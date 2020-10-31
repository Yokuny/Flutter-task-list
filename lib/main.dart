import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _toDoList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: Text("Lista de tarefas"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "New Task",
                        labelStyle: TextStyle(color: Colors.blueAccent)),
                  ),
                ),
                RaisedButton(
                  color: Colors.blueAccent,
                  child: Text("add"),
                  textColor: Colors.white,
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<File> _getFile() async {
    //async pq usamos o await
    final directory =
        await getApplicationDocumentsDirectory(); //os diretorios de armazenamento do ios e android são diferentes
    return File(
        "${directory.path}/data.json"); //o .path é "o caminha até tal diretorio. E la crie uma pasta e o arquivo data.json"
  }

  // salvar dados em arquivo
  Future<File> _saveData() async {
    //tudo oque envolver salvamento usa async
    String data =
        json.encode(_toDoList); //pega a List transforma em Json e salva em data
    final file = await _getFile();
    return file.writeAsString(data);
  }

  // ler dados de arquivo
  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  appBar({Text title, MaterialAccentColor backgroundColor, bool centerTitle}) {}
}
