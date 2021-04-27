import 'package:flutter/material.dart';
import 'package:misterija/screens/main_screen/widgets/assumptions.dart';
import 'package:misterija/screens/main_screen/widgets/known_facts.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(child: Assumptions()),
          Expanded(child: KnownFacts())
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Dodaj pretpostavku',
        child: Icon(Icons.add),
      ),
    );
  }
}
