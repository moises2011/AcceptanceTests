Feature: Maestro de Tipos de vehiculo
	Como		Cliente front
	Quiero		Un endpoint REST
	Para		listar los diferentes Tipos de vehículos

Scenario: Maestro Tipo vehículo - Peticion exitosa
	Given Obtengo un token de autorización válido
	And Creo un cliente http al servidor "http://renting-masters.azurewebsites.net"
	And Adjunto "token" a la cabecera "Authorization" de la petición
	When Realizo una llamada GET al Request URI "/api/vehicleType"
	Then Recibo un código de respuesta http "200"
	And  Recibo un arreglo de objetos mayor o igual a  "0"
	And Termino prueba

Scenario: Maestro Tipo vehículo - Sin token de autorización válido
	Given No obtengo un token de autorización válido
	And Creo un cliente http al servidor "http://renting-masters.azurewebsites.net"
	And Adjunto "token" a la cabecera "Authorization" de la petición
	When Realizo una llamada GET al Request URI "/api/vehicleType"
	Then Recibo un código de respuesta http "401"
	And  Recibo un arreglo de objetos mayor o igual a  "0"
	And Termino prueba
