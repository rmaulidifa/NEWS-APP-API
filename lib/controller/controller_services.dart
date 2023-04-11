import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/users.dart';

class Service extends GetxController {
  //inisialisasi controller
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var isLogin = false.obs;
  Users? users;
  var user = DataUser().obs;

  void cleanController() {
    emailController.value.clear(); //menghapus textfield email
    passwordController.value.clear(); //menghapus textfield password
  }

  Future<bool> login() async {
    isLogin.value = false; //inisialisasi awal
    Dio dio = Dio(); //inisialisasi dio
    var res = await dio.get("https://reqres.in/api/users"); //get data dari api

    Users abc = Users.fromJson(res.data); //mengubah data dari api menjadi model
    //mengambil data dari model
    abc.data!.forEach((element) { 
      if (element.email == emailController.value.text &&
          element.firstName == passwordController.value.text) {
        user.value = element;
        isLogin.value = true;
        print("Login Berhasil sebagai ${user.value.firstName}");
      }
    });
    cleanController(); //menghapus textfield
    return isLogin.value;
  }
  //menghapus data login
  void logout() {
    isLogin.value = false;
    cleanController();
  }
}