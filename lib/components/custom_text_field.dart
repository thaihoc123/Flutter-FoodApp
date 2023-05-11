import 'package:flutter/material.dart';
import 'package:midtermpr1/resourses/app_color.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool isPassword;
  final IconData? iconData;
  final IconData? iconPass;
  final VoidCallback? onPass;

  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.isPassword = false,
    this.iconData,
    this.iconPass,
    this.onPass,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: AppColor.white,
          border: Border.all(color: AppColor.green),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 3),
              color: AppColor.blue,
              blurRadius: 6,
            )
          ]),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              obscureText: isPassword,
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: Icon(iconData, color: AppColor.green),
                border: InputBorder.none,
                hintText: hintText,
                prefixIconConstraints: const BoxConstraints(minWidth: 40),
              ),
            ),
          ),
          GestureDetector(
            onTap: onPass,
            child: Icon(
              iconPass,
              color: AppColor.green,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
