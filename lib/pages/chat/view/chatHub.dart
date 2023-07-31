import 'package:flutter/material.dart';
import 'dart:convert';

class BattleLogEntry {
  final int turn;
  final String attacker;
  final String moveName;
  final String moveType;
  final int damage;
  final String defender;
  final int defenderHealth;
  final String fainted;
  final String next;
  final String ability;
  final String targetName;
  final int targetHealth;

  BattleLogEntry({
    required this.turn,
    required this.attacker,
    required this.moveName,
    required this.moveType,
    required this.damage,
    required this.defender,
    required this.defenderHealth,
    required this.fainted,
    required this.next,
    required this.ability,
    required this.targetName,
    required this.targetHealth,
  });
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

List<Map> jsonData = [
  {
    "turn": 1,
    "attacker": "Reindeer",
    "moveName": "Dark Blessing",
    "moveType": "Dark",
    "damage": 264,
    "defender": "Skiina",
    "defenderHealth": 454
  },
  {
    "turn": 1,
    "attacker": "Reindeer",
    "moveName": "Dark Blessing",
    "moveType": "Dark",
    "damage": 264,
    "defender": "Skiina",
    "defenderHealth": 454
  },
  {
    "turn": 2,
    "attacker": "Skiina",
    "moveName": "Sonic Combustion",
    "moveType": "Wind",
    "damage": 433,
    "defender": "Reindeer",
    "defenderHealth": 238
  },
  {
    "turn": 2,
    "attacker": "Skiina",
    "moveName": "Sonic Combustion",
    "moveType": "Wind",
    "damage": 433,
    "defender": "Reindeer",
    "defenderHealth": 238
  },
  {
    "turn": 3,
    "attacker": "Reindeer",
    "moveName": "Dark Blessing",
    "moveType": "Dark",
    "damage": 264,
    "defender": "Skiina",
    "defenderHealth": 190
  },
  {
    "turn": 3,
    "attacker": "Reindeer",
    "moveName": "Dark Blessing",
    "moveType": "Dark",
    "damage": 264,
    "defender": "Skiina",
    "defenderHealth": 190
  },
  {
    "turn": 4,
    "attacker": "Skiina",
    "moveName": "Sonic Combustion",
    "moveType": "Wind",
    "damage": 433,
    "defender": "Reindeer",
    "defenderHealth": 1
  },
  {
    "turn": 5,
    "ability": "Endurance",
    "targetName": "Reindeer",
    "targetHealth": 1
  },
  {
    "turn": 4,
    "attacker": "Skiina",
    "moveName": "Sonic Combustion",
    "moveType": "Wind",
    "damage": 433,
    "defender": "Reindeer",
    "defenderHealth": 1
  },
  {
    "turn": 6,
    "attacker": "Reindeer",
    "moveName": "Dark Blessing",
    "moveType": "Dark",
    "damage": 264,
    "defender": "Skiina",
    "defenderHealth": 1
  },
  {
    "turn": 7,
    "ability": "Endurance",
    "targetName": "Skiina",
    "targetHealth": 1
  },
  {
    "turn": 6,
    "attacker": "Reindeer",
    "moveName": "Dark Blessing",
    "moveType": "Dark",
    "damage": 264,
    "defender": "Skiina",
    "defenderHealth": 1
  },
  {
    "turn": 8,
    "attacker": "Skiina",
    "moveName": "Sonic Combustion",
    "moveType": "Wind",
    "damage": 433,
    "defender": "Reindeer",
    "defenderHealth": -432
  },
  {"turn": 9, "fainted": "Reindeer", "next": "Traruza"},
  {
    "turn": 10,
    "attacker": "Skiina",
    "moveName": "Sonic Combustion",
    "moveType": "Wind",
    "damage": 466,
    "defender": "Traruza",
    "defenderHealth": 366
  },
  {
    "turn": 10,
    "attacker": "Skiina",
    "moveName": "Sonic Combustion",
    "moveType": "Wind",
    "damage": 466,
    "defender": "Traruza",
    "defenderHealth": 366
  },
  {
    "turn": 11,
    "attacker": "Traruza",
    "moveName": "Double Punch",
    "moveType": "Neutral",
    "damage": 380,
    "defender": "Skiina",
    "defenderHealth": -379
  },
  {"turn": 12, "fainted": "Skiina", "next": "Frogi"},
  {
    "turn": 13,
    "attacker": "Frogi",
    "moveName": "Waterfall",
    "moveType": "Water",
    "damage": 227,
    "defender": "Traruza",
    "defenderHealth": 139
  },
  {
    "turn": 13,
    "attacker": "Frogi",
    "moveName": "Waterfall",
    "moveType": "Water",
    "damage": 227,
    "defender": "Traruza",
    "defenderHealth": 139
  },
  {
    "turn": 14,
    "attacker": "Traruza",
    "moveName": "Dragon Quake",
    "moveType": "Earth",
    "damage": 452,
    "defender": "Frogi",
    "defenderHealth": 219
  },
  {
    "turn": 14,
    "attacker": "Traruza",
    "moveName": "Dragon Quake",
    "moveType": "Earth",
    "damage": 452,
    "defender": "Frogi",
    "defenderHealth": 219
  },
  {
    "turn": 15,
    "attacker": "Frogi",
    "moveName": "Waterfall",
    "moveType": "Water",
    "damage": 227,
    "defender": "Traruza",
    "defenderHealth": -88
  },
  {"turn": 16, "fainted": "Traruza", "next": "Warhulk"},
  {
    "turn": 17,
    "attacker": "Frogi",
    "moveName": "Waterfall",
    "moveType": "Water",
    "damage": 99,
    "defender": "Warhulk",
    "defenderHealth": 831
  },
  {"turn": 18, "ability": "Spike", "targetName": "Frogi", "targetHealth": 197},
  {
    "turn": 17,
    "attacker": "Frogi",
    "moveName": "Waterfall",
    "moveType": "Water",
    "damage": 99,
    "defender": "Warhulk",
    "defenderHealth": 831
  },
  {
    "turn": 19,
    "attacker": "Frogi",
    "moveName": "Waterfall",
    "moveType": "Water",
    "damage": 99,
    "defender": "Warhulk",
    "defenderHealth": 731
  },
  {"turn": 20, "ability": "Spike", "targetName": "Frogi", "targetHealth": 178},
  {
    "turn": 19,
    "attacker": "Frogi",
    "moveName": "Waterfall",
    "moveType": "Water",
    "damage": 99,
    "defender": "Warhulk",
    "defenderHealth": 731
  },
  {
    "turn": 21,
    "attacker": "Frogi",
    "moveName": "Waterfall",
    "moveType": "Water",
    "damage": 99,
    "defender": "Warhulk",
    "defenderHealth": 632
  },
  {"turn": 22, "ability": "Spike", "targetName": "Frogi", "targetHealth": 160},
  {
    "turn": 21,
    "attacker": "Frogi",
    "moveName": "Waterfall",
    "moveType": "Water",
    "damage": 99,
    "defender": "Warhulk",
    "defenderHealth": 632
  },
  {
    "turn": 23,
    "attacker": "Warhulk",
    "moveName": "Black Hole",
    "moveType": "Dark",
    "damage": 423,
    "defender": "Frogi",
    "defenderHealth": -263
  },
  {"turn": 24, "fainted": "Frogi", "next": "Skiina"},
  {
    "turn": 25,
    "attacker": "Skiina",
    "moveName": "Polar Light",
    "moveType": "Light",
    "damage": 188,
    "defender": "Warhulk",
    "defenderHealth": 444
  },
  {"turn": 26, "ability": "Spike", "targetName": "Skiina", "targetHealth": 646},
  {
    "turn": 25,
    "attacker": "Skiina",
    "moveName": "Polar Light",
    "moveType": "Light",
    "damage": 188,
    "defender": "Warhulk",
    "defenderHealth": 444
  },
  {
    "turn": 27,
    "attacker": "Skiina",
    "moveName": "Polar Light",
    "moveType": "Light",
    "damage": 188,
    "defender": "Warhulk",
    "defenderHealth": 256
  },
  {"turn": 28, "ability": "Spike", "targetName": "Skiina", "targetHealth": 582},
  {
    "turn": 27,
    "attacker": "Skiina",
    "moveName": "Polar Light",
    "moveType": "Light",
    "damage": 188,
    "defender": "Warhulk",
    "defenderHealth": 256
  },
  {
    "turn": 29,
    "attacker": "Skiina",
    "moveName": "Polar Light",
    "moveType": "Light",
    "damage": 188,
    "defender": "Warhulk",
    "defenderHealth": 68
  },
  {"turn": 30, "ability": "Spike", "targetName": "Skiina", "targetHealth": 523},
  {
    "turn": 29,
    "attacker": "Skiina",
    "moveName": "Polar Light",
    "moveType": "Light",
    "damage": 188,
    "defender": "Warhulk",
    "defenderHealth": 68
  },
  {
    "turn": 31,
    "attacker": "Warhulk",
    "moveName": "Black Hole",
    "moveType": "Dark",
    "damage": 641,
    "defender": "Skiina",
    "defenderHealth": 1
  },
  {
    "turn": 32,
    "ability": "Endurance",
    "targetName": "Skiina",
    "targetHealth": 1
  },
  {
    "turn": 31,
    "attacker": "Warhulk",
    "moveName": "Black Hole",
    "moveType": "Dark",
    "damage": 641,
    "defender": "Skiina",
    "defenderHealth": 1
  },
  {
    "turn": 33,
    "attacker": "Skiina",
    "moveName": "Polar Light",
    "moveType": "Light",
    "damage": 188,
    "defender": "Warhulk",
    "defenderHealth": -120
  },
  {"turn": 34, "ability": "Spike", "targetName": "Skiina", "targetHealth": -1}
]; // Replace with your actual battle log data

List<BattleLogEntry> _battleLog = List<BattleLogEntry>.from(
  jsonData.map((entry) => BattleLogEntry(
        turn: entry['turn'],
        attacker: entry['attacker'] ?? '',
        moveName: entry['moveName'] ?? '',
        moveType: entry['moveType'] ?? '',
        damage: entry['damage'] ?? 0,
        defender: entry['defender'] ?? '',
        defenderHealth: entry['defenderHealth'] ?? 0,
        fainted: entry['fainted'] ?? '',
        next: entry['next'] ?? '',
        ability: entry['ability'] ?? '',
        targetName: entry['targetName'] ?? '',
        targetHealth: entry['targetHealth'] ?? 0,
      )),
);

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // Sort the _battleLog list based on the turn value in ascending order
    _battleLog.sort((a, b) => a.turn.compareTo(b.turn));

// Create a new list to store unique turns
    List<int> uniqueTurns = [];

