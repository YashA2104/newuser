import 'package:KartexFinal/screens/Forgot%20Password/forgot_password.dart';
import 'package:flutter/material.dart';

class CheckBoxLogin extends StatelessWidget {
  final String text;
  CheckBoxLogin({@required this.text});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (value) {
            value = true;
          },
        ),
        Text(text),
        Spacer(),
      ],
    );
  }
}
