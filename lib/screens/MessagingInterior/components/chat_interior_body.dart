import 'dart:io';

import 'package:KartexFinal/models/ChatMessage.dart';
import 'package:KartexFinal/screens/MessagingInterior/components/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatInteriorBody extends StatefulWidget {
  String shopImage,shopName,phoneNumber,id;
ChatInteriorBody({
  @required this.shopImage,
  @required this.phoneNumber,
  @required this.id,
  @required this.shopName,
  Key key
  }) : super(key: key);

  @override
  _ChatInteriorBodyState createState() => _ChatInteriorBodyState();
}

class _ChatInteriorBodyState extends State<ChatInteriorBody> {
  ScrollController scrollController =ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: StreamBuilder<QuerySnapshot>(
                      stream: _firestore.collection('messages').orderBy('timeStamp').snapshots(),
                      builder: (context , snapshot){
                        if(!snapshot.hasData){
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.blue,
                            ),
                          );
                        }
                        else{
                          List<DocumentSnapshot> docs = snapshot.data.docs;
                          List<Widget> messages = docs.where((element) =>
                          ((element['senderID'] == FirebaseAuth.instance.currentUser.uid &&
                              element['receiverID'] == widget.id ) ||
                              (element['receiverID'] == FirebaseAuth.instance.currentUser.uid &&
                                  element['senderID'] == widget.id)),
                          ).map((doc)=> Message(
                            isSender: FirebaseAuth.instance.currentUser.uid == doc['senderID'],
                            msgText: doc['messageBody'],
                          )).toList();

                          return ListView(
                            controller: scrollController,
                            children: messages,
                          );
                        }


                      })
                ),
              ),
            ],
          ),
        ),
        bottomMenu(context,widget.id),
      ],
    );
  }

  var _firestore = FirebaseFirestore.instance;

  Container bottomMenu(BuildContext context, String id) {

    String DPpath;
    final picker = ImagePicker();
    File image;

    Future chooseImage() async {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          image = File(pickedFile.path);
        }
      });
    }
    TextEditingController messageController = new TextEditingController();

    Future<void> sendChat() async {
      if (messageController.text.length > 0) {
        var doc = await FirebaseFirestore.instance.collection('Customer').doc(FirebaseAuth.instance.currentUser.uid).collection('user').doc('details').get();
        var doc_ab = await FirebaseFirestore.instance.collection('shop').doc(id).get();
        var _doc = await FirebaseFirestore.instance.collection('chattedUsers').doc(id).collection('users').doc(FirebaseAuth.instance.currentUser.uid).get();
        var doc_a = await _firestore.collection('chattedShops').doc(FirebaseAuth.instance.currentUser.uid).collection('shops').doc(id).get();
        if(_doc.exists && doc_a.exists){
          var a =2;
        }
        else{
          await _firestore.collection('chattedUsers').doc(id).collection('users').doc(FirebaseAuth.instance.currentUser.uid).set(
              {
                'userID' : FirebaseAuth.instance.currentUser.uid,
                'userName' : doc['firstName'] + doc['lastName'],
                'phoneNumber': doc['phoneNumber'],
                'address': doc['address'],
              });
          await _firestore.collection('chattedShops').doc(FirebaseAuth.instance.currentUser.uid).collection('shops').doc(id).set(
              {
                'shopID' : doc_ab['userID'],
                'shop' : doc_ab['shopImage'],
                'shopName' : doc_ab['shopName'],
                'phoneNumber': doc_ab['phoneNumber'],
              });
        }

        await _firestore.collection("messages").add({
          'senderID': FirebaseAuth.instance.currentUser.uid,
          'receiverID': id,
          'messageBody': messageController.text,
          'timeStamp': FieldValue.serverTimestamp(),
          'isImage' : false,
        });
        messageController.clear();
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      }
      else{
        Fluttertoast.showToast(msg: 'Kindly Enter a Message');
      }

    }
    Future <void> sendImage() async {
      await chooseImage();
      var storage = FirebaseStorage.instance
          .ref('sentImages')
          .child(faker.person.name().toString());
      UploadTask uploadTask = storage.putFile(image);
      await uploadTask.whenComplete(() => null).then((value) async {
        await value.ref.getDownloadURL().then((value) async => {
          DPpath = value.toString(),
        await _firestore.collection("messages").add({
        'senderID': FirebaseAuth.instance.currentUser.uid,
        'receiverID': id,
        'messageBody': DPpath,
        'timeStamp': FieldValue.serverTimestamp(),
        'isImage' : true,
        }),
            messageController.clear(),
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut),
        });
      });
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(color: Colors.white),
      child: SafeArea(
        child: Row(
          children: [
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.50),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    Icon(Icons.sentiment_satisfied_alt, color: Colors.white),
                    SizedBox(
                      width: 2,
                    ),
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type Message',
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print('123');
                        sendImage();
                      },
                      child: Icon(
                        Icons.attach_file,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),

                  ],
                ),
              ),
            ),
            IconButton(
                icon: Icon(Icons.send_rounded,),
              onPressed: (){
                  sendChat();
              },
            ),
          ],
        ),
      ),
    );
  }
}
