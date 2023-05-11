import 'package:flutter/material.dart';
import 'package:midtermpr1/components/custom_app_bar.dart';
import 'package:midtermpr1/components/custom_button.dart';
import 'package:midtermpr1/components/custom_text_field.dart';
import 'package:midtermpr1/models/account_model.dart';
import 'package:midtermpr1/pages/home_page.dart';
import 'package:midtermpr1/resourses/app_color.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rppasswordController = TextEditingController();
  bool isPassword = true;
  IconData? iconPass = Icons.visibility;
  @override
  void initState() {
    super.initState();
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
        leftPressed: () {
          Navigator.pop(context);
        },
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
                      'Change Password Form',
                      style: TextStyle(
                          color: AppColor.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    CustomTextField(
                      controller: usernameController,
                      hintText: 'Username',
                    ),
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      isPassword: isPassword,
                      iconPass: iconPass,
                      onPass: _showPassword,
                    ),
                    CustomTextField(
                      controller: rppasswordController,
                      hintText: 'Repeat password',
                      isPassword: isPassword,
                    ),
                    CustomButton(
                      text: 'Submit',
                      onTap: () {
                        String username = usernameController.text.trim();
                        String password = passwordController.text.trim();
                        String rppassword = rppasswordController.text.trim();
                        String? notification;
                        bool isUsernameExists = false;
                        for (var account in accountList) {
                          if (username == account.username) {
                            isUsernameExists = true;
                            account.password = password;
                            break;
                          }
                        }
                        if (username == '' && password == '') {
                          notification = 'Please insert username, password';
                        } else if (username == '') {
                          notification = 'Please insert username';
                        } else if (password == '') {
                          notification = 'Please insert password';
                        } else if (password != rppassword) {
                          notification = 'Password is not match!';
                        } else if (username.length < 6 ||
                            username.length > 20 ||
                            password.length < 6 ||
                            password.length > 20) {
                          notification =
                              'Username and password have be from 6 to 20 characters';
                        } else if (!isUsernameExists) {
                          notification = 'Username is not exists!';
                        } else {
                          setState(() {});
                          Route route = MaterialPageRoute(
                              builder: (context) => HomePage(
                                    username: usernameController,
                                    password: passwordController,
                                  ));
                          Navigator.push(context, route);
                          notification = 'Change password success!';
                        }
                        final snackBar = SnackBar(
                          content: Text(notification),
                          backgroundColor: AppColor.grey,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    ),
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
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Back',
                        style: TextStyle(color: AppColor.green))),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
