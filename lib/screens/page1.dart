import 'package:flutter/material.dart';
import 'package:sqflite_example/model/user.dart';
import 'package:sqflite_example/screens/page2.dart';
import 'package:sqflite_example/services/sql_service.dart';

class Page1 extends StatefulWidget {
  Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  late TextEditingController _firstNameController = TextEditingController();
  late TextEditingController _lastNameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    SqfliteService.createDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Page2(),
                    ),
                  ),
              icon: Icon(Icons.next_plan))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _firstNameController,
            ),
            SizedBox(
              height: 50.0,
            ),
            TextField(
              controller: _lastNameController,
            ),
            SizedBox(
              height: 50.0,
            ),
            InkWell(
              onTap: () {
                SqfliteService.insertData(
                  user: User(
                    firstName: _firstNameController.text.trim(),
                    lastName: _lastNameController.text.trim(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.teal,
                ),
                child: Icon(Icons.check),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
