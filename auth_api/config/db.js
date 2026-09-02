const{initializeApp, applicationDefault, cert} = require('firebase-admin/app');
const {getfirestore} = require('firebase-admin/firestore');
const serviceAccount=require('./serviceAccountKey.json');

initializeApp({
    credential: cert(serviceAccount)
});

const db=getfirestore();

module.exports=db;  