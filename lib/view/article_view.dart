import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

//class ArticleView berisi widget untuk menampilkan data dari api ke dalam webview
class ArticleView extends StatefulWidget {
  
  final String blogUrl; //inisialisasi variabel
  ArticleView({required this.blogUrl}); //membuat constructor

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  final Completer<WebViewController> _completer = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.red, Colors.white])),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'IDN',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'NEWS',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.save)),
          )
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      //widget di bawah ini digunakan untuk menampilkan data dari api ke dalam webview
      body: Container(
        height: MediaQuery.of(context).size.height, //mengatur tinggi
        width: MediaQuery.of(context).size.width, //mengatur lebar
      child: WebView( //widget webview
        initialUrl: widget.blogUrl, //mengambil data dari api
        onWebViewCreated: ((WebViewController webViewController){ //membuat webview
          _completer.complete(webViewController); //mengisi webview
        }),
        ),
      )
    );
  }
}