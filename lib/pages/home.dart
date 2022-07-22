import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String _userToDo;
  List todoList = [];

  @override
  void initState() {
    super.initState();
    
    todoList.addAll(['Buy milk', 'Wash dishes', 'Купить картошку']);
  }

  void _menuOpen () {
    Navigator.of(context).push(
      MaterialPageRoute (builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar( title: Text("Menu"),),
          body: Text("Main menu"),
        );
    })
    );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Todo list'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.menu_outlined),
              onPressed: _menuOpen),
        ],
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index){
           return Dismissible(
               key: Key (todoList[index]),
               child: Card (
                 child: ListTile(
                     title: Text(todoList[index]),
                   trailing: IconButton(
                       icon: Icon(
                         Icons.delete_sweep,
                         color: Colors.red,
                       ),
                       onPressed: (){
                         setState(() {
                           todoList.removeAt(index);
                         });
                       },
                   ),
                 ),
               ),
               onDismissed: (direction) {
             setState(() {
               todoList.removeAt(index);
             });
           },
           );
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Добавить элемент'),
              content: TextField(
                onChanged: (String value) {
                  _userToDo = value;
            },
            ),
              actions: [
                ElevatedButton(onPressed: () {
                  setState(() {
                    todoList.add(_userToDo);
                  });
                  Navigator.of(context).pop();
                }, child: Text('Add'))
              ],
            );
          });

        },
        child: Icon(
          Icons.add_box,
          color: Colors.white,
        ),
      ),
    );
  }
}
