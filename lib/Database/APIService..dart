import 'dart:convert';

import 'package:http/http.dart' as http;
class apiService{

  String myUrl = "https://6673d5f375872d0e0a93e612.mockapi.io/me/Dhruv/todoapi";
  List<dynamic> users = [];

  Future<List<dynamic>> fetchTodos() async{
    var res = await http.get(Uri.parse(myUrl));
    List<dynamic> users = await jsonDecode(res.body);
    return users;
  }
}
