import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jualan/models/post_result.dart';
import 'package:http/http.dart' as http;

class TestApiPage extends StatefulWidget {
  @override
  _TestApiPageState createState() => _TestApiPageState();
}

class _TestApiPageState extends State<TestApiPage> {
  PostResult postResult;

  Future<PostResult> post(String name, String job) async {
    String apiUrl = "https://reqres.in/api/users";

    var apiResult = await http.post(apiUrl,
        body: {"name": name, "job": job}); // buat post dengan parameter body
    var jsonObject = json.decode(apiResult
        .body); // merubah apiResult menjadi Json, ngambil juga dari api atau response

    return PostResult.fromJson(jsonObject);
  }

  @override
  void initState() {
    super.initState();
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
            Text(postResult != null
                ? postResult.id +
                    postResult.name +
                    postResult.job +
                    postResult.createdAt
                : "data kosong"),
            RaisedButton(
              onPressed: () {
                post("Rizki", "Programer").then((value) {
                  // fungsi then membalikan nilai dari api
                  setState(() {
                    postResult = value;
                  });
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
