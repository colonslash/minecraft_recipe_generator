import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minecraft_app/pages/home_page.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:minecraft_app/models/OutputModel.dart';

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  List<List<String>> itemList = [[" ", " ", " "],[" ", " ", " "],[" ", " ", " "]];
  Output output = new Output("out", 64);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Recipe"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
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
                  onPressed: () {
                    //TODO save recipe in file
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
                                        hintText: "Recipe Name",
                                        helperText: "Give your recipe a unique name",
                                      ),
                                      controller: myController,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      FlatButton(
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel"),
                                        color: Colors.red,
                                      ),
                                      FloatingActionButton.extended(
                                        onPressed: (){
                                          //genJSON(myController.text, genCraftingGrid(itemList), genCraftingKey(itemList));
                                          testPrint(genCraftingGrid(itemList), genCraftingKey(itemList), output);
                                          Navigator.of(context).popUntil((route) => route.isFirst);
                                          Navigator.pushReplacement(
                                              context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                                        },
                                        label: Text('Finish'),
                                        backgroundColor: Colors.green,
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  ),
                                ],
                                mainAxisSize: MainAxisSize.min,
                              )
                          ),
                        );
                      },//builder
                    );//dialog box
                  },// onPressed
                  label: Text("Save Recipe"),
                  backgroundColor: Colors.green,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<List<String>> key = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]];

  // generate crafting grid
  String genCraftingGrid(List<List<String>> itemList){
    String returnValue = "";
    var counter1 = 0;
    itemList.forEach((element) {
      returnValue += "\n\t\t\"";
      var counter2 = 0;
      element.forEach((_element) {
        switch(_element){
          case " ":
            returnValue += " ";
            break;
          case "ignore":
            break;
          default:
            returnValue += key[counter1][counter2];
        }
        counter2++;
      });
      returnValue += "\",";
      counter1++;
    });
    returnValue = returnValue.substring(0, returnValue.length - 1);
    return returnValue;
  }

  // generate the key for crafting grid
  String genCraftingKey(List<List<String>> itemList) {
    String returnValue = "";
    var counter1 = 0;
    itemList.forEach((element) {
      returnValue += "\n\t\t\"";
      var counter2 = 0;
      element.forEach((_element) {
        if(_element != " "){
         returnValue +=  key[counter1][counter2] + "\": {\n\t\t\t\"item\": \"minecraft:" + _element + "\"\n\t\t},";
        }
        counter2++;
      });
      counter1++;
    });
    returnValue = returnValue.substring(0, returnValue.length - 1);
    return returnValue;
  }

  // writing and reading to new text file
  // get protected documents directory for the app
  Future<String> get _localPath async {
    Directory dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }
  // new file with title $name.json and document path
  Future<File> _localFile(String name) async {
    final path = await _localPath;
    return File('$path/$name.json');
  }
  // generate json inside new file
  Future<File> genJSON (String name, String craftingGrid, String craftingKey) async {
    final file = await _localFile(name);
    return file.writeAsString(
      "{\n\t\"type\": \"minecraft:crafting_shaped,\n\t\"pattern\": ["
      + craftingGrid
      + "\n\t],\n\t\"key\": {"
      + craftingKey + "\n\t},"
      + "\n\t\"result\": {\n\t\t"
      + "\"item\": \"(output String here)\",\n\t\t"
      + "\"result\": \"(count String here)\"\n\t}\n}"
    );
  }

  //test output from file
  Future<String> testOutFile(String name) async {
    try {
    final file = await _localFile(name);
    String contents = await file.readAsString();
    print(contents);
    return contents;
    } catch (e) {
    return "Output failed.";
    }
  }

  // test output print
  void testPrint(String craftingGrid, String craftingKey, Output output) {
    String item = output.getItem;
    var count = output.getCount;
    print("{\n\t\"type\": \"minecraft:crafting_shaped,\n\t\"pattern\": [$craftingGrid\n\t],"
      + "\n\t\"key\": {$craftingKey\n\t},"
      + "\n\t\"result\": {\n\t\t\"item\": \"$item\",\n\t\t"
      + "\"count\": $count\n\t}\n}"
    );
  }
}
