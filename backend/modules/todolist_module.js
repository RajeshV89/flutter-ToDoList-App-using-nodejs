const mongoose = require('mongoose');

const toDoListSchema = mongoose.Schema({
    taskName:{type:String,require:true,maxlength:40},
    taskDetail:String,
    date: String,
    taskCheck:{type:Boolean,default:false},
    activity:{
        type:String,
        enum:['sports','home','office','book','general','game'],
        default:'general'
    },
    priority:{type:Boolean,default:false}

});

const ToDoListModel = mongoose.model('todoLists',toDoListSchema);

module.exports.ToDoListModel = ToDoListModel;