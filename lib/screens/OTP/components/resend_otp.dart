import 'package:KartexFinal/screens/ResendOTP/resendOTP.dart';
import 'package:flutter/material.dart';
import 'package:KartexFinal/size_config.dart';
import 'package:KartexFinal/constants.dart';

class ResendOTP extends StatelessWidget {
  const ResendOTP({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ResendOTPScreen.routeName);
      },
      borderRadius: BorderRadius.circular(getProportionateScreenWidth(100)),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(getProportionateScreenWidth(20))),
          child: Text(
            'Resend OTP',
            style: TextStyle(
              color: kSecondaryColor,
              fontFamily: 'Muli',
              fontSize: getProportionateScreenWidth(14),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
