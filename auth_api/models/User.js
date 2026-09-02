const db=requre('../config/db');

class User{
    static async findUserByUserName(userData){
        return await db.collection('users').where('username','==',userData.username).get();
    }

    static async findUserByEmail(userData){
        return await db.collection('users').where('email','==',userData.email).get();
    }

    static async createUser(userData){
        return await db.collection('users').add(userData);
    }

}
 module.exports=User;