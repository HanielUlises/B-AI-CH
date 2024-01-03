import {getConnection} from "../model/database.js"

const crearUsuario =  async (req,res) => {
    try{
        const connection = await getConnection();
        const result = await connection.query("aqui va el query");
        console.log(result);
    }catch (error){
        res.status(500);
        res.send(error.message);
    }
    
    
}

export const methods = {
    crearUsuario
}