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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton.extended(
              label: Text("Generate JSON"),
              backgroundColor: Colors.green,
              // TODO add route
              //onPressed: ,
            ),
          FloatingActionButton.extended(
            label: Text("Add new recipe"),
            backgroundColor: Colors.green,
            onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RecipePage()),
              );
            }
            ),

        ],
      )
      );
  }
}
