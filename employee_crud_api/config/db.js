const{initiallizeApp,cert}=require('firebase-admin/app');
const {getfirst}=require('firebase-admin/firestore');
const serviceAccountKey=require('../serviceAccountKey.json');
initiallizeApp({
    Credential:cert(serviceAccountKey)
});

const db=getFirestore();

module.exports=db;