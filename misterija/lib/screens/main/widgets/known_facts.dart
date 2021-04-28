import 'package:flutter/material.dart';
import 'package:misterija/data.dart';
import 'package:misterija/screens/main/widgets/dialogs/pick_a_player_dialog.dart';

class KnownFacts extends StatefulWidget {
  @override
  _KnownFactsState createState() => _KnownFactsState();
}

class _KnownFactsState extends State<KnownFacts> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Table(
          columnWidths: {
            0: FractionColumnWidth(.37),
            2: FractionColumnWidth(0.35)
          },
          children: Data.rooms
              .asMap()
              .map((i, room) {
                return MapEntry(
                    i,
                    TableRow(children: [
                      TableCell(
                        child: Row(
                          children: [
                            Text(room.text),
                            Expanded(
                                child: TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(50, 30),
                                  alignment: Alignment.center),
                              child: room.player == null
                                  ? Icon(Icons.person_add)
                                  : Text(room.player!),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return PickAPlayerDialog();
                                    }).then((value) => setState(() {
                                      if (value == null) {
                                        room.player = null;
                                        return;
                                      }
                                      room.player = value.toString();
                                      room.checked = true;
                                    }));
                              },
                            )),
                            Checkbox(
                              value: room.checked,
                              onChanged: (newValue) {
                                setState(() {
                                  room.checked = newValue ?? false;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      i < Data.people.length
                          ? TableCell(
                              child: Row(
                                children: [
                                  Text(Data.people[i].text),
                                  Expanded(
                                      child: TextButton(
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size(50, 30),
                                        alignment: Alignment.center),
                                    child: Data.people[i].player == null
                                        ? Icon(Icons.person_add)
                                        : Text(Data.people[i].player!),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return PickAPlayerDialog();
                                          }).then((value) => setState(() {
                                            if (value == null) {
                                              Data.people[i].player = null;
                                              return;
                                            }
                                            Data.people[i].player =
                                                value.toString();
                                            Data.people[i].checked = true;
                                          }));
                                    },
                                  )),
                                  Checkbox(
                                    value: Data.people[i].checked,
                                    onChanged: (newValue) {
                                      setState(() {
                                        Data.people[i].checked =
                                            newValue ?? false;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            )
                          : TableCell(child: Container()),
                      i < Data.items.length
                          ? TableCell(
                              child: Row(
                                children: [
                                  Text(Data.items[i].text),
                                  Expanded(
                                      child: TextButton(
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size(50, 30),
                                        alignment: Alignment.center),
                                    child: Data.items[i].player == null
                                        ? Icon(Icons.person_add)
                                        : Text(Data.items[i].player!),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return PickAPlayerDialog();
                                          }).then((value) => setState(() {
                                            if (value == null) {
                                              Data.items[i].player = null;
                                              return;
                                            }

                                            Data.items[i].player =
                                                value.toString();
                                            Data.items[i].checked = true;
                                          }));
                                    },
                                  )),
                                  Checkbox(
                                    value: Data.items[i].checked,
                                    onChanged: (newValue) {
                                      setState(() {
                                        Data.items[i].checked =
                                            newValue ?? false;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            )
                          : TableCell(child: Container())
                    ]));
              })
              .values
              .toList()),
    );
  }
}
