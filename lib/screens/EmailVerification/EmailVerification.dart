import 'package:KartexFinal/screens/EmailVerification/components/body.dart';
import 'package:KartexFinal/size_config.dart';
import 'package:flutter/material.dart';

class EmailVerification extends StatelessWidget {
  static String routeName = '/EmailVerification';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          ' Email Sent',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
      body: Body(),
    );
  }
}
