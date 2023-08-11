import 'package:flutter/material.dart';
import 'package:spirit_summoner/pages/home/shared/homePages.dart';

class Move {
  final String name;
  final String elementType;
  final String moveType;
  final int power;

  Move(this.name, this.elementType, this.moveType, this.power);
}

class Pokemon {
  final String name;
  final int level;
  int health;
  final int maxHealth;
  final int attack;
  final int defense;
  final int magicAttack;
  final int magicDefense;
  final int speed;
  final int intelligence;
  final String ability;
  final String heldItem;
  final String coreType;
  final String move1;
  final String move2;
  final String move3;
  final String move4;
  final String imagePath;

  Pokemon({
    required this.name,
    required this.level,
    required this.health,
    required this.maxHealth,
    required this.attack,
    required this.defense,
    required this.magicAttack,
    required this.magicDefense,
    required this.speed,
    required this.intelligence,
    required this.ability,
    required this.heldItem,
    required this.coreType,
    required this.move1,
    required this.move2,
    required this.move3,
    required this.move4,
    required this.imagePath,
  });

  // Method to take damage and handle ability effects
  void takeDamage(int damage) {
    health -= damage;

    // Apply damage ability effects
    if (ability == "Endurance" && health <= 0) {
      health = 1;
    }
  }

  // Method to heal the Pokemon (if needed)
  void heal(int amount) {
    health += amount;
    // You can add any additional checks or adjustments here, if required.
  }
}

class BattleScreen extends StatefulWidget {
  @override
  _BattleScreenState createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen>
    with TickerProviderStateMixin {
  late AnimationController _pokemonAnimationController;
  late AnimationController _healthBarAnimationController;

  late List<Pokemon> _team1;
  late List<Pokemon> _team2;
  late Pokemon _attacker;
  late Pokemon _defender;
  late Move _selectedMove;

  int _activeTeam1PokemonIndex = 0;
  int _activeTeam2PokemonIndex = 0;

  bool _isBattleOver = false;
  bool _isPokemonVisible = true;
  AnimationController? _fadeController;

  // Declare variables for animation
  late Offset _attackerInitialPosition;
  late Offset _attackerFinalPosition;
  AnimationController? _attackerReverseAnimationController;

  // Create some Move objects for spirit1
  Move darkBlessing = Move("Dark Blessing", "Dark", "Magical", 100);
  Move hornAttack = Move("Horn Attack", "Neutral", "Physical", 100);
  Move polarLight = Move("Polar Light", "Light", "Magical", 140);
  Move chomp = Move("Chomp", "Neutral", "Physical", 120);
  Move whirlwindZone = Move("Whirlwind Zone", "Wind", "Magical", 140);
  Move sonicCombustion = Move("Sonic Combustion", "Wind", "Magical", 150);
  Move queenBreath = Move("Queen Breath", "Light", "Magical", 100);

  List<Map<String, dynamic>> _battleRounds = [];
  int _currentRoundIndex = 0;
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

    _initTeams();
    _startBattleRound();
    _battleRounds = _createBattleRounds();
  }

  List<Map<String, dynamic>> _createBattleRounds() {
    List<Map<String, dynamic>> rounds = [];

    // Create the battle rounds based on the teams and moves
    for (int i = 0; i < _team1.length; i++) {
      for (int j = 0; j < _team2.length; j++) {
        rounds.add({
          'attacker': _team1[i],
          'defender': _team2[j],
          'move': polarLight,
        });
        // Add more rounds for other moves if needed
      }
    }

    return rounds;
  }

  @override
  void dispose() {
    _pokemonAnimationController.dispose();
    _healthBarAnimationController.dispose();
    _attackerReverseAnimationController!.dispose();
    _fadeController?.dispose();
    super.dispose();
  }

