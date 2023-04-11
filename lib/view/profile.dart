import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:uas_pmobile/view/home.dart';
import 'dart:convert';

//class profile digunakan untuk menampilkan halaman profile
class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
  final double coverHeight = 200.0; //inisialisasi variabel
  final double profilHeight = 144;

  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profilHeight / 2; 
    return Scaffold(
     body: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
         buildTop(), //memanggil method buildTop 
         buildContent(), //memanggil method buildContent
      ],
     ),
  );
  }

  //method buildTop untuk menampilkan gambar cover dan profile
  Widget buildTop() {
    final bottom = profilHeight / 2;
    final top = coverHeight - profilHeight / 2;
    
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: bottom),
            child: buildCoverImage()),
          Positioned(
            top: top,
            child: buildProfileImage(),
          )
        ],
      );
  }

//method buildCoverImage untuk menampilkan gambar cover
  Widget buildCoverImage() => Container(
    color: Colors.grey,
    child: Image.network('https://images.unsplash.com/photo-1664574654521-7faf33eb9086?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
    // child: Image.asset('assets/cover.jpg'),
    width: double.infinity,
    height: 200,
    fit: BoxFit.cover,
    ),
  );

//method buildProfileImage untuk menampilkan gambar profile
  Widget buildProfileImage() => CircleAvatar(
    radius: 72,
    backgroundImage: NetworkImage('https://images.unsplash.com/photo-1585728748176-455ac5eed962?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80',
    ),
  );

//method buildContent untuk menampilkan nama, pekerjaan, dan sosial media
  Widget buildContent() => Column(
    children: [
      const SizedBox(height: 8),
      Text('Renisa Maulidifa', style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      ),
      const SizedBox(height: 8),
      Text('UI/UX Designer', style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w300,
      ),
      ),
      const SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSocialIcon(FontAwesomeIcons.facebookF),
          const SizedBox(width: 12),
          buildSocialIcon(FontAwesomeIcons.twitter),
          const SizedBox(width: 12),
          buildSocialIcon(FontAwesomeIcons.instagram),
          const SizedBox(width: 12),
          buildSocialIcon(FontAwesomeIcons.linkedinIn),
          const SizedBox(width: 12),
        ],
      ),
      
      const SizedBox(height: 16),
      Divider(),
      const SizedBox(height: 16),
      buildAbout(),
      const SizedBox(height: 32),
    ],
    );

//method buildAbout untuk menampilkan bio
  Widget buildAbout() => Column(
    
    children:[
      Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Text('Bio', style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        ),
        const SizedBox(height: 16),
        Text('Hallo Guys, Nice to Meet You'
        , style: TextStyle(
          fontSize: 18,
          height: 1.4,
        ),
        ),
      ]
    ),
  ]
  );

//method buildSocialIcon untuk menampilkan icon sosial media
  Widget buildSocialIcon(IconData icon) => CircleAvatar(
    radius: 24,
   child: Material(
    shape: CircleBorder(),
    clipBehavior: Clip.hardEdge,
    color: Colors.transparent,
    child: InkWell(
      onTap: () {},
      child: Icon(icon, size: 32),

   ),
  ),
  );
}
     