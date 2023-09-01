import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liviz_shop/constants.dart';
import 'package:liviz_shop/models/Category.dart';
import 'package:liviz_shop/models/favouriteProduct.dart';
import 'package:liviz_shop/screens/details/details_screen.dart';
import 'package:liviz_shop/screens/favorite/components/favoriteProductList.dart';
import 'package:liviz_shop/screens/favorite/components/favouriteProductCard.dart';
import 'package:liviz_shop/screens/home/home_screen.dart';
import 'package:page_transition/page_transition.dart';

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);

class SearchForm extends StatefulWidget {
  const SearchForm({
    super.key,
    required this.fromHome,
    this.query,
  });

  final bool fromHome;
  final String? query;

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  TextEditingController _queryController = TextEditingController();

  void initState() {
    super.initState();
    if (widget.query != null) {
      _queryController.text = widget.query!;
    } else {
      _queryController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        controller: _queryController,
        autofocus: !widget.fromHome ? true : false,
        onChanged: (value) {
          if (widget.fromHome) {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeftJoined,
                    duration: const Duration(milliseconds: 700),
                    childCurrent: Homescreen(),
                    reverseDuration: const Duration(milliseconds: 700),
                    child: SearchList(
                      query: value,
                    )));
          }
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "Rechercher article...",
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          errorBorder: outlineInputBorder,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(14),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding / 2),
            child: SizedBox(
              width: 48,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                      elevation: 100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      context: context,
                      builder: (context) {
                        return FilterDialog();
                      });
                },
                child: SvgPicture.asset("assets/icons/Filter.svg"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  int collectionIndex = 0;
  var selectPrice = const RangeValues(0.1, 0.9);
  double _maxPrice = 0.9;
  double _minPrice = 0.1;

  reinitialize() {
    setState(() {
      selectPrice = const RangeValues(0.1, 0.9);
      _maxPrice = 0.9;
      _minPrice = 0.1;
      collectionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 241, 240, 240),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: GestureDetector(
              onTap: () {
                reinitialize();
              },
              child: const Text(
                "Effacer",
                style: TextStyle(color: primaryColor),
              ),
            ),
            title: Text(
              "Filtre",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            trailing: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  width: 30,
                  child: const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 204, 204, 204),
                    child: FaIcon(
                      FontAwesomeIcons.close,
                      color: Colors.black,
                      size: 20,
                    ),
                  )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Catégorie",
                style: Theme.of(context).textTheme.headline6,
              ),
              Container()
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: collections.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          collectionIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: collectionIndex == index
                                ? primaryColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            collections[index],
                            style: TextStyle(
                                color: collectionIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    )),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Prix",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                "${(_minPrice * 100000).toInt()}frs - ${(_maxPrice * 100000).toInt()}frs",
                style: const TextStyle(),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          RangeSlider(
              activeColor: primaryColor,
              values: selectPrice,
              divisions: 1000,
              labels: RangeLabels("${(_minPrice * 100000).toInt()}frs",
                  "${(_maxPrice * 100000).toInt()}frs"),
              onChanged: (RangeValues newRange) {
                setState(() {
                  selectPrice = newRange;
                  _maxPrice = selectPrice.end;
                  _minPrice = selectPrice.start;
                });
              }),
          Expanded(child: Container()),
          Center(
            child: SizedBox(
              width: 200,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    primary: primaryColor, shape: const StadiumBorder()),
                child: const Text("Appliquer le flitre"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchList extends StatefulWidget {
  const SearchList({Key? key, required this.query}) : super(key: key);
  final String query;

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  String queryStream = '';

  void initState() {
    super.initState();
    setState(() {
      queryStream = widget.query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/Location.svg"),
            const SizedBox(width: defaultPadding / 2),
            Text(
              "15/2 New Texas",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/Notification.svg"),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: SearchForm(
                fromHome: false,
                query: widget.query,
              ),
            ),
            ListTile(
              onTap: () {
                print("View recents research");
              },
              leading: Text(
                "Dernières recherches",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ),
            Container(
              height: 1,
              color: Colors.grey.withOpacity(0.1),
            ),
            ListTile(
              leading: Text(
                "Résultats de recherche",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            ResearchProductsList()
          ],
        ),
      ),
    );
  }
}

class ResearchProductsList extends StatelessWidget {
  const ResearchProductsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.57,
      child: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding,
              childAspectRatio: 0.72),
          itemCount: demo_favorite_product.length,
          itemBuilder: (context, index) => FavouriteProductCard(
                title: demo_favorite_product[index].title,
                image: demo_favorite_product[index].image,
                price: demo_favorite_product[index].price,
                bgColor: demo_favorite_product[index].bgColor,
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                            favouriteProduct: demo_favorite_product[index]),
                      ));
                },
              )),
    );
  }
}
