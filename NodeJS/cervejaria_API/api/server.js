

var express  = require('express'),
	bodyParser = require('body-parser'),
	mongodb = require('mongodb'),
	objectId = require('mongodb').ObjectID,
	opn = require('opn');
//https://qastack.com.br/programming/8500326/how-to-use-nodejs-to-open-default-browser-and-navigate-to-a-specific-url


var app = express();

//body-parser -> midlewhere 
app.use(bodyParser.urlencoded({ extended:true}));
app.use(bodyParser.json()); 

var port = 8080; 
app.listen(port); 


//variavel de conexão com banco mongoDB
var db = mongodb.Db(
	'cerveja',
	new mongodb.Server('localhost', 27017, {}),
	{}
);

console.log('Servidor Rodando na porta ' + port); //msg server node

app.get('/', function(req, res){  
	res.send('Combine os verbos GET, POST, PUT e DELETE com a URI: localhost:8080/api');
});

//lista todos os documentos cadastrados do banco
app.get('/api', function(req,res){
	db.open( function(err, mongoclient){
		mongoclient.collection('cadastro', function(err, colection){

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
app.get('/api/id/:id', function(req,res){     //:id indica que o nome do parametro sera pelo id do doc.
	db.open( function(err, mongoclient){
		mongoclient.collection('cadastro', function(err, colection){

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
app.post('/api', function(req,res){
	var dados = req.body;
	dados.media = (parseInt(dados.Temp_ini) + parseInt(dados.Temp_fim))/2 //adiciona a media ao json

	db.open( function(err, mongoclient){
		mongoclient.collection('cadastro', function(err, colection){

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

//metodo para Editar registro ja salvo no banco.
app.put('/api/:id', function(req,res){     //:id indica que o nome do parametro sera pelo id do doc.
	var vMedia = (parseInt(req.body.Temp_fim)+parseInt(req.body.Temp_ini))/2

	db.open( function(err, mongoclient){
		mongoclient.collection('cadastro', function(err, colection){
			colection.update(
				{ _id: objectId(req.params.id)},
				{$set : {Estilo: req.body.Estilo, 
						 Temp_fim:req.body.Temp_fim, 
						 Temp_ini:req.body.Temp_ini,
						 media: vMedia }},
				{},
				function(err, records){
						if(err){
							res.json(err);
						} else {
						res.json(records);
						}
					mongoclient.close();
				}
			);  
		});
	});
});

//metodo para Deletar registros do banco por ID
app.delete('/api/:id', function(req,res){     //:id indica que o nome do parametro sera pelo id do doc.
	var vMedia = (parseInt(req.body.Temp_fim)+parseInt(req.body.Temp_ini))/2

	db.open( function(err, mongoclient){
		mongoclient.collection('cadastro', function(err, colection){
			colection.remove(  {_id : objectId(req.params.id)}, function(err, records){
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


//**** CRUD FINALIZADO
//Lista um unico documento passando no get o id  como parametro de busca	
app.get('/api/temp/:media', function(req,res){     //:id indica que o nome do parametro sera pelo id do doc.
	db.open( function(err, mongoclient){
		mongoclient.collection('cadastro', function(err, colection){

			colection.find({media: {$eq: parseInt(req.params.media)}}).toArray(function(err, results){   //neste caso o find recebe a condição de busca.
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
app.post('/api/temp', function(req,res){
	var entrada = req.body;
	console.log("entrada:");
	console.log(entrada);  //entrada ok!   retornar estilo de cerveja mais adequado para aquela temperatura

	db.open( function(err, mongoclient){
		mongoclient.collection('cadastro', function(err, colection){
// {media: {$eq: parseFloat(entrada.temperature)}}
		colection.find().toArray(function(err, results){   //neste caso o find recebe a condição de busca.
				if(err){
					res.json(err);
				} else {

					var obj = {};
					var conj_obj =[];
					var menores = [];
					var retorno = [];

					for (var i=0;i<results.length;i++)
					{				
						
							obj = {Estilo: results[i].Estilo,
								   	   media: results[i].media,
									   sub: parseFloat(entrada.temperature)-parseFloat(results[i].media)}
					
						if (obj.sub < 0)
						{
							obj.sub = (obj.sub)*-1;
						}			   

						conj_obj.push(obj);
						menores.push(parseFloat(obj.sub)) 
					}
					//menor sub é: 
					var min = Math.min.apply(null, menores); //pega maior valor da array resolvendo NaN
					

					for(var i=0; i<conj_obj.length; i++)
					{
						if (conj_obj[i].sub==min)
						{
							retorno.push( {Estilo: conj_obj[i].Estilo, 
										   media: conj_obj[i].media});
						}
					}

	var link = "https://open.spotify.com/search/"+retorno[0].Estilo

	var spotfy = {"beerStyle": retorno[0].Estilo,
  				  "search" : link}
					//controle de debud
					// console.log("Menor diferença: ")
					// console.log(min)		
					// console.log("Saida: ")
					// console.log(conj_obj)
					// console.log("Retorno: ")
					// console.log(retorno)	
					res.json(spotfy);
				}
		mongoclient.close();
			opn(link);
			});
		});
	});
});