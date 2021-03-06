﻿Feature: Maestro de Gamas
	Como		Cliente front
	Quiero		Un endpoint REST
	Para		listar las diferentes Gamas

Scenario: Maestro Gama - Peticion exitosa
	Given Obtengo un token de autorización válido
	And Creo un cliente http al servidor "http://renting-masters.azurewebsites.net"
	And Adjunto "token" a la cabecera "Authorization" de la petición
	When Realizo una llamada GET al Request URI "/api/spectrum"
	Then Recibo un código de respuesta http "200"
	And  Recibo un arreglo de objetos mayor o igual a  "0"
	And Termino prueba

Scenario: Maestro Gama - Sin token de autorización válido
	Given No obtengo un token de autorización válido
	And Creo un cliente http al servidor "http://renting-masters.azurewebsites.net"
	And Adjunto "token" a la cabecera "Authorization" de la petición
	When Realizo una llamada GET al Request URI "/api/spectrum"
	Then Recibo un código de respuesta http "401"
	And Termino prueba
