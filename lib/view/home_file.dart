import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class HomeFile extends StatefulWidget {
  const HomeFile({Key? key}) : super(key: key);

  @override
  State<HomeFile> createState() => _HomeFileState();
}

class _HomeFileState extends State<HomeFile> {
  String documentPath = '';
  String tempPath = '';
  File? myFile;
  String fileText = '';

  Future getPaths() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();
    print(docDir.path);
    setState(() {
      documentPath = docDir.path;
      tempPath = tempDir.path;
    });
  }

  @override
  void initState() {
    getPaths().then((_) {
      myFile = File('$documentPath/pizzas.txt');
      writeFile();
    });
    super.initState();
  }

  Future<bool> writeFile() async {
    try {
      await myFile!.writeAsString('Margherita, Capricciosa, Napoli');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> readFile() async {
    try {
      String fileContent = await myFile!.readAsString();
      setState(() {
        fileText = fileContent;
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Path Provider'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Doc path: ${documentPath}'),
            Text('Temp path: ${tempPath}'),
            ElevatedButton(
              onPressed: () => readFile(),
              child: Text('Файл унших'),
            ),
            Text(fileText),
          ],
        ),
      ),
    );
  }
}