  void _initTeams() {
    // Create team 1
    _team1 = [
      Pokemon(
        name: "Reindeer",
        level: 70,
        health: 671,
        maxHealth: 671,
        attack: 42,
        defense: 48,
        magicAttack: 368,
        magicDefense: 68,
        speed: 565,
        intelligence: 86,
        ability: "Endurance",
        heldItem: "Flashlight",
        coreType: "Neutral",
        move1: "darkBlessing",
        move2: "hornAttack",
        move3: "polarLight",
        move4: "chomp",
        imagePath: "005",
      ),
      Pokemon(
        name: "Skiina",
        level: 70,
        health: 718,
        maxHealth: 718,
        attack: 5,
        defense: 48,
        magicAttack: 457,
        magicDefense: 50,
        speed: 555,
        intelligence: 114,
        ability: "Endurance",
        heldItem: "Flashlight",
        coreType: "Wind",
        move1: "queenBreath",
        move2: "whirlwindZone",
        move3: "polarLight",
        move4: "sonicCombustion",
        imagePath: "006",
      ),
      Pokemon(
        name: "Reindeer",
        level: 70,
        health: 671,
        maxHealth: 671,
        attack: 42,
        defense: 48,
        magicAttack: 368,
        magicDefense: 68,
        speed: 565,
        intelligence: 86,
        ability: "Endurance",
        heldItem: "Flashlight",
        coreType: "Neutral",
        move1: "darkBlessing",
        move2: "hornAttack",
        move3: "polarLight",
        move4: "chomp",
        imagePath: "005",
      ),
      // Add more Pokemon to team 1 as needed
    ];

    // Create team 2
    _team2 = [
      Pokemon(
        name: "Skiina",
        level: 70,
        health: 718,
        maxHealth: 718,
        attack: 5,
        defense: 48,
        magicAttack: 457,
        magicDefense: 50,
        speed: 555,
        intelligence: 114,
        ability: "Endurance",
        heldItem: "Flashlight",
        coreType: "Wind",
        move1: "queenBreath",
        move2: "whirlwindZone",
        move3: "polarLight",
        move4: "sonicCombustion",
        imagePath: "006",
      ),
      Pokemon(
        name: "Reindeer",
        level: 70,
        health: 671,
        maxHealth: 671,
        attack: 42,
        defense: 48,
        magicAttack: 368,
        magicDefense: 68,
        speed: 565,
        intelligence: 86,
        ability: "Endurance",
        heldItem: "Flashlight",
        coreType: "Neutral",
        move1: "darkBlessing",
        move2: "hornAttack",
        move3: "polarLight",
        move4: "chomp",
        imagePath: "005",
      ),
      Pokemon(
        name: "Skiina",
        level: 70,
        health: 718,
        maxHealth: 718,
        attack: 5,
        defense: 48,
        magicAttack: 457,
        magicDefense: 50,
        speed: 555,
        intelligence: 114,
        ability: "Endurance",
        heldItem: "Flashlight",
        coreType: "Wind",
        move1: "queenBreath",
        move2: "whirlwindZone",
        move3: "polarLight",
        move4: "sonicCombustion",
        imagePath: "006",
      ),
      // Add more Pokemon to team 2 as needed
    ];
    // Set the initial active Pokemon for each team
    _attacker = _team1[_activeTeam1PokemonIndex];
    _defender = _team2[_activeTeam2PokemonIndex];
  }

  void _startBattleRound() {
    // Only proceed if no animation is currently in progress
    if (!_isAnimating) {
      // Check if the battle is over
      if (_isBattleOver == true) {
        _showBattleResult('Team BLANK wins!');
        return;
      }

      // Set the attacker, defender, and move for this round
      _attacker = _team1[_activeTeam1PokemonIndex];
      _defender = _team2[_activeTeam2PokemonIndex];
      _selectedMove = polarLight;

      // Set initial and final positions for attacker's image animation
      _attackerInitialPosition = Offset.zero;
      _attackerFinalPosition = Offset(150, -275);

      // Start the attack animation
      _animatePokemonAttack();
    }
  }

  bool _hasConsciousPokemon(List<Pokemon> team) {
    return team.any((pokemon) => pokemon.health > 0);
  }

  void _animatePokemonAttack() {
    _isAnimating = true;
    _pokemonAnimationController.forward(from: 0.0).whenComplete(() {
      _attackerReverseAnimationController;
      _pokemonAnimationController.reset();
      _calculateDamage();
    });

    // After the animation is complete, check if the defender's health is 0 or less
    if (_defender.health <= 0) {
      _defender.health = 0;
      if (!_hasConsciousPokemon(_team2)) {
        // If all Pokemon on Team 2 have fainted, the battle is over
        _showBattleResult("Team 1 Wins!");
      } else {
        // Send in the next Pokemon from Team 2
        _animatePokemonSwitch(_defender);
        _nextDefender();
      }
    }
  }

  void _nextDefender() {
    // Check if the current defender has fainted
    if (_defender.health <= 0) {
      // Send in the next Pokemon from Team 2 if available
      if (_activeTeam2PokemonIndex < _team2.length - 1) {
        _activeTeam2PokemonIndex++;
        _defender = _team2[_activeTeam2PokemonIndex];
        _animatePokemonSwitch(_defender);
      } else {
        // All Pokemon from Team 2 have fainted, end the battle
        _isBattleOver == true;
        _showBattleResult('Team BLANK wins!');
      }
    }
  }

  void _animatePokemonSwitch(Pokemon pokemon) {
    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    // Start the fade-out animation
    _fadeController!.forward().whenComplete(() {
      setState(() {
        _defender = _team2[_activeTeam2PokemonIndex];
        _isPokemonVisible = true; // Reset visibility
      });

      // Dispose of the animation controller
      _fadeController!.dispose();
      _fadeController = null; // Set to null after disposing

      _startBattleRound();
    });

    setState(() {
      _isAnimating = true;
      _isPokemonVisible = false;
    });
  }

  void _showBattleResult(String message) {
    // Show the battle result message using a dialog
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevent dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Battle Result'),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Reset the battle state after showing the result
                setState(() {
                  _isAnimating = false;
                  _activeTeam1PokemonIndex = 0;
                  _activeTeam2PokemonIndex = 0;
                  _attacker = _team1[_activeTeam1PokemonIndex];
                  _defender = _team2[_activeTeam2PokemonIndex];
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

  void _calculateDamage() {
    // Replace this with your battle logic to calculate damage
    // For simplicity, we'll just assume a fixed damage for the example
    int damage = 140;

    _defender.health -= damage;

    if (_defender.health < 0) {
      _defender.health = 0;
    }

    _animateHealthBar();

    // Start the attacker's reverse animation
    _attackerReverseAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //_attackerReverseAnimationController!.removeStatusListener(_calculateDamage);
          _attackerReverseAnimationController!.dispose();
          _attackerReverseAnimationController = null;

          // Check if the defender's health is 0 or less
          if (_defender.health <= 0) {
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
    _healthBarAnimationController.forward(from: 0.0).whenComplete(() {
      // Health bar animation is complete
      if (_defender.health <= 0) {
        _animateFainting();
      } else {
        _startBattleRound();
      }
    });
  }

  void _animateFainting() {
    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    // Start the fade-out animation
    _fadeController!.forward().whenComplete(() {
      setState(() {
        _isPokemonVisible = true; // Reset visibility
      });

      // Dispose of the animation controller
      _fadeController!.dispose();
      _fadeController = null; // Set to null after disposing

      _startBattleRound();
    });

    setState(() {
      _isAnimating = true;
      _isPokemonVisible = false;
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
                          'assets/Spirits/${_defender.imagePath}_${_defender.name}.png'),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      color: Colors.red,
                      child: Image.asset(
                          'assets/Spirits/${_attacker.imagePath}_${_attacker.name}.png'),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      color: Colors.green,
                      child: Image.asset(
                          'assets/Spirits/${_defender.imagePath}_${_defender.name}.png'),
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
                                    "${_defender.name}",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Level ${_defender.level}",
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
                                      "assets/Types/type${_defender.coreType}.png"),
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
                                          value: _defender.health /
                                              _defender.maxHealth,
                                          minHeight: 15,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    _defender.health > 0
                                        ? "-${_selectedMove.power}"
                                        : "${_defender.name} fainted!",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  height: 225,
                                  width: 250,
                                  alignment: Alignment.centerRight,
                                  child: AnimatedOpacity(
                                    opacity: _isPokemonVisible ? 1.0 : 0.0,
                                    duration: Duration(milliseconds: 500),
                                    child: Image.asset(
                                      'assets/Spirits/${_defender.imagePath}_${_defender.name}.png',
                                      height: 225,
                                      width: 250,
                                    ),
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
                                _defender.health > 0 &&
                                        _attackerReverseAnimationController !=
                                            null
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
                                              child: Image.asset(
                                                'assets/Spirits/${_attacker.imagePath}_${_attacker.name}.png',
                                                height: 225,
                                                width: 250,
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Image.asset(
                                          'assets/Spirits/${_attacker.imagePath}_${_attacker.name}.png',
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
                                        child: _defender.health > 0
                                            ? Image.asset(
                                                "assets/Types/type${_selectedMove.elementType}.png")
                                            : Image.asset(
                                                "assets/Types/type${_selectedMove.elementType}.png",
                                                opacity:
                                                    const AlwaysStoppedAnimation(
                                                        0.0),
                                              ),
                                      ),
                                      Text(
                                        _defender.health > 0
                                            ? " ${_selectedMove.name}"
                                            : "",
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
                                          value: _attacker.health /
                                              _attacker.maxHealth,
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
                                    "${_attacker.name}",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "Level ${_attacker.level}",
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
                                      "assets/Types/type${_attacker.coreType}.png"),
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
                          'assets/Spirits/${_attacker.imagePath}_${_attacker.name}.png'),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      color: Colors.red,
                      child: Image.asset(
                          'assets/Spirits/${_defender.imagePath}_${_defender.name}.png'),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      color: Colors.blue,
                      child: Image.asset(
                          'assets/Spirits/${_attacker.imagePath}_${_attacker.name}.png'),
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
