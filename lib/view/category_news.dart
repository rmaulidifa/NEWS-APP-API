import 'package:flutter/material.dart';
import 'package:uas_pmobile/model/article_model.dart';
import 'package:uas_pmobile/view/article_view.dart';
import 'package:uas_pmobile/viewmodel/news.dart';

//class CategoryNews berisi widget untuk menampilkan data dari api ke dalam listview
class CategoryNews extends StatefulWidget {
  
  final String category; //inisialisasi variabel
  CategoryNews({required this.category}); //membuat constructor

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<ArticleModel> articles =  <ArticleModel>[]; //inisialisasi variabel
  bool _loading = true; //inisialisasi variabel

  @override
  void initState() { //inisialisasi state
    super.initState(); //memanggil state
    getCategoryNews(); //memanggil method getCategoryNews
  }

  getCategoryNews() async{
    CategoryNewsClass newsClass = CategoryNewsClass(); //inisialisasi variabel
    await newsClass.getNews(widget.category); //memanggil method getNews
    articles = newsClass.news; //memanggil variabel news
    setState(() { //mengubah state
      _loading = false; //mengubah state
    });
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      //berisi widget untuk membuat tampilan appbar
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
      //berisi widget untuk membuat tampilan body 
     body: _loading ? Center( //membuat kondisi jika _loading bernilai true
        child: CircularProgressIndicator(), //membuat widget progress indicator
      ) : SingleChildScrollView( //membuat widget scrollview
      
            /// Blogs
           child: Container(
            child: Container(
              padding: EdgeInsets.only(top: 16, right: 16, left: 16),
              child: ListView.builder( //membuat listview
                itemCount: articles.length, //menghitung jumlah data
                shrinkWrap: true, //mengatur ukuran listview
                physics: ClampingScrollPhysics(), //mengatur scroll
                itemBuilder: (context, index) { //membuat listview
                  return BlogTile( //memanggil widget BlogTile
                    imageUrl: articles[index].urlToImage, //memanggil variabel urlToImage
                    title: articles[index].title, //memanggil variabel title
                    desc: articles[index].description, //memanggil variabel description
                    url: articles[index].url, //memanggil variabel url
                  );
                },
              ),
            ),
        ),
      ),
    );
  }
}

//class BlogTile berisi widget untuk menampilkan data dari api ke dalam listview
class BlogTile extends StatelessWidget {
  
  final String imageUrl, title, desc, url; //inisialisasi variabel
  BlogTile({required this.imageUrl, required this.title, required this.desc, required this.url}); //membuat constructor

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute( //membuat navigasi
          builder: (context) => ArticleView( //memanggil widget ArticleView
            blogUrl: url, //memanggil variabel url
          ),
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect( //cliprrect digunakan untuk membuat tampilan gambar menjadi persegi panjang
              borderRadius: BorderRadius.circular(6),
              //mengambil gambar dari internet yang dipanggil melalui variabel imageUrl
              child:Image.network(imageUrl) 
              ),
            SizedBox(height: 8,),
            Text(title, style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
            ),
            SizedBox(height: 8,),
            Text(desc, style: TextStyle(
              color: Colors.black54,
            ),
            ),
            
          ],
        )
      ),
    );
  }
}