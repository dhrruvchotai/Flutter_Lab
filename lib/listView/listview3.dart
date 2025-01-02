import 'package:flutter/material.dart';

class Listview3 extends StatelessWidget {
  Listview3({super.key});
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List View Practice"),backgroundColor: Colors.red,),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context,int index){
              isSelected = index % 2 == 0;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text('Item ${index}'),
                  tileColor: isSelected ? Colors.blue : Colors.green,
                  titleTextStyle : TextStyle(fontWeight: FontWeight.w900),
                  titleAlignment:ListTileTitleAlignment.center,
                ),
              );
      }),
    );
  }
}
