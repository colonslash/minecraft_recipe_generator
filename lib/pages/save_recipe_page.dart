import 'dart:io';
import 'package:flutter/material.dart';
import 'package:minecraft_app/pages/home_page.dart';
import 'package:path_provider/path_provider.dart';

class SaveRecipePage extends StatefulWidget {
  @override
  _SaveRecipePageState createState() => _SaveRecipePageState();
}

class _SaveRecipePageState extends State<SaveRecipePage> {
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose recipe pack to add to"),
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        //TODO add popup to create new recipe pack, auto gen "buttons" for existing packs
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context){
              return AlertDialog(
                content: Form(
                  child: Column(
                    children: <Widget>[
                      Form(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter pack name',
                          ),
                          controller: myController,
                        ),
                      ),
                      FloatingActionButton.extended(
                        onPressed: (){
                          genJSON(myController.text, "content");
                          testOut(myController.text);
                          Navigator.of(context).pop();
                          Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                        },
                        label: Text('Finish'),
                      ),
                    ],
                  )
                ),
              );
            },//builder
          );//dialog box
        },//onPressed
      ),
    );
  }

  ///writing and reading to recipe.txt
  // get protected documents directory for the app
  Future<String> get _localPath async {
    Directory dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }
  // new file with title $name.txt and document path
  Future<File> _localFile(String name) async {
    final path = await _localPath;
    return File('$path/$name.txt');
  }
  // generate json inside new file
  Future<File> genJSON (String name, String x) async {
    final file = await _localFile(name);
    return file.writeAsString('$x');
  }

  //test output
  Future<String> testOut(String name) async {
    try {
      final file = await _localFile(name);
      String contents = await file.readAsString();
      print(contents);
      return contents;
    } catch (e) {
      return "Output failed.";
    }
  }
}