import 'package:flutter/material.dart';
import 'package:labs/CRUD_DB/DB.dart';

class User_CRUD extends StatefulWidget {
  const User_CRUD({super.key});

  @override
  State<User_CRUD> createState() => _User_CRUDState();
}

class _User_CRUDState extends State<User_CRUD> {

  @override
  void initState() {
    super.initState();
    initializeDB();
  }

  void initializeDB() async{
    await mydatabase.initDatabase();
    fetchDataFromDB();
  }

  void fetchDataFromDB() async {
    List<Map<String, dynamic>> usersdata = await mydatabase.fetchData();
    setState(() {
      users = usersdata;
    });
    print('Fetched Users: $users');
  }


  MyDB mydatabase = MyDB();
  List<Map<String,dynamic>> users = [];
  TextEditingController Name = TextEditingController();
  TextEditingController City = TextEditingController();
  int? userId;
  bool isUpdateUserActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("USER CRUD USING DB"),centerTitle: true,),
      body: Column(
        children: [
          //Name Field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: Name,
              decoration: InputDecoration(
                  border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  hintText: "Name",
              ),
            ),
          ),
          //City Field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: City,
              decoration: InputDecoration(
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: "City",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){
              if(isUpdateUserActive){
                mydatabase.updateUser(userId!, Name.text, City.text);
              }
              else{
                mydatabase.addUser(Name.text, City.text);
              }
              Name.clear();
              City.clear();
              fetchDataFromDB();
              setState(() {

              });
            }, child: isUpdateUserActive ? Text('Update User') : Text('Add User'),),
          ),
          Expanded(
            child: users.isEmpty 
              ? Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.no_accounts_rounded,size: 60,),
                        Text("NO Users!",style: TextStyle(fontSize: 25),)
                      ],
                    ),
                ),
              )
              : ListView.builder(itemCount: users.length,itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Color(0XFF8ecae6),
                  title: Text(users[index]['name'],),
                  subtitle:Text(users[index]['city']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: (){
                        Name.text = users[index]['name'];
                        City.text = users[index]['city'];
                        fetchDataFromDB();
                        setState(() {
                          isUpdateUserActive = true;
                          userId = users[index]['id'];
                        });
                      }, icon: Icon(Icons.edit_note,size: 30,)),
                      IconButton(onPressed: () async{
                        await mydatabase.deleteUser(users[index]['id']);
                        fetchDataFromDB();
                      }, icon: Icon(Icons.delete))
                    ],
                  ),
                ),
              );
            },)
          ),
        ],
      ),
    );
  }
}
