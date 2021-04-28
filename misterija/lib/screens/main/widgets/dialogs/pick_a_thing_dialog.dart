import 'package:flutter/material.dart';

class PickAThingDialog extends StatelessWidget {
  final List<String> things;
  final String title;

  const PickAThingDialog(this.things, this.title);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: Text(title),
        children: things.map((thing) {
          return SimpleDialogOption(
            child: OutlinedButton(
                onPressed: () {Navigator.pop(context, thing);},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      thing,
                    ),
                  ),
                )),
          );
        }).toList());
  }
}
