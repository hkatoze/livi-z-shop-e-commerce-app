import 'package:flutter/material.dart';
import 'package:liviz_shop/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liviz_shop/screens/loginScreen/loginScreen.dart';
import 'package:liviz_shop/screens/welcome/welcome_screen.dart';
import 'package:page_transition/page_transition.dart';

class IntroScreen extends StatefulWidget {
  final List<OnbordingData> onbordingDataList;
  final MaterialPageRoute pageRoute;
  IntroScreen(this.onbordingDataList, this.pageRoute);

  void skipPage(BuildContext context) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 700),
            reverseDuration: Duration(milliseconds: 700),
            child: LoginScreen()));
  }

  @override
  IntroScreenState createState() {
    return new IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == widget.onbordingDataList.length - 1) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  Widget _buildPageIndicator(int page) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: page == currentPage ? 10.0 : 6.0,
      width: page == currentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: page == currentPage ? primaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Expanded(
            flex: 1,
            child: new Container(),
          ),
          new Expanded(
            flex: 3,
            child: new PageView(
              children: widget.onbordingDataList,
              controller: controller,
              onPageChanged: _onPageChanged,
            ),
          ),
          new Expanded(
            flex: 1,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                new TextButton(
                  child: new Text(lastPage ? "" : "PASSER",
                      style: new TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () => lastPage
                      ? null
                      : widget.skipPage(
                          context,
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Container(
                    child: Row(
                      children: [
                        _buildPageIndicator(0),
                        _buildPageIndicator(1),
                        _buildPageIndicator(2),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  child: new Text(lastPage ? "COMMENCER" : "SUIVANT",
                      style: new TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () => lastPage
                      ? widget.skipPage(context)
                      : controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnbordingData extends StatefulWidget {
  final imagePath;
  final title;
  final desc;

  OnbordingData({this.imagePath, this.title, this.desc});

  @override
  _OnbordingDataState createState() =>
      _OnbordingDataState(this.imagePath, this.title, this.desc);
}

class _OnbordingDataState extends State<OnbordingData> {
  final imagePath;
  final title;
  final desc;

  _OnbordingDataState(this.imagePath, this.title, this.desc);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/logo.jpg"))),
          ),
          Text(
            "Livi'z Boutik",
            style: GoogleFonts.ooohBaby(
                color: primaryColor, fontSize: 43, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Image(
            fit: BoxFit.fitWidth,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.28,
            image: AssetImage(imagePath),
          ),
          SizedBox(
            height: 12.0,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: primaryColor),
              ),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              desc,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final List<OnbordingData> list = [
    OnbordingData(
      imagePath: "assets/images/pic1.png",
      title: "Chosissez un article",
      desc:
          "Vous trouverez une game variée d'articles pour bébé et nouvelles mamans",
    ),
    OnbordingData(
      imagePath: "assets/images/pic2.png",
      title: "Effectuer le Paiement",
      desc:
          "Vous décidez de payer directement ou à la livraison.Votre choix est notre choix 😊.",
    ),
    OnbordingData(
      imagePath: "assets/images/pic3.png",
      title: "Recevez votre commande",
      desc:
          "Recevez votre colis en un temps record maximum 2 jours où que vous soyez. ",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroScreen(
      list,
      MaterialPageRoute(builder: (context) => OnboardingScreen()),
    ));
  }
}
