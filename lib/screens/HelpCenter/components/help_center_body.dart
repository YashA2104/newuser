import 'package:KartexFinal/constants.dart';
import 'package:KartexFinal/size_config.dart';
import 'package:flutter/material.dart';

class HelpCenterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          Image.asset(
            'assets/images/splash_3.png',
            height: SizeConfig.screenHeight * 0.40,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Contact Us',
            style: TextStyle(
              fontFamily: 'Muli',
              fontSize: getProportionateScreenWidth(32),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          Text(
            '+91 7410712775',
            style: TextStyle(
              fontFamily: 'Muli',
              fontSize: getProportionateScreenWidth(16),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
