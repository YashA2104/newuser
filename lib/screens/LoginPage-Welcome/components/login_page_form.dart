import 'package:KartexFinal/components/check_box.dart';
import 'package:KartexFinal/components/form_detail.dart';
import 'package:KartexFinal/constants.dart';
import 'package:KartexFinal/screens/Forgot%20Password/forgot_password.dart';
import 'package:KartexFinal/screens/Login%20Success/login_success.dart';
import 'package:KartexFinal/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPageForm extends StatelessWidget {
   String email, pass;

  TextEditingController nameController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  void getValues() {
    email = nameController.text.toString();
    pass = passController.text.toString();
  }

  Future<void> logIn(context) async {
    getValues();
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    UserCredential user = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: pass);
    String Uid;
    Uid = user.user.uid;
    Fluttertoast.showToast(msg: Uid);
    DocumentSnapshot doc = await firebaseFirestore
        .collection('Customer')
        .doc(Uid)
        .collection('user')
        .doc('details')
        .get();
    if (user != null && doc.exists) {
      Fluttertoast.showToast(msg: "Logged In Successfully");
      Navigator.pushNamed(context, LoginSuccess.routeName);
    } else {
      Fluttertoast.showToast(msg: 'User not found,Please sign in');
    }
  }

  @override
  Widget build(BuildContext context) {
     SizeConfig().init(context);
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            FormDetails(
              controller: nameController,
              labelText: 'Enter Email',
              hint: 'Enter your email',
            ),
            SizedBox(height: 30),
            FormDetails(
              controller: passController,
              labelText: 'Password',
              hint: 'Enter your password',
            ),
            SizedBox(height: 30),
            // CheckBoxLogin(text: 'Remember me'),
            SizedBox(height: 30),
            Container(
              height: 50,
              width: double.infinity,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () {
                  logIn(context);
                },
                color: kPrimaryColor,
                child: Text('Continue',
                    style: TextStyle(
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: kSecondaryColor,
                    )),
              ),
            ),
            SizedBox(height: 50),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, ForgotPassword.routeName);
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: kSecondaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}


