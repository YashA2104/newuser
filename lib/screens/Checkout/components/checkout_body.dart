import 'package:KartexFinal/components/product_card.dart';
import 'package:KartexFinal/models/Products.dart';
import 'package:KartexFinal/screens/Checkout/components/CheckoutBar.dart';
import 'package:KartexFinal/screens/Checkout/components/DeliveryOptions.dart';
import 'package:KartexFinal/screens/Checkout/components/TextConfig.dart';
import 'package:KartexFinal/screens/cart/components/check_out_card.dart';

import 'package:KartexFinal/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            CheckoutBar(
              title: 'Your Cart',
              text: 'View All',
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    demoProducts.length,
                    (index) {
                      if (demoProducts[index].isPopular)
                        return ProductCard(product: demoProducts[index]);

                      return SizedBox
                          .shrink(); // here by default width and height is 0
                    },
                  ),
                  SizedBox(width: getProportionateScreenWidth(20)),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            CheckoutBar(title: 'Your Address', text: 'Edit Address'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextConfig(
                  text:
                      'Rohit Raut, (+91) 9488483154 \n Ajni Quarters ,Nagpur , 44024',
                ),
              ],
            ),
            CheckoutBar(title: 'Shipping Options', text: 'Choose Service'),
            DeliveryOptions(),
            CheckoutBar(title: 'Payment Methods', text: 'View All'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
            ),
          ],
        )
      ],
    );
  }
}
