import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:midtermpr1/pages/food_cart_page.dart';
import 'package:midtermpr1/pages/forget_password_page.dart';
import 'package:midtermpr1/pages/home_page.dart';
import 'package:midtermpr1/pages/payment_page.dart';
import 'package:midtermpr1/pages/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      // home: FoodCartPage(),
      // home: PaymentPage(),
      // home: SplashPage(),
      // home: ForgetPasswordPage(),
    );
  }
}
