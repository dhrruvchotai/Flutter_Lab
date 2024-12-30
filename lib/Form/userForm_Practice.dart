import 'package:flutter/material.dart';

class userForm_Practice extends StatefulWidget {
  const userForm_Practice({super.key});

  @override
  State<userForm_Practice> createState() => _userForm_PracticeState();
}

class _userForm_PracticeState extends State<userForm_Practice> {

  TextEditingController Password = TextEditingController();
  TextEditingController  Email = TextEditingController();
  GlobalKey<FormState> Form_Key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Form'),backgroundColor: Colors.blue),
      body: Form(
        key: Form_Key,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: Email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  validator: (value){
                    if(value!.isEmpty) {
                      return 'Please enter something!!';
                    }
                    if(!RegExp(r'^.*@gmail.com$').hasMatch(value)){
                      return 'Please enter valid email!!';
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: Password,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  onChanged: (Password){
                    setState(() {

                    });
                  },
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please enter something!!!';
                    }
                    if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
                      return 'The Password Is Incorrect!!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FilledButton(onPressed: (){
                  if(!Form_Key.currentState!.validate()){
                    Text('Please enter valid details!!');
                  }
                }, child:Text('Submit'),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
