import 'package:KartexFinal/screens/HelpCenter/help_center.dart';
import 'package:KartexFinal/screens/LoginPage-Welcome/login_page.dart';
import 'package:KartexFinal/screens/MyAccount/MyAccounts.dart';
import 'package:KartexFinal/screens/Notification/notifications.dart';
import 'package:KartexFinal/screens/SettingsScreen/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  String profileImage;
  Body({
    @required this.profileImage,
});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(profilePic: profileImage,),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () {
              Navigator.pushNamed(context, MyAccounts.routeName);
            },
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {
              Navigator.pushNamed(context, Notifications.routeName);
            },
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {
              Navigator.pushNamed(context, Settings.routeName);
            },
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {
              Navigator.pushNamed(context, HelpCenter.routeName);
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              FirebaseAuth.instance.signOut().whenComplete(() => {
                Fluttertoast.showToast(msg: 'You have been signed out !!'),
                Navigator.pushNamed(context, LoginPage.routeName),
              });

            },
          ),
          ProfileMenu(
            text: "Go to Vendor App",
            icon: "assets/icons/Shop Icon.svg",
            press: () {
              // Navigator.pushNamed(context, LoginPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