    for (var logEntry in _battleLog) {
      // Add the turn to the uniqueTurns list if it doesn't exist already
      if (!uniqueTurns.contains(logEntry.turn)) {
        uniqueTurns.add(logEntry.turn);
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Battle Results'),
      ),
      body: ListView.builder(
        itemCount: uniqueTurns.length,
        itemBuilder: (context, index) {
          final turn = uniqueTurns[index];

          // Get the log entry for the current turn
          final logEntry = _battleLog.firstWhere((entry) => entry.turn == turn);

          return ListTile(
            title: Text('Turn: ${logEntry.turn}'),
            subtitle: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Attacker: ${logEntry.attacker}'),
                Text('Move Name: ${logEntry.moveName}'),
                Text('Move Type: ${logEntry.moveType}'),
                Text('Damage: ${logEntry.damage}'),
                Text('Defender: ${logEntry.defender}'),
                Text('Defender Health: ${logEntry.defenderHealth}'),
                Text('Fainted: ${logEntry.fainted}'),
                Text('Next: ${logEntry.next}'),
                Text('Ability: ${logEntry.ability}'),
                Text('Target Name: ${logEntry.targetName}'),
                Text('Target Health: ${logEntry.targetHealth}'),
              ],
            )),
          );
        },
      ),
    );
  }
}
