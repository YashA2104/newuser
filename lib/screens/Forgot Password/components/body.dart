import 'package:KartexFinal/screens/Forgot%20Password/components/forgot_password_form.dart';
import 'package:KartexFinal/screens/LoginPage-Welcome/components/bottom_text.dart';
import 'package:KartexFinal/size_config.dart';
import 'package:flutter/material.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              'Verification through Email',
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: getProportionateScreenWidth(24),
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3),
            Text(
              'Please enter your email and we\'ll send \nyou a link to return to your account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: getProportionateScreenWidth(12),
                color: Theme.of(context).accentColor,
              ),
            ),
            SizedBox(height: 100),
            ForgotPasswordForm(),
            SizedBox(height: 40),
            BottomText(),
          ],
        ),
      ),
    );
  }
}
