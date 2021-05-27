import 'package:KartexFinal/screens/MessagingInterior/components/chat_interior_body.dart';
import 'package:flutter/material.dart';

class ChatInterior extends StatelessWidget {
  static String routeName = '/ChatInterior';
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
              backgroundImage: AssetImage('assets/images/user_2.png'),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Budwar Shops',
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
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call,
            color: Colors.black,),
          )
        ],
      ),
      body: ChatInteriorBody(),
    );
  }
}
