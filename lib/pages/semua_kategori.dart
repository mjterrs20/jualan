import 'package:flutter/material.dart';

class KategoriPage extends StatefulWidget {
  @override
  _KategoriPageState createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kategori"),
        backgroundColor: Colors.black12,
      ),
      body: Container(
        child: Center(
          child: Text("ini kategori"),
        ),
      ),
    );
  }
}