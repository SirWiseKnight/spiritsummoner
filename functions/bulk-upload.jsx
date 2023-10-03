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

    // Call the asynchronous function for batch processing
    this.processBatch();
  }

  async processBatch() {
    // Get a new write batch
    const batch = this.db.batch();
    
    // Set the value for Spirit
    const spirit1Ref = db.collection('users').doc('tRzkTK8rFWdM3omN0efkHnQAzPh2').collection('spirit-list').doc('KyFAysMcb08I00pdqqju');
    batch.set(spirit1Ref, {
      ability: 'Ground',
      attack: 340,
      coreType: 'Earth',
      defense: 129,
      deviant: '',
      health: 832,
      heldItem: 'Sledgehammer',
      index: 7,
      intelligence: 73,
      level: 70,
      magicAttack: 54,
      magicDefense: 127,
      maxHealth: 832,
      move1element: 'Neutral',
      move1name: 'smash',
      move1nameALT: 'Smash',
      move1power: 100,
      move1type: 'Physical',
      move2element: 'Earth',
      move2name: 'earthquake',
      move2nameALT: 'Earthquake',
      move2power: 100,
      move2type: 'Physical',
      move3element: 'Earth',
      move3name: 'dragonQuake',
      move3nameALT: 'Dragon Quake',
      move3power: 150,
      move3type: 'Physical',
      move4element: 'Earth',
      move4name: 'doublePunch',
      move4nameALT: 'Double Punch',
      move4power: 150,
      move4type: 'Physical',
      name: 'Traruza',
      nickname: 'Ground Dragon',
      partner: false,
      position: 2,
      speed: 510,
      usedEndurance: false,
    });
    
    // Set the value 
    const spirit2Ref = db.collection('users').doc('tRzkTK8rFWdM3omN0efkHnQAzPh2').collection('spirit-list').doc('UsKD7mHCwUw9h65SaQMo');
    batch.set(spirit2Ref, {
      ability: 'Endurance',
      attack: 42,
      coreType: 'Light',
      defense: 48,
      deviant: '',
      health: 671,
      heldItem: 'Sledgehammer',
      index: 5,
      intelligence: 86,
      level: 70,
      magicAttack: 368,
      magicDefense: 68,
      maxHealth: 671,
      move1element: 'Dark',
      move1name: 'darkBlessing',
      move1nameALT: 'Dark Blessing',
      move1power: 100,
      move1type: 'Magical',
      move2element: 'Neutral',
      move2name: 'hornAttack',
      move2nameALT: 'Horn Attack',
      move2power: 100,
      move2type: 'Physical',
      move3element: 'Light',
      move3name: 'polarLight',
      move3nameALT: 'Polar Light',
      move3power: 140,
      move3type: 'Magical',
      move4element: 'Neutral',
      move4name: 'chomp',
      move4nameALT: 'Chomp',
      move4power: 120,
      move4type: 'Physical',
      name: 'Reindeer',
      nickname: 'Reindeer',
      partner: false,
      position: 1,
      speed: 565,
      usedEndurance: false,
    });
    
    // Set the value of 
    const spirit3Ref = db.collection('users').doc('tRzkTK8rFWdM3omN0efkHnQAzPh2').collection('spirit-list').doc('kbLhkuyJSGpMXF2fYHqC');
    batch.set(spirit3Ref, {
      ability: 'Spike',
      attack: 382,
      coreType: 'Dark',
      defense: 416,
      deviant: '',
      health: 903,
      heldItem: 'Cloak',
      index: 9,
      intelligence: 41,
      level: 70,
      magicAttack: 5,
      magicDefense: 296,
      maxHealth: 903,
      move1element: 'Neutral',
      move1name: 'smash',
      move1nameALT: 'Smash',
      move1power: 100,
      move1type: 'Physical',
      move2element: 'Electric',
      move2name: 'staticSmash',
      move2nameALT: 'Static Smash',
      move2power: 100,
      move2type: 'Physical',
      move3element: 'Neutral',
      move3name: 'superSmash',
      move3nameALT: 'Super Smash',
      move3power: 150,
      move3type: 'Physical',
      move4element: 'Dark',
      move4name: 'blackHole',
      move4nameALT: 'Black Hole',
      move4power: 150,
      move4type: 'Physical',
      name: 'Warhulk',
      nickname: 'Warhulk',
      partner: false,
      position: 3,
      speed: 35,
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