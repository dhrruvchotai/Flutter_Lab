import 'package:flutter/material.dart';

class BirthdayCardPage extends StatefulWidget {
  var name;
   BirthdayCardPage({super.key,required this.name});

  @override
  State<BirthdayCardPage> createState() => _BirthdaycardpageState();
}

class _BirthdaycardpageState extends State<BirthdayCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Bday Card'),),
      body: Stack(
        children: [
            // IconButton(onPressed: (){
            //   Navigator.pop(context);
            // }, icon: Icon(Icons.arrow_back)),

            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/birthday.png'))
              ),
            ),
            Positioned(
                left: 720,
                bottom: 90,
                child: Column(
                  children: [
                    Center(child: Text(widget.name,style: TextStyle(fontSize: 32, color: Colors.black54),)),
                    // ElevatedButton(onPressed: (){
                    //   Navigator.pop(context);
                    // }, child: Text('Go Back'))
                  ],
                )
            )
          ],
      ),
    );
  }
}


