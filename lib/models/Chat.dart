import 'package:KartexFinal/screens/MessagingInterior/chat_interior.dart';
import 'package:flutter/material.dart';

class chatWidget extends StatelessWidget {
  bool isActive =false;
  String image,name,id,phoneNumber;
  chatWidget({
    @required this.image,
    @required this.name,
    @required this.id,
    @required this.phoneNumber,
});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatInterior(phoneNumber: phoneNumber,id: id,shopName: name,shopImage: image,)));
      },
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(image),
                ),
                if (isActive == true)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white)),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Hi',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.50)),
                    )
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.80,
              child: Text(
                'today',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
