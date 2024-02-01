const express = require('express');
const mongoose = require('mongoose');
const {ToDoListModel} = require('../modules/todolist_module');

const routes = express.Router();

routes.get('/',async (req,res)=>{
    const todolist = await ToDoListModel.find();
    res.send(todolist);
});

module.exports = routes;