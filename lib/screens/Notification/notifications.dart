import 'package:KartexFinal/screens/Notification/components/notification_body.dart';
import 'package:KartexFinal/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:KartexFinal/size_config.dart';
import 'package:KartexFinal/constants.dart';

class Notifications extends StatelessWidget {
  static String routeName = '/Notifications';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: kSecondaryColor,
            ),
            onPressed: () {
              Navigator.pushNamed(context, ProfileScreen.routeName);
            },
          ),
        ),
        elevation: 0,
        title: Text(
          'Notifications',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
      ),
      body: NotificationsBody(),
    );
  }
}
