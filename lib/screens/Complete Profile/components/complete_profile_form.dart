import 'package:KartexFinal/components/buttons.dart';
import 'package:KartexFinal/components/form_detail.dart';
import 'package:KartexFinal/constants.dart';
import 'package:KartexFinal/screens/OTP/otp_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:KartexFinal/size_config.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({Key key}) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  String newValue, f_name, l_name, p_number, address;
  TextEditingController fnameController = new TextEditingController();
  TextEditingController lnameController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    void getValues() {
    f_name = fnameController.text.toString();
    l_name = lnameController.text.toString();
    p_number = phoneNumberController.text.toString();
    address = addressController.text.toString();
    
  }

  void updateValues() async {
    if (f_name.isNotEmpty &&
        l_name.isNotEmpty &&
        p_number.isNotEmpty &&
        address.isNotEmpty) {
      FirebaseFirestore firebaseFirestore = await FirebaseFirestore.instance;
      firebaseFirestore
          .collection('Customer')
          .doc(await FirebaseAuth.instance.currentUser.uid.toString())
          .collection('user')
          .doc('details')
          .update({
        'firstName': f_name,
        'lastName': l_name,
        'phoneNumber': p_number,
        'address': address,
      }).whenComplete(() async => {
                Navigator.pushNamed(context, OTPScreen.routeName),
                Fluttertoast.showToast(msg: 'Data Received Successfully!'),
                
                
                
              });
    } else {
      Fluttertoast.showToast(msg: 'Please Fill All the Details');
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
              controller: fnameController,
              labelText: 'First Name',
              hint: 'Enter your first name',
            ),
            SizedBox(
              height: 30,
            ),
            FormDetails(
              controller: lnameController,
              labelText: 'Last Name',
              hint: 'Enter your last name',
            ),
            SizedBox(
              height: 30,
            ),
            FormDetails(
              controller: phoneNumberController,
              labelText: 'Phone Number',
              hint: 'Enter your phone number',
            ),
            SizedBox(
              height: 30,
            ),
            FormDetails(
              controller: addressController,
              labelText: 'Address',
              hint: 'Enter your Address',
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () async {
                  await getValues();
                  await updateValues();
                  Navigator.pushNamed(context, OTPScreen.routeName);
                },
                
                color: kSecondaryColor,
                child: Text('Continue',
                    style: TextStyle(
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: kPrimaryColor,
                    )),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
