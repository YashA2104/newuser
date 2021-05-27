import 'package:KartexFinal/screens/Checkout/components/TextConfig.dart';
import 'package:KartexFinal/size_config.dart';
import 'package:flutter/material.dart';

class DeliveryOptions extends StatelessWidget {
  const DeliveryOptions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(15)),
            child: Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              child: Container(
                width: getProportionateScreenWidth(60),
                height: getProportionateScreenWidth(60),
                child: Image.asset('assets/images/fedex-express.png'),
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$130.18',
                style: TextStyle(
                  fontFamily: 'Muli',
                  fontSize: getProportionateScreenWidth(15),
                  color: Colors.black54,
                ),
              ),
              TextConfig(text: 'Will be delivered by May 15,2021')
            ],
          )
        ],
      ),
    );
  }
}
