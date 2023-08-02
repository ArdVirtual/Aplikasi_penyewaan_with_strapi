import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/edit.dart';
import 'package:http/http.dart' as http;

class MyList extends StatelessWidget {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int totalData = 0;
  var dataJson;

  void menampilkandata() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };

    var response = await http.get(
        Uri.parse('http://localhost:1337/api/outdoors'),
        headers: headers);

    dataJson = jsonDecode(response.body);
    print(dataJson["data"][1]["attributes"]["total"]);
    setState(() {
      totalData = dataJson["meta"]["pagination"]["total"];
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    menampilkandata();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: ListView.builder(
          itemCount: totalData,
          itemBuilder: (data, index) {

            return ListTile(
              onTap: () {
                var namabarang = dataJson["data"][index]["attributes"]["namabarang"];
                var jenis = dataJson["data"][index]["attributes"]["jenis"];
                var id = dataJson["data"][index]["id"];
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditPage(
                            namabarang: namabarang,
                            jenis: jenis,
                            id: id,
                          )),
                );
              },
              leading: const Icon(Icons.add_shopping_cart),

              trailing: IconButton(
                  onPressed: () async {

                    var id = dataJson["data"][index]["id"];

                    Map<String, String> headers = {
                      'Content-Type': 'application/json',
                      'Accept': 'application/json'
                    };

                    var response = await http.delete(
                        Uri.parse('http://localhost:1337/api/outdoors/$id'),
                        headers: headers);

                    menampilkandata();

                  },
                  icon: const Icon(Icons.delete)),
              title: Text(dataJson["data"][index]["attributes"]["namabarang"]),
            );
          }),
    );
  }
}
