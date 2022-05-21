
export const getRoutines = async (req, res) => {
    try{
        console.log('Welcome to routines');
        res.status(200).send('Welcome');
    }
    catch(err){

    }
}

export const getRoutine = async (req, res) => {
    try{
        var id = req.header;
        console.log('Welcome to routine ', id);
    }
    catch(err){
        console.log(err);
    }
}

export const getTask = async (req, res) => {
    try{
        var id = req.header.arguments.id;
        console.log('Welcome to task ', id);
    }
    catch(err){
        
    }
}