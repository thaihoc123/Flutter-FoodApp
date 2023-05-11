import 'package:flutter/material.dart';
import 'package:midtermpr1/components/custom_app_bar.dart';
import 'package:midtermpr1/components/custom_button.dart';
import 'package:midtermpr1/models/account_model.dart';
import 'package:midtermpr1/pages/splash_page.dart';
import 'package:midtermpr1/resourses/app_color.dart';

import 'home_page.dart';

class PaymentPage extends StatelessWidget {
  final AccountModel? account;
  final double? allPrice;
  const PaymentPage({super.key, this.allPrice, this.account});

  @override
  Widget build(BuildContext context) {
    String accountNumber = '0896200798';
    double size = 12;
    return Scaffold(
      appBar: CustomAppBar(
        account: account,
        logout: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: AppColor.grey,
                title: const Text(
                  'You have not payment yet!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.red,
                  ),
                ),
                content: const Text(
                  'Do you want to lock out?',
                  style: TextStyle(fontSize: 17),
                ),
                actions: [
                  TextButton(
                    child: const Text('No'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Yes'),
                    onPressed: () {
                      Route route = MaterialPageRoute(
                          builder: (context) => const HomePage());
                      Navigator.push(context, route);
                    },
                  ),
                ],
              );
            },
          );
        },
        leftPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Payment',
                  style: TextStyle(
                      color: AppColor.blue,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Your totaly Bills: ${(allPrice ?? 0).toStringAsFixed(2)}\$',
                  style: const TextStyle(color: AppColor.red, fontSize: 20),
                ),
                const Text(
                  'Please transfer into this back account',
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                Text('Number: ${accountNumber}'),
                const Text('Bank: MB Bank, Momo'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: CustomButton(
                      text: 'Done',
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => const SplashPage());
                        Navigator.push(context, route);
                      }),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Back',
                        style: TextStyle(color: AppColor.green))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
