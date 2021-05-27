import 'package:KartexFinal/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getProportionateScreenWidth(15),),
        Text('All Shops in "Daily Needs" near you'),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15), vertical: getProportionateScreenWidth(10)),
          child: InkWell(
            borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
            onTap: () {},
            child: Container(
              child: Padding(
                padding:  EdgeInsets.symmetric( horizontal: getProportionateScreenWidth(20), vertical: getProportionateScreenWidth(10)),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: getProportionateScreenHeight(170),
                        width: getProportionateScreenHeight(170),
                        child: Image.asset('assets/images/OIP.jfif',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: getProportionateScreenWidth(20),),
                    IntrinsicHeight(
                      child: Column(
                        children: [
                          Text(
                        'Vishal Mega Mart',
                        style: TextStyle(
                          fontFamily: 'Muli',
                          fontSize: getProportionateScreenWidth(15),
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Divider(
                         indent: 2,
                        endIndent: 2,
                        color: Colors.black,
                        
                      ),
                      SizedBox(height: getProportionateScreenWidth(5),),
                      Text('Address',maxLines: 3,),
                      SizedBox(height: getProportionateScreenWidth(20),),
                          Text('Daily Needs'),
                          SizedBox(height: getProportionateScreenWidth(15),),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Text('Ratings'),
                                
                                VerticalDivider(
                                  indent: 2,
                                  endIndent: 2,
                                  color: Colors.black,
                                ),
                                Text('3hrs'),
                                
                                VerticalDivider(
                                  indent: 2,
                                  endIndent: 2,
                                  color: Colors.black,
                                ),
                                Text('Efficient'),
                                
                              ],
                            ),
                          )
                        ],

                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

