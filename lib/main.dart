import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'App de Cuaderno'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                      'https://icones.pro/wp-content/uploads/2021/04/symbole-de-dossier-jaune.png'),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                            ),
                            margin: const EdgeInsets.only(top: 48, left: 10),
                            child: const Text(
                              'Nombre',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container()
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                              ),
                              margin: const EdgeInsets.only(top: 2, left: 10),
                              child: const Text('Fecha Creacion',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ))),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: const BoxDecoration(
                                color: Colors.yellow,
                              ),
                              margin: const EdgeInsets.only(top: 2, left: 10),
                              child: const Text('Profesor',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ))),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                            ),
                            margin: const EdgeInsets.only(top: 2, left: 10),
                            child: const Text(
                              'Horarios',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: const BoxDecoration(
                                color: Colors.purple,
                              ),
                              margin: const EdgeInsets.only(top: 2, left: 10),
                              child: const Text('Duracion',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ))),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
