

import 'package:KartexFinal/screens/CategoryEach/Categoryeach.dart';
import 'package:KartexFinal/screens/Checkout/Checkout.dart';
import 'package:KartexFinal/screens/Complete%20Profile/complete_profile.dart';
import 'package:KartexFinal/screens/EmailVerification/EmailVerification.dart';
import 'package:KartexFinal/screens/Forgot%20Password/forgot_password.dart';
import 'package:KartexFinal/screens/HelpCenter/help_center.dart';
import 'package:KartexFinal/screens/Login%20Success/login_success.dart';
import 'package:KartexFinal/screens/LoginPage-Welcome/login_page.dart';
import 'package:KartexFinal/screens/MessagingChat/chat.dart';
import 'package:KartexFinal/screens/MessagingInterior/chat_interior.dart';
import 'package:KartexFinal/screens/MyAccount/MyAccounts.dart';
import 'package:KartexFinal/screens/Notification/notifications.dart';
import 'package:KartexFinal/screens/OTP/otp_screen.dart';
import 'package:KartexFinal/screens/RegisterPage/register_page.dart';
import 'package:KartexFinal/screens/RegisterSuccess/register_success.dart';
import 'package:KartexFinal/screens/ResendOTP/resendOTP.dart';
import 'package:KartexFinal/screens/SettingsScreen/settings.dart';
import 'package:KartexFinal/screens/ShopAll/shopall.dart';
import 'package:KartexFinal/screens/Shopeach/shopeach.dart';
import 'package:KartexFinal/screens/ShopsScreen/ShopsScreen.dart';
import 'package:KartexFinal/screens/Wishlist/wishlist.dart';
import 'package:KartexFinal/screens/cart/cart_screen.dart';
import 'package:KartexFinal/screens/details/details_screen.dart';
import 'package:KartexFinal/screens/home/home_screen.dart';
import 'package:KartexFinal/screens/profile/profile_screen.dart';
import 'package:KartexFinal/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginPage.routeName: (context) => LoginPage(),
  LoginSuccess.routeName: (context) => LoginSuccess(),
  ForgotPassword.routeName: (context) => ForgotPassword(),
  CompleteProfile.routeName: (context) => CompleteProfile(),
  RegisterPage.routeName: (context) => RegisterPage(),
  OTPScreen.routeName: (context) => OTPScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  EmailVerification.routeName: (context) => EmailVerification(),
  RegisterSuccess.routeName: (context) => RegisterSuccess(),
  ResendOTPScreen.routeName: (context) => ResendOTPScreen(),
  Checkout.routeName: (context) => Checkout(),
  ChatScreen.routeName: (context) => ChatScreen(),
  ChatInterior.routeName: (context) => ChatInterior(),
  Wishlist.routeName: (context) => Wishlist(),
  HelpCenter.routeName: (context) => HelpCenter(),
  Notifications.routeName: (context) => Notifications(),
  Settings.routeName: (context) => Settings(),
  MyAccounts.routeName: (context) => MyAccounts(),
  CategoryEach.routeName: (context) => CategoryEach(),
  StoreDetailPage.routeName: (context) => StoreDetailPage(),
  Shopall.routeName: (context) => Shopall(),
  Shopeach.routeName: (context) => Shopeach(),

};
