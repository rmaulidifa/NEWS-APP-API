import 'dart:convert';

import 'package:uas_pmobile/model/article_model.dart';
import 'package:http/http.dart' as http;

//class article_model berisi variabel yang digunakan untuk menampung data dari api
class News{

  List<ArticleModel> news = []; //variabel news bertipe data List<ArticleModel>

  Future<void> getNews() async{
  //url berisi api yang digunakan untuk menampilkan data
  String url = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=4fa17e570c5143fbaed1d751589cd138";

  var response = await http.get(Uri.parse(url)); //http.get digunakan untuk mengambil data dari api

  var jsonData = jsonDecode(response.body); //mengubah data dari api menjadi json

//jika data yang diambil dari api berhasil maka akan menampilkan data
  if(jsonData['status'] == "ok"){ //jika status dari api adalah ok
    jsonData["articles"].forEach((element){  //mengambil data dari api
      if(element['urlToImage'] != null && element['description'] != null){ //jika urlToImage dan description tidak kosong
        ArticleModel articleModel = ArticleModel( //mengisi variabel articleModel dengan data yang diambil dari api
             //mengambil variabel dari class ArticleModel
             title: element['title'],
             author: element['author'],
              description: element['description'],
              url: element["url"],
              urlToImage: element['urlToImage'],
              content: element["content"],
        );

        news.add(articleModel); //menambahkan data ke dalam variabel news
      }
    });
}
}
}

//class CategoryNewsClass berisi variabel yang digunakan untuk menampung data dari api
class CategoryNewsClass{

  List<ArticleModel> news = []; //variabel news bertipe data List<ArticleModel>

  Future<void> getNews(String category) async{
    //url berisi api yang digunakan untuk menampilkan data
     String url = "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=4fa17e570c5143fbaed1d751589cd138";
     
  var response = await http.get(Uri.parse(url)); //http.get digunakan untuk mengambil data dari api

  var jsonData = jsonDecode(response.body); //mengubah data dari api menjadi json

//jika data yang diambil dari api berhasil maka akan menampilkan data
  if(jsonData['status'] == "ok"){
    jsonData["articles"].forEach((element){ 
      if(element['urlToImage'] != null && element['description'] != null){
        ArticleModel articleModel = ArticleModel(
             title: element['title'],
             author: element['author'],
              description: element['description'],
              url: element["url"],
              urlToImage: element['urlToImage'],
              content: element["content"],
        );

        news.add(articleModel); //menambahkan data yang diambil dari api ke variabel news
      }
    });
    
}
}
}