import 'package:flutter/material.dart';

class customWidget extends StatelessWidget {
  const customWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomText(name : "Dhruv",clr : Colors.red,fSize: 50),
    );
  }
  Widget CustomText({required String name,required Color clr,required double fSize}){
    return Text(name,style: TextStyle(color: clr,fontSize: fSize),
    );
  }

}
