const _ = require('lodash');
const firebase = require('firebase-admin');
const serviceAccount = require('/Users/masonjohnson/development/summoner-wip/spiritsummoner/functions/secretKey.json');

class FirestoreConnection {
  constructor() {
    // Initialize the Firebase app
    if (!firebase.apps.length) {
      firebase.initializeApp({
        credential: firebase.credential.cert(serviceAccount),
      });
    }

    // Get the Firestore instance and store it in this.db
    this.db = firebase.firestore();
    
    // Call the asynchronous function for bulk upload
    this.bulkUpload();
  }

  async bulkUpload() {
    // Get a new write batch
    const batch = this.db.batch();
    const userID = 'HV4CA1bZK9Xe0J2AOO5djOH0MvY2';
    const spirit1ID = 'HnU6cWYXWfcoW3T7GHNN';
    const spirit2ID = 'PlFKZ3FiqgZQ7SQz06AC';
    const spirit3ID = 'VZbPSuUZ7sJvPZaXBRHI';
    
    // Set the values for spirit1Ref, spirit2Ref, and spirit3Ref
    const spirit1Ref = this.db.collection('users').doc(userID).collection('spirit-list').doc(spirit1ID);
    const spirit2Ref = this.db.collection('users').doc(userID).collection('spirit-list').doc(spirit2ID);
    const spirit3Ref = this.db.collection('users').doc(userID).collection('spirit-list').doc(spirit3ID);

    
    // Set the value for Spirit
    batch.set(spirit1Ref, {
      ability: 'Endurance',
      attack: 5,
      coreType: 'Wind',
      defense: 48,
      deviant: '',
      health: 718,
      heldItem: 'Flashlight',
      index: 6,
      intelligence: 114,
      level: 70,
      magicAttack: 457,
      magicDefense: 50,
      maxHealth: 718,
      move1element: 'Light',
      move1name: 'queenBreath',
      move1nameALT: 'Queen Breath',
      move1power: 100,
      move1type: 'Magical',
      move2element: 'Wind',
      move2name: 'whirlwindZone',
      move2nameALT: 'Whirlwind Zone',
      move2power: 140,
      move2type: 'Magical',
      move3element: 'Wind',
      move3name: 'sonicCombustion',
      move3nameALT: 'Sonic Combustion',
      move3power: 150,
      move3type: 'Magical',
      move4element: 'Light',
      move4name: 'polarLight',
      move4nameALT: 'Polar Light',
      move4power: 120,
      move4type: 'Magical',
      name: 'Skiina',
      nickname: 'Skiina',
      partner: false,
      position: 1,
      speed: 555,
      usedEndurance: false,
    });
    
    // Set the value 
    batch.set(spirit2Ref, {
      ability: 'Torrent',
      attack: 5,
      coreType: 'Water',
      defense: 70,
      deviant: '',
      health: 671,
      heldItem: 'Mystic Water',
      index: 8,
      intelligence: 150,
      level: 70,
      magicAttack: 308,
      magicDefense: 55,
      maxHealth: 671,
      move1element: 'Water',
      move1name: 'bubble',
      move1nameALT: 'bubble',
      move1power: 100,
      move1type: 'Magical',
      move2element: 'Poison',
      move2name: 'consume',
      move2nameALT: 'Consume',
      move2power: 100,
      move2type: 'Magical',
      move3element: 'Earth',
      move3name: 'touch',
      move3nameALT: 'Touch',
      move3power: 100,
      move3type: 'Magical',
      move4element: 'Water',
      move4name: 'waterfall',
      move4nameALT: 'Waterfall',
      move4power: 150,
      move4type: 'Magical',
      name: 'Frogi',
      nickname: 'Frogi',
      partner: false,
      position: 2,
      speed: 555,
      usedEndurance: false,
    });
    
    // Set the value of 
    batch.set(spirit3Ref, {
      ability: 'Endurance',
      attack: 5,
      coreType: 'Wind',
      defense: 46,
      deviant: '',
      health: 718,
      heldItem: 'Flashlight',
      index: 6,
      intelligence: 115,
      level: 70,
      magicAttack: 453,
      magicDefense: 58,
      maxHealth: 718,
      move1element: 'Light',
      move1name: 'queenBreath',
      move1nameALT: 'Queen Breath',
      move1power: 100,
      move1type: 'Magical',
      move2element: 'Wind',
      move2name: 'whirlwindZone',
      move2nameALT: 'Whirlwind Zone',
      move2power: 140,
      move2type: 'Magical',
      move3element: 'Wind',
      move3name: 'sonicCombustion',
      move3nameALT: 'Sonic Combustion',
      move3power: 150,
      move3type: 'Magical',
      move4element: 'Light',
      move4name: 'polarLight',
      move4nameALT: 'Polar Light',
      move4power: 120,
      move4type: 'Magical',
      name: 'Skiina',
      nickname: 'Skiina',
      partner: false,
      position: 3,
      speed: 555,
      usedEndurance: false,
    });

    try {
      // Commit the batch
      await batch.commit();
      console.log('Batch successfully committed!');
    } catch (error) {
      console.error('Error committing batch:', error);
    }
  }
}

// Create an instance of the FirestoreConnection class
const firestoreConnection = new FirestoreConnection();