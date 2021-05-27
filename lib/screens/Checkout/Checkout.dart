import 'package:KartexFinal/screens/Checkout/components/checkout_body.dart';
import 'package:KartexFinal/screens/cart/cart_screen.dart';
import 'package:KartexFinal/screens/cart/components/check_out_card.dart';

import 'package:KartexFinal/size_config.dart';
import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  static String routeName = '/Checkout';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
            color: Colors.black,
            iconSize: getProportionateScreenHeight(20),
          ),
          elevation: 0,
          title: Column(
            children: [
              Text(
                'Check Out',
                style: TextStyle(
                  fontFamily: 'Muli',
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                '4 items',
                style: TextStyle(
                  fontFamily: 'Muli',
                  fontSize: getProportionateScreenWidth(15),
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CheckoutCard(
          text: 'Pay Now',
        ),
        body: Body(),
      ),
    );
  }
}
