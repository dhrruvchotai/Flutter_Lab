import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: BirthdayCard(),
));

class BirthdayCard extends StatefulWidget {
  const BirthdayCard({super.key});

  @override
  State<BirthdayCard> createState() => _BirthdayCardState();
}

class _BirthdayCardState extends State<BirthdayCard> {

  TextEditingController name = TextEditingController();

  bool isSubmit = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isSubmit ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: name,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              )
            ),
          ),
          SizedBox(height: 10,),
          FilledButton(onPressed: (){
            setState(() {
              isSubmit = false;
            });
          }, child: Text('Submit',), style: FilledButton.styleFrom(backgroundColor: Colors.blue),)
        ],
      ) : Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage('https://www.shutterstock.com/image-vector/birthday-vertical-greeting-card-poster-600w-2313456591.jpg'),fit: BoxFit.fill)
            ),
          ),
          Positioned(
            left: 165,
              top: 325,
              child: Text(name.text.toString(), style: TextStyle(fontSize: 32, color: Colors.red),)
          )
        ],
      )
    );
  }
}
