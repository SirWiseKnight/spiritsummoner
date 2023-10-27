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
    const userID = 'tRzkTK8rFWdM3omN0efkHnQAzPh2';
    const spirit1ID = 'vKWd6QfusQHw6H2Qd7L5';
    const spirit2ID = 'sncNGlNooNTc58yQtmtR';
    const spirit3ID = 'n3fRNCrjN3c7hK0hO69X';
    
    // Set the values for spirit1Ref, spirit2Ref, and spirit3Ref
    const spirit1Ref = this.db.collection('users').doc(userID).collection('spirit-list').doc(spirit1ID);
    const spirit2Ref = this.db.collection('users').doc(userID).collection('spirit-list').doc(spirit2ID);
    const spirit3Ref = this.db.collection('users').doc(userID).collection('spirit-list').doc(spirit3ID);

    
    // Set the value for Spirit
    batch.set(spirit1Ref, {
      ability: 'Vortex',
      attack: 5,
      category: 'Humanoid',
      coreType: 'Wind',
      defense: 55,
      deviant: '',
      health: 340,
      heldItem: 'Wind Scroll',
      index: 55,
      intelligence: 55,
      level: 1,
      magicAttack: 38.5,
      magicDefense: 44,
      maxHealth: 340,
      moves: ['auraOfWind', 'heavenLight', 'tornado'],
      name: 'Isni',
      nickname: 'Isni',
      partner: false,
      position: 0,
      speed: 20,
      usedEndurance: false,
    });
    
    // Set the value 
    batch.set(spirit2Ref, {
      ability: 'Vortex',
      attack: 5,
      category: 'Humanoid',
      coreType: 'Wind',
      defense: 71.3,
      deviant: '',
      health: 370,
      heldItem: 'Wind Scroll',
      index: 56,
      intelligence: 87.4,
      level: 1,
      magicAttack: 63.25,
      magicDefense: 94.3,
      maxHealth: 370,
      moves: ['auraOfWind', 'heavenLight', 'tornado', 'lightning', 'judgement'],
      name: 'Isine',
      nickname: 'Isine',
      partner: false,
      position: 0,
      speed: 28,
      usedEndurance: false,
    });
    
    // Set the value of 
    batch.set(spirit3Ref, {
      ability: 'Vortex',
      attack: 5,
      category: 'Humanoid',
      coreType: 'Wind',
      defense: 84,
      deviant: '',
      health: 378,
      heldItem: 'Wind Scroll',
      index: 57,
      intelligence: 96,
      level: 1,
      magicAttack: 96,
      magicDefense: 108,
      maxHealth: 378,
      moves: ['auraOfWind', 'heavenLight', 'tornado', 'lightning', 'judgement', 'heavenlySlash'],
      name: 'Isinoar',
      nickname: 'Isinoar',
      partner: false,
      position: 0,
      speed: 20,
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