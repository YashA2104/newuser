import 'package:KartexFinal/models/Chat.dart';
import 'package:KartexFinal/screens/MessagingInterior/chat_interior.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder <QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('chattedShops').doc(FirebaseAuth.instance.currentUser.uid).collection('shops').snapshots(),
            builder: (context , snapshots){
              final List<DocumentSnapshot> documents = snapshots.data.docs;
              return documents.isNotEmpty? ListView(
                children: documents.map((doc)  =>
                    chatWidget(image: doc['shop'], name: doc['shopName'],id: doc['shopID'],phoneNumber: doc['phoneNumber'],)).toList(),
              ) : Center(child: CircularProgressIndicator());
            },
          ),
        )
      ],
    );
  }
}
