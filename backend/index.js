require('dotenv').config();
const mongoose = require('mongoose');
const toDoList= require('./routes/todolist');
const express = require('express');
const app = express();

mongoose.connect('mongodb://localhost:27017/todolist-app')
        .then(()=>console.log("Connected to MongoDB todolist-app"))
        .catch(error=>console.error("Could not connect to MongoDB"));


app.use('/api/todolist',toDoList);

app.get('/',(req,res)=>{
    res.send("Hello World");
})

const port= process.env.PORT_NUMBER || 3000;
app.listen(port,()=>{
    console.log(`Listening on Port ${port}`);
})