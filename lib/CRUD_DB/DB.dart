import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class MyDB{

  late Database _db;
  List<Map<String,dynamic>> UserList = [];

  Future<void> initDatabase() async{
    try {
      _db = await openDatabase(
        join(await getDatabasesPath(), 'UserDB.db'),
        onCreate: (db, version) {
          return db.execute(
              'CREATE TABLE user(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, city TEXT)');
        },
        version: 1,
      );
    }
    catch(e){
      print("Error While Creating Database : $e");
    }
  }

  Future<List<Map<String,dynamic>>> fetchData() async{
    final List<Map<String,dynamic>> data = await _db.query('user');
    return data;
  }

  Future<void> addUser(String name, String city) async{
    try{
      await _db.insert(
        'user',
        {'name' : name, 'city' : city},
        conflictAlgorithm: ConflictAlgorithm.replace
      );
      fetchData();
    }
    catch(e){
      print('Error in adding user : $e');
    }
  }

  Future<void> deleteUser(int id) async{
    await _db.delete(
        'user',
        where: 'id = ?',
        whereArgs: [id],
    );
  }

  Future<void> updateUser(int id, String name, String city) async{
   await _db.update(
     'user',
     {'name' : name, 'city' : city},
     where: 'id = ?',
     whereArgs: [id]
   );
  }
}