import 'package:flutter/material.dart';
import 'package:liviz_shop/constants.dart';
import 'package:liviz_shop/screens/cart/components/myCartProducts.dart';
import 'package:liviz_shop/screens/congratulationScreen/congratulationsScreen.dart';
import 'package:page_transition/page_transition.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int selectedLocation = 1;
  List<String> payementMethods = [
    "assets/images/apple-pay.png",
    "assets/images/visa.png",
    "assets/images/mastercard.png",
    "assets/images/paypal.png",
    "assets/images/orange-money.png",
    "assets/images/moov-money.png",
    "assets/images/liguidicash.png"
  ];
  int paymentMethodSelected = 0;

  setSelectedLocation(int value) {
    setState(() {
      selectedLocation = value;
    });
  }

  setSelectedPayementMethod(int value) {
    setState(() {
      paymentMethodSelected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
        title: Text(
          "Checkout",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Delivery address",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(defaultPadding / 2),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.all(Radius.circular(defaultBorderRadius)),
              ),
              child: Row(
                children: [
                  const SizedBox(width: defaultPadding / 2),
                  Radio(
                    value: 1,
                    hoverColor: Color.fromARGB(255, 241, 236, 236),
                    groupValue: selectedLocation,
                    onChanged: (value) {
                      setSelectedLocation(value!);
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Home",
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: defaultPadding / 4),
                      Text(
                        "(342) 4522019",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: defaultPadding / 4),
                      Text(
                        "222 New York",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Container(
                      child: Icon(
                    Icons.edit,
                    size: 30,
                    color: Colors.grey,
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(defaultPadding / 2),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.all(Radius.circular(defaultBorderRadius)),
              ),
              child: Row(
                children: [
                  const SizedBox(width: defaultPadding / 2),
                  Radio(
                    value: 2,
                    hoverColor: Color.fromARGB(255, 241, 236, 236),
                    groupValue: selectedLocation,
                    onChanged: (value) {
                      setSelectedLocation(value!);
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Office",
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: defaultPadding / 4),
                      Text(
                        "(342) 4522019",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: defaultPadding / 4),
                      Text(
                        "222 Montmarte.paris",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Container(
                      child: Icon(
                    Icons.edit,
                    size: 30,
                    color: Colors.grey,
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Billing information",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(defaultPadding / 2),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.all(Radius.circular(defaultBorderRadius)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Fee  :",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "\$300",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultPadding / 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal  :",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "\$300",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total  :",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "\$300",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Payment Method",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: payementMethods.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                setState(() {
                                  paymentMethodSelected = index;
                                });
                              },
                              child: Container(
                                  width: 120,
                                  child: Stack(
                                    children: [
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: bgColor,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                            child: Image.asset(
                                              payementMethods[index],
                                            ),
                                          )),
                                      Positioned(
                                        left: 70,
                                        top: -15,
                                        child: Radio(
                                          value: index,
                                          activeColor: Colors.green,
                                          hoverColor: Color.fromARGB(
                                              255, 241, 236, 236),
                                          groupValue: paymentMethodSelected,
                                          onChanged: (value) {
                                            setSelectedPayementMethod(value!);
                                          },
                                        ),
                                      ),
                                    ],
                                  )),
                            )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Center(
                    child: SizedBox(
                      width: 210,
                      height: 48,
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                              shape: const StadiumBorder()),
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeftJoined,
                                    duration: Duration(milliseconds: 700),
                                    childCurrent: CheckOutScreen(),
                                    reverseDuration:
                                        Duration(milliseconds: 700),
                                    child: CongratulationsScreen()));
                          },
                          icon: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Center(
                                child: Icon(
                              Icons.arrow_forward,
                              color: primaryColor,
                            )),
                          ),
                          label: Text("Swipe for Payment")),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
