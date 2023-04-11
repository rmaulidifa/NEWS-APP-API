import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas_pmobile/controller/controller_services.dart';
import 'package:uas_pmobile/view/widget.dart';

//class login_page berisi widget halaman login yang mana datanya diambil dari api

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Service controller = Get.put<Service>(Service()); //get.put untuk mengambil data dari api
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logo(), //memanggil method logo yang ada di widget.dart
          username(controller.emailController.value), //memanggil method username yang ada di widget.dart
          password(controller.passwordController.value), //memanggil method password yang ada di widget.dart
          loginbutton(controller, context) //memanggil method loginbutton yang ada di widget.dart
        ],
      ),
    )));
  }
}