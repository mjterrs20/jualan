import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String status = '';

  // check apakah web ada atau tidak
  // status code 200 sama dengan ada
  // status code 403 sama dengan tidak ada
  _check() {
    http.get('https://firebasestorage.googleapis.com/v0/b/aplikasi-cafa6.appspot.com/o/a000066_featured_4.jpg?alt=media&token=7e353570-fc3b-4ab1-98d4-6f2e527382c8').then((response){
        print("skuy"+response.statusCode.toString());
      });
  }
  void initState() {
    super.initState();
    _check();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hi"),
      ),
      body: Center(
        child: Text("Hi"),
      ),
    );
  }
}
