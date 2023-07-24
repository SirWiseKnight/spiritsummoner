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
  constructor(name, health, attack, defense, magicAttack, magicDefense, speed, intelligence, ability, heldItem, coreType, moves) {
    this.name = name;
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
    } else if (this.ability === "Static" && move.moveType === "Physical") {
      abilityDamageMultiplier = 1.3;
    } else if (this.ability === "Mega Launcher" && move.moveType === "Magical") {
      abilityDamageMultiplier = 1.5;
    } else if (this.ability === "Sheer Force" && move.moveType === "Magical") {
      abilityDamageMultiplier = 1.3;
    }

    // Apply held item effects
    let itemDamageMultiplier = 1;
    if (this.heldItem === "Light Ball" && move.elementType === "Electric") {
      itemDamageMultiplier = 1.2;
    } else if (this.heldItem === "Charcoal" && move.elementType === "Fire") {
      itemDamageMultiplier = 1.2;
    } else if (this.heldItem === "Life Orb") {
      itemDamageMultiplier = 2.0;
      this.takeDamage(this.health * 0.1);
    }

    // Apply same type advantage bonus
    let typeDamageMultiplier = 1;
    if (this.coreType === "Electric" && move.elementType === "Electric") {
      itemDamageMultiplier = 1.2;
    } else if (this.coreType === "Water" && move.elementType === "Water") {
      itemDamageMultiplier = 1.2;
    } else if (this.coreType === "Earth" && move.elementType === "Earth") {
      itemDamageMultiplier = 1.2;
    } else if (this.coreType === "Neutral" && move.elementType === "Neutral") {
      itemDamageMultiplier = 1.2;
    } else if (this.coreType === "Poison" && move.elementType === "Poison") {
      itemDamageMultiplier = 1.2;
    } else if (this.coreType === "Light" && move.elementType === "Light") {
      itemDamageMultiplier = 1.2;
    } else if (this.coreType === "Dark" && move.elementType === "Dark") {
      itemDamageMultiplier = 1.2;
    } else if (this.coreType === "Wind" && move.elementType === "Wind") {
      itemDamageMultiplier = 1.2;
    } else if (this.coreType === "Fire" && move.elementType === "Fire") {
      itemDamageMultiplier = 1.2;
    } else if (this.coreType === "Grass" && move.elementType === "Grass") {
      itemDamageMultiplier = 1.2;
    }

    // Calculate the damage with adjusted attack power
    let damage;
    if (move.moveType === "Physical") {
      damage = (move.power + Math.max(0, this.attack - opponent.defense)) * abilityDamageMultiplier * itemDamageMultiplier * typeDamageMultiplier * this.getTypeMultiplier(move.elementType, opponent.coreType) * 0.1;
    } else if (move.moveType === "Magical") {
      damage = (move.power + Math.max(0, this.magicAttack - opponent.magicDefense)) * abilityDamageMultiplier * itemDamageMultiplier * typeDamageMultiplier * this.getTypeMultiplier(move.elementType, opponent.coreType) * 0.1;
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

    // apply ability effects
    if (this.ability === "Sturdy" && this.health <= 0) {
      this.health = 1;
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
let thunderbolt = new Move("Thunderbolt", "Electric", "Magical", 90);
let quickAttack = new Move("Quick Attack", "Neutral", "Physical", 40);
let ironTail = new Move("Iron Tail", "Earth", "Physical", 100);
let voltTackle = new Move("Volt Tackle", "Electric", "Physical", 120);

let ember = new Move("Ember", "Fire", "Magical", 40);
let scratch = new Move("Scratch", "Neutral", "Physical", 40);
let dragonRage = new Move("Dragon Rage", "Fire", "Magical", 40);
let fireFang = new Move("Fire Fang", "Fire", "Physical", 65);

let waterGun = new Move("Water Gun", "Water", "Magical", 40);
let tackle = new Move("Tackle", "Neutral", "Physical", 40);
let bubble = new Move("Bubble", "Water", "Magical", 40);
let bite = new Move("Bite", "Dark", "Physical", 60);

let vineWhip = new Move("Vine Whip","Grass","Physical" ,45 );
let razorLeaf= new Move("Razor Leaf","Grass","Physical" ,55 );
let seedBomb= new Move("Seed Bomb","Grass","Physical" ,80 );
let solarBeam= new Move("Solar Beam","Grass","Magical" ,120 );

let pound= new Move("Pound","Neutral","Physical" ,40 );
let bodySlam= new Move("Body Slam","Neutral","Physical" ,85 );
let doubleSlap= new Move("Double Slap","Neutral","Physical" ,15 );
let hyperVoice= new Move("Hyper Voice","Neutral","Magical" ,90 );

let scratchM= new Move("Scratch","Neutral","Physical" ,40 );
let furySwipes= new Move("Fury Swipes","Neutral","Physical" ,18 );
let slashM= new Move("Slash","Neutral","Physical" ,70 );
let nightSlash= new Move("Night Slash","Dark","Physical" ,70 );

// create some Pokemon
let pikachu= new Pokemon("Pikachu",100 ,50 ,30 ,40 ,20 ,20 ,15 ,"Static","Light Ball","Electric",[thunderbolt,quickAttack,ironTail,voltTackle]);
let charmander= new Pokemon("Charmander",80 ,60 ,20 ,50 ,30 ,80 ,10 ,"Blaze","Charcoal","Fire",[ember,scratch,dragonRage,fireFang]);
let jigglypuff= new Pokemon("Jigglypuff",95 ,25 ,25 ,35 ,45 ,40 ,10 ,"Huge Power","Moon Stone","Neutral",[pound,bodySlam,doubleSlap,hyperVoice]);

let bulbasaur= new Pokemon("Bulbasaur",81 ,55 ,35 ,45 ,25 ,75 ,20 ,"Overgrow","Life Orb","Grass",[vineWhip,razorLeaf,seedBomb,solarBeam]);
let squirtle= new Pokemon("Squirtle",90 ,40 ,40 ,30 ,50 ,70 ,10 ,"Torrent","Mystic Water","Water",[waterGun,tackle,bubble,bite]);
let meowth= new Pokemon("Meowth",70 ,65 ,15 ,55 ,35 ,30 ,30 ,"Pickup","Amulet Coin","Neutral",[scratchM,furySwipes,slashM,nightSlash]);

// create the teams
let team1 = [pikachu,charmander,jigglypuff];
let team2 =[bulbasaur,squirtle,meowth];

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