import 'package:flutter/material.dart';

class Listview2 extends StatelessWidget {
  Listview2({super.key});

  List<String> names = ['Hello','brooo','Dhruv'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List View Practice'),backgroundColor: Colors.blue,),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (BuildContext context,int index){
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 50,
                    color: Colors.blue,
                    child: Text('Entry ${index} : ${names[index]}'),
                  ),
                );
              }),
      ),
    );
  }
}
