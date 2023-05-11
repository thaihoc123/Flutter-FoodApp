import 'package:flutter/material.dart';
import 'package:midtermpr1/models/account_model.dart';
import '/resourses/app_color.dart';
import 'dart:math' as m;

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final VoidCallback? leftPressed;
  final VoidCallback? logout;
  final Color? color;
  final AccountModel? account;
  const CustomAppBar({
    super.key,
    this.leftPressed,
    this.color = AppColor.bgColor,
    this.logout,
    this.account,
  });

  @override
  Widget build(BuildContext context) {
    double size = 22;
    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20)
            .copyWith(top: MediaQuery.of(context).padding.top + 15, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: leftPressed,
              child: Transform.rotate(
                angle: m.pi / 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        border: Border.all(color: AppColor.white),
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(3, 3),
                            color: AppColor.grey,
                            blurRadius: 4,
                          ),
                        ]),
                    child: Transform.rotate(
                      angle: -m.pi / 4,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: size,
                        color: AppColor.brown,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(account?.name ?? 'Hoc App',
                style: TextStyle(
                    fontSize: size,
                    color: AppColor.blue,
                    fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: logout,
              child: CircleAvatar(
                backgroundImage:
                    AssetImage(account?.image ?? 'assets/images/hoc.png'),
                radius: size,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
