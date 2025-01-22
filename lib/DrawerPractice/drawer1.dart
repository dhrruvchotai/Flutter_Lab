import 'package:flutter/material.dart';

class Drawer1 extends StatelessWidget {
  const Drawer1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Drawer Practice")),backgroundColor: Colors.blue,),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('My Drawer Header',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),),decoration: BoxDecoration(color: Colors.blue),),
            ListTile(
              title: Text('Item 1'),
              hoverColor:Colors.red,
            ),
            ListTile(
              title: Text('Item 2'),
            )
          ],
        ),
      ),
    );
  }
}
