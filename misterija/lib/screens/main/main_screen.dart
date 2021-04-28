import 'package:flutter/material.dart';
import 'package:misterija/data.dart';
import 'package:misterija/screens/main/widgets/assumptions.dart';
import 'package:misterija/screens/main/widgets/known_facts.dart';
import 'package:misterija/screens/main/widgets/dialogs/new_player_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  MainScreen({required this.title});

  final newPlayerController = TextEditingController();
  final String title;

  Assumptions assumptions = Assumptions([]);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (action) {
              if (action == MenuAction.add_player) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return NewPlayerDialog(widget.newPlayerController);
                    });
              } else if (action == MenuAction.clear_all_players) {
                SharedPreferences.getInstance()
                    .then((preferences) => preferences.clear());
              }
            },
            itemBuilder: (BuildContext context) {
              return Data.menuItems.map((MenuItem choice) {
                return PopupMenuItem<MenuAction>(
                  value: choice.action,
                  child: Text(choice.displayText),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 3, child: SingleChildScrollView(child: widget.assumptions)),
          Expanded(flex: 4, child: KnownFacts())
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addAssumption(Assumption());
        },
        tooltip: 'Dodaj pretpostavku',
        child: Icon(Icons.add),
      ),
    );
  }

  _addAssumption(Assumption assumption) {
    setState(() {
      widget.assumptions =
          Assumptions(widget.assumptions.assumptions + [assumption]);
    });
  }
}
