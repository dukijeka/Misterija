enum MenuAction { add_player, clear_all_players }

class MenuItem {
  final String displayText;
  final MenuAction action;

  MenuItem(this.displayText, this.action);
}

class KnownFact {
  final String text;
  bool checked = false;
  String? player;

  KnownFact(this.text);
}

class Assumption{
  String? player1;
  String? room;
  String? person;
  String? item;
  String? player2;
  String? assumedAnswer;
}

class Data {
  static const playersKey = 'players';

  static final menuItems = [
    MenuItem('Dodaj igrača', MenuAction.add_player),
    MenuItem('Obriši sve igrače', MenuAction.clear_all_players)
  ];

  static final rooms = [
    KnownFact('Spavaca s.'),
    KnownFact('Trpezarija'),
    KnownFact('Bilijar sala'),
    KnownFact('Studio'),
    KnownFact('Salon'),
    KnownFact('Hol'),
    KnownFact('Biblioteka'),
    KnownFact('Kuhinja'),
    KnownFact('Kabinet')
  ];

  static final people = [
    KnownFact('Red'),
    KnownFact('Blue'),
    KnownFact('Pink'),
    KnownFact('White'),
    KnownFact('Green'),
    KnownFact('Yellow')
  ];

  static final items = [
    KnownFact('Zlato'),
    KnownFact('Novac'),
    KnownFact('Dijamanti'),
    KnownFact('Slika'),
    KnownFact('Statua'),
    KnownFact('Nakit')
  ];
}
