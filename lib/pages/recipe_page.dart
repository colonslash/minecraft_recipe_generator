import 'package:flutter/material.dart';
import 'package:minecraft_app/pages/home_page.dart';
import 'package:minecraft_app/pages/save_recipe_page.dart';

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Recipe"),
        backgroundColor: Colors.green,
      ),
      body: Image.asset('assets/grid.png'),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FlatButton(
              onPressed: (){
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text("Cancel"),
              color: Colors.red,
          ),
          FloatingActionButton.extended(
            onPressed: (){
              //TODO save recipe in temp file to be read in save_recipe_page
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SaveRecipePage()));
            },
            label: Text("Save recipe"),
            backgroundColor: Colors.green,
          )
        ],
      ),
    );
  }
}
