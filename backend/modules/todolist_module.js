const mongoose = require('mongoose');
const Joi = require('joi');

const toDoListSchema = mongoose.Schema({
    taskName:{type:String,require:true,maxlength:40},
    taskDetail:String,
    dateData: String,
    taskCheck:{type:Boolean,default:false},
    activity:{
        type:String,
        enum:['sports','home','office','book','general','game','movie'],
        default:'general'
    },
    priority:{type:Boolean,default:false}

});

const ToDoListModel = mongoose.model('todoLists',toDoListSchema);

function validateToDoList(todolist){
    const schema=Joi.object({
        taskName:Joi.string().max(50).required(),
        taskDetail:Joi.string().allow(null, ''),
        dateData:Joi.string(),
        taskCheck:Joi.boolean().optional(),
        activity:Joi.string().valid('sports','home','office','book','general','game','movie').allow(null,''),
        priority:Joi.boolean().optional()

    });
    return schema.validate(todolist);
}

module.exports.ToDoListModel = ToDoListModel;
module.exports.validateToDoList=validateToDoList;