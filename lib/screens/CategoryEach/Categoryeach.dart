import 'package:KartexFinal/screens/CategoryEach/components/SeachFieldEach.dart';
import 'package:KartexFinal/screens/CategoryEach/components/body.dart';
import 'package:KartexFinal/screens/ShopsScreen/ShopsScreen.dart';

import 'package:flutter/material.dart';

import '../../size_config.dart';

class CategoryEach extends StatelessWidget {
  static String routeName = '/CategoryEach';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pushNamed(context, StoreDetailPage.routeName);
          },
        ),
        elevation: 0,
        title: SearchFieldEach(),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_outlined),
            onPressed: () {},
            color: Colors.black,
          )
        ],
      ),
      body: Body(),
    );
  }
}
