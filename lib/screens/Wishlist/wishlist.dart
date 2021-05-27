import 'package:KartexFinal/components/custom_bottom_nav_bar.dart';
import 'package:KartexFinal/constants.dart';
import 'package:KartexFinal/models/Cart.dart';
import 'package:KartexFinal/screens/Wishlist/components/body.dart';
import 'package:KartexFinal/screens/enums.dart';
import 'package:KartexFinal/screens/home/home_screen.dart';
import 'package:KartexFinal/size_config.dart';
import 'package:flutter/material.dart';

class Wishlist extends StatelessWidget {
  static String routeName = '/Wishlist';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kSecondaryColor,
          ),
          onPressed: () {
            Navigator.pushNamed(context, HomeScreen.routeName);
          },
          iconSize: getProportionateScreenWidth(15),
        ),
        elevation: 0,
        title: Column(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(2),
            ),
            Text(
              'Your Favourite Shops',
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: getProportionateScreenWidth(18),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(5),
            ),
            Text(
              '${demoCarts.length} items',
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: getProportionateScreenWidth(14),
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
      body: Body(),
      bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}
