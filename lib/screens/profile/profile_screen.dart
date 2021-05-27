import 'package:KartexFinal/components/custom_bottom_nav_bar.dart';
import 'package:KartexFinal/constants.dart';
import 'package:KartexFinal/screens/enums.dart';
import 'package:KartexFinal/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: kSecondaryColor,
            onPressed: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            }),
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
