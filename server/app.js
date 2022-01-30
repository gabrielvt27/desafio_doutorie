const express = require('express');
const app = express();
const bodyParser = require('body-parser');

app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

app.post('/product', function(req, res){
    // Campos aceitos para essa requisição
    let validKeys = ['nome', 'descricao', 'valor'];
    let message = 'Created';

    res.status(201);

    // Verifica se o corpo da requisição possui parâmetros
    if(!req.body){
        res.status(400);
        message = 'Corpo da requisição vazio';
    }else{
        // Valida todos os campos do corpo da requisição com a lista 'validKeys'
        for(let key of Object.keys(req.body)){
            if(!validKeys.includes(key) || req.body[key] == ""){
                res.status(400);
                message = `Campo ${key} inválido`;
                break;
            }
        }
    }

    res.send({
        message:message, 
        content:req.body
    });
});

app.listen(3000);