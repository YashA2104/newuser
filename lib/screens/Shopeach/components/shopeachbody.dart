import 'package:KartexFinal/constants.dart';
import 'package:KartexFinal/screens/MessagingInterior/chat_interior.dart';
import 'package:KartexFinal/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopeachBody extends StatefulWidget {

  String shopImage,deliveryTiming,location,phoneNumber,catImage,id,shopName;
  ShopeachBody({
    @required this.shopImage,
    @required this.id,
    @required this.catImage,
    @required this.deliveryTiming,
    @required this.location,
    @required this.phoneNumber,
    @required this.shopName,

  });

  @override
  _ShopeachBodyState createState() => _ShopeachBodyState();
}

class _ShopeachBodyState extends State<ShopeachBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContainerMulti(shopImage: widget.shopImage,),
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          ShopDetails(),
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          detailsContainer(
            color: kSecondaryColor,
            text: widget.deliveryTiming + ' Hours',
            colortoo: kPrimaryColor,
            svg: 'assets/images/clock.svg',
          ),
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          detailsContainer(
            color: kPrimaryColor,
            text: 'Location: ' + widget.location,
            colortoo: kSecondaryColor,
            svg: 'assets/images/map-pin.svg',
          ),
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          Messages(id: widget.id,),
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          ViewShopgallery(),
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          ContainerMulti(shopImage: widget.catImage,),
          SizedBox(height: getProportionateScreenWidth(15)),
        ],
      ),
    );
  }
}

class ViewShopgallery extends StatelessWidget {
  const ViewShopgallery({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Text(
        'View Shop Gallery',
        style: TextStyle(
          fontFamily: 'Muli',
          fontSize: getProportionateScreenWidth(16),
          fontWeight: FontWeight.bold,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
_makingPhoneCall(String phone) async {
  String url = 'tel:$phone';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class Messages extends StatelessWidget {
  String phone,id;
  Messages({
    Key key,
  @required this.phone,
    @required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: Row(
        children: [
          ContainerHalf(phone: phone,),
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          InkWell(
            onTap: () async{
              var doc = await FirebaseFirestore.instance.collection('shop').doc(id).get();
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatInterior(shopImage: doc['shopImage'], phoneNumber: doc['phoneNumber'], id: id, shopName: doc['shopName'])));
            },
            child: Stack(
              children: [
                Container(
                  height: getProportionateScreenWidth(120),
                  width: getProportionateScreenWidth(170),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: getProportionateScreenWidth(10),
                        top: getProportionateScreenWidth(10)),
                    child: Text(
                      'Message:',
                      style: TextStyle(
                        fontFamily: 'Muli',
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius:
                          BorderRadius.circular(getProportionateScreenWidth(15))),
                ),
                Positioned(
                    top: getProportionateScreenWidth(45),
                    left: getProportionateScreenWidth(57),
                    child: SvgPicture.asset('assets/images/message-circle.svg'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShopDetails extends StatelessWidget {
  const ShopDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Text(
        'Shop Details',
        style: TextStyle(
          fontFamily: 'Muli',
          fontSize: getProportionateScreenWidth(16),
          fontWeight: FontWeight.bold,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}

class ContainerHalf extends StatelessWidget {
  String phone;
  ContainerHalf({
    @required this.phone,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        _makingPhoneCall(phone);
      },
      child: Stack(
        children: [
          Container(
            height: getProportionateScreenWidth(120),
            width: getProportionateScreenWidth(170),
            child: Padding(
              padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(18),
                  top: getProportionateScreenWidth(10)),
              child: Text(
                'Call Shop:',
                style: TextStyle(
                  fontFamily: 'Muli',
                  fontSize: getProportionateScreenWidth(18),
                  fontWeight: FontWeight.bold,
                  color: kSecondaryLightColor,
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius:
                    BorderRadius.circular(getProportionateScreenWidth(15))),
          ),
          Positioned(
              top: getProportionateScreenWidth(45),
              left: getProportionateScreenWidth(55),
              child: SvgPicture.asset('assets/images/phone-call.svg'))
        ],
      ),
    );
  }
}

class detailsContainer extends StatelessWidget {
  const detailsContainer({
    Key key,
    @required this.color,
    @required this.text,
    @required this.colortoo,
    @required this.svg,
  }) : super(key: key);
  final Color color;
  final String text;
  final Color colortoo;
  final String svg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: Stack(children: [
        Container(
          height: getProportionateScreenWidth(100),
          width: double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(15)),
          ),
        ),
        Positioned(
          top: 6,
          left: 20,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Muli',
              fontSize: getProportionateScreenWidth(18),
              fontWeight: FontWeight.bold,
              color: colortoo,
            ),
          ),
        ),
        Positioned(
          right: getProportionateScreenWidth(25),
          bottom: getProportionateScreenWidth(25),
          child: SvgPicture.asset(svg),
        ),
        // Positioned(
        //   bottom: 20,
        //   left: 30,
        //   child: Text(
        //     '8:30 - 10:30',
        //     style: TextStyle(
        //       fontFamily: 'Muli',
        //       fontSize: getProportionateScreenWidth(14),
        //       fontWeight: FontWeight.bold,
        //       color: kPrimaryColor,
        //     ),
        //   ),
        // ),
        // Positioned(
        //   bottom: 30,
        //   left: 30,
        //   child: Text(
        //     '10:30 - 12:30',
        //     style: TextStyle(
        //       fontFamily: 'Muli',
        //       fontSize: getProportionateScreenWidth(14),
        //       fontWeight: FontWeight.bold,
        //       color: kPrimaryColor,
        //     ),
        //   ),
        // )
      ]),
    );
  }
}

class ContainerMulti extends StatelessWidget {
  String shopImage;
  ContainerMulti({
    @required this.shopImage,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: Container(
        height: getProportionateScreenWidth(250),
        width: double.infinity,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
        ),
        child: Image.network(shopImage),
      ),
    );
  }
}
