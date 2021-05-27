import 'package:KartexFinal/components/default_button.dart';
import 'package:KartexFinal/constants.dart';
import 'package:KartexFinal/screens/LoginPage-Welcome/login_page.dart';
import 'package:KartexFinal/screens/splash/components/splash_contents.dart';
import 'package:KartexFinal/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Kart-Ex, Your all in one ideal marketplace.",
      "image": "assets/images/splash_1gif.gif"
    },
    {
      "text":
          "We help you guys to conect with store and get you \nthe best price possible ",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]['image'],
                    text: splashData[index]['text'],
                  ),
                )),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          splashData.length, (index) => buildDot(index: index)),
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(15),
                    ),
                    Spacer(),
                    // Spacer(
                    //   flex: 2,
                    // ),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        Navigator.pushNamed(context, LoginPage.routeName);
                      },
                    ),

                    SizedBox(
                      height: getProportionateScreenWidth(15),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: getProportionateScreenHeight(56),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: kPrimaryColor,
                        onPressed: () {
                          Navigator.pushNamed(context, LoginPage.routeName);
                        },
                        child: Text(
                          'Open Vendor App',
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              color: kSecondaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(25),
                    )
                    // Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kSecondaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
