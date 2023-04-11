import 'package:flutter/material.dart';
import 'package:uas_pmobile/controller/controller_services.dart';
import 'package:uas_pmobile/view/home.dart';

//method logo untuk menampilkan logo
logo(){
  return Container(
    width: 200,
    height: 200,
    child: Image.asset('assets/logo.png'),
  );
}

//method username untuk menampilkan textfield username
username(TextEditingController controller) {
  return Container(
    height: 50,
    width: 300,
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        icon: const Icon(Icons.person),
        hintText: 'Enter your email',
        hintStyle: TextStyle(
              color: Colors.grey,
            ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    ),
  );
}

//method password untuk menampilkan textfield password
password(TextEditingController controller) {
  return SizedBox(
    width: 300,
    height: 50,
    child: TextField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
            hintText: "Password",
            icon: const Icon(Icons.lock),
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              // ),
            ),
            ),
            // ),
  );
}

//method loginbutton untuk menampilkan button login
loginbutton(Service controller, BuildContext context) {
  return Container(
    width: 200,
    height: 80,
     padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
     child: ElevatedButton(
      child: Text("Login"),
      onPressed: () {
        controller.login().then((value) {
          if (value) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
            //create snackbar scaffold succes
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Anda Berhasil Login"),
                duration: Duration(seconds: 2),
                backgroundColor: Colors.green,
              ),
            );
          } else {
            //create snackbar scaffold failed
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Login Gagal, Silakan Coba Lagi"),
                duration: Duration(seconds: 2),
                backgroundColor: Colors.red,
              ),
            );
          }
        });
      },
    ),
  );
}