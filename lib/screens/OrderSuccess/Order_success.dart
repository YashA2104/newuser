import 'package:KartexFinal/screens/RegisterSuccess/components/register_success.dart';
import 'package:KartexFinal/size_config.dart';
import 'package:flutter/material.dart';

class OrderSuccess extends StatelessWidget {
  static String routeName = '/Ordersuccess';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          ' Order Placed',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
      body: Body(),
    );
  }
}
