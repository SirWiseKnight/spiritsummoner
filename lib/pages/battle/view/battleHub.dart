import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
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
  bool _introAnimation = false;

  List _items = [
    {
      "turn": 1,
      "attacker": "Reindeer",
      "attackerTeam": 1,
      "attackerHealth": 671,
      "moveName": "Dark Blessing",
      "moveType": "Dark",
      "damage": 264,
      "defender": "Skiina",
      "defenderTeam": 2,
      "defenderHealth": 454
    },
  ];
  String _results = "";
  List _team1 = [
    {
      "team": 1,
      "id": 5,
      "name": "Reindeer",
      "nickname": "Reindeer",
      "level": 70,
      "maxHealth": 671,
      "coreType": "Neutral",
    },
    {
      "team": 1,
      "id": 5,
      "name": "Reindeer",
      "nickname": "Reindeer",
      "level": 70,
      "maxHealth": 671,
      "coreType": "Neutral",
    },
    {
      "team": 1,
      "id": 5,
      "name": "Reindeer",
      "nickname": "Reindeer",
      "level": 70,
      "maxHealth": 671,
      "coreType": "Neutral",
    },
  ];
  List _team2 = [
    {
      "team": 2,
      "id": 5,
      "name": "Reindeer",
      "nickname": "Reindeer",
      "level": 70,
      "maxHealth": 671,
      "coreType": "Neutral",
    },
    {
      "team": 2,
      "id": 5,
      "name": "Reindeer",
      "nickname": "Reindeer",
      "level": 70,
      "maxHealth": 671,
      "coreType": "Neutral",
    },
    {
      "team": 2,
      "id": 5,
      "name": "Reindeer",
      "nickname": "Reindeer",
      "level": 70,
      "maxHealth": 671,
      "coreType": "Neutral",
    },
  ];
  int indexer = 0;
  int _delay = 2000;
  late int _damage = 0;

  late Map<String, dynamic> _attacker = _team1[0];
  late int _attackerHP = 100;
  late int _attackerLeadHP = 0;
  late Map<String, dynamic> _defender = _team2[0];
  late int _defenderHP = 100;
  late int _defenderLeadHP = 0;

  int _activeTeam1PokemonIndex = 0;
  int _activeTeam2PokemonIndex = 0;

  bool _isBattleOver = false;
  bool _isPokemonVisible = true;
  AnimationController? _fadeController = null;

  // Declare variables for animation
  late Offset _attackerInitialPosition = Offset(150, -275);
  late Offset _attackerFinalPosition = Offset.zero;
  AnimationController? _attackerReverseAnimationController = null;
  late Offset _defenderInitialPosition = Offset.zero;
  late Offset _defenderFinalPosition = Offset(-150, 275);

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
      duration: Duration(milliseconds: 2000),
    );
    _healthBarAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
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

