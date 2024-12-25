import 'package:flutter/material.dart';

class printonScreen extends StatefulWidget {
  printonScreen({super.key});

  @override
  State<printonScreen> createState() => _printonScreenState();
}

class _printonScreenState extends State<printonScreen> {
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          TextField(
            controller: name,
            style: TextStyle(color: Colors.black,backgroundColor: Colors.yellowAccent),
          ),
          ElevatedButton(onPressed: (){
            setState(() {

            });
          }, child: Text("Click here!!")),
          Text(name.text,style: TextStyle(color: Colors.black,backgroundColor: Colors.grey),)
        ],
      ),

    );
  }
}
