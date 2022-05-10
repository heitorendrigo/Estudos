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



//rota GET para POI's
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
	

//POST POI - Cadastrar novas POI's usando parametros do body
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


//metodo PUT POI - para Editar POI Cadastrada
app.put('/api/poi/:id', function(req,res){ 
	db.open( function(err, mongoclient){
		mongoclient.collection('POI', function(err, colection){
			colection.update(
				{ _id: objectId(req.params.id)},
				{$set : {nome: req.body.nome, 
						 raio:req.body.raio, 
						 latitude:req.body.latitude}},
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


//==============================LOG DAS POSIÇÕES================================================


//rota GET Posicoes
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


//metodo PUT POSICAO - para Editar POSICAO Cadastrada
app.put('/api/posicao/:id', function(req,res){     
	db.open( function(err, mongoclient){
		mongoclient.collection('POSICAO', function(err, colection){
			colection.update(
				{ _id: objectId(req.params.id)},
				{$set : {placa: req.body.placa, 
						 data_posicao:req.body.data_posicao, 
						 velocidade:req.body.velocidade,
						 longitude:req.body.longitude,
						 latitude:req.body.latitude,
						 ignicao:req.body.ignicao
						}},
						 {},
				function(err, records){
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

//=====================inicio entrega desafio===================

//Lista um unico documento passando no get o parametro de busca	

// forma de passagem do parametro na url:  placa-MesDDAAAA

app.get('/api/:parametro', function(req,res){//deve-se informar placa"-"data. 
	var parametro = req.params.parametro
	var placa = parametro.substr(0,parametro.indexOf('-'));
	var data = parametro.substr(parametro.indexOf('-')+1,parametro.length);
		data = data.substr(0,3)+' '+data.substr(3,2)+' '+data.substr(5,data.length-1)
	var arrJsonsPosicao = [];
	var arrJsonsPoi = [];
	var arrPontosRegistrados = [];
	var returnJson = [];
	var tempoPonto = '';


	db.open( function(err, mongoclient){
		mongoclient.collection('POSICAO', function(err, colection){

			colection.find({
							placa: {$eq: placa}, //primeira condição do find
						    data_posicao:{$regex : data, $options : 'i'}// segunda condição que contenha    ***AND***
							}).toArray(function(err, pontos){   //neste caso o find recebe a condição de busca.
				if(err){
					res.json(err);
						} 
					else 
						{
							var log = {}; 
							for (var i=0;i<pontos.length;i++)
							{				
								log = {id: i+1,				    //montando o json obj com o que preciso
									   placa: pontos[i].placa,
									   data_posicao: pontos[i].data_posicao,
									   velocidade: pontos[i].velocidade,
									   ignicao: pontos[i].ignicao,
									   horario: pontos[i].data_posicao.substr(16,8),
									   latitude: pontos[i].latitude,
									   longitude: pontos[i].longitude}
					
								arrJsonsPosicao.push(log);													
							}
								//*****array das posições		
						}
				//mongoclient.close();
			});
		});

	mongoclient.collection('POI', function(err, colection){

			colection.find().toArray( function(err, results){ //o inser foi trocado por find, pois agora é uma busca, porem traz todos os docs.
				if(err){
					res.json(err);
				} else {
					
					for (var i=0;i<results.length;i++)
								{				
									var log = {poi: results[i].nome, 
										   	   latitude: parseFloat(results[i].latitude),
										   	   latitudeMax: (parseFloat(results[i].latitude)+(0.00001*parseFloat(results[i].raio)/2)),
										   	   latitudeMin: (parseFloat(results[i].latitude)-(0.00001*parseFloat(results[i].raio)/2)),
										   	   longitude: parseFloat(results[i].longitude),
										   	   longitudeMax: (parseFloat(results[i].longitude)+(0.00001*parseFloat(results[i].raio)/2)),
										   	   longitudeMin: (parseFloat(results[i].longitude)-(0.00001*parseFloat(results[i].raio)/2))}
						
									arrJsonsPoi.push(log);													
								}
							//
				}

		mongoclient.close();


	    for (var pos=0;pos<arrJsonsPosicao.length;pos++){
	    	for (var poi=0; poi<arrJsonsPoi.length;poi++){
	    		if (parseFloat(arrJsonsPosicao[pos].latitude) > arrJsonsPoi[poi].latitudeMin && parseFloat(arrJsonsPosicao[pos].latitude) < arrJsonsPoi[poi].latitudeMax  && parseFloat(arrJsonsPosicao[pos].longitude) > arrJsonsPoi[poi].longitudeMin && parseFloat(arrJsonsPosicao[pos].longitude) < arrJsonsPoi[poi].longitudeMax){
	    			var obj = 	{ poi: arrJsonsPoi[poi].poi,
	    						 latitMax: arrJsonsPoi[poi].latitudeMax,
	    						 latitude: parseFloat(arrJsonsPosicao[pos].latitude),
	    						 latitMin: arrJsonsPoi[poi].latitudeMin,
	    						 longitMax: arrJsonsPoi[poi].longitudeMax,
	    						 longitude: parseFloat(arrJsonsPosicao[pos].longitude) ,
	    						 longitMin:arrJsonsPoi[poi].longitudeMin,
	    						 horario :  arrJsonsPosicao[pos].horario
	    						}

	    				arrPontosRegistrados.push(obj);

	    		}
	    	}
	    }

			var max = arrPontosRegistrados[0].horario.substr(0,2)+arrPontosRegistrados[0].horario.substr(3,2)+arrPontosRegistrados[0].horario.substr(6,9);
			var min = arrPontosRegistrados[0].horario.substr(0,2)+arrPontosRegistrados[0].horario.substr(3,2)+arrPontosRegistrados[0].horario.substr(6,9);

				for(var i=0;i<arrPontosRegistrados.length;i++){

					if( parseInt(arrPontosRegistrados[i].horario.substr(0,2)+arrPontosRegistrados[i].horario.substr(3,2)+arrPontosRegistrados[i].horario.substr(6,9)) > max){
						max = parseInt(arrPontosRegistrados[i].horario.substr(0,2)+arrPontosRegistrados[i].horario.substr(3,2)+arrPontosRegistrados[i].horario.substr(6,9));
					}

					if( parseInt(arrPontosRegistrados[i].horario.substr(0,2)+arrPontosRegistrados[i].horario.substr(3,2)+arrPontosRegistrados[i].horario.substr(6,9)) < max){
						min = parseInt(arrPontosRegistrados[i].horario.substr(0,2)+arrPontosRegistrados[i].horario.substr(3,2)+arrPontosRegistrados[i].horario.substr(6,9));
					}

				}
		

	
				//até aqui tenho os valore de inicio e saida do ponto
				max = max.toString()
				min = min.toString()
				console.log('horario max: '+max)
				console.log('horario min: '+min)



				var hh = (parseInt(max.substr(0,2))-parseInt(min.substr(0,2))).toString()
				var mm = (parseInt(max.substr(2,2))-parseInt(min.substr(2,2))).toString()
				var ss = (parseInt(max.substr(4,6))-parseInt(min.substr(4,6))).toString()


				if (hh.length<2){
					hh = '0'+hh
				}

				if (mm.length<2){
					mm = '0'+mm
				}

				if (ss.length<2){
					ss = '0'+ss
				}


				if (parseInt(ss)<0){
					ss = (parseInt(ss)+60).toString()
					mm = (parseInt(mm)-1).toString()
				}
				

				if (parseInt(mm)<0){
					ss = (parseInt(mm)+60).toString()
					mm = (parseInt(hh)-1).toString()
				}

				tempoPonto = hh+':'+mm+':'+ss;
				
				console.log('Permanencia: '+tempoPonto)


				var returnObj = {}
				returnObj.POI = arrPontosRegistrados[0].poi
				returnObj.peranencia = tempoPonto
				returnJson.push(returnObj);





	   // console.log(arrJsonsPosicao)
	    res.json(returnJson)

//arrReturn


			});
		});	
	});
});