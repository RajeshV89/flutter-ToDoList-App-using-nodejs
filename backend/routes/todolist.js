const express = require('express');
const mongoose = require('mongoose');
const {ToDoListModel,validateToDoList} = require('../modules/todolist_module');

const routes = express.Router();

routes.get('/',async (req,res)=>{
    const todolist = await ToDoListModel.find();
    res.send(todolist);
});
routes.post('/',async(req,res)=>{
    const {error} = validateToDoList(req.body);
    if(error) return res.status(400).send(error.details[0].message);
    try{
    let todolist = new ToDoListModel({
        taskName:req.body.taskName,
        taskDetail:req.body.taskDetail,
        dateData:req.body.dateData,
        taskCheck:req.body.taskCheck,
        activity:req.body.activity,
        priority:req.body.priority
    });
    todolist = await todolist.save();
    res.send(todolist);
}
    catch (error){
        console.error('Error:', error.message);
        res.status(500).send('Internal Server Error');

    }
    

    

})

module.exports = routes;