import 'package:flutter/material.dart';
import 'package:midtermpr1/models/food_model.dart';
import 'package:midtermpr1/resourses/app_color.dart';

class CustomFoodDetail extends StatelessWidget {
  final FoodModel foodModel;
  final VoidCallback? decrease;
  final VoidCallback? increase;
  const CustomFoodDetail({
    super.key,
    required this.foodModel,
    this.decrease,
    this.increase,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
      decoration: BoxDecoration(
          color: AppColor.white,
          border: Border.all(color: AppColor.green),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              offset: Offset(3, 3),
              color: AppColor.blue,
              blurRadius: 6,
            )
          ]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              foodModel.image ?? '',
              width: 90,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodModel.name ?? '',
                  style: const TextStyle(color: AppColor.green),
                ),
                Text(
                  foodModel.decription ?? '',
                  style: const TextStyle(color: AppColor.grey),
                ),
                Text(
                  'Price: ${(foodModel.price ?? 0.0).toStringAsFixed(2)}\$',
                  style: const TextStyle(color: AppColor.red),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                          'Total Price: ${((foodModel.price ?? 0) * (foodModel.quantity ?? 0)).toStringAsFixed(2)}\$'),
                      const Spacer(),
                      TextButton(onPressed: decrease, child: const Text('-')),
                      Text((foodModel.quantity ?? 0).toString()),
                      TextButton(onPressed: increase, child: const Text('+')),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
