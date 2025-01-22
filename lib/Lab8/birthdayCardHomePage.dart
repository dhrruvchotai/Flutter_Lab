import 'package:flutter/material.dart';
import 'package:labs/Lab8/birthdayCardPage.dart';

class NewBirthdayCard extends StatefulWidget {
  const NewBirthdayCard({super.key});

  @override
  State<NewBirthdayCard> createState() => _BirthdayCardState();
}

class _BirthdayCardState extends State<NewBirthdayCard> {

  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              FilledButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => BirthdayCardPage(name : name.text)));
              }, child: Text('Submit',), style: FilledButton.styleFrom(backgroundColor: Colors.blue),)
            ],
          )
      ),
    );
  }
}
