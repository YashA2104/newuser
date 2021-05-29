import 'package:KartexFinal/constants.dart';
import 'package:KartexFinal/screens/ShopAll/shopall.dart';
import 'package:KartexFinal/screens/Shopeach/components/shopeachbody.dart';
import 'package:KartexFinal/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Shopeach extends StatefulWidget {
  String shopImage,deliveryTiming,location,phoneNumber,catImage,id,shopName;

  Shopeach({
    @required this.shopImage,
    @required this.id,
    @required this.catImage,
    @required this.deliveryTiming,
    @required this.location,
    @required this.phoneNumber,
    @required this.shopName,

});
  static String routeName = '/Shopeach';

  @override
  _ShopeachState createState() => _ShopeachState();
}

class _ShopeachState extends State<Shopeach> {
  bool isFavourite = false;

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
          widget.shopName,
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        actions: [
          InkWell(
            onTap: (){
              setState(() {
                if(isFavourite = true){
                  isFavourite = false;
                }
                else{
                  isFavourite = true;
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/icons/Heart Icon_2.svg",
                height: getProportionateScreenHeight(20),
                width:  getProportionateScreenWidth(20),
                color: isFavourite == true
                    ? Color(0xFFFF4848)
                    : Color(0xFFDBDEE4),
              ),
            ),
          ),
        ],
      ),
      body: ShopeachBody(shopImage: widget.shopImage ,catImage: widget.catImage,deliveryTiming: widget.deliveryTiming,shopName: widget.shopName,id: widget.id,location: widget.location,phoneNumber: widget.phoneNumber,),
    );
  }
}
