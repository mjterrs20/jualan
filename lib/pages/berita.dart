import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jualan/models/models_berita.dart';

class BeritaPage extends StatefulWidget {
  @override
  _BeritaPageState createState() => _BeritaPageState();
}

class _BeritaPageState extends State<BeritaPage> {
  Berita berita;
  Future<Berita> _berita()async{
    String apiUrl = "https://newsapi.org/v2/everything?q=bitcoin&from=2019-10-19&sortBy=publishedAt&apiKey=c43a05ee47444ed4b826b2b1615aca77";
    var apiResult = await http.get(apiUrl);
    var jsonObject = json.decode(apiResult.body);

    berita = Berita.fromJson(jsonObject);
    print(berita.status); 
    for (int i = 0 ;i<berita.articles.length; i++)
    {print(berita.articles[i].source.name);}
    return berita;
  }
  @override
  void initState(){
    super.initState();
    _berita();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}