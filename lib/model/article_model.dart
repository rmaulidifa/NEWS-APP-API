//class ArticleModel digunakan sebagai class model untuk mengambil data dari api

class ArticleModel{
  String author; //inisialisasi variabel
  String title;
  String description;
  String url;
  String urlToImage;
  String content;
  
  //membuat constructor
  ArticleModel({required this.author, required this.title, required this.description, required this.url, required this.urlToImage, required this.content});
  
}