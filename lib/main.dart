import 'package:flutter/material.dart';
// * theme file
import 'package:to_do_list_app/theme.dart';
import 'package:to_do_list_app/add.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.data,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'unko',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 32,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              child: Card(
                child: ListTile(
                    title: Text(todoList[index]),
                ),
              ),
              background: Container(
                color: Colors.red
              ),
              onDismissed: (direction) {
                setState(() {
                  todoList.removeAt(index);
                });
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            final newListText = await Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return Add();
            }));
            if (newListText != null) {
              setState(() {
                todoList.add(newListText);
              });
            }
          }),
    );
  }
}
