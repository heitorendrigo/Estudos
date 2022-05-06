var express  = require('express'),
	bodyParser = require('body-parser'),
	mongodb = require('mongodb'),
	objectId = require('mongodb').ObjectID;
//	opn = require('opn');
//https://qastack.com.br/programming/8500326/how-to-use-nodejs-to-open-default-browser-and-navigate-to-a-specific-url


var app = express();

//bodyparser
app.use(bodyParser.urlencoded({ extended:true}));
app.use(bodyParser.json());

var port = 8080;
app.listen(port);
console.log('API rodando na porta '+port);



//variavel de conexão com banco mongoDB
var db = mongodb.Db(
	'mobi7',
	new mongodb.Server('localhost', 27017, {}),
	{}
);



//rota GET raiz
app.get('/api/poi', function(req,res){
	db.open( function(err, mongoclient){
		mongoclient.collection('POI', function(err, colection){

			colection.find().toArray( function(err, results){ //o inser foi trocado por find, pois agora é uma busca, porem traz todos os docs.
				if(err){
					res.json(err);
				} else {
					res.json(results);
				}

		mongoclient.close();
			});
		});
	});
});

//Lista um unico documento passando no get o id  como parametro de busca	
app.get('/api/poi/:id', function(req,res){     //:id indica que o nome do parametro sera pelo id do doc.
	db.open( function(err, mongoclient){
		mongoclient.collection('POI', function(err, colection){

			colection.find(objectId(req.params.id)).toArray(function(err, results){   //neste caso o find recebe a condição de busca.
				if(err){
					res.json(err);
				} else {
					res.json(results);
				}
		mongoclient.close();
			});
		});
	});
});
	

//metodo para cadastrar info no banco metodo post
app.post('/api/poi', function(req,res){
	var dados = req.body;

	db.open( function(err, mongoclient){
		mongoclient.collection('POI', function(err, colection){

			colection.insert(dados, function(err, records){  //atenção que para outros metodos este insert sera trocado
				if(err){
					res.json(err);
				} else {
					res.json(records);
				}
				mongoclient.close();
			});
		});
	});
});



//metodo para Deletar registros do banco por ID
app.delete('/api/poi/:id', function(req,res){     //:id indica que o nome do parametro sera pelo id do doc.

	db.open( function(err, mongoclient){
		mongoclient.collection('POI', function(err, colection){
			colection.remove({_id : objectId(req.params.id)}, function(err, records){
				if(err){
					res.json(err);
				} else {
					res.json(records);
				}
		mongoclient.close();
			});  
		});
	});
});




//==============================LOG DAS POSIÇÕES================================================

//rota GET raiz
app.get('/api/posicao', function(req,res){
	db.open( function(err, mongoclient){
		mongoclient.collection('POSICAO', function(err, colection){

			colection.find().toArray( function(err, results){ //o inser foi trocado por find, pois agora é uma busca, porem traz todos os docs.
				if(err){
					res.json(err);
				} else {
					res.json(results);
				}

		mongoclient.close();
			});
		});
	});
});

//Lista um unico documento passando no get o id  como parametro de busca	
app.get('/api/posicao/:id', function(req,res){     //:id indica que o nome do parametro sera pelo id do doc.
	db.open( function(err, mongoclient){
		mongoclient.collection('POSICAO', function(err, colection){

			colection.find(objectId(req.params.id)).toArray(function(err, results){   //neste caso o find recebe a condição de busca.
				if(err){
					res.json(err);
				} else {
					res.json(results);
				}
		mongoclient.close();
			});
		});
	});
});
	

//metodo para cadastrar info no banco metodo post
app.post('/api/posicao', function(req,res){
	var dados = req.body;

	db.open( function(err, mongoclient){
		mongoclient.collection('POSICAO', function(err, colection){

			colection.insert(dados, function(err, records){  //atenção que para outros metodos este insert sera trocado
				if(err){
					res.json(err);
				} else {
					res.json(records);
				}
				mongoclient.close();
			});
		});
	});
});



//metodo para Deletar registros do banco por ID
app.delete('/api/posicao/:id', function(req,res){     //:id indica que o nome do parametro sera pelo id do doc.

	db.open( function(err, mongoclient){
		mongoclient.collection('POSICAO', function(err, colection){
			colection.remove({_id : objectId(req.params.id)}, function(err, records){
				if(err){
					res.json(err);
				} else {
					res.json(records);
				}
		mongoclient.close();
			});  
		});
	});
});