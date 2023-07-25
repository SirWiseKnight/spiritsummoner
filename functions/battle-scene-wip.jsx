// The Cloud Functions for Firebase SDK to create Cloud Functions and triggers.
// const {logger} = require("firebase-functions");
// const {onRequest} = require("firebase-functions/v2/https");
// const {onDocumentCreated} = require("firebase-functions/v2/firestore");

// The Firebase Admin SDK to access Firestore.
// const {initializeApp} = require("firebase-admin/app");
// const {getFirestore} = require("firebase-admin/firestore");

// initializeApp();

// need to call both teams, assign their values, and lock them in

// define the Move class
class Move {
  constructor(name, elementType, moveType, power) {
    this.name = name;
    this.elementType = elementType;
    this.moveType = moveType;
    this.power = power;
  }
}

// define the Pokemon class
class Pokemon {
  constructor(name, level, health, attack, defense, magicAttack, magicDefense, speed, intelligence, ability, heldItem, coreType, moves) {
    this.name = name;
    this.level = level;
    this.health = health;
    this.attack = attack;
    this.defense = defense;
    this.magicAttack = magicAttack;
    this.magicDefense = magicDefense;
    this.speed = speed;
    this.intelligence = intelligence;
    this.ability = ability;
    this.heldItem = heldItem;
    this.coreType = coreType;
    this.moves = moves;
    // Add a property to keep track of whether the "Endurance" ability has been used
    this.usedEndurance = false;
  }

  // method to calculate damage multiplier based on type effectiveness
getTypeMultiplier(moveElementType, opponentCoreType) {
  // Define type effectiveness multipliers based on type matchups
  const typeEffectiveness = {
    "Electric": {
      "Water": 2,
      "Wind": 2,
      "Electric": 0.5,
      "Earth": 0.5,
      "Earth": 0.5,
      // Add other type matchups here...
    },
    "Fire": {
      "Grass": 2,
      "Wind": 2,
      "Fire": 0.5,
      "Water": 0.5,
      "Light": 0.5,
      // Add other type matchups here...
    },
    "Water": {
      "Fire": 2,
      "Poison": 2,
      "Water": 0.5,
      "Grass": 0.5,
      "Electric": 0.5,
      // Add other type matchups here...
    },
    "Grass": {
      "Water": 2,
      "Earth": 2,
      "Grass": 0.5,
      "Fire": 0.5,
      "Electric": 0.5,
      // Add other type matchups here...
    },
    "Neutral": {
    },
    "Wind": {
      "Fire": 2,
      "Earth": 2,
      "Wind": 0.5,
      "Light": 0.5,
      "Poison": 0.5,
      // Add other type matchups here...
    },
    "Poison": {
      "Grass": 2,
      "Electric": 2,
      "Poison": 0.5,
      "Dark": 0.5,
      "Wind": 0.5,
      // Add other type matchups here...
    },
    "Dark": {
      "Light": 2,
      "Poison": 0.5,
      "Earth": 0.5,
      "Neutral": 0.5,
      // Add other type matchups here...
    },
    "Light": {
      "Dark": 2,
      "Wind": 0.5,
      "Fire": 0.5,
      "Neutral": 0.5,
      // Add other type matchups here...
    },
    "Earth": {
      "Poison": 2,
      "Electric": 2,
      "Earth": 0.5,
      "Dark": 0.5,
      "Wind": 0.5,
      // Add other type matchups here...
    },
  };

  // Check if move's elementType has type effectiveness defined against opponent's coreType
  if (typeEffectiveness[moveElementType] && typeEffectiveness[moveElementType][opponentCoreType]) {
    return typeEffectiveness[moveElementType][opponentCoreType];
  }
  // If no type effectiveness defined, return default multiplier of 1
  return 1;
}

