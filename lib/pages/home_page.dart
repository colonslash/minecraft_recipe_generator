import 'package:flutter/material.dart';
import 'package:minecraft_app/pages/recipe_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Recipe Generator'),
        backgroundColor: Colors.green,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton.extended(
            label: Text("New recipe"),
            backgroundColor: Colors.green,
            onPressed: (){
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => RecipePage()),
              );
            },
          ),
        ],
      )
      );
  }
}
