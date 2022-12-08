import 'package:flutter/material.dart';
import 'package:proyecto/contenido.dart';
import 'package:proyecto/datos.dart';
import 'package:proyecto/detalles.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'NotoGraph'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List items = [];

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
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Opciones'),
            ),
            ListTile(
              leading: Icon(Icons.comment),
              title: Text('Comentarios y Sugerencias'),
            ),
            AboutListTile(
              icon: Icon(
                Icons.verified,
              ),
              child: const Text('Version'),
              applicationName: 'App de Albumes',
              applicationVersion: '0.1v',
              applicationLegalese: '© 2022 FIANS, UAT',
              aboutBoxChildren: [],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          margin: const EdgeInsets.only(top: 20, left: 20),
          child: Column(
            children: [
              items.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Card(
                            key: ValueKey(items[index]["id"]),
                            margin: const EdgeInsets.all(10),
                            color: Colors.amber.shade100,
                            child: ListTile(
                              leading: Text('1'),
                              title: Text(items[index]["asignatura"]),
                              subtitle: Text(items[index]["docente"]),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => contenido(),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: ((context) => detalles())),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
