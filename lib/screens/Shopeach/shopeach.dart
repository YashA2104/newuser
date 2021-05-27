import 'package:KartexFinal/constants.dart';
import 'package:KartexFinal/screens/ShopAll/shopall.dart';
import 'package:KartexFinal/screens/Shopeach/components/shopeachbody.dart';
import 'package:KartexFinal/size_config.dart';
import 'package:flutter/material.dart';

class Shopeach extends StatelessWidget {
  static String routeName = '/Shopeach';
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
            Navigator.pushNamed(context, Shopall.routeName);
          },
        ),
        elevation: 0,
        title: Text(
          'Shop name',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
      ),
      body: ShopeachBody(),
    );
  }
}
