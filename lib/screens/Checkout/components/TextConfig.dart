import 'package:KartexFinal/size_config.dart';
import 'package:flutter/material.dart';

class TextConfig extends StatelessWidget {
  const TextConfig({
    Key key,
    @required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Muli',
        fontSize: getProportionateScreenWidth(15),
        color: Colors.black54,
      ),
      maxLines: 2,
    );
  }
}
