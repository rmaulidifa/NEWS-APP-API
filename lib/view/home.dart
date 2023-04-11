import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uas_pmobile/model/article_model.dart';
import 'package:uas_pmobile/model/category_model.dart';
import 'package:uas_pmobile/view/article_view.dart';
import 'package:uas_pmobile/view/category_news.dart';
import 'package:uas_pmobile/view/login_page.dart';
import 'package:uas_pmobile/view/profile.dart';
import 'package:uas_pmobile/viewmodel/data.dart';
import 'package:uas_pmobile/viewmodel/news.dart';

//class home berisi widget untuk menampilkan data dari api ke dalam home
class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

//inisialisasi variabel
 List<CategoryModel> categories =  <CategoryModel>[];
 List<ArticleModel> articles =  <ArticleModel>[];
 bool _loading = true;

  @override
  void initState() { //inisialisasi state
    super.initState(); //memanggil state
    categories = getCategories(); //memanggil method getCategories
    getNews(); //memanggil method getNews
  }

  getNews() async{
    News newsClass = News(); //inisialisasi variabel
    await newsClass.getNews(); //memanggil method getNews
    articles = newsClass.news; //memanggil variabel news
    setState(() { //mengubah state
      _loading = false; //mengubah state
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: new Icon(Icons.person, color: Colors.red),
            //Menangani kejadian saat menu profile diklik
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
              builder: (context) => Profile(
          ),
        ));
            },),
        ],
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
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading ? Center( //menampilkan loading
      child : Container(
        child: CircularProgressIndicator(),
      ),
      ) :
      SingleChildScrollView(
        child: Container(
           padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[

            /// Categories
            Container(
              padding: EdgeInsets.only(top: 16),
              height: 70,
              child: ListView.builder( //menampilkan data dari api ke dalam listview
                itemCount: categories.length, //menghitung jumlah data
                shrinkWrap: true, //mengatur ukuran listview
                scrollDirection: Axis.horizontal, //mengatur arah listview
                itemBuilder: (context, index) { //mengatur tampilan listview
                  return CategoryTile( //memanggil class CategoryTile
                    imageUrl: categories[index].imageUrl, //memanggil variabel imageUrl
                    categoryName: categories[index].categoryName, //memanggil variabel categoryName
                  );
                },
              ),
            ),
        
            /// Blogs
            Container(
              padding: EdgeInsets.only(top: 16),
              child: ListView.builder( //menampilkan data dari api ke dalam listview
                itemCount: articles.length, //menghitung jumlah data
                shrinkWrap: true, //mengatur ukuran listview
                physics: ClampingScrollPhysics(), //mengatur scroll listview
                itemBuilder: (context, index) { //mengatur tampilan listview
                  return BlogTile( //memanggil class BlogTile
                    imageUrl: articles[index].urlToImage, //memanggil variabel imageUrl
                    title: articles[index].title, //memanggil variabel title
                    desc: articles[index].description, //memanggil variabel desc
                    url: articles[index].url, //memanggil variabel url
                  );
                },
              ),
            )
          ],
        ),
      ),
      ),
      //menampilkan menu drawer
         drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text('IDN NEWS'),
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(
          builder: (context) => Profile( //memanggil class Profile
          ),
        ));
              },
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(
          builder: (context) => Home( //memanggil class Home
          ),
        ));
              },
            ),
            ListTile(
              title: const Text('Log Out'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
            builder: (context) => LoginPage(
          ),
        ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

//class category tile untuk menampilkan data dari api ke dalam listview
class CategoryTile extends StatelessWidget {

  final String imageUrl, categoryName; //inisialisasi variabel
  CategoryTile({required this.imageUrl, required this.categoryName}); //menginisialisasi variabel

  @override
  Widget build(BuildContext context){
    return GestureDetector( //menangani kejadian saat widget diklik
      onTap: (){
        Navigator.push(context, MaterialPageRoute( //mengarahkan ke halaman lain
          builder: (context) => CategoryNews( //memanggil class CategoryNews
            category: categoryName.toLowerCase(), //memanggil variabel categoryName
          ),
        ));
      },
      child: Container(
      margin: EdgeInsets.only(right: 16),
      child: Stack(
        children: <Widget> [
          ClipRRect( //membuat widget menjadi persegi panjang
          borderRadius: BorderRadius.circular(6),
           child: CachedNetworkImage( //menampilkan gambar dari url
            imageUrl : imageUrl, width: 120, height: 60, fit: BoxFit.cover,),
          ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(categoryName, style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),),
            )
        ],
      ),
      ),
    );
  }
}

//class blog tile untuk menampilkan data dari api ke dalam listview
class BlogTile extends StatelessWidget {
  
  final String imageUrl, title, desc, url; //inisialisasi variabel
  BlogTile({required this.imageUrl, required this.title, required this.desc, required this.url}); //menginisialisasi variabel

  @override
  Widget build(BuildContext context) {
    return GestureDetector( 
      onTap: (){ //menangani kejadian saat widget diklik
        Navigator.push(context, MaterialPageRoute( //mengarahkan ke halaman lain
          builder: (context) => ArticleView( //memanggil class ArticleView
            blogUrl: url, //memanggil variabel url
          ),
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect( //membuat widget menjadi persegi panjang
              borderRadius: BorderRadius.circular(6),
              child:Image.network(imageUrl) //menampilkan gambar dari url
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