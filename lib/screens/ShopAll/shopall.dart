import 'package:KartexFinal/constants.dart';
import 'package:KartexFinal/screens/ShopAll/components/ShopAllbody.dart';
import 'package:KartexFinal/screens/home/home_screen.dart';
import 'package:KartexFinal/size_config.dart';
import 'package:flutter/material.dart';

class Shopall extends StatelessWidget {
  String type;
  Shopall({
    @required this.type,
});
  static String routeName = '/Shopall';
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
        ),
        elevation: 0,
        title: Text(
          'Available Shops',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.filter,
                color: kPrimaryColor,
              ))
        ],
      ),
      body: ShopAllBody(),
    );
  }
}
