import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/list.dart';
import 'package:flutter_application_1/pages/setting.dart';

class MySwift extends StatefulWidget {
  const MySwift({super.key});

  @override
  State<MySwift> createState() => _MySwiftState();
}

class _MySwiftState extends State<MySwift> {
  var judul = "Aksara Outdoor";
  var isi = "Selamat datang";
  var gambar = "images/Alam.jpg";
  var tombolbawah = "kembali Aplikasi";

  int pageIndex = 0;

  final MyHome _listHome = MyHome();
  final MyList _listProducts = new MyList();
  final MySetting _sites = new MySetting();

  Widget _showPage = new MyHome();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _listHome;
        break;
      case 1:
        return _listProducts;
        break;
      case 2:
        return _sites;
        break;
      // case 3:
      // return _flutterPages;
      // break;
      default:
        return new Container(
          child: new Center(
            child: Text(
              "No page found by page chooser.",
              style: new TextStyle(fontSize: 30),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(judul),
      ),

      body: Container(
        color: Colors.purple,
        child: Center(
          child: Center(
            child: _showPage,
          ),
        ),
      ),

      bottomNavigationBar: CurvedNavigationBar(
        index: pageIndex,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        color: Colors.pink,
        buttonBackgroundColor: Colors.red,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}