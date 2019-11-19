import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jualan/models/getlist_result.dart';
import 'package:http/http.dart' as http;

class TestApiGetListPage extends StatefulWidget {
  @override
  _TestApiGetListPageState createState() => _TestApiGetListPageState();
}

class _TestApiGetListPageState extends State<TestApiGetListPage> {
  Data data;
  ListUsers listUser;
   Future<ListUsers> _getUsers(String pages)async{
    String apiUrl = "https://reqres.in/api/users?page=" + pages;
    var apiResult = await http.get(apiUrl);
    var jsonObject = json.decode(apiResult.body);

    listUser = ListUsers.fromJson(jsonObject);
    print(listUser); 
    for (int i = 0 ;i<listUser.data.length; i++)
    {print(listUser.data[i].avatar);}
    return listUser;
  }
  @override
  void initState(){
    super.initState();
    _getUsers("2");
  }
  
  // Future<List<Data>> _getUsers(String pages)async{
  //   String apiUrl = "https://reqres.in/api/users?page=" + pages;
  //   var apiResult = await http.get(apiUrl);
  //   var jsonObject = json.decode(apiResult.body);
  //   List<dynamic> listUser = (jsonObject as Map<String, dynamic>)['data'];

  //   List<Data> users = [];
  //   for (int i=0; i<listUser.length; i++){
  //     users.add(Data.fromJson(listUser[i]));
  //   }
  //   return users;
  // }
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
                
              },
              child: Text('GET'),
            )
          ],
        ),
      ),
    );
  }
}