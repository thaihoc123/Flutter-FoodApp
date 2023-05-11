import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:midtermpr1/components/custom_app_bar.dart';
import 'package:midtermpr1/components/custom_button.dart';
import 'package:midtermpr1/components/custom_text_field.dart';
import 'package:midtermpr1/models/account_model.dart';
import 'package:midtermpr1/models/food_model.dart';
import 'package:midtermpr1/pages/food_cart_page.dart';
import 'package:midtermpr1/pages/forget_password_page.dart';
import 'package:midtermpr1/pages/signup_page.dart';
import 'package:midtermpr1/resourses/app_color.dart';

class HomePage extends StatefulWidget {
  final TextEditingController? username;
  final TextEditingController? password;
  const HomePage({super.key, this.username, this.password});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<AccountModel> _accountLogined = [];
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPassword = true;
  IconData? iconPass = Icons.visibility;

  @override
  void initState() {
    if (widget.username != null) {
      setState(() {
        usernameController.text = widget.username!.text;
        passwordController.text = widget.password!.text;
      });
    }
    super.initState();
  }

  void _exit() {
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
            'Do you want to exit?',
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
                setState(() {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showPassword() {
    setState(() {
      isPassword = !isPassword;
      if (!isPassword) {
        iconPass = Icons.visibility_off;
      } else {
        iconPass = Icons.visibility;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leftPressed: _exit,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      'Login Form',
                      style: TextStyle(
                          color: AppColor.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    CustomTextField(
                      iconData: Icons.man_4,
                      controller: widget.username ?? usernameController,
                      hintText: 'Username',
                    ),
                    CustomTextField(
                      iconData: Icons.lock,
                      controller: passwordController,
                      hintText: 'Password',
                      isPassword: isPassword,
                      iconPass: iconPass,
                      onPass: _showPassword,
                    ),
                    CustomButton(
                      text: 'Login',
                      onTap: () {
                        String username = usernameController.text.trim();
                        String password = passwordController.text.trim();
                        String notification = 'Username or password is wrong';
                        if (username == '' && password == '') {
                          notification = 'Please insert username and password';
                        } else if (password == '') {
                          notification = 'Please insert password';
                        } else if (username == '') {
                          notification = 'Please insert username';
                        }
                        for (var account in accountList) {
                          if (username == account.username &&
                              password == account.password) {
                            _accountLogined.add(AccountModel(
                              username: username,
                              password: password,
                            ));
                            notification = 'Login Success';
                            print(foodList);
                            Route route = MaterialPageRoute(
                                builder: (context) => FoodCartPage(
                                      account: account,
                                    ));
                            Navigator.push(context, route);
                          }
                        }
                        final snackBar = SnackBar(
                          content: Text(notification),
                          backgroundColor: AppColor.grey,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    ),
                    CustomButton(
                        text: 'Register',
                        onTap: () {
                          Route route = MaterialPageRoute(
                              builder: (context) => const SignUpPage());
                          Navigator.push(context, route);
                        }),
                    CustomButton(
                        text: 'Forget Password',
                        onTap: () {
                          Route route = MaterialPageRoute(
                              builder: (context) => const ForgetPasswordPage());
                          Navigator.push(context, route);
                        }),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              children: [
                GestureDetector(
                    onTap: _exit,
                    child: const Text('Back',
                        style: TextStyle(color: AppColor.green))),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      String username = usernameController.text.trim();
                      String password = passwordController.text.trim();
                      for (var account in _accountLogined) {
                        if (_accountLogined.isNotEmpty) {
                          if (username == account.username &&
                              password == account.password) {
                            Route route = MaterialPageRoute(
                                builder: (context) => FoodCartPage(
                                      account: account,
                                    ));
                            Navigator.push(context, route);
                          }
                        }
                      }
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
