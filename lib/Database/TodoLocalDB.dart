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
  List<Map<String, dynamic>> _mytodos = [];
  late Database _database;
  bool _isLoading = true;
  String? _priority = 'Low'; // Initialize with default value

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    try {
      _database = await openDatabase(
        path.join(await getDatabasesPath(), 'todos.db'),
        version: 4,
        onCreate: (db, version) async {
          print("Creating Table...");
          await db.execute(
              "CREATE TABLE todos (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, priority TEXT)"
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
      List<Map<String, dynamic>> todos = await _database.query('todos');
      setState(() {
        _mytodos.addAll(todos);
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
      print("ID: ${todo['id']}, Title: ${todo['title']}, Priority: ${todo['priority']}");
    }
  }

  Color getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return Colors.red.shade100;
      case 'low':
        return Colors.green.shade100;
      default:
        return Colors.white;
    }
  }

  Color getPriorityTextColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'low':
        return Colors.green;
      default:
        return Colors.black;
    }
  }

  void sortTodos(String order) {
    setState(() {
      if (order == "High-Low") {
        _mytodos.sort((a, b) => a["priority"].toString().compareTo(b["priority"].toString()));
      } else {
        _mytodos.sort((a, b) => b["priority"].toString().compareTo(a["priority"].toString()));
      }
    });
  }

  Future<void> _addTodo(BuildContext buildContext, String task, String priority) async {
    try {
      if (task.isNotEmpty && priority.isNotEmpty) {
        int result = await _database.insert(
          'todos',
          {'title': task, 'priority': priority},
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
        print("Todo added with ID: $result");
        await _fetchTodos();
        _title.clear();
      } else {
        ScaffoldMessenger.of(buildContext).showSnackBar(
          const SnackBar(content: Text('Title and priority cannot be empty')),
        );
      }
    } catch (e) {
      print("Error adding todo: $e");
      ScaffoldMessenger.of(buildContext).showSnackBar(
        const SnackBar(content: Text('Failed to add todo')),
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
        const SnackBar(content: Text('Failed to delete todo')),
      );
    }
  }

  Future<void> _updateTodo(BuildContext buildContext, int id, String newTitle, String priority) async {
    try {
      await _database.update(
        'todos',
        {'title': newTitle, 'priority': priority},
        where: 'id = ?',
        whereArgs: [id],
      );
      await _fetchTodos();
    } catch (e) {
      print("Error updating todo: $e");
      ScaffoldMessenger.of(buildContext).showSnackBar(
        const SnackBar(content: Text('Failed to update todo')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Todo App"),
          actions: [
            PopupMenuButton<String>(
              onSelected: (String item) {
                sortTodos(item);
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: "High-Low",
                  child: Text('High-Low'),
                ),
                const PopupMenuItem<String>(
                  value: "Low-High",
                  child: Text('Low-High'),
                ),
              ],
            ),
          ]
      ),
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
                hintText: 'TODO',
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _priority,
              decoration: const InputDecoration(
                labelText: 'Priority',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: "High", child: Text("High")),
                DropdownMenuItem(value: "Low", child: Text("Low")),
              ],
              onChanged: (value) {
                setState(() {
                  _priority = value;
                });
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _addTodo(context, _title.text, _priority!),
              child: const Text('Add Todo'),
            ),
            const SizedBox(height: 10),
            _isLoading
                ? const CircularProgressIndicator()
                : _mytodos.isEmpty
                ? const Text('No todos found')
                : Expanded(
              child: ListView.builder(
                itemCount: _mytodos.length,
                itemBuilder: (context, index) {
                  final todo = _mytodos[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    color: getPriorityColor(todo['priority']),
                    child: ListTile(
                      title: Text(todo['title']),
                      subtitle: Text(
                        todo['priority'],
                        style: TextStyle(
                          color: getPriorityTextColor(todo['priority']),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              _showEditDialog(context, index);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _deleteTodo(context, todo['id']);
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
    String currentPriority = _mytodos[index]['priority'];

    showDialog(
      context: buildContext,
      builder: (dialogContext) {
        return StatefulBuilder(
            builder: (context, setStateDialog) {
              return AlertDialog(
                title: const Text('Edit Todo'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: newTitle,
                      decoration: const InputDecoration(labelText: 'Title'),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: currentPriority,
                      decoration: const InputDecoration(
                        labelText: 'Priority',
                        border: OutlineInputBorder(),
                      ),
                      items: const [
                        DropdownMenuItem(value: "High", child: Text("High")),
                        DropdownMenuItem(value: "Low", child: Text("Low")),
                      ],
                      onChanged: (value) {
                        setStateDialog(() {
                          currentPriority = value!;
                        });
                      },
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(dialogContext),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _updateTodo(
                        buildContext,
                        _mytodos[index]['id'],
                        newTitle.text,
                        currentPriority,
                      );
                      Navigator.pop(dialogContext);
                    },
                    child: const Text('Save'),
                  ),
                ],
              );
            }
        );
      },
    );
  }
}