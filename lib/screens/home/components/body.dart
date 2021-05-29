import 'package:KartexFinal/components/product_card.dart';
import 'package:KartexFinal/constants.dart';
import 'package:KartexFinal/screens/home/components/section_title.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
              child: Text(
                    'Categories',
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(17),
                        fontFamily: 'Muli',
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor),
                    overflow: TextOverflow.clip,
                  ),
            ),
            Categories(),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
