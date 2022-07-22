import 'package:flutter/material.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
        title: Text('Todo list'),
        centerTitle: true,
      ),
      body: Column (
      children: [
        Text('MainScreen'),
        ElevatedButton(onPressed: () {}, child: Text('Follow next'))
      ],
    )
    );
  }
}