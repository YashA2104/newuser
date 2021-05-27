import 'package:KartexFinal/constants.dart';
import 'package:KartexFinal/screens/CategoryEach/Categoryeach.dart';
import 'package:KartexFinal/screens/ShopAll/shopall.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/smartphone_white_24dp.svg", "text": "Electronics"},
      {"icon": "assets/icons/grocery.svg", "text": "Groceries"},
      {"icon": "assets/icons/liquor_white_24dp.svg", "text": "Liquor"},
      {"icon": "assets/icons/medication_white_24dp.svg", "text": "Medicines"},
      {"icon": "assets/icons/milk-bottle.svg", "text": "Daily Needs"},
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Shopall(type: categories[index]["text"])));
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                icon,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(height: 5),
            FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kPrimaryColor),
                ))
          ],
        ),
      ),
    );
  }
}
