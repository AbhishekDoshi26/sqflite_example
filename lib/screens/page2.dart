import 'package:flutter/material.dart';
import 'package:sqflite_example/model/user.dart';
import 'package:sqflite_example/services/sql_service.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  User? _user;
  TextEditingController _firstNameController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  void getData() async {
    _user = await SqfliteService.getData(firstName: _firstNameController.text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
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
            InkWell(
              onTap: () {
                getData();
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.teal,
                ),
                child: Icon(Icons.check),
              ),
            ),
            Text(_user != null && _user!.lastName != null ? _user!.lastName : ""),
          ],
        ),
      ),
    );
  }
}
