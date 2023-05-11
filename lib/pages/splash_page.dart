import 'dart:async';

import 'package:flutter/material.dart';
import 'package:midtermpr1/pages/home_page.dart';
import 'package:midtermpr1/resourses/app_color.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Route route = MaterialPageRoute(builder: (context) => const HomePage());
      Navigator.push(context, route);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColor.bgColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'You bought the foods successful!',
            style: TextStyle(
                color: AppColor.blue,
                fontSize: 20,
                decoration: TextDecoration.none),
          ),
          Text(
            'Thank you for using our service!!',
            style: TextStyle(
                color: AppColor.green,
                fontSize: 20,
                decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }
}
