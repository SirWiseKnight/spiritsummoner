const _ = require('lodash');

const firebase = require("firebase-admin");
const serviceAccount = require("/Users/masonjohnson/development/summoner-wip/spiritsummoner/functions/secretKey.json");

class FirestoreConnection {
  constructor() {
    // Initialize the Firebase app
    if (!firebase.apps.length) {
      firebase.initializeApp({
        credential: firebase.credential.cert(serviceAccount),
      });
    }

    // Get the Firestore instance
    this.db = firebase.firestore();
  }

  async getDataFromSubcollection(userId) {
    try {
      const userRef = this.db.collection('users').doc(userId);
      const activeSquadRef = userRef.collection('active-squad');
      
      // Query documents where the field matches the specified value
      const query = activeSquadRef.where('position', '==', 1); // Use this field to grab only spirits in the respective squad position
      const snapshot = await query.get();

      const data = [];
      snapshot.forEach((doc) => {
        data.push({
          id: doc.id,
          ...doc.data()
        });
      });

      return data;
    } catch (error) {
      console.error("Error getting documents from subcollection:", error);
      throw error;
    }
  }
}

// Usage of FirestoreConnection class
const firestoreConnection = new FirestoreConnection();

// Specify the user ID for the attacker
const attackerUserId = "tRzkTK8rFWdM3omN0efkHnQAzPh2"; // need to pass this from application

// Call the method and store the results in a variable
async function fetchAttackerData() {
  try {
    const attackerTeamData = await firestoreConnection.getDataFromSubcollection(attackerUserId);
    
    // Destructuring the array into individual variables
    for (const attacker of attackerTeamData) {
      const {name, nickname, level, coreType, ability, index, heldItem, maxHealth, health, attack, defense, magicAttack, magicDefense, speed, intelligence, move1name, move2name, move3name, move4name, usedEndurance /* ...other fields */ } = attacker;
      spirit1 = new Pokemon(1, index, name, nickname, level, maxHealth, health, attack, defense, magicAttack, magicDefense, speed, intelligence, ability, heldItem, coreType, move1name, move2name, move3name, move4name);
      console.log(spirit1);
    }
  } catch (error) {
    console.error("Error fetching data:", error);
  }
}

fetchAttackerData();

// Specify the user ID for the defender
const defenderUserId = "HV4CA1bZK9Xe0J2AOO5djOH0MvY2"; // need to pass this from application

// Call the method and store the results in a variable
async function fetchDefenderData() {
  try {
    const defenderTeamData = await firestoreConnection.getDataFromSubcollection(defenderUserId);
    // You can now use the 'defenderTeamData' variable in the rest of your script
  } catch (error) {
    console.error("Error fetching data:", error);
  }
}

