import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jualan/models/get_result.dart';
import 'package:http/http.dart' as http;

class TestApiGetPage extends StatefulWidget {
  @override
  _TestApiGetPageState createState() => _TestApiGetPageState();
}

class _TestApiGetPageState extends State<TestApiGetPage> {
  // Users users;
  Data data;
  Future<Data> _get(String id) async {
    String apiUrl = "https://reqres.in/api/users/" + id;

    var apiResult = await http.get(apiUrl);
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)['data']; // cara ngeluarin dari nilai data

    return Data.fromJson(userData);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(""),
            RaisedButton(
              onPressed: () {
                _get('2').then((value){
                  print(value.firstName);
                });
              },
              child: Text('Post'),
            )
          ],
        ),
      ),
    );
  }
}