import 'package:KartexFinal/screens/Forgot%20Password/components/body.dart';
import 'package:KartexFinal/screens/LoginPage-Welcome/login_page.dart';
import 'package:flutter/material.dart';
import 'package:KartexFinal/size_config.dart';

class ForgotPassword extends StatelessWidget {
  static String routeName = "/forgot_password";
  const ForgotPassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () {
            Navigator.pushNamed(context, LoginPage.routeName);
          },
        ),
        elevation: 0,
        title: Text(
          'Email Verification',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
      body: SingleChildScrollView(child: ForgotPasswordBody()),
    );
  }
}
