import 'package:KartexFinal/screens/Login%20Success/components/login_success_body.dart';
import 'package:KartexFinal/constants.dart';
import 'package:KartexFinal/size_config.dart';
import 'package:flutter/material.dart';

class LoginSuccess extends StatelessWidget {
  static String routeName = "/login_success";
  const LoginSuccess({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Login Success',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
      ),
      body: LoginSuccessBody(),
    );
  }
}