  // method to calculate damage dealt by a move
  calculateMoveDamage(move, opponent) {
    // Apply ability effects
    let abilityDamageMultiplier = 1;
    if (this.ability === "Huge Power" && move.moveType === "Physical") {
      abilityDamageMultiplier = 2.0;
    } else if (this.ability === "Static" && move.elementType === "Electric") {
      abilityDamageMultiplier = 1.2;
    } else if (this.ability === "Overgrow" && move.elementType === "Grass") {
      abilityDamageMultiplier = 1.2;
    } else if (this.ability === "Blaze" && move.elementType === "Fire") {
      abilityDamageMultiplier = 1.2;
    } else if (this.ability === "Torrent" && move.elementType === "Water") {
      abilityDamageMultiplier = 1.2;
    } else if (this.ability === "Shiny" && move.elementType === "Light") {
      abilityDamageMultiplier = 1.2;
    } else if (this.ability === "Spike") {
      abilityDamageMultiplier = 1.0;
    } else if (this.ability === "Ground" && move.elementType === "Earth") {
      abilityDamageMultiplier = 1.2;
    }

    // Apply held item effects
    let itemDamageMultiplier = 1;
    if (this.heldItem === "Light Ball" && move.elementType === "Electric") {
      itemDamageMultiplier = 1.2;
    } else if (this.heldItem === "Charcoal" && move.elementType === "Fire") {
      itemDamageMultiplier = 1.2;
    } else if (this.heldItem === "Mystic Water" && move.elementType === "Water") {
      itemDamageMultiplier = 1.2;
    } else if (this.heldItem === "Leech Seed" && move.elementType === "Grass") {
      itemDamageMultiplier = 1.2;
    } else if (this.heldItem === "Flashlight" && move.elementType === "Light") {
      itemDamageMultiplier = 1.2;
    } else if (this.heldItem === "Cloak" && move.elementType === "Dark") {
      itemDamageMultiplier = 1.2;
    } else if (this.heldItem === "Sledgehammer" && move.elementType === "Earth") {
      itemDamageMultiplier = 1.2;
    } else if (this.heldItem === "Life Orb") {
      itemDamageMultiplier = 2.0;
      this.takeDamage(this.health * 0.1);
    }

    // Apply same type advantage bonus
    let typeDamageMultiplier = 1;
    if (this.coreType === "Electric" && move.elementType === "Electric") {
      typeDamageMultiplier = 1.2;
    } else if (this.coreType === "Water" && move.elementType === "Water") {
      typeDamageMultiplier = 1.2;
    } else if (this.coreType === "Earth" && move.elementType === "Earth") {
      typeDamageMultiplier = 1.2;
    } else if (this.coreType === "Neutral" && move.elementType === "Neutral") {
      typeDamageMultiplier = 1.2;
    } else if (this.coreType === "Poison" && move.elementType === "Poison") {
      typeDamageMultiplier = 1.2;
    } else if (this.coreType === "Light" && move.elementType === "Light") {
      typeDamageMultiplier = 1.2;
    } else if (this.coreType === "Dark" && move.elementType === "Dark") {
      typeDamageMultiplier = 1.2;
    } else if (this.coreType === "Wind" && move.elementType === "Wind") {
      typeDamageMultiplier = 1.2;
    } else if (this.coreType === "Fire" && move.elementType === "Fire") {
      typeDamageMultiplier = 1.2;
    } else if (this.coreType === "Grass" && move.elementType === "Grass") {
      typeDamageMultiplier = 1.2;
    }

    // Calculate the damage with adjusted attack power
    let damage;
    if (move.moveType === "Physical") {
      damage = ((((((1.2 * this.level) / 5) + 1) * move.power * Math.max(0, this.attack / opponent.defense)) / 50) + 2) * abilityDamageMultiplier * itemDamageMultiplier * typeDamageMultiplier * this.getTypeMultiplier(move.elementType, opponent.coreType);
    } else if (move.moveType === "Magical") {
      damage = ((((((1.2 * this.level) / 5) + 1) * move.power * Math.max(0, this.magicAttack / opponent.magicDefense)) / 50) + 2) * abilityDamageMultiplier * itemDamageMultiplier * typeDamageMultiplier * this.getTypeMultiplier(move.elementType, opponent.coreType);
    }

    // Ensure that damage is at least 1
    return Math.max(1, damage);
  }

