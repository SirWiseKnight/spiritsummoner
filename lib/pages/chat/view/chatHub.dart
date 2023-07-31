import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List _items = [];
  String _results = "";
  List _team1 = [];
  List _team2 = [];
  int indexer = 0;

// Fetch content from the json file
  Future<void> readJson() async {
    final dynamic response =
        await rootBundle.loadString('functions/battle_log.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["log"];
      _results = data["winner"];
      _team1 = data["teams"]["team1"];
      _team2 = data["teams"]["team2"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Battle Results'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Load Battle'),
              onPressed: readJson,
            ),
            SizedBox(
              height: 12,
            ),
            _items.isNotEmpty
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(child: Text("Team 1")),
                          Container(
                              child: Text("Spirit 1: ${_team1[0]["name"]}")),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Text(
                                      "   Type: ${_team1[0]["coreType"]}")),
                              SizedBox(width: 8.0),
                              Container(
                                  child:
                                      Text("   Level: ${_team1[0]["level"]}")),
                              SizedBox(width: 8.0),
                              Container(
                                  child:
                                      Text("   HP: ${_team1[0]["maxHealth"]}")),
                            ],
                          ),
                          Container(
                              child: Text("Spirit 2: ${_team1[1]["name"]}")),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Text(
                                      "   Type: ${_team1[1]["coreType"]}")),
                              SizedBox(width: 8.0),
                              Container(
                                  child:
                                      Text("  Level: ${_team1[1]["level"]}")),
                              SizedBox(width: 8.0),
                              Container(
                                  child:
                                      Text("  HP: ${_team1[1]["maxHealth"]}")),
                            ],
                          ),
                          Container(
                              child: Text("Spirit 3: ${_team1[2]["name"]}")),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Text(
                                      "   Type: ${_team1[2]["coreType"]}")),
                              SizedBox(width: 8.0),
                              Container(
                                  child:
                                      Text("   Level: ${_team1[2]["level"]}")),
                              SizedBox(width: 8.0),
                              Container(
                                  child:
                                      Text("   HP: ${_team1[2]["maxHealth"]}")),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(child: Text("Team 2")),
                          Container(
                              child: Text("Spirit 4: ${_team2[0]["name"]}")),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Text(
                                      "   Type: ${_team2[0]["coreType"]}")),
                              SizedBox(width: 8.0),
                              Container(
                                  child:
                                      Text("   Level: ${_team2[0]["level"]}")),
                              SizedBox(width: 8.0),
                              Container(
                                  child:
                                      Text("   HP: ${_team2[0]["maxHealth"]}")),
                            ],
                          ),
                          Container(
                              child: Text("Spirit 5: ${_team2[1]["name"]}")),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Text(
                                      "   Type: ${_team2[1]["coreType"]}")),
                              SizedBox(width: 8.0),
                              Container(
                                  child:
                                      Text("   Level: ${_team2[1]["level"]}")),
                              SizedBox(width: 8.0),
                              Container(
                                  child:
                                      Text("   HP: ${_team2[1]["maxHealth"]}")),
                            ],
                          ),
                          Container(
                              child: Text("Spirit 6: ${_team2[2]["name"]}")),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Text(
                                      "   Type: ${_team2[2]["coreType"]}")),
                              SizedBox(width: 8.0),
                              Container(
                                  child:
                                      Text("   Level: ${_team2[2]["level"]}")),
                              SizedBox(width: 8.0),
                              Container(
                                  child:
                                      Text("   HP: ${_team2[2]["maxHealth"]}")),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                : Container(),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              child: const Text('Next Turn'),
              onPressed: () {
                if (indexer < _items.length - 1) {
                  indexer = indexer + 1;
                  readJson();
                } else {
                  null;
                }
              },
            ),
            SizedBox(
              height: 12,
            ),
            _items.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                            children: [
                              Text("Turn: ${_items[indexer]["turn"]}"),
                              Text("Attacker: ${_items[indexer]["attacker"]}"),
                              Text("Move Name: ${_items[indexer]["moveName"]}"),
                              Text("Move Type: ${_items[indexer]["moveType"]}"),
                              Text("Damage: ${_items[indexer]["damage"]}"),
                              Text("Defender: ${_items[indexer]["defender"]}"),
                              Text(
                                  "Defender Health: ${_items[indexer]["defenderHealth"]}"),
                              Text("Fainted: ${_items[indexer]["fainted"]}"),
                              Text("Next: ${_items[indexer]["next"]}"),
                              Text("Ability: ${_items[indexer]["ability"]}"),
                              Text(
                                  "Target Name: ${_items[indexer]["targetName"]}"),
                              Text(
                                  "Target Health: ${_items[indexer]["targetHealth"]}"),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : Container(),
            SizedBox(
              height: 12,
            ),
            _items.isNotEmpty
                ? Container(child: Text("Winner: ${_results}"))
                : Container(),
          ],
        ),
      ),
    );
  }
}
