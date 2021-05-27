import 'package:KartexFinal/components/custom_bottom_nav_bar.dart';
import 'package:KartexFinal/screens/MessagingChat/components/chat_body.dart';
import 'package:KartexFinal/screens/enums.dart';
import 'package:KartexFinal/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:KartexFinal/size_config.dart';

class ChatScreen extends StatelessWidget {
  static String routeName = "/Chat";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushNamed(context, HomeScreen.routeName);
          },
        ),
        elevation: 0,
        title: Text(
          'Chat',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ChatBody(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.message),
    );
  }
}
