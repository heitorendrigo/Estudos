var express = require('express'),
	bodyParser = require ('body-Parser'),
	mongodb = require('mongodb');

var app = express();

//bodyparser
app.use(bodyParser.urlencoded({ extended:true}));
app.use(bodyParser.json());

var port = 8080;
app.listen(port);

console.log('API rodando na porta '+port);


//rota GET raiz
app.get('/', function(req, res)
				{

					var jsonResposta = {msg:'Olá'}
					res.send(jsonResposta);
				}
		);
