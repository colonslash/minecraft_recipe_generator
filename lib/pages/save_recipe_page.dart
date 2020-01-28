import 'package:flutter/material.dart';
import 'package:minecraft_app/pages/home_page.dart';
import 'dart:io';
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
                          createJSON(myController.text);
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

  void createJSON(String name) {
    //TODO new json file with parameter as name

  }
}