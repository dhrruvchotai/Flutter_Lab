import 'package:flutter/material.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Sheet"),backgroundColor: Colors.blue,),
      body: Expanded(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              showModalBottomSheet(context: context, builder: (context){
                return Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        ElevatedButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text("Hey Shitt go down!!!"))
                      ],
                    ),
                  ),
                );
              },);
            }, child: Text("Hey Shitt come up!!"))
          ],
        ),
      ),
    );
  }
}
