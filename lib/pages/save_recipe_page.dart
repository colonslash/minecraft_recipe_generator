import 'package:flutter/material.dart';
import 'package:minecraft_app/pages/home_page.dart';

class SaveRecipePage extends StatefulWidget {
  @override
  _SaveRecipePageState createState() => _SaveRecipePageState();
}

class _SaveRecipePageState extends State<SaveRecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose recipe pack to add to"),
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          //TODO add popup to create new recipe pack, auto gen "buttons" for existing packs
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
      ),

    );
  }
}
