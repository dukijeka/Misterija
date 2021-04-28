import 'package:flutter/material.dart';
import 'package:misterija/data.dart';
import 'package:misterija/screens/main/widgets/dialogs/pick_a_player_dialog.dart';
import 'package:misterija/screens/main/widgets/dialogs/pick_a_thing_dialog.dart';

class Assumptions extends StatefulWidget {
  final List<Assumption> assumptions;

  const Assumptions(this.assumptions);

  @override
  _AssumptionsState createState() => _AssumptionsState();
}

class _AssumptionsState extends State<Assumptions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.assumptions.map((assumption) {
        return Row(
          children: [
            Expanded(
              flex: 2,
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(50, 30),
                    alignment: Alignment.center),
                child: assumption.player1 == null
                    ? Icon(Icons.person_add)
                    : Text(assumption.player1!),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return PickAPlayerDialog();
                      }).then((value) {
                    setState(() {
                      if (value == null) {
                        assumption.player1 = null;
                        return;
                      }
                      assumption.player1 = value.toString();
                    });
                  });
                },
              ),
            ),
            Expanded(
                child: Container(
                    height: 20,
                    child: VerticalDivider(
                      color: Colors.white,
                      width: 20,
                    ))),
            Expanded(
              flex: 2,
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(50, 30),
                    alignment: Alignment.center),
                child: assumption.room == null
                    ? Icon(Icons.house_outlined)
                    : Text(assumption.room!),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return PickAThingDialog(
                            Data.rooms.map((room) => room.text).toList(),
                            'Izaberite sobu');
                      }).then((value) {
                    setState(() {
                      if (value == null) {
                        assumption.room = null;
                        return;
                      }
                      assumption.room = value.toString();
                    });
                  });
                },
              ),
            ),
            Expanded(
                child: Container(
                    height: 20,
                    child: VerticalDivider(
                      color: Colors.white,
                      width: 20,
                    ))),
            Expanded(
              flex: 2,
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(50, 30),
                    alignment: Alignment.center),
                child: assumption.person == null
                    ? Icon(Icons.accessibility_new_outlined)
                    : Text(assumption.person!),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return PickAThingDialog(
                            Data.people.map((person) => person.text).toList(),
                            'Izaberite osobu');
                      }).then((value) {
                    setState(() {
                      if (value == null) {
                        assumption.person = null;
                        return;
                      }
                      assumption.person = value.toString();
                    });
                  });
                },
              ),
            ),
            Expanded(
                child: Container(
                    height: 20,
                    child: VerticalDivider(
                      color: Colors.white,
                      width: 20,
                    ))),
            Expanded(
              flex: 2,
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(50, 30),
                    alignment: Alignment.center),
                child: assumption.item == null
                    ? Icon(Icons.post_add)
                    : Text(assumption.item!),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return PickAThingDialog(
                            Data.items.map((item) => item.text).toList(),
                            'Izaberite predmet');
                      }).then((value) {
                    setState(() {
                      if (value == null) {
                        assumption.item = null;
                        return;
                      }
                      assumption.item = value.toString();
                    });
                  });
                },
              ),
            ),
            Expanded(
                child: Container(
                    height: 20,
                    child: VerticalDivider(
                      color: Colors.white,
                      width: 20,
                    ))),
            Expanded(
              flex: 2,
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(50, 30),
                    alignment: Alignment.center),
                child: assumption.player2 == null
                    ? Icon(Icons.person_add)
                    : Text(assumption.player2!),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return PickAPlayerDialog();
                      }).then((value) {
                    setState(() {
                      if (value == null) {
                        assumption.player2 = null;
                        return;
                      }
                      assumption.player2 = value.toString();
                    });
                  });
                },
              ),
            ),
            Expanded(
                child: Container(
                    height: 20,
                    child: VerticalDivider(
                      color: Colors.white,
                      width: 20,
                    ))),
            Expanded(
              child: TextField(),
            ),
          ],
        );
      }).toList(),
    );
  }
}