  // method to choose the best move to use against an opponent
  chooseBestMove(opponent) {
    let bestMove;
    let maxDamage = 0;

    for (let move of this.moves) {
      let damage = this.calculateMoveDamage(move, opponent);
      if (damage > maxDamage) {
        maxDamage = damage;
        bestMove = move;
      }
    }

    return bestMove;
  }

  // method to take damage
  takeDamage(damage) {
    this.health -= damage;

    // apply damage ability effects
    if (this.ability === "Endurance" && !this.usedEndurance && this.health <= 0) {
      this.health = 1;
      this.usedEndurance = true;
    }
  }
}

// define the Battle class
class Battle {
  constructor(team1, team2) {
    this.team1 = team1;
    this.team2 = team2;
  }
  
// method to simulate a round of battle
battleRound() {
  this.turnNumber = 0;

  while (!this.isBattleOver()) {
    for (let i = 0; i < this.team1.length && i < this.team2.length; i++) {
      let attacker1 = this.team1[i];
      let defender1 = this.team2[i];

      while (attacker1.health > 0 && defender1.health > 0) {

        // Determine the order of turns based on speed
        let turnOrder = [];
        if (attacker1.speed >= defender1.speed) {
          turnOrder = [attacker1, defender1];
        } else {
          turnOrder = [defender1, attacker1];
        }

        for (let pokemon of turnOrder) {
          let target = pokemon === attacker1 ? defender1 : attacker1;
          let bestMove = pokemon.chooseBestMove(target);
          let numAttacks = pokemon.speed / target.speed >= 3 ? 3 : pokemon.speed / target.speed >= 2 ? 2 : 1;

          this.turnNumber++;
          console.log(``);
          console.log(`--- Turn ${this.turnNumber} ---`);
          for (let j = 0; j < numAttacks; j++) {
            // Check if the attacker is still alive before proceeding with the attack
            if (pokemon.health > 0) {
              let damage = pokemon.calculateMoveDamage(bestMove, target);
              target.takeDamage(damage);
              console.log(`${pokemon.name} uses ${bestMove.name}, dealing ${damage} damage to ${target.name}`);
              console.log(`-> ${target.name} (${target.health} HP)`);
              console.log(`-> ${pokemon.name} (${pokemon.health} HP)`);

              // Check if the target's health is 0 or less and remove from the team if true
              if (target.health <= 0) {
                // Determine the team to which the target belongs and remove from that team
                const targetTeam = target === this.team1[i] ? this.team1 : this.team2;
                targetTeam.splice(i, 1);

                // Exit the loop if the target faints during the turn
                break;
              }
            }
          }
        }

        // Check if attacker1's health is 0 or less and switch to the next Pokemon in the team
        if (attacker1.health <= 0 && this.team1.length > 0) {
          console.log(`${attacker1.name} has fainted. ${this.team1[0].name} is sent out.`);
          attacker1 = this.team1[0];
        }

        // Check if defender1's health is 0 or less and switch to the next Pokemon in the team
        if (defender1.health <= 0 && this.team2.length > 0) {
          console.log(`${defender1.name} has fainted. ${this.team2[0].name} is sent out.`);
          defender1 = this.team2[0];
        }
      }
    }
  }
}

  // method to check if the battle is over
  isBattleOver() {
    // check if all Pokemon on team1 have fainted
    let team1Fainted = true;
    for (let pokemon of this.team1) {
      if (pokemon.health > 0) {
        team1Fainted = false;
        break;
      }
    }

    // check if all Pokemon on team2 have fainted
    let team2Fainted = true;
    for (let pokemon of this.team2) {
      if (pokemon.health > 0) {
        team2Fainted = false;
        break;
      }
    }

    return team1Fainted || team2Fainted;
  }
}

