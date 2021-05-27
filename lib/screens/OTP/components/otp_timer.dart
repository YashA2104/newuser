import 'package:flutter/material.dart';
import 'package:KartexFinal/size_config.dart';
import 'package:KartexFinal/constants.dart';

class OTPTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'This code shall expire in 30s',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(12),
            color: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
