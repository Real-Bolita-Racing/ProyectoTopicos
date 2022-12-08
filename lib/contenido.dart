import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class contenido extends StatefulWidget {
  @override
  _ImageState createState() => _ImageState();
}

class _ImageState extends State<contenido> {
  File? imagen;

  final picker = ImagePicker();
  Future selImagen(op) async {
    var pickedFile;
    if (op == 1) {
      pickedFile = await picker.getImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    }

    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
      } else {
        print('No selecciono una Imagen');
      }
    });
  }

  opciones(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          content: SingleChildScrollView(
              child: Column(
            children: [
              InkWell(
                onTap: () {
                  selImagen(1);
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.grey)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Tomar una Foto',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Icon(Icons.camera_alt, color: Colors.blue)
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  selImagen(2);
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Seleccionar una Imagen',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Icon(Icons.image_search, color: Colors.blue)
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: Colors.red),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Cancelar',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contenido del Album'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    opciones(context);
                  },
                  child: Text('Selecciona una imagen'),
                ),
                SizedBox(
                  height: 30,
                ),
                imagen == null ? Center() : Image.file(imagen!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