fetchDefenderData();



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
  constructor(team, id, name, nickname, level, maxHealth, health, attack, defense, magicAttack, magicDefense, speed, intelligence, ability, heldItem, coreType, move1, move2, move3, move4, usedEndurance) {
    // Add a custom serialization method for the Pokemon class
    this.team = team,
    this.id = id,
    this.name = name,
    this.nickname = nickname,
    this.level = level,
    this.maxHealth = maxHealth,
    this.health = health,
    this.attack = attack,
    this.defense = defense,
    this.magicAttack = magicAttack,
    this.magicDefense = magicDefense,
    this.speed = speed,
    this.intelligence = intelligence,
    this.ability = ability,
    this.heldItem = heldItem,
    this.coreType = coreType,
    this.move1 = move1,
    this.move2 = move2,
    this.move3 = move3,
    this.move4 = move4,
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

    for (let move of [this.move1, this.move2, this.move3, this.move4]) {
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

  serialize() {
    return {
      team: this.team,
      id: this.id,
      name: this.name,
      nickname: this.nickname,
      level: this.level,
      maxHealth: this.maxHealth,
      health: this.health,
      attack: this.attack,
      defense: this.defense,
      magicAttack: this.magicAttack,
      magicDefense: this.magicDefense,
      speed: this.speed,
      intelligence: this.intelligence,
      ability: this.ability,
      heldItem: this.heldItem,
      coreType: this.coreType,
      move1: this.move1,
      move2: this.move2,
      move3: this.move3,
      move4: this.move4,
      usedEndurance: this.usedEndurance,
    };
  }
}

async function main() {
  await fetchAttackerData();
// define the Battle class
class Battle {
  constructor(team1, team2) {
    this.team1 = team1;
    this.team2 = team2;
    this.battleLog = []; // Initialize the battle log array
  }

  logMessage(message) {
    this.battleLog.push(message);
    console.log(message);
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
      
          for (let j = 0; j < numAttacks; j++) {
            // Check if the attacker is still alive before proceeding with the attack
            if (pokemon.health > 0 && target.health > 0) {
              this.turnNumber++;
              let damage = pokemon.calculateMoveDamage(bestMove, target);
              target.takeDamage(damage);
              if (target.ability === "Spike") {
                  if (pokemon.health === 1) {pokemon.takeDamage(2);}
                  else {pokemon.takeDamage(pokemon.health * 0.1);};
              };
              // Log battle messages as objects
              const logObject = {
              turn: this.turnNumber,
              attacker: pokemon.name,
              attackerTeam: pokemon.team,
              attackerHealth: Number(pokemon.health.toFixed(0)),
              moveName: bestMove.name,
              moveType: bestMove.elementType,
              damage: Number(damage.toFixed(0)),
              defender: target.name,
              defenderTeam: target.team,
              defenderHealth: Number(target.health.toFixed(0)),
            };
            this.logMessage(logObject);
              if (target.ability === "Spike") {
                //this.turnNumber++;
                // Log battle messages as objects
                const logObject = {
                turn: this.turnNumber,
                ability: target.ability,
                targetName: pokemon.name,
                targetHealth: Number(pokemon.health.toFixed(0)),
              };
              //this.logMessage(logObject);
              };

                // Determine if the target held on using Endurance
              if (target.ability === "Endurance" && target.health === 1) {
                //this.turnNumber++;
                // Log battle messages as objects
                const logObject = {
                turn: this.turnNumber,
                ability: target.ability,
                targetName: target.name,
                targetHealth: Number(target.health.toFixed(0)),
              };
              //this.logMessage(logObject);
                };

              if (target.health <= 0 && pokemon.health <= 0) {
                // Determine the team to which the target belongs and remove from that team
                const targetTeam = target === this.team1[i] ? this.team1 : this.team2;
                targetTeam.splice(i, 1);
                // Determine the team to which the pokemon belongs and remove from that team
                const pokemonTeam = pokemon === this.team1[i] ? this.team1 : this.team2;
                pokemonTeam.splice(i, 1);
                break;
              }

              // Check if the target's health is 0 or less and remove from the team if true
              else if (target.health <= 0) {
                // Determine the team to which the target belongs and remove from that team
                const targetTeam = target === this.team1[i] ? this.team1 : this.team2;
                targetTeam.splice(i, 1);
                break;
              }

                // Check if the target's health is 0 or less and remove from the team if true
              else if (pokemon.health <= 0) {
                // Determine the team to which the pokemon belongs and remove from that team
                const pokemonTeam = pokemon === this.team1[i] ? this.team1 : this.team2;
                pokemonTeam.splice(i, 1);
                break;
          }
      }
      }
    }
    
  
        // Check if attacker1's health is 0 or less and switch to the next Pokemon in the team
        if (attacker1.health <= 0 && this.team1.length > 0) {
          //this.turnNumber++;
          // Log battle messages as objects
          const logObject = {
          turn: this.turnNumber,
          fainted: attacker1.name,
          next: this.team1[0].name,
        };
          //this.logMessage(logObject);
          attacker1 = this.team1[0];
        }

        // Check if defender1's health is 0 or less and switch to the next Pokemon in the team
        if (defender1.health <= 0 && this.team2.length > 0) {
         // this.turnNumber++;
          // Log battle messages as objects
          const logObject = {
          turn: this.turnNumber,
          fainted: defender1.name,
          next: this.team2[0].name,
        };
        //this.logMessage(logObject);
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
let darkBlessing = new Move("Dark Blessing", "Dark", "Magical", 100);
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
let spirit2= new Pokemon(1, 7, "Traruza", "Traruza",70 , 832 ,832 ,340 ,129 ,54 ,127 ,510 ,73 ,"Ground","Sledgehammer","Earth",dragonTail,dragonQuake,earthquake,doublePunch);
let spirit3= new Pokemon(1, 9, "Warhulk", "Warhulk",70 , 930 , 930, 382 ,416 ,5 ,296 ,35 ,41 ,"Spike","Cloak","Dark",smash,staticSmash,superSmash,blackHole);

let spirit4= new Pokemon(2, 6, "Skiina", "Skiina",70 , 718 ,718 ,5 ,48 ,457 ,50 ,555 ,114 ,"Endurance","Flashlight","Wind",queenBreath,whirlwindZone,sonicCombustion,polarLight);
let spirit5= new Pokemon(2, 8, "Frogi", "Frogi",70 , 671 ,671 ,5 ,70 ,308 ,55 ,555 ,150 ,"Torrent","Mystic Water","Water",bubble,consume,touch,waterfall);
let spirit6= new Pokemon(2, 6, "Skiina", "Skiina",70 , 718 ,718 ,5 ,46 ,453 ,58 ,555 ,115 ,"Endurance","Flashlight","Wind",queenBreath,whirlwindZone,sonicCombustion,polarLight);

// create the teams
let team1 = [spirit1,spirit2,spirit3];
let team2 =[spirit4,spirit5,spirit6];

// Manually create copies of the teams with deep-cloned Pokemon objects
let team1Copy = [spirit1,spirit2,spirit3];
let team2Copy =[spirit4,spirit5,spirit6];

// Create the battle
const battle = new Battle(team1, team2);

// simulate the battle until it's over
while (!battle.isBattleOver()) {
battle.battleRound();
}

// Determine the winner
let winner;
if (team1.every((pokemon) => pokemon.health <= 0)) {
  winner = "Team2";
} else if (team2.every((pokemon) => pokemon.health <= 0)) {
  winner = "Team1";
}
// Custom replacer function for JSON.stringify to handle circular references
function customReplacer(key, value) {
  if (typeof value === 'object' && value !== null) {
    if (value instanceof Pokemon) {
      return value.serialize(); // Use the custom serialization for Pokemon
    }
    if (value instanceof Move) {
      return { ...value }; // Clone the Move objects
    }
  }
  return value;
}

// Create an object to store the battle result, log messages, and teams
const battleResult = {
  teams: {
    team1: team1Copy,
    team2: team2Copy,
  },
  log: battle.battleLog,
  winner: winner,
};

// Convert the object to a JSON-formatted string
const jsonResult = JSON.stringify(battleResult, customReplacer, 2);

// Export the JSON to a file (you can use Node.js file system module for this)
// Here's an example using Node.js:
const fs = require("fs");

fs.writeFile("battle_log_firebase.json", jsonResult, (err) => {
  if (err) {
    console.error("Error writing JSON file:", err);
  } else {
    console.log("Battle log exported to battle_log_firebase.json successfully!");
  }
})
// Other code that depends on fetchAttackerData can go here
}

main();