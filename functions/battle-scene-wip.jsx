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
  constructor(name, health, attack, defense, magicAttack, magicDefense, speed, ability, heldItem, moves) {
    this.name = name;
    this.health = health;
    this.attack = attack;
    this.defense = defense;
    this.magicAttack = magicAttack;
    this.magicDefense = magicDefense;
    this.speed = speed;
    this.ability = ability;
    this.heldItem = heldItem;
    this.moves = moves;
  }

  // method to calculate damage dealt by a move
  calculateMoveDamage(move, opponent) {
    // Apply ability effects
    let abilityDamageMultiplier = 1;
    if (this.ability === "Strong Jaw" && move.moveType === "Physical") {
      abilityDamageMultiplier = 1.5;
    } else if (this.ability === "Tough Claws" && move.moveType === "Physical") {
      abilityDamageMultiplier = 1.3;
    } else if (this.ability === "Mega Launcher" && move.moveType === "Magical") {
      abilityDamageMultiplier = 1.5;
    } else if (this.ability === "Sheer Force" && move.moveType === "Magical") {
      abilityDamageMultiplier = 1.3;
    }

    // Apply held item effects
    let itemDamageMultiplier = 1;
    if (this.heldItem === "Choice Band" && move.moveType === "Physical") {
      itemDamageMultiplier = 1.5;
    } else if (this.heldItem === "Choice Specs" && move.moveType === "Magical") {
      itemDamageMultiplier = 1.5;
    } else if (this.heldItem === "Life Orb") {
      itemDamageMultiplier = 1.3;
      this.takeDamage(this.health * 0.1);
    }

    // Calculate the damage with adjusted attack power
    let damage;
    if (move.moveType === "Physical") {
      damage = (move.power + Math.max(0, this.attack - opponent.defense)) * abilityDamageMultiplier * itemDamageMultiplier * 0.2;
    } else if (move.moveType === "Magical") {
      damage = (move.power + Math.max(0, this.magicAttack - opponent.magicDefense)) * abilityDamageMultiplier * itemDamageMultiplier * 0.2;
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
    this.turnNumber = 0; // Initialize the turn number to 0
  }

// method to simulate a round of battle
  battleRound() {

    this.turnNumber = 0;
    let index1 = 0;
    let index2 = 0;

    // Continue the battle until all Pokémon on one team have fainted
    while (index1 < this.team1.length && index2 < this.team2.length) {
      let attacker1 = this.team1[index1];
      let defender1 = this.team2[index1]; 

      if (attacker1.health > 0) {
        //console.log(`${attacker1.name} attacks ${defender1.name}`);

        let bestMove1 = attacker1.chooseBestMove(defender1);
        let numAttacks1 = attacker1.speed / defender1.speed >= 3 ? 3 : attacker1.speed / defender1.speed >= 2 ? 2 : 1; // 

        for (let j = 0; j < numAttacks1; j++) {
          // Check if the attacker is still alive before proceeding with the attack
          if (attacker1.health > 0) {
            this.turnNumber = this.turnNumber + 1; // Increment the turn number at the start of each round
            console.log(``); 
            console.log(`--- Turn ${this.turnNumber} ---`); // Print the current turn number
            let damage1 = attacker1.calculateMoveDamage(bestMove1, defender1);
            defender1.takeDamage(damage1);
            console.log(`${attacker1.name} uses ${bestMove1.name}, dealing ${damage1} damage to ${defender1.name}`);
            console.log(`-> ${defender1.name} (${defender1.health} HP)`);
  
            // Check if defender1's health is 0 or less and remove from the team if true
            if (defender1.health <= 0) {
              this.turnNumber = this.turnNumber + 1; // Increment the turn number at the start of each round
              console.log(``); 
              console.log(`--- Turn ${this.turnNumber} ---`); // Print the current turn number
              console.log(`-> ${defender1.name} has fainted.`);
              this.team2.splice(index1, 1);
              break; // Exit the loop if the defender faints during the turn
            }
          }
        }

      // Check if both teams still have Pokemon available to battle
      if (index2 >= this.team2.length) {
        break;
      }

      this.turnNumber = this.turnNumber + 1; // Increment the turn number at the start of each round
      console.log(``); 
      console.log(`--- Turn ${this.turnNumber} ---`); // Print the current turn number

      let attacker2 = this.team2[index2];
      let defender2 = this.team1[index2];

      if (attacker2.health > 0) {
        //console.log(`${attacker2.name} attacks ${defender2.name}`);

        let bestMove2 = attacker2.chooseBestMove(defender2);
        let numAttacks2 = attacker2.speed / defender2.speed >= 3 ? 3 : attacker2.speed / defender2.speed >= 2 ? 2 : 1; // 

        for (let j = 0; j < numAttacks2; j++) {
          // Check if the attacker is still alive before proceeding with the attack
          if (attacker2.health > 0) {
            let damage2 = attacker2.calculateMoveDamage(bestMove2, defender2);
            defender2.takeDamage(damage2);
            console.log(`${attacker2.name} uses ${bestMove2.name}, dealing ${damage2} damage to ${defender2.name}`);
            console.log(`-> ${defender2.name} (${defender2.health} HP)`);
  
            // Check if defender2's health is 0 or less and remove from the team if true
            if (defender2.health <= 0) {
              this.turnNumber = this.turnNumber + 1; // Increment the turn number at the start of each round
              console.log(``); 
              console.log(`--- Turn ${this.turnNumber} ---`); // Print the current turn number
              console.log(`-> ${defender2.name} has fainted.`);
              this.team1.splice(index2, 1);
              break; // Exit the loop if the defender faints during the turn
            }
          }
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
let quickAttack = new Move("Quick Attack", "Normal", "Physical", 40);
let ironTail = new Move("Iron Tail", "Steel", "Physical", 100);
let voltTackle = new Move("Volt Tackle", "Electric", "Physical", 120);

let ember = new Move("Ember", "Fire", "Magical", 40);
let scratch = new Move("Scratch", "Normal", "Physical", 40);
let dragonRage = new Move("Dragon Rage", "Dragon", "Magical", 40);
let fireFang = new Move("Fire Fang", "Fire", "Physical", 65);

let waterGun = new Move("Water Gun", "Water", "Magical", 40);
let tackle = new Move("Tackle", "Normal", "Physical", 40);
let bubble = new Move("Bubble", "Water", "Magical", 40);
let bite = new Move("Bite", "Dark", "Physical", 60);

let vineWhip = new Move("Vine Whip","Grass","Physical" ,45 );
let razorLeaf= new Move("Razor Leaf","Grass","Physical" ,55 );
let seedBomb= new Move("Seed Bomb","Grass","Physical" ,80 );
let solarBeam= new Move("Solar Beam","Grass","Magical" ,120 );

let pound= new Move("Pound","Normal","Physical" ,40 );
let bodySlam= new Move("Body Slam","Normal","Physical" ,85 );
let doubleSlap= new Move("Double Slap","Normal","Physical" ,15 );
let hyperVoice= new Move("Hyper Voice","Normal","Magical" ,90 );

let scratchM= new Move("Scratch","Normal","Physical" ,40 );
let furySwipes= new Move("Fury Swipes","Normal","Physical" ,18 );
let slashM= new Move("Slash","Normal","Physical" ,70 );
let nightSlash= new Move("Night Slash","Dark","Physical" ,70 );

// create some Pokemon
let pikachu= new Pokemon("Pikachu",100 ,50 ,30 ,40 ,20 ,30 ,"Static","Light Ball",[thunderbolt,quickAttack,ironTail,voltTackle]);
let charmander= new Pokemon("Charmander",80 ,60 ,20 ,50 ,30 ,60 ,"Blaze","Charcoal",[ember,scratch,dragonRage,fireFang]);
let squirtle= new Pokemon("Squirtle",90 ,40 ,40 ,30 ,50 ,70 ,"Torrent","Mystic Water",[waterGun,tackle,bubble,bite]);

let bulbasaur= new Pokemon("Bulbasaur",81 ,55 ,35 ,45 ,25 ,75 ,"Overgrow","Miracle Seed",[vineWhip,razorLeaf,seedBomb,solarBeam]);
let jigglypuff= new Pokemon("Jigglypuff",95 ,45 ,25 ,35 ,45 ,65 ,"Cute Charm","Moon Stone",[pound,bodySlam,doubleSlap,hyperVoice]);
let meowth= new Pokemon("Meowth",70 ,65 ,15 ,55 ,35 ,80 ,"Pickup","Amulet Coin",[scratchM,furySwipes,slashM,nightSlash]);

// create the teams
let team1 = [pikachu,charmander,squirtle];
let team2 =[bulbasaur,jigglypuff,meowth];

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