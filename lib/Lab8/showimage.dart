import 'package:flutter/material.dart';

class showimage extends StatefulWidget {
  showimage({super.key});

  @override
  State<showimage> createState() => _showimageState();
}

class _showimageState extends State<showimage> {
  bool isDisplayMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birthday Card'), backgroundColor: Colors.blue,),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: isDisplayMode ? Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: FilledButton(onPressed: () {
                  setState(() {

                  });
                  isDisplayMode = !isDisplayMode;
                  print(isDisplayMode);
                }, child: Text('Get Card'),
                  style: FilledButton.styleFrom(backgroundColor: Colors.blue),),
              )
            ],
          ) : Stack(
            children: [
              Image.asset("assets/images/minion.jpg"),
              Container(
                color: Colors.white..withOpacity(0.5),
              ),
            ],
    ),)
    ,
    );
  }
}