//BATTLE ROUND STARTS HERE
  void _startBattleRound() async {
    await readJson(); // Ensure that data from the JSON file is read before starting

    if (indexer > 0) {
      setState(() {
        _delay = 500;
      });
    }

    if (indexer == 0) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {
          _introAnimation = true;
          _attackerHP = _attackerLeadHP;
          _defenderHP = _defenderLeadHP;
        });
      });
    }

    if (!_isAnimating && _jsonFileLoaded) {
      await _introAnimation == true;

      // Check if the battle is over
      if (_items[indexer]["turn"] > _items.length) {
        // Stop all animations running for the battle here before showing results
        _fadeController!.stop();
        _pokemonAnimationController.stop();
        _attackerReverseAnimationController!.stop();
        _healthBarAnimationController.stop();
        _introAnimation = false;
        _showBattleResult(_results);
        return;
      }

      // Check for last attack animation
      if (_items[indexer]["turn"] >= _items.length) {
        // Check if Team1 is attacking
        if (_items[indexer]["attackerTeam"] == 1) {
          _defenderHP = _items[indexer]["defenderHealth"];
          _attackerHP = _items[indexer]["attackerHealth"];
          Future.delayed(const Duration(milliseconds: 500), () {
            setState(() {
              _defenderLeadHP = _defenderHP;
            });
          });
        }

        // Check if Team2 is attacking
        if (_items[indexer]["attackerTeam"] == 2) {
          _attackerHP = _items[indexer]["defenderHealth"];
          _defenderHP = _items[indexer]["attackerHealth"];
          Future.delayed(const Duration(milliseconds: 500), () {
            setState(() {
              _attackerLeadHP = _attackerHP;
            });
          });
        }

        await Future.delayed(Duration(milliseconds: _delay), () {});
        // Set the battle state to OVER and animate final attack scene
        _animatePokemonAttack();
        _isBattleOver = true;
        return;
      }

      // Else - normal battle sequence
      // Set attacker parameters
      _attacker = _team1[_activeTeam1PokemonIndex];
      _attackerInitialPosition = Offset.zero;
      _attackerFinalPosition = Offset(150, -275);

      // Set defender parameters
      _defender = _team2[_activeTeam2PokemonIndex];
      _defenderInitialPosition = Offset.zero;
      _defenderFinalPosition = Offset(-150, 275);

      // Set damage parameters
      _damage = _items[indexer]["damage"];

      await Future.delayed(Duration(milliseconds: _delay), () {});
      // Animate the attack
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
        // Stop all animations running for the battle here before showing results
        _fadeController!.stop();
        _pokemonAnimationController.stop();
        _attackerReverseAnimationController!.stop();
        _healthBarAnimationController.stop();
        _introAnimation = false;
        _showBattleResult(_results);
      }
      if (_activeTeam2PokemonIndex > _team2.length) {
        // All Pokemon from Team 2 have fainted, end the battle
        _isBattleOver ==
            true; // Change this to assignment (_isBattleOver = true;)
        // Stop all animations running for the battle here before showing results
        _fadeController!.stop();
        _pokemonAnimationController.stop();
        _attackerReverseAnimationController!.stop();
        _healthBarAnimationController.stop();
        _introAnimation = false;
        _showBattleResult(_results);
      }
    });
  }

  void _animatePokemonAttack() async {
    _isAnimating = true;

    await _pokemonAnimationController.forward(from: 0.0).whenComplete(() {
      if (_items[indexer]["attackerTeam"] == 1) {
        _defenderHP = _items[indexer]["defenderHealth"];
        _attackerHP = _items[indexer]["attackerHealth"];
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            _defenderLeadHP = _defenderHP;
          });
        });
      }

      if (_items[indexer]["attackerTeam"] == 2) {
        _attackerHP = _items[indexer]["defenderHealth"];
        _defenderHP = _items[indexer]["attackerHealth"];
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            _attackerLeadHP = _attackerHP;
          });
        });
      }

      // Start the attacker's reverse animation
      _attackerReverseAnimationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
      )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _attackerReverseAnimationController = null;
          }
        });
      _attackerReverseAnimationController!.forward(from: 0.0);
      _animateHealthBar(); // Move this line here to trigger the switch animation
      _isAnimating = false;
      if (_items[indexer]["turn"] < _items.length) {
        incrementIndexer();
      }
      if (_items[indexer]["turn"] > _items.length) {
        return;
      }
      // Restart battle round
      _startBattleRound();
    });
  }

  void _nextDefender() async {
    await readJson();
    // Send in the next Pokemon from Team 2 if available
    if (_items[indexer]["turn"] < _items.length) {
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
    if (_items[indexer]["turn"] < _items.length) {
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
    _fadeController!.forward(from: 0.0).whenComplete(() {
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
    });
  }

  void _showBattleResult(String _results) async {
    await readJson();
    // Reset the battle state after showing the result
    setState(() {
      _isAnimating = false; // Add this line to reset animation state
      _introAnimation = false;
    });
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

  void _animateHealthBar() {
    _healthBarAnimationController.reset(); // Reset the animation controller

    _healthBarAnimationController.forward(from: 0.0).whenComplete(() {
      setState(() {
        if (_attackerHP <= 0) {
          _animateFainting();
          _nextAttacker(); // Move to the next defender if the current one faints
        }
        if (_defenderHP <= 0) {
          _animateFainting();
          _nextDefender(); // Move to the next defender if the current one faints
        } else {
          return; // Start the next battle round
        }
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
    _fadeController!.forward(from: 0.0).whenComplete(() {
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _isPokemonVisible = true; // Reset visibility
        });
      });
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
      body: AnimatedCrossFade(
        alignment: Alignment.center,
        crossFadeState: _introAnimation == false
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: Duration(milliseconds: 1000),
        firstCurve: Interval(0, 0),
        secondCurve: Curves.easeIn,
        sizeCurve: Curves.decelerate,
        firstChild: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 121, 162, 204),
                  Color.fromARGB(255, 148, 220, 223),
                  Color.fromARGB(255, 117, 154, 202),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Image.asset(
                '/Users/masonjohnson/development/summoner-wip/spiritsummoner/assets/icons/fight_vs@2x.png'),
          ),
        ),
        secondChild: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 121, 162, 204),
                Color.fromARGB(255, 148, 220, 223),
                Color.fromARGB(255, 117, 154, 202),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
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
                Stack(
                  clipBehavior: Clip.antiAlias,
                  children: [
                    battleFieldAnimatedContainer(
                        pokemonAnimationController: _pokemonAnimationController,
                        team2: _team2,
                        activeTeam2PokemonIndex: _activeTeam2PokemonIndex,
                        healthBarAnimationController:
                            _healthBarAnimationController,
                        defenderHP: _defenderHP,
                        defender: _defender,
                        attackerHP: _attackerHP,
                        attackerReverseAnimationController:
                            _attackerReverseAnimationController,
                        items: _items,
                        indexer: indexer,
                        defenderFinalPosition: _defenderFinalPosition,
                        defenderInitialPosition: _defenderInitialPosition,
                        isPokemonVisible: _isPokemonVisible,
                        attackerFinalPosition: _attackerFinalPosition,
                        attackerInitialPosition: _attackerInitialPosition,
                        team1: _team1,
                        activeTeam1PokemonIndex: _activeTeam1PokemonIndex),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
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
      ),
    );
  }
}

class battleFieldAnimatedContainer extends StatelessWidget {
  const battleFieldAnimatedContainer({
    super.key,
    required AnimationController pokemonAnimationController,
    required List team2,
    required int activeTeam2PokemonIndex,
    required AnimationController healthBarAnimationController,
    required int defenderHP,
    required Map<String, dynamic> defender,
    required int attackerHP,
    required AnimationController? attackerReverseAnimationController,
    required List items,
    required this.indexer,
    required Offset defenderFinalPosition,
    required Offset defenderInitialPosition,
    required bool isPokemonVisible,
    required Offset attackerFinalPosition,
    required Offset attackerInitialPosition,
    required List team1,
    required int activeTeam1PokemonIndex,
  })  : _pokemonAnimationController = pokemonAnimationController,
        _team2 = team2,
        _activeTeam2PokemonIndex = activeTeam2PokemonIndex,
        _healthBarAnimationController = healthBarAnimationController,
        _defenderHP = defenderHP,
        _defender = defender,
        _attackerHP = attackerHP,
        _attackerReverseAnimationController =
            attackerReverseAnimationController,
        _items = items,
        _defenderFinalPosition = defenderFinalPosition,
        _defenderInitialPosition = defenderInitialPosition,
        _isPokemonVisible = isPokemonVisible,
        _attackerFinalPosition = attackerFinalPosition,
        _attackerInitialPosition = attackerInitialPosition,
        _team1 = team1,
        _activeTeam1PokemonIndex = activeTeam1PokemonIndex;

  final AnimationController _pokemonAnimationController;
  final List _team2;
  final int _activeTeam2PokemonIndex;
  final AnimationController _healthBarAnimationController;
  final int _defenderHP;
  final Map<String, dynamic> _defender;
  final int _attackerHP;
  final AnimationController? _attackerReverseAnimationController;
  final List _items;
  final int indexer;
  final Offset _defenderFinalPosition;
  final Offset _defenderInitialPosition;
  final bool _isPokemonVisible;
  final Offset _attackerFinalPosition;
  final Offset _attackerInitialPosition;
  final List _team1;
  final int _activeTeam1PokemonIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pokemonAnimationController,
      builder: (context, child) {
        return Container(
          height: 625,
          child: Stack(
            children: [
              // Defender Platform
              Positioned(
                right: -90,
                top: 180,
                child: Container(
                  height: 400,
                  width: 400,
                  alignment: Alignment.topRight,
                  child: Image.asset(
                      "/Users/masonjohnson/development/summoner-wip/spiritsummoner/assets/platforms/platform${_team2[_activeTeam2PokemonIndex]["coreType"]}.webp"),
                ),
              ),

              // Attacker Platform
              Positioned(
                left: -120,
                bottom: 25,
                child: Container(
                  height: 400,
                  width: 400,
                  alignment: Alignment.bottomLeft,
                  child: Image.asset(
                      "/Users/masonjohnson/development/summoner-wip/spiritsummoner/assets/platforms/platform${_team1[_activeTeam1PokemonIndex]["coreType"]}.webp"),
                ),
              ),

              // Attacker Name, Level, and Type
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Container(
                  height: 700,
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
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Level ${_team1[_activeTeam1PokemonIndex]["level"]}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
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
              ),

              // Defender Name, Level, and Type
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "${_team2[_activeTeam2PokemonIndex]["name"]}",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                  left: 16.0,
                ),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Level ${_team2[_activeTeam2PokemonIndex]["level"]}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 52.0,
                  left: 16.0,
                ),
                child: Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                      "assets/Types/type${_team2[_activeTeam2PokemonIndex]["coreType"]}.png"),
                ),
              ),

              // Defender Image
              Positioned(
                right: -60,
                top: 25,
                child: Container(
                  child: _attackerHP > 0 &&
                          _attackerReverseAnimationController != null &&
                          _items[indexer]["attackerTeam"] == 2
                      ? AnimatedBuilder(
                          animation: _attackerReverseAnimationController!,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset.lerp(
                                _defenderFinalPosition,
                                _defenderInitialPosition,
                                _attackerReverseAnimationController!.value,
                              )!,
                              child: Container(
                                alignment: Alignment.topRight,
                                child: AnimatedOpacity(
                                  opacity: _isPokemonVisible ? 1.0 : 0.0,
                                  duration: Duration(milliseconds: 500),
                                  child: Image.asset(
                                    'assets/Spirits/${_team2[_activeTeam2PokemonIndex]["id"]}_${_team2[_activeTeam2PokemonIndex]["name"]}.png',
                                    height: 325,
                                    width: 325,
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : Container(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            'assets/Spirits/${_team2[_activeTeam2PokemonIndex]["id"]}_${_team2[_activeTeam2PokemonIndex]["name"]}.png',
                            height: 325,
                            width: 325,
                          ),
                        ),
                ),
              ),

              // Attacker Image
              Positioned(
                bottom: 25,
                left: -60,
                child: Container(
                  height: 400,
                  child: _defenderHP > 0 &&
                          _attackerReverseAnimationController != null &&
                          _items[indexer]["attackerTeam"] == 1
                      ? AnimatedBuilder(
                          animation: _attackerReverseAnimationController!,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset.lerp(
                                _attackerFinalPosition,
                                _attackerInitialPosition,
                                _attackerReverseAnimationController!.value,
                              )!,
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: AnimatedOpacity(
                                  opacity: _isPokemonVisible ? 1.0 : 0.0,
                                  duration: Duration(milliseconds: 500),
                                  child: Image.asset(
                                    'assets/Spirits/${_team1[_activeTeam1PokemonIndex]["id"]}_${_team1[_activeTeam1PokemonIndex]["name"]}.png',
                                    height: 325,
                                    width: 325,
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
                            height: 325,
                            width: 325,
                          ),
                        ),
                ),
              ),

              // Attacker Health Bar
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Container(
                  height: 700,
                  alignment: Alignment.bottomLeft,
                  child: AnimatedBuilder(
                    animation: _healthBarAnimationController,
                    builder: (context, child) {
                      return Container(
                        width: 250,
                        child: LinearProgressIndicator(
                          color: Colors.green,
                          backgroundColor: Colors.grey,
                          value: _attackerHP /
                              _team1[_activeTeam1PokemonIndex]["maxHealth"],
                          minHeight: 15,
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Defender Health Bar
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Container(
                  height: 300,
                  alignment: Alignment.topRight,
                  child: AnimatedBuilder(
                    animation: _healthBarAnimationController,
                    builder: (context, child) {
                      return Container(
                        width: 250,
                        child: LinearProgressIndicator(
                          color: Colors.green,
                          backgroundColor: Colors.grey,
                          value: (_defenderHP / _defender["maxHealth"])
                              .clamp(0.0, 1.0),
                          minHeight: 15,
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Attacker Move Box
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 150.0,
                  right: 16.0,
                ),
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: _defenderHP > 0 &&
                          _items[indexer]["attackerTeam"] == 1 &&
                          _attackerReverseAnimationController == null
                      ? Container(
                          width: 210,
                          height: 30,
                          color: Colors.white.withOpacity(0.75),
                          alignment: Alignment.center,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                  "assets/Types/type${_items[indexer]["moveType"]}.png"),
                              Text(
                                " ${_items[indexer]["moveName"]}",
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(color: Colors.transparent),
                ),
              ),

              // Defender Move Box
              Padding(
                padding: const EdgeInsets.only(
                  top: 200.0,
                  left: 16.0,
                ),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: _defenderHP > 0 &&
                          _items[indexer]["attackerTeam"] == 2 &&
                          _attackerReverseAnimationController == null
                      ? Container(
                          color: Colors.white.withOpacity(0.75),
                          height: 30,
                          width: 210,
                          alignment: Alignment.center,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                  "assets/Types/type${_items[indexer]["moveType"]}.png"),
                              Text(
                                " ${_items[indexer]["moveName"]}",
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(color: Colors.transparent),
                ),
              ),

              // Attacker Received Damage Box
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 125.0,
                  right: 200.0,
                ),
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: _defenderHP > 0 &&
                          _items[indexer]["attackerTeam"] == 2 &&
                          _attackerReverseAnimationController != null
                      ? Container(
                          width: 210,
                          height: 75,
                          alignment: Alignment.center,
                          child: Text(
                            "-${_items[indexer]["damage"]}",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.w900,
                              shadows: [
                                Shadow(
                                  // bottomLeft
                                  offset: Offset(-2, -2),
                                  color: Colors.red,
                                ),
                                Shadow(
                                  // bottomRight
                                  offset: Offset(2, -2),
                                  color: Colors.red,
                                ),
                                Shadow(
                                  // bottomRight
                                  offset: Offset(3, 3),
                                  color: Colors.black,
                                ),
                                Shadow(
                                  // topRight
                                  offset: Offset(2, 2),
                                  color: Colors.red,
                                ),
                                Shadow(
                                  // topLeft
                                  offset: Offset(-2, 2),
                                  color: Colors.red,
                                ),
                                Shadow(
                                  // topCenter
                                  offset: Offset(0, -2),
                                  color: Colors.red,
                                ),
                                Shadow(
                                  // right
                                  offset: Offset(2, 0),
                                  color: Colors.red,
                                ),
                                Shadow(
                                  // left
                                  offset: Offset(-2, 0),
                                  color: Colors.red,
                                ),
                                Shadow(
                                  // bottom
                                  offset: Offset(0, 2),
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(color: Colors.transparent),
                ),
              ),

              //Defender Received Damage Box
              Padding(
                padding: const EdgeInsets.only(
                  top: 200.0,
                  left: 200.0,
                ),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: _defenderHP > 0 &&
                          _items[indexer]["attackerTeam"] == 1 &&
                          _attackerReverseAnimationController != null
                      ? Container(
                          height: 75,
                          width: 210,
                          alignment: Alignment.center,
                          child: Text(
                            "-${_items[indexer]["damage"]}",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.w900,
                              shadows: [
                                Shadow(
                                  // bottomLeft
                                  offset: Offset(-2, -2),
                                  color: Colors.red,
                                ),
                                Shadow(
                                  // bottomRight
                                  offset: Offset(2, -2),
                                  color: Colors.red,
                                ),
                                Shadow(
                                  // bottomRight
                                  offset: Offset(3, 3),
                                  color: Colors.black,
                                ),
                                Shadow(
                                  // topRight
                                  offset: Offset(2, 2),
                                  color: Colors.red,
                                ),
                                Shadow(
                                  // topLeft
                                  offset: Offset(-2, 2),
                                  color: Colors.red,
                                ),
                                Shadow(
                                  // topCenter
                                  offset: Offset(0, -2),
                                  color: Colors.red,
                                ),
                                Shadow(
                                  // right
                                  offset: Offset(2, 0),
                                  color: Colors.red,
                                ),
                                Shadow(
                                  // left
                                  offset: Offset(-2, 0),
                                  color: Colors.red,
                                ),
                                Shadow(
                                  // bottom
                                  offset: Offset(0, 2),
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(color: Colors.transparent),
                ),
              ),

              // End of Stack
            ],
          ),
        );
      },
    );
  }
}
