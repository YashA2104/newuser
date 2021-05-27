import 'package:KartexFinal/models/Cart.dart';
import 'package:KartexFinal/screens/home/home_screen.dart';
import 'package:KartexFinal/size_config.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () {
            Navigator.pushNamed(context, HomeScreen.routeName);
          },
          iconSize: getProportionateScreenWidth(15),
        ),
        elevation: 0,
        title: Column(
          children: [
            Text(
              'Your Cart',
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: getProportionateScreenWidth(18),
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
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
      bottomNavigationBar: CheckoutCard(
        text: 'Check Out',
      ),
    );
  }
}
