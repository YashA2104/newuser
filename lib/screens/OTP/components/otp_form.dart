import 'package:flutter/material.dart';
import 'package:KartexFinal/size_config.dart';
import 'package:KartexFinal/constants.dart';

class OTPForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      width: getProportionateScreenWidth(60),
      child: TextFormField(
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        obscureText: true,
        decoration: InputDecoration(
          focusColor: kPrimaryColor,
          contentPadding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: kPrimaryLightColor,
                  width: getProportionateScreenWidth(3))),
        ),
      ),
    );
  }
}
