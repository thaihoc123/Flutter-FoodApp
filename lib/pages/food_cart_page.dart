import 'package:flutter/material.dart';
import 'package:midtermpr1/components/custom_app_bar.dart';
import 'package:midtermpr1/components/custom_food_detail.dart';
import 'package:midtermpr1/models/account_model.dart';
import 'package:midtermpr1/models/food_model.dart';
import 'package:midtermpr1/pages/home_page.dart';
import 'package:midtermpr1/pages/payment_page.dart';
import 'package:midtermpr1/resourses/app_color.dart';

class FoodCartPage extends StatefulWidget {
  final AccountModel? account;

  const FoodCartPage({
    super.key,
    this.account,
  });

  @override
  State<FoodCartPage> createState() => _FoodCartPageState();
}

class _FoodCartPageState extends State<FoodCartPage> {
  List<FoodModel> foodList2 = List.from(foodList);
  List<FoodModel> defaultFood = [];

  @override
  void initState() {
    if (foodList == foodList2) {
      defaultFood = foodList;
    } else {
      defaultFood = foodList2;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        account: widget.account,
        logout: () {
          Route route =
              MaterialPageRoute(builder: (context) => const HomePage());
          Navigator.push(context, route);
        },
        leftPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: AppColor.grey,
                title: const Text(
                  'Alert',
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
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(height: 20),
                const Text(
                  'Food List',
                  style: TextStyle(
                      color: AppColor.brown,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: defaultFood.length,
                    itemBuilder: ((context, index) {
                      FoodModel food = defaultFood[index];
                      return Dismissible(
                        key: UniqueKey(),
                        direction: ((food.quantity ?? 0) == 1)
                            ? DismissDirection.endToStart
                            : DismissDirection.none,
                        onDismissed: (direction) {
                          setState(() {
                            defaultFood
                                .removeWhere((item) => item.id == food.id);
                            food.quantity = (food.quantity ?? 0) - 1;
                          });
                        },
                        background: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColor.green),
                          margin: const EdgeInsets.only(top: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.delete, color: AppColor.white),
                            ],
                          ),
                        ),
                        child: CustomFoodDetail(
                          foodModel: food,
                          decrease: () {
                            setState(() {
                              if ((food.quantity ?? 0) > 1) {
                                food.quantity = (food.quantity ?? 0) - 1;
                              }
                            });
                          },
                          increase: () {
                            setState(() {
                              food.quantity = (food.quantity ?? 0) + 1;
                            });
                          },
                        ),
                      );
                    }),
                  ),
                ),
              ]),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Back',
                        style: TextStyle(color: AppColor.green))),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      double allPrice = 0;
                      for (var food in defaultFood) {
                        allPrice += (food.price ?? 0) * (food.quantity ?? 0);
                        setState(() {});
                      }
                      Route route = MaterialPageRoute(
                          builder: (context) => PaymentPage(
                                account: widget.account,
                                allPrice: allPrice,
                              ));
                      Navigator.push(context, route);
                    },
                    child: const Text('Next',
                        style: TextStyle(color: AppColor.green))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
