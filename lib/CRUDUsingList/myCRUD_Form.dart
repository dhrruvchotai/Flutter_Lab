import 'package:flutter/material.dart';
import 'package:labs/CRUDUsingList/user.dart';

class myCRUD_Form extends StatefulWidget {
  const myCRUD_Form({super.key});

  @override
  State<myCRUD_Form> createState() => _myCRUD_FormState();
}

class _myCRUD_FormState extends State<myCRUD_Form> {

  User user = User();

  TextEditingController Name = TextEditingController();
  TextEditingController Age = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Id = TextEditingController();

  GlobalKey<FormState> FormKey = GlobalKey();
  List<Map<String, dynamic>> Users = [];
  String FormattedUsers = "";
  bool isUpdate=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('CRUD Using Form')),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: FormKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
               isUpdate==false? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: Name,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter name!!';
                          }
                          if (!RegExp(r'\w')
                              .hasMatch(value)) {
                            return 'Please enter valid name!!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: Age,
                        decoration: InputDecoration(
                          labelText: 'Age',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter age!!';
                          }

                          if (!RegExp(r'\d').hasMatch(value)) {
                            return 'Please enter valid age';
                          }

                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: Email,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter email!!";
                          }
                          if (!RegExp(r'^.*@gmail.com$').hasMatch(value)) {
                            return 'Please enter valid email!!';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ) : Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(12.0),
                     child: TextFormField(
                       controller: Name,
                       decoration: InputDecoration(
                         labelText: 'Name',
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(20)),
                       ),
                       validator: (value) {
                         if (value!.isEmpty) {
                           return 'Please enter name!!';
                         }
                         if (!RegExp(r'\w')
                             .hasMatch(value)) {
                           return 'Please enter valid name!!';
                         }
                         return null;
                       },
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(12.0),
                     child: TextFormField(
                       controller: Age,
                       decoration: InputDecoration(
                         labelText: 'Age',
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(20)),
                       ),
                       validator: (value) {
                         if (value!.isEmpty) {
                           return 'Please enter age!!';
                         }

                         if (!RegExp(r'\d').hasMatch(value)) {
                           return 'Please enter valid age';
                         }

                         return null;
                       },
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(12.0),
                     child: TextFormField(
                       controller: Email,
                       decoration: InputDecoration(
                         labelText: 'Email',
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(20)),
                       ),
                       validator: (value) {
                         if (value!.isEmpty) {
                           return "Please enter email!!";
                         }
                         if (!RegExp(r'^.*@gmail.com$').hasMatch(value)) {
                           return 'Please enter valid email!!';
                         }
                         return null;
                       },
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(12.0),
                     child: TextFormField(
                       controller: Id,
                       decoration: InputDecoration(
                         labelText: 'Id',
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(20)),
                       ),
                       validator: (value) {
                         if (value!.isEmpty) {
                           return "Please enter Id!!";
                         }
                         if (!RegExp(r'\d').hasMatch(value)) {
                           return 'Please enter valid Id!!';
                         }
                         return null;
                       },
                     ),
                   ),
                 ],
               ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: FilledButton(
                          onPressed: () {
                            setState(() {
                              isUpdate=false;
                            });

                            if(!FormKey.currentState!.validate()){
                              print('Please enter valid details');
                              user.addUserInList(name: Name.text, age:Age.text, email: Email.text);
                            }

                            // print('Name : ${Name.text}, Age : ${Age.text}, Email : ${Email.text} ');
                            // print(user.getUserList());

                          },
                          child: Text('Add User'),
                          style: FilledButton.styleFrom(backgroundColor: Colors.blue),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: FilledButton(onPressed: (){

                          setState(() {});

                          if(!FormKey.currentState!.validate()){
                            print('Enter valid details!!');
                          }

                          Users = user.getUserList();
                          for( int i = 0; i<Users.length;i++){
                            FormattedUsers += "Id : $i,\t Name : ${Users[i]["Name"]}, \t Age : ${Users[i]["Age"]}, \t Email : ${Users[i]["Email"]} \n \n";
                          }

                        }, child: Text('Display Users'),style: FilledButton.styleFrom(
                            backgroundColor: Colors.blue
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: FilledButton(onPressed: (){
                          setState(() {
                            isUpdate=true;
                          });
                          user.updateUser(name: Name.text, age: Age.text, email: Email.text, id: Id.text);
                        }, child: Text("Update"),
                        style: FilledButton.styleFrom(backgroundColor: Colors.blue)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(FormattedUsers),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
