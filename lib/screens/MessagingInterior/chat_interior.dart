import 'package:KartexFinal/screens/MessagingInterior/components/chat_interior_body.dart';
import 'package:KartexFinal/size_config.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatInterior extends StatelessWidget {
  String shopImage,shopName,phoneNumber,id;
  ChatInterior({
   @required this.shopImage,
   @required this.phoneNumber,
   @required this.id,
   @required this.shopName,
});
  static String routeName = '/ChatInterior';
  _makingPhoneCall(String phone) async {
    String url = 'tel:$phone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios_outlined),
              color: Colors.black,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(shopImage),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              width: getProportionateScreenWidth(130),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shopName,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  Text(
                    'Active 3m ago',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.payment_rounded,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {
              _makingPhoneCall(phoneNumber);
            },
            icon: Icon(Icons.call,
            color: Colors.black,),
          )
        ],
      ),
      body: ChatInteriorBody(shopImage: shopName,phoneNumber: phoneNumber,id: id,shopName: shopName,),
    );
  }
}
