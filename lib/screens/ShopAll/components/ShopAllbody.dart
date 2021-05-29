import 'package:KartexFinal/constants.dart';
import 'package:KartexFinal/screens/Shopeach/shopeach.dart';
import 'package:KartexFinal/screens/home/components/search_field.dart';
import 'package:KartexFinal/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShopAllBody extends StatelessWidget {
  String type;
  ShopAllBody({
    @required this.type,
});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SeachShop(),
        Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: StreamBuilder <QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('shop').snapshots(),
            builder: (context , snapshots){
              final List<DocumentSnapshot> documents = snapshots.data.docs;
              return documents.isNotEmpty? ListView(
                children: documents.where((element) => element['shopType'] == type).map((doc)  =>
                    InkWell(
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Shopeach(
                          phoneNumber: doc['phoneNumber'],
                          location:  doc['address'],
                          id: doc['userID'],
                          shopName: doc['shopName'],
                          deliveryTiming: doc['deliveryTiming'],
                          catImage: doc['catImage'],
                          shopImage: doc['shopImage'],

                        ),

                        ),

                        );
                      },
                      child: ShopContainer(
                        shopName: doc['shopName'],
                            shopAddress: doc['address'],
                            shopImage: doc['shopImage'],
                            press: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Shopeach(
                                shopImage: doc['shopImage'],
                                shopName: doc['shopName'],
                                catImage: doc['catImage'],
                                deliveryTiming: doc['deliveryTiming'],
                                id: doc['userID'],
                                location: doc['address'],
                                phoneNumber: doc['phoneNumber'],

                              )));
                              },),
                    )).toList(),
              ) : CircularProgressIndicator();
            },
          ),
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
   String shopImage,shopName,shopAddress;
   ShopContainer({
    Key key,
    @required this.press,
    @required this.shopName,
    @required this.shopAddress,
    @required this.shopImage,
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(shopImage),
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
                          shopName,
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
                            shopAddress,
                            softWrap: true,
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
