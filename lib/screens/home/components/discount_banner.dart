import 'package:KartexFinal/constants.dart';
import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'package:carousel_pro/carousel_pro.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
          child: Container(
            height: getProportionateScreenWidth(190),
            width: double.infinity,
            margin: EdgeInsets.all(getProportionateScreenWidth(20)),
            // padding: EdgeInsets.symmetric(
            //   horizontal: getProportionateScreenWidth(20),
            //   vertical: getProportionateScreenWidth(15),
            // ),
            decoration: BoxDecoration(
               boxShadow: [
            BoxShadow(
              blurRadius: getProportionateScreenWidth(15),
              color: Colors.black12.withOpacity(0.2),
              offset: Offset(0, 4),
            ),
          ],
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Carousel(
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotColor: Colors.black45,
              indicatorBgPadding: 5.0,
              dotBgColor: Colors.transparent,
              dotVerticalPadding: 5.0,
              dotPosition: DotPosition.bottomRight,
              dotIncreasedColor: kSecondaryColor,
              images: [
                Image.asset(
                  'assets/images/splash_1gif.gif',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/splash_2.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/splash_3.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: getProportionateScreenWidth(40),
          top: getProportionateScreenWidth(40),
          child: Text.rich(
            TextSpan(
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(text: "Welcome to Kartex" ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: getProportionateScreenWidth(20),color: kPrimaryColor)),
               
              ],
            ),
          ),
        ),
      ],
    );
  }
}
