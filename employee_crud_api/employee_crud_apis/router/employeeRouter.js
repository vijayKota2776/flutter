const express=require('express');
const Employee=require('../models/Employee');

const router=express.Router();

router.get('/',async (request,response)=>{
    try {
        const employees=await Employee.find();
        response.status(200).json(employees);
    } catch (error) {
        response.status(500).json({message:error.message});
    }
});

router.get('/:id',async (request,response)=>{
    try {
        const employee=await Employee.findById(request.params.id);
        if(!employee){
            return response.status(404).json({message:"Employee Not Found!!!"});
        }
        response.status(200).json(employee);
    } catch (error) {
        response.status(500).json({message:error.message});
    }
});

router.post('/',async (request,response)=>{
    try {
        const employee=await Employee.create(request.body);
        response.status(201).json({message:"Employee Created Successfully!!!",employee});
    } catch (error) {
        response.status(500).json({message:error.message});
    }
});

router.put('/:id',async (request,response)=>{
    try {
        const employee= await Employee.findByIdAndUpdate(request.params.id,request.body);
        if(!employee){
            return response.status(404).json({message:"Employee Not Found!!!"});
        }
        response.status(200).json({message:"Employee Updated Successfully!!!",employee});
    } catch (error) {
        response.status(500).json({message:error.message});
    }
});

router.delete('/:id',async (request,response)=>{
    try {
        const employee= await Employee.findByIdAndDelete(request.params.id);
        if(!employee){
            return response.status(404).json({message:"Employee Not Found!!!"});
        }
        response.status(200).json({message:"Employee Deleted Successfully!!!",employee});
    } catch (error) {
        response.status(500).json({message:error.message});
    }
});

module.exports=router;