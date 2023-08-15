import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';
import 'package:spirit_summoner/pages/home/shared/homePages.dart';

class BattleScreen extends StatefulWidget {
  @override
  _BattleScreenState createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen>
    with TickerProviderStateMixin {
  late AnimationController _pokemonAnimationController;
  late AnimationController _healthBarAnimationController;

  bool _jsonFileLoaded = false;

  List _items = [];
  String _results = "";
  List _team1 = [];
  List _team2 = [];
  int indexer = 0;
  late int _damage;

  late Map<String, dynamic> _attacker;
  late int _attackerHP;
  late int _attackerLeadHP;
  late Map<String, dynamic> _defender;
  late int _defenderHP;
  late int _defenderLeadHP;

  int _activeTeam1PokemonIndex = 0;
  int _activeTeam2PokemonIndex = 0;

  bool _isBattleOver = false;
  bool _isPokemonVisible = true;
  AnimationController? _fadeController;

  // Declare variables for animation
  late Offset _attackerInitialPosition;
  late Offset _attackerFinalPosition;
  AnimationController? _attackerReverseAnimationController;
  late Offset _defenderInitialPosition;
  late Offset _defenderFinalPosition;

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
    _defenderLeadHP = _team2[_activeTeam2PokemonIndex]["maxHealth"];
    _attackerLeadHP = _team1[_activeTeam1PokemonIndex]["maxHealth"];
    _jsonFileLoaded = true; // Set the flag to indicate JSON file is loaded
  }

  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _pokemonAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _healthBarAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _attackerReverseAnimationController = null;
    _fadeController = null;
    _startBattleRound();
  }

  @override
  void dispose() {
    _pokemonAnimationController.dispose();
    _healthBarAnimationController.dispose();
    if (_attackerReverseAnimationController != null) {
      _attackerReverseAnimationController!.dispose();
    }
    if (_fadeController != null) {
      _fadeController!.dispose();
    }
    super.dispose();
  }

  void _startBattleRound() async {
    await readJson();
    if (!_isAnimating && _jsonFileLoaded) {
      if (_isBattleOver) {
        _showBattleResult(_results);
        return;
      }

      if (_items[indexer]["turn"] >= _items.length) {
        // Ensure that the next turn is within valid range
        if (_items[indexer]["attackerTeam"] == 1) {
          _defenderHP = _items[indexer]["defenderHealth"];
          _attackerHP = _items[indexer]["attackerHealth"];
          Future.delayed(const Duration(milliseconds: 500), () {
            setState(() {
              _defenderLeadHP = _defenderHP;
            });
          });
        }

        //need to add in damage to attacker HP when logic is updated
        if (_items[indexer]["attackerTeam"] == 2) {
          _attackerHP = _items[indexer]["defenderHealth"];
          _defenderHP = _items[indexer]["attackerHealth"];
          Future.delayed(const Duration(milliseconds: 500), () {
            setState(() {
              _attackerLeadHP = _attackerHP;
            });
          });
        }
        _isBattleOver = true;
        _animatePokemonAttack();
        return;
      }

      _attacker = _team1[_activeTeam1PokemonIndex];
      _defender = _team2[_activeTeam2PokemonIndex];

      _damage = _items[indexer]["damage"];

      //need to add in logic to determine which team is attacking/defending
      if (_items[indexer]["attackerTeam"] == 1) {
        _defenderHP = _items[indexer]["defenderHealth"];
        _attackerHP = _items[indexer]["attackerHealth"];
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            _defenderLeadHP = _defenderHP;
          });
        });
      }

      //need to add in damage to attacker HP when logic is updated
      if (_items[indexer]["attackerTeam"] == 2) {
        _attackerHP = _items[indexer]["defenderHealth"];
        _defenderHP = _items[indexer]["attackerHealth"];
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            _attackerLeadHP = _attackerHP;
          });
        });
      }

      _attackerInitialPosition = Offset.zero;
      _attackerFinalPosition = Offset(150, -275);
      _defenderInitialPosition = Offset.zero;
      _defenderFinalPosition = Offset(-150, 275);

      _animatePokemonAttack();
    }

    print(_items[indexer]["turn"]);
    print(_items[indexer]["damage"]);
    print(_defenderHP);

    setState(() {
      if (_activeTeam1PokemonIndex > _team1.length) {
        // All Pokemon from Team 1 have fainted, end the battle
        _isBattleOver ==
            true; // Change this to assignment (_isBattleOver = true;)
        _showBattleResult(_results);
      }
      if (_activeTeam2PokemonIndex > _team2.length) {
        // All Pokemon from Team 1 have fainted, end the battle
        _isBattleOver ==
            true; // Change this to assignment (_isBattleOver = true;)
        _showBattleResult(_results);
      }
    });
    if (_defenderHP <= 0 && _items[indexer]["turn"] <= _items.length) {
      _animateFainting();
      _nextDefender(); // Move to the next defender if the current one faints
    }

    if (_attackerHP <= 0 && _items[indexer]["turn"] <= _items.length) {
      _animateFainting();
      _nextAttacker(); // Move to the next attacker if the current one faints
    }

    incrementIndexer();
  }

  void _animatePokemonAttack() async {
    _isAnimating = true;

    await _pokemonAnimationController.forward(from: 0.0).whenComplete(() {
      _animateHealthBar(); // Move this line here to trigger the switch animation

      // Start the attacker's reverse animation
      _attackerReverseAnimationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 700),
      )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _attackerReverseAnimationController = null;
          }
        });
      _attackerReverseAnimationController!.forward(from: 0.0);
      _isAnimating = false;
    });
  }

  void _nextDefender() async {
    await readJson();
    // Send in the next Pokemon from Team 2 if available
    if (_items[indexer]["turn"] <= _items.length) {
      _activeTeam2PokemonIndex++;
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _defenderLeadHP = _team2[_activeTeam2PokemonIndex]["maxHealth"];
          _defenderHP = _defenderLeadHP;
        });
      });
      _animatePokemonSwitch(_defender);
    } else {
      // All Pokemon from Team 2 have fainted, end the battle
      _isBattleOver ==
          true; // Change this to assignment (_isBattleOver = true;)
      _showBattleResult(_results);
    }
  }

  void _nextAttacker() async {
    await readJson();
    // Send in the next Pokemon from Team 2 if available
    if (_items[indexer]["turn"] <= _items.length) {
      _activeTeam1PokemonIndex++;
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _attackerLeadHP = _team1[_activeTeam2PokemonIndex]["maxHealth"];
          _attackerHP = _attackerLeadHP;
        });
      });
      _animatePokemonSwitch(_attacker);
    } else {
      // All Pokemon from Team 1 have fainted, end the battle
      _isBattleOver ==
          true; // Change this to assignment (_isBattleOver = true;)
      _showBattleResult(_results);
    }
  }

  void _animatePokemonSwitch(pokemon) async {
    await readJson();
    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    // Start the fade-out animation
    _fadeController!.forward().whenComplete(() {
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          if (_activeTeam1PokemonIndex > _team1.length) {
            // All Pokemon from Team 1 have fainted, end the battle
            _isBattleOver ==
                true; // Change this to assignment (_isBattleOver = true;)
            _showBattleResult(_results);
          }
          if (_activeTeam2PokemonIndex > _team2.length) {
            // All Pokemon from Team 1 have fainted, end the battle
            _isBattleOver ==
                true; // Change this to assignment (_isBattleOver = true;)
            _showBattleResult(_results);
          }
          if (_defenderHP <= 0) {
            _defender = _team2[_activeTeam2PokemonIndex];
            _isPokemonVisible = true; // Reset visibility
          }
          if (_attackerHP <= 0) {
            _attacker = _team1[_activeTeam1PokemonIndex];
            _isPokemonVisible = true; // Reset visibility
          }
        });
      });

      _isAnimating = true;
      _isPokemonVisible = false;
      //_jsonFileLoaded = false; // Reset the flag
      _startBattleRound(); // Start the next battle round
    });
  }

  void _showBattleResult(String _results) async {
    await readJson();
    // Show the battle result message using a dialog
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevent dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Battle Result'),
          content: Text(_results == 'Team1' ? 'Team 1 Wins!' : 'Team 2 Wins!'),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Reset the battle state after showing the result
                setState(() {
                  _isAnimating =
                      false; // Add this line to reset animation state
                  _activeTeam1PokemonIndex = 0;
                  _activeTeam2PokemonIndex = 0;
                  _attacker = _team1[0];
                  _defender = _team2[0];
                  super.dispose();
                });
                // Close the dialog and navigate back to the previous page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _calculateDamage() async {
    await readJson();

    if (_defenderHP > 0) {
      setState(() {
        _defenderHP -= _damage;
      });
    }
    if (_defenderHP <= 0) {
      setState(() {
        _defenderHP == 0;
      });
    }
    ;

    // Start the attacker's reverse animation
    _attackerReverseAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //_attackerReverseAnimationController!.removeStatusListener(_calculateDamage);
          //_attackerReverseAnimationController!.dispose();
          _attackerReverseAnimationController = null;

          // Check if the defender's health is 0 or less
          if (_defenderHP <= 0) {
            // If the defender has fainted, switch to the next Pokemon from Team 2
            _nextDefender();
          }

          // Battle round is complete, switch to the next round
          _isAnimating = false;
          _startBattleRound();
        }
      });
    _attackerReverseAnimationController!.forward(from: 0.0);
  }

  void _animateHealthBar() {
    _healthBarAnimationController.reset(); // Reset the animation controller

    _healthBarAnimationController.forward().whenComplete(() {
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          if (_items[indexer]["turn"] >= _items.length) {
            _startBattleRound();
            return;
          }
          if (_attackerHP <= 0) {
            _animateFainting();
            _nextAttacker(); // Move to the next defender if the current one faints
          }
          if (_defenderHP <= 0) {
            _animateFainting();
            _nextDefender(); // Move to the next defender if the current one faints
          } else if (!_isAnimating) {
            _startBattleRound(); // Start the next battle round
          }
        });
      });
    });
  }

  void _animateFainting() async {
    await readJson();
    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    // Start the fade-out animation
    _fadeController!.forward().whenComplete(() {
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _isPokemonVisible = true; // Reset visibility
        });
      });

      _startBattleRound();
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isAnimating = true;
        _isPokemonVisible = false;
      });
    });
  }

  // Function to increment the indexer every 10 seconds
  void incrementIndexer() async {
    await readJson();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        if (indexer <= _items.length) {
          indexer = indexer + 1;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Battle Scene"),
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      color: Colors.blue,
                      child: Image.asset(
                          'assets/Spirits/${_team2[0]['id']}_${_team2[0]['name']}.png'),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      color: Colors.red,
                      child: Image.asset(
                          'assets/Spirits/${_team2[1]['id']}_${_team2[1]['name']}.png'),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      color: Colors.green,
                      child: Image.asset(
                          'assets/Spirits/${_team2[2]['id']}_${_team2[2]['name']}.png'),
                    ),
                  ],
                ),
              ),
              AnimatedBuilder(
                animation: _pokemonAnimationController,
                builder: (context, child) {
                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "${_team2[_activeTeam2PokemonIndex]["name"]}",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Level ${_team2[_activeTeam2PokemonIndex]["level"]}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.centerRight,
                                  child: Image.asset(
                                      "assets/Types/type${_team2[_activeTeam2PokemonIndex]["coreType"]}.png"),
                                ),
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          Container(
                            height: 300,
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topRight,
                                  child: AnimatedBuilder(
                                    animation: _healthBarAnimationController,
                                    builder: (context, child) {
                                      return Container(
                                        width: 250,
                                        child: LinearProgressIndicator(
                                          color: Colors.green,
                                          backgroundColor: Colors.grey,
                                          value: (_defenderHP /
                                                  _defender["maxHealth"])
                                              .clamp(0.0, 1.0),
                                          minHeight: 15,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  height: 30,
                                  width: 250,
                                  alignment: Alignment.center,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: _defenderHP > 0 &&
                                                _items[indexer]
                                                        ["attackerTeam"] ==
                                                    2
                                            ? Image.asset(
                                                "assets/Types/type${_items[indexer]["moveType"]}.png")
                                            : Text(""),
                                      ),
                                      Text(
                                        _defenderHP > 0 &&
                                                _items[indexer]
                                                        ["attackerTeam"] ==
                                                    2
                                            ? " ${_items[indexer]["moveName"]}"
                                            : "-${_items[indexer]["damage"]}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8),
                                _attackerHP > 0 &&
                                        _attackerReverseAnimationController !=
                                            null &&
                                        _items[indexer]["attackerTeam"] == 2
                                    ? AnimatedBuilder(
                                        animation:
                                            _attackerReverseAnimationController!,
                                        builder: (context, child) {
                                          return Transform.translate(
                                            offset: Offset.lerp(
                                              _defenderFinalPosition,
                                              _defenderInitialPosition,
                                              _attackerReverseAnimationController!
                                                  .value,
                                            )!,
                                            child: Container(
                                              alignment: Alignment.topRight,
                                              child: AnimatedOpacity(
                                                opacity: _isPokemonVisible
                                                    ? 1.0
                                                    : 0.0,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                child: Image.asset(
                                                  'assets/Spirits/${_team2[_activeTeam1PokemonIndex]["id"]}_${_team2[_activeTeam1PokemonIndex]["name"]}.png',
                                                  height: 225,
                                                  width: 250,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : Container(
                                        alignment: Alignment.topRight,
                                        child: Image.asset(
                                          'assets/Spirits/${_team2[_activeTeam1PokemonIndex]["id"]}_${_team2[_activeTeam1PokemonIndex]["name"]}.png',
                                          height: 225,
                                          width: 250,
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: Container()),
                                _defenderHP > 0 &&
                                        _attackerReverseAnimationController !=
                                            null &&
                                        _items[indexer]["attackerTeam"] == 1
                                    ? AnimatedBuilder(
                                        animation:
                                            _attackerReverseAnimationController!,
                                        builder: (context, child) {
                                          return Transform.translate(
                                            offset: Offset.lerp(
                                              _attackerFinalPosition,
                                              _attackerInitialPosition,
                                              _attackerReverseAnimationController!
                                                  .value,
                                            )!,
                                            child: Container(
                                              alignment: Alignment.bottomLeft,
                                              child: AnimatedOpacity(
                                                opacity: _isPokemonVisible
                                                    ? 1.0
                                                    : 0.0,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                child: Image.asset(
                                                  'assets/Spirits/${_team1[_activeTeam1PokemonIndex]["id"]}_${_team1[_activeTeam1PokemonIndex]["name"]}.png',
                                                  height: 225,
                                                  width: 250,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Image.asset(
                                          'assets/Spirits/${_team1[_activeTeam1PokemonIndex]["id"]}_${_team1[_activeTeam1PokemonIndex]["name"]}.png',
                                          height: 225,
                                          width: 250,
                                        ),
                                      ),
                                Container(
                                  height: 30,
                                  width: 250,
                                  alignment: Alignment.center,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: _defenderHP > 0 &&
                                                _items[indexer]
                                                        ["attackerTeam"] ==
                                                    1
                                            ? Image.asset(
                                                "assets/Types/type${_items[indexer]["moveType"]}.png")
                                            : Text(""),
                                      ),
                                      Text(
                                        _defenderHP > 0 &&
                                                _items[indexer]
                                                        ["attackerTeam"] ==
                                                    1
                                            ? " ${_items[indexer]["moveName"]}"
                                            : "-${_items[indexer]["damage"]}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  alignment: Alignment.center,
                                  child: AnimatedBuilder(
                                    animation: _healthBarAnimationController,
                                    builder: (context, child) {
                                      return Container(
                                        width: 250,
                                        child: LinearProgressIndicator(
                                          color: Colors.green,
                                          backgroundColor: Colors.grey,
                                          value: _attackerHP /
                                              _team1[_activeTeam1PokemonIndex]
                                                  ["maxHealth"],
                                          minHeight: 15,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          Container(
                            height: 300,
                            alignment: Alignment.bottomRight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(child: Container()),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "${_team1[_activeTeam1PokemonIndex]["name"]}",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "Level ${_team1[_activeTeam1PokemonIndex]["level"]}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.centerRight,
                                  child: Image.asset(
                                      "assets/Types/type${_team1[_activeTeam1PokemonIndex]["coreType"]}.png"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      color: Colors.green,
                      child: Image.asset(
                          'assets/Spirits/${_team1[0]['id']}_${_team1[0]['name']}.png'),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      color: Colors.red,
                      child: Image.asset(
                          'assets/Spirits/${_team1[1]['id']}_${_team1[1]['name']}.png'),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      color: Colors.blue,
                      child: Image.asset(
                          'assets/Spirits/${_team1[2]['id']}_${_team1[2]['name']}.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
