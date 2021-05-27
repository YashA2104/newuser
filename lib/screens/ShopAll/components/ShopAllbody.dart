import 'package:KartexFinal/constants.dart';
import 'package:KartexFinal/screens/Shopeach/shopeach.dart';
import 'package:KartexFinal/screens/home/components/search_field.dart';
import 'package:KartexFinal/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShopAllBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SeachShop(),
        ShopContainer(
          press: () {
            Navigator.pushNamed(context, Shopeach.routeName);
          },
        ),
      ],
    );
  }
}

class SeachShop extends StatelessWidget {
  const SeachShop({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.9,
      decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        blurRadius: getProportionateScreenWidth(6),
        color: Colors.black12.withOpacity(0.1),
        offset: Offset(0, 4),
      ),
    ],
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
    onChanged: (value) => print(value),
    decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenWidth(9)),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        hintText: "Search",
        suffixIcon: Icon(Icons.search)),
      ),
    );
  }
}

class ShopContainer extends StatelessWidget {
  const ShopContainer({
    Key key,
    @required this.press,
  }) : super(key: key);
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15),vertical: getProportionateScreenWidth(15)),
      child: Stack(
        children: [
          GestureDetector(
            onTap: press,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(getProportionateScreenWidth(15)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: getProportionateScreenWidth(6),
                    color: Colors.black12.withOpacity(0.3),
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              height: getProportionateScreenWidth(150),
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                    child: Container(
                      height: getProportionateScreenWidth(120),
                      width: getProportionateScreenWidth(120),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(
                              getProportionateScreenWidth(15))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(getProportionateScreenWidth(1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: getProportionateScreenWidth(20),
                        ),
                        Text(
                          'Prashant Medical',
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(17),
                              fontFamily: 'Muli',
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor),
                          overflow: TextOverflow.clip,
                        ),
                        SizedBox(
                          height: getProportionateScreenWidth(8),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                                'assets/images/check-circle-verified.svg'),
                            SizedBox(
                              width: getProportionateScreenWidth(15),
                            ),
                            Text(
                              'Verified',
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(15),
                                  fontFamily: 'Muli',
                                  color: kPrimaryColor),
                              overflow: TextOverflow.clip,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenWidth(7),
                        ),
                        FittedBox(
                          child: Text(
                            'Anand Palace no 9',
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(12),
                                fontFamily: 'Muli',
                                color: kPrimaryColor),
                            maxLines: 3,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: getProportionateScreenWidth(20),
            bottom: getProportionateScreenWidth(15),
            child: Text(
              'View Details',
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(13),
                  fontFamily: 'Muli',
                  color: kPrimaryColor),
              overflow: TextOverflow.clip,
            ),
          )
        ],
      ),
    );
  }
}
