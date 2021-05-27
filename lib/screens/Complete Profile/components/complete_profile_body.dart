import 'package:KartexFinal/constants.dart';
import 'package:KartexFinal/screens/Complete%20Profile/components/complete_profile_form.dart';
import 'package:flutter/material.dart';
import 'package:KartexFinal/size_config.dart';

class CompleteProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Complete Profile',
            style: TextStyle(
              fontFamily: 'Muli',
              fontSize: getProportionateScreenWidth(24),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            'Complete your details or continue \nwith social media',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Muli',
              fontSize: getProportionateScreenWidth(12),
              color: kPrimaryColor,
            ),
          ),
          SizedBox(
            height: 80,
          ),
          CompleteProfileForm(),
          Text(
            'By continuing you confirm that you agree \nwith the Term and Conditions',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Muli',
              fontSize: getProportionateScreenWidth(12),
              color: kPrimaryColor,
            ),
          )
        ],
      ),
    );
  }
}
