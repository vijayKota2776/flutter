const express = require('express');
const User=require('../models/User');

const router=express.Router();

router.post('/register',async (request,response)=>{
    try {
        const {name,userName,email,password}=request.body;
        const existingUser=await User.findUserByUserName({userName});
        if(!existingUser.empty){
            return response.status(400).json({message:"Username already exists!!!"});
        }
        const existingEmail=await User.findUserByEmail({email});
        if(!existingEmail.empty){
            return response.status(400).json({message:"Email already exists!!!"});
        }
        const hashedpassword=await bcrypt.hash(password,10);
        
        const newUser={
            name,
            userName,
            email,
            password:hashedpassword
        };
        const createdUser=await User.createUser(newUser);
        response.status(201).json({message:"User Registered Successfully!!!",userId:createdUser.id});
    }catch (error) {
        console.log(' Error registering user:', error.message);
        response.status(500).json({message:error.message});
    }
});

routerpost('/login',async (request,response)=>{
    try {
        const {userName,password}=request.body;
        const existingUser=await User.findUserByUserName({userName});
        if(!existingUser.empty){
            return response.status(400).json({message:"User not found!!!"});                

        }
        const isMatch=await bcrypt.compare(password,existingUser.docs[0].data().password);
        if(!isMatch){
            return response.status(400).json({message:"Invalid Password!!!"});
        }
        const token = jwt.sign({userId:existingUser.id,name:existingUser.name,userName:existingUser.userName,email:existingUser.Email},'secretkey',{expiresIn:'1h'});
        response.status(200).json({message:"Login Successful!!!",userId:userDoc.id});
    }catch (error) {
        console.log(' Error logging in user:', error.message);
        response.status(500).json({message:error.message});
    }
});

module.exports=router;