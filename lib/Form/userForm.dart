import 'package:flutter/material.dart';

class userForm extends StatefulWidget {
  const userForm({super.key});

  @override
  State<userForm> createState() => _userFormState();
}

class _userFormState extends State<userForm> {
  TextEditingController UserName = TextEditingController();
  TextEditingController Password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Form'),backgroundColor: Colors.blue,),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  // onChanged: (UserName) {
                  //   setState(() {
                  //
                  //   });
                  // },
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please Enter Something!!';
                    }
                    if(!RegExp(r'^.*@gmail.com$').hasMatch(value)){
                      return 'Enter Valid Email!!!';
                    }
                    return null;
                  },
                  controller: UserName,
                  decoration: InputDecoration(
                    labelText: 'Enter UserName : ',
                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(20)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  // onChanged: (Password){
                  //   setState(() {
                  //
                  //   });
                  // },
                  controller: Password,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please Enter Something!!';
                    }
                    if(!RegExp(r'^\d\w[@$_]{6}$').hasMatch(value)){
                      return 'Enter Valid Password!!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter Password : ',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed:(){
                  if(formKey.currentState!.validate()){
                    Text('Enter Valid Values!!');
                  }
                  print('UserName : ${UserName.text} \n Password : ${Password.text}');
                }, child: Text('Submit')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
