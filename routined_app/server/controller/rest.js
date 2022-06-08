import {PrismaClient} from '@prisma/client';

const prisma = new PrismaClient();
await prisma.$connect();

// FETCH DATA

export const getRoutinesOfDay = async (req, res) => {
    try{
        const routines = await prisma.routines.findMany();
        res.send(routines);
    }
    catch(error){
        res.status(500);
        console.log(err);
    }
}

export const getRoutines = async (req, res) => {
    try{
        const routines = await prisma.routines.findMany();
        res.send(routines);
    }
    catch(err){
        res.status(500);
        console.log(err);
    }
}

export const getRoutine = async (req, res) => {
    try{
        var id = req.params.id;

        var routine = await prisma.routines.findUnique({
            where: {
                routine_id: Number(id)
            }
        })

        res.send(routine);
    }
    catch(err){
        res.status(500);
        console.log(err);
    }
}

export const getTask = async (req, res) => {
    try{
        var id = req.params.id;

        var task = await prisma.tasks.findUnique({
            where: {
                task_id: Number(id)
            }
        })

        res.send(task);
    }
    catch(err){
        res.status(500);
        console.log(err);
    }
}

// CREATE DATA

export const createRoutine = async (req, res) => {
    try{
        const {name, startTime, endTime, occurence} = req.body;

        var routine = await prisma.routines.create({
            data: {
                name,
                occurence,
                startTime,
                endTime,
                user_id: { connect: {user_id}}
            }
        })

        res.send(routine);
    }
    catch(err){
        res.status(500);
        console.log(err);
    }
}

export const createTask = async (req, res) => {
    try{
        const {name, duration, description, } = req.body;

        var task = await prisma.tasks.create({
            data: {
                name,
                duration,
                description,
                routine_id: { connect: {routine_id}}
            }
        })

        res.send(task);
    }
    catch(err){
        res.status(500);
        console.log(err);
    }
}

// UPDATE DATA

export const updateRoutine = async (req, res) => {
    try{
        const {name, startTime, endTime, occurence} = req.body;

        var routine = await prisma.routines.update({
            data: {
                name,
                occurence,
                startTime,
                endTime,
                user_id: { connect: {user_id}}
            }
        })

        res.send(routine);
    }
    catch(err){
        res.status(500);
        console.log(err);
    }
}

export const updateTask = async (req, res) => {
    try{
        const {name, duration, description, } = req.body;

        var task = await prisma.tasks.update({
            data: {
                name,
                duration,
                description,
                routine_id: { connect: {routine_id}}
            }
        })

        res.send(task);
    }
    catch(err){
        res.status(500);
        console.log(err);
    }
}