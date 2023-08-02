import 'package:flutter/material.dart';
import 'package:flutter_application_1/nota/cart_screen.dart';
import 'package:flutter_application_1/pages/list.dart';
import 'package:flutter_application_1/utama.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {

    var gambarTenda  = "images/Alat/tenda 2-3.jpg";
    var gambarHammoc  = "images/Alat/Hammoc.png";
    var gambarNesting  = "images/Alat/nesting.jpg";
    var gambarMatras  = "images/Alat/matras.jpg";
    var gambarHeadlamp  = "images/Alat/Headlamp.jpg";
    var gambarTas  = "images/Alat/tas 50L.jpg";

    var tombolbawah     = "Pesan";

    return Scaffold(

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          Container(
            color: Colors.blue[800],
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage(gambarTenda),
                  height: 350,
                  width: 800,
                ),
              ],
            ),
          ),

          Container(
            color: Colors.blue[700],
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage(gambarHammoc),
                  height: 350,
                  width: 800,
                ),
              ],
            ),
          ),

          Container(
            color: Colors.blue[600],
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage(gambarNesting),
                  height: 350,
                  width: 800,
                ),
              ],
            ),
          ),

          Container(
            color: Colors.blue[500],
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage(gambarMatras),
                  height: 350,
                  width: 800,
                ),
              ],
            ),
          ),

          Container(
            color: Colors.blue[400],
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage(gambarHeadlamp),
                  height: 350,
                  width: 800,
                ),
              ],
            ),
          ),

          Container(
            color: Colors.blue[300],
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage(gambarTas),
                  height: 350,
                  width: 800,
                ),
                ElevatedButton(
                  child: Text(tombolbawah),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}