import 'package:KartexFinal/components/form_detail.dart';
import 'package:KartexFinal/screens/EmailVerification/EmailVerification.dart';
import 'package:KartexFinal/screens/OTP/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:KartexFinal/size_config.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordForm extends StatelessWidget {
  TextEditingController emailController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            FormDetails(
              labelText: 'Email',
              controller: emailController,
              hint: 'Enter your email',
            ),
            SizedBox(height: 200),
            Container(
              height: 50,
              width: double.infinity,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: (){
                  FirebaseAuth.instance
                      .sendPasswordResetEmail(
                          email: emailController.text.toString())
                      .whenComplete(() => {
                            Fluttertoast.showToast(
                                msg: 'Reset Password Email has been sent !!!'),
                            Navigator.pushNamed(
                                context, EmailVerification.routeName),
                          });
                },
                color: Theme.of(context).primaryColor,
                child: Text('Continue',
                    style: TextStyle(
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    )),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
          ],
        ),
      ),
    );
  }
}
