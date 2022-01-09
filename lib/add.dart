import 'package:flutter/material.dart';
import 'package:to_do_list_app/main.dart';

class Add extends StatefulWidget {
  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'ToDoを追加',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 32,
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop(MaterialPageRoute(builder: (context) {
                  return MyHomePage();
                }));
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: Container(
          padding: EdgeInsets.all(64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                onChanged: (String value) {
                  setState(() {
                    _text = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: '入力してください',
                ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(_text);
                    },
                    child: Text('リストに追加')),
              ),
            ],
          ),
        ));
  }
}
