import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:proyecto/datos.dart';
import 'package:proyecto/main.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class detalles extends StatefulWidget {
  @override
  State<detalles> createState() => rutadetalles();
}

class rutadetalles extends State<detalles> {
  List<String> list = <String>[
    '07:00',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00'
  ];

  List<String> list2 = <String>[
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
    '21:00'
  ];
  String dropdownValue = "07:00";
  String dropdownValue2 = "08:00";
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  void dispose() {
    myController.dispose();
    super.dispose();
  }

  List items = [];

  //saveJson(datos)
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('assets/datos.json');
  }

  Future<File> writeJson(List<dynamic> datos) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(_localFile.toString());
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/datos.json');
    final data = await json.decode(response);

    setState(() {
      items = data["Carpetas"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar Album"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: const EdgeInsets.only(top: 50, left: 20),
                    child: TextField(
                      controller: myController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Asignatura"),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: const EdgeInsets.only(top: 15, left: 20),
                    child: TextField(
                      controller: myController2,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Profesor"),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    margin: const EdgeInsets.only(top: 15, left: 20),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.purple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    margin: const EdgeInsets.only(top: 15, left: 20),
                    child: DropdownButton<String>(
                      value: dropdownValue2,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.purple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue2 = value!;
                        });
                      },
                      items:
                          list2.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: const EdgeInsets.only(top: 15, left: 20),
                    child: TextField(
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Descripcion"),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 100, left: 130),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.all(16.0),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        print(myController.text);
                        print(myController2.text);
                        var Carpetas = {
                          "asignatura": myController.text,
                          "profesor": myController2.text,
                        };
                        items.add(Carpetas);
                        writeJson(items);
                      },
                      child: const Text('Guardar'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
