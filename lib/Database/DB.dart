import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class MyDB extends StatefulWidget {
  const MyDB({super.key});

  @override
  State<MyDB> createState() => _MyDBState();
}

class _MyDBState extends State<MyDB> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  List<Map<String, dynamic>> _mytodos = [];
  late Database _database;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    try {
      _database = await openDatabase(
        path.join(await getDatabasesPath(), 'todos.db'),
        version: 3,
        onCreate: (db, version) async {
          print("Creating Table...");
          await db.execute(
              "CREATE TABLE todos (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT)"
          );
          print("Table Created Successfully!");
        },
      );
      await _fetchTodos();
    } catch (e) {
      print("Database initialization error: $e");
    }
  }

  Future<void> _fetchTodos() async {
    try {
      final List<Map<String, dynamic>> todos = await _database.query('todos');
      setState(() {
        _mytodos = todos;
        _isLoading = false;
      });
      _printAllTodos();
    } catch (e) {
      setState(() => _isLoading = false);
      print("Error fetching todos: $e");
    }
  }

  void _printAllTodos() async {
    final List<Map<String, dynamic>> todos = await _database.query('todos');
    for (var todo in todos) {
      print("ID: ${todo['id']}, Title: ${todo['title']}, Description: ${todo['description']}");
    }
  }

  Future<void> _addTodo(BuildContext buildContext, String task, String desc) async {
    try {
      if (task.isNotEmpty && desc.isNotEmpty) {
        int result = await _database.insert(
          'todos',
          {'title': task, 'description': desc},
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        print("Todo added with ID: $result");
        await _fetchTodos();
        _title.clear();
        _description.clear();
      } else {
        ScaffoldMessenger.of(buildContext).showSnackBar(
          SnackBar(content: Text('Title and description cannot be empty')),
        );
      }
    } catch (e) {
      print("Error adding todo: $e");
      ScaffoldMessenger.of(buildContext).showSnackBar(
        SnackBar(content: Text('Failed to add todo')),
      );
    }
  }

  Future<void> _deleteTodo(BuildContext buildContext, int id) async {
    try {
      await _database.delete(
        'todos',
        where: 'id = ?',
        whereArgs: [id],
      );
      await _fetchTodos();
    } catch (e) {
      print("Error deleting todo: $e");
      ScaffoldMessenger.of(buildContext).showSnackBar(
        SnackBar(content: Text('Failed to delete todo')),
      );
    }
  }

  Future<void> _updateTodo(BuildContext buildContext, int id, String newTitle, String newDesc) async {
    try {
      await _database.update(
        'todos',
        {'title': newTitle, 'description': newDesc},
        where: 'id = ?',
        whereArgs: [id],
      );
      await _fetchTodos();
    } catch (e) {
      print("Error updating todo: $e");
      ScaffoldMessenger.of(buildContext).showSnackBar(
        SnackBar(content: Text('Failed to update todo')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo App with SQLite")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _title,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Title',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _description,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Description',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _addTodo(context, _title.text, _description.text),
              child: Text('Add Todo'),
            ),
            SizedBox(height: 10),
            _isLoading
                ? CircularProgressIndicator()
                : _mytodos.isEmpty
                ? Text('No todos found')
                : Expanded(
              child: ListView.builder(
                itemCount: _mytodos.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(_mytodos[index]['title']),
                      subtitle: Text(_mytodos[index]['description']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              _showEditDialog(context, index);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _deleteTodo(context, _mytodos[index]['id']);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext buildContext, int index) {
    TextEditingController newTitle = TextEditingController(
      text: _mytodos[index]['title'],
    );
    TextEditingController newDesc = TextEditingController(
      text: _mytodos[index]['description'],
    );

    showDialog(
      context: buildContext,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text('Edit Todo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: newTitle,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: newDesc,
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _updateTodo(
                  buildContext,
                  _mytodos[index]['id'],
                  newTitle.text,
                  newDesc.text,
                );
                Navigator.pop(dialogContext);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}