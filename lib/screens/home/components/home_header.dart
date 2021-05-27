import 'package:KartexFinal/constants.dart';
import 'package:KartexFinal/screens/Notification/notifications.dart';
import 'package:KartexFinal/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            color: kPrimaryLightColor,
            svgSrc: Icons.star_border,
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          IconBtnWithCounter(
            color: kSecondaryColor,
            svgSrc: Icons.shopping_bag_outlined,
            numOfitem: 3,
            press: () {
              Navigator.pushNamed(context, Notifications.routeName);
            },
          ),
        ],
      ),
    );
  }
}
