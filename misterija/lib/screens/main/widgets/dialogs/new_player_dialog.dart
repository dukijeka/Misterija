import 'package:flutter/material.dart';
import 'package:misterija/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewPlayerDialog extends StatelessWidget {
  final TextEditingController newPlayerController;

  const NewPlayerDialog(this.newPlayerController);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Unesite ime Igrača'),
      content: TextField(
        controller: newPlayerController,
      ),
      actions: [
        TextButton(
          onPressed: () {Navigator.pop(context);},
          child: Text('Odustani'),
        ),
        TextButton(
          onPressed: () {
            _onNewPlayerAdded(newPlayerController.text, context);
          },
          child: Text('Potvrdi'),
        ),
      ],
    );
  }

  _onNewPlayerAdded(String newPlayerName, BuildContext context) async {
    if (newPlayerName.isNotEmpty) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final playersList = preferences.getStringList(Data.playersKey);

      if (playersList == null) {
        preferences.setStringList(Data.playersKey, [newPlayerName]);
      } else if (!playersList.contains(newPlayerName)) {
        preferences.setStringList(
            Data.playersKey, playersList + [newPlayerName]);
      }
    }

    Navigator.pop(context);
  }
}
