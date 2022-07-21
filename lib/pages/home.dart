import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List todoList = [];

  @override
  void initState() {
    super.initState();
    
    todoList.addAll(['Buy milk', 'Wash dishes', 'Купить картошку']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Todo list'),
        centerTitle: true,
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
      )
    );
  }
}
