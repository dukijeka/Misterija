import 'package:flutter/material.dart';
import 'package:misterija/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PickAPlayerDialog extends StatefulWidget {
  @override
  _PickAPlayerDialogState createState() => _PickAPlayerDialogState();
}

class _PickAPlayerDialogState extends State<PickAPlayerDialog> {
  List<String> players = [];

  @override
  void initState() {
    _initList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: Text('Izaberite igrača'),
        children: players.map((player) {
          return SimpleDialogOption(
            child: OutlinedButton(
                onPressed: () {Navigator.pop(context, player);},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      player,
                    ),
                  ),
                )),
          );
        }).toList());
  }

  _initList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final playersList = preferences.getStringList(Data.playersKey);

    if (playersList != null) {
      setState(() {
        players = playersList;
      });
    }
  }
}
