import 'package:flutter/material.dart';
import 'package:minecraft_app/pages/home_page.dart';
import 'package:fluro/fluro.dart';
void main() {
  final router = Router();
  runApp(new MaterialApp(
    home: new HomePage(),
    title: "Minecraft App",
    debugShowCheckedModeBanner: false,
    color: Colors.green,
  ));
}