// create some moves
let blessing = new Move("Blessing", "Light", "Magical", 100);
let hornAttack = new Move("Horn Attack", "Neutral", "Physical", 100);
let polarLight = new Move("Polar Light", "Light", "Magical", 140);
let chomp = new Move("Chomp", "Neutral", "Physical", 120);

let bubble = new Move("Bubble", "Water", "Magical", 100);
let consume = new Move("Consume", "Poison", "Magical", 100);
let touch = new Move("Touch", "Earth", "Magical", 100);
let waterfall = new Move("Waterfall", "Water", "Magical", 150);

let whirlwindZone = new Move("Whirlwind Zone", "Wind", "Magical", 140);
let sonicCombustion = new Move("Sonic Combustion", "Wind", "Magical", 150);
let queenBreath = new Move("Queen Breath", "Light", "Magical", 100);

let smash = new Move("Smash", "Neutral", "Physical", 100);
let staticSmash = new Move("Static Smash", "Electric", "Physical", 100);
let superSmash = new Move("Super Smash", "Neutral", "Physical", 150);
let blackHole = new Move("Black Hole", "Dark", "Physical", 150);

let dragonTail = new Move("Smash", "Neutral", "Physical", 100);
let earthquake = new Move("Earthquake", "Earth", "Physical", 100);
let dragonQuake = new Move("Dragon Quake", "Earth", "Physical", 150);
let doublePunch = new Move("Double Punch", "Neutral", "Physical", 150);

// create some Pokemon
let spirit1= new Pokemon("Reindeer",70 , 671 ,42 ,48 ,368 ,68 ,565 ,86 ,"Endurance","Flashlight","Neutral",[blessing,hornAttack,polarLight,chomp]);
let spirit2= new Pokemon("Traruza",70 , 832 ,340 ,129 ,54 ,127 ,510 ,73 ,"Ground","Sledgehammer","Earth",[dragonTail,dragonQuake,earthquake,doublePunch]);
let spirit3= new Pokemon("Warhulk",70 , 930 ,382 ,416 ,5 ,296 ,35 ,41 ,"Spike","Cloak","Dark",[smash,staticSmash,superSmash,blackHole]);

let spirit4= new Pokemon("Skiina",70 , 718 ,5 ,48 ,457 ,50 ,555 ,114 ,"Endurance","Flashlight","Wind",[queenBreath,whirlwindZone,sonicCombustion,polarLight]);
let spirit5= new Pokemon("Frogi",70 , 671 ,5 ,70 ,308 ,55 ,555 ,150 ,"Torrent","Mystic Water","Water",[bubble,consume,touch,waterfall]);
let spirit6= new Pokemon("Skiina",70 , 718 ,5 ,46 ,453 ,58 ,555 ,115 ,"Endurance","Flashlight","Wind",[queenBreath,whirlwindZone,sonicCombustion,polarLight]);

// create the teams
let team1 = [spirit1,spirit2,spirit3];
let team2 =[spirit4,spirit5,spirit6];

// create the battle
let battle= new Battle(team1,team2);

// simulate the battle until it's over
while (!battle.isBattleOver()) {
battle.battleRound();
}

// determine the winner
if (team1.every(pokemon => pokemon.health <=0)) {
  console.log("");
  console.log("--- RESULT ---");
  console.log("Team2 wins!");
  console.log("");
  console.log("-- REWARDS ---");
  console.log("List rewards here!");
} else if (team2.every(pokemon => pokemon.health <=0)) {
  console.log("");
  console.log("--- RESULT ---");
console.log("Team1 wins!");
console.log("");
console.log("-- REWARDS ---");
console.log("List rewards here!");
}