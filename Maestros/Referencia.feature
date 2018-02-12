Feature: Maestro de Referencias
	Como		Cliente front
	Quiero		Un endpoint REST
	Para		consultar las Referencias de un cliente

Scenario: Maestro Referencias - Peticion exitosa
	Given Obtengo un token de autorización válido
	And Creo un cliente http al servidor "http://renting-masters.azurewebsites.net"
	And Asocio el parametro "Marca" igual a "1" vía bodAnd request
	And Asocio el parametro "Cliente" igual a "<cliente>" vía bodAnd request
	When Realizo una llamada GET al Request URI "/api/reference"
	Then Recibo un código de respuesta http "200"
	And Termino prueba

Scenario: Maestro Referencias - Consulta sin parámetro Marca
	Given Obtengo un token de autorización válido
	And Creo un cliente http al servidor "http://renting-masters.azurewebsites.net"
	And Asocio el parametro "Marca" igual a "null" vía bodAnd request
	And Asocio el parametro "Cliente" igual a "<cliente>" vía bodAnd request
	When Realizo una llamada GET al Request URI "/api/reference"
	Then Recibo un código de respuesta http "400"
	And Termino prueba

Scenario: Maestro Referencias - Consulta sin parámetro Cliente
	Given Obtengo un token de autorización válido
	And Creo un cliente http al servidor "http://renting-masters.azurewebsites.net"
	And Asocio el parametro "Marca" igual a "1" vía bodAnd request
	And Asocio el parametro "Cliente" igual a "null" vía bodAnd 
	When Realizo una llamada GET al Request URI "/api/reference"
	Then Recibo un código de respuesta http "400"
	And Termino prueba 

Scenario: Maestro Referencias - Consulta con formato inválido del parámetro Marca
	Given Obtengo un token de autorización válido
	And Creo un cliente http al servidor "http://renting-masters.azurewebsites.net"
	And Asocio el parametro "Marca" igual a "(("#$%)" vía bodAnd request
	And Asocio el parametro "Cliente" igual a "<cliente>" vía bodAnd request
	When Realizo una llamada GET al Request URI "/api/reference"
	Then Recibo un código de respuesta http "400"
	And Termino prueba

Scenario: Maestro Referencias - Consulta con formato inválido del parámetro Cliente
	Given Obtengo un token de autorización válido
	And Creo un cliente http al servidor "http://renting-masters.azurewebsites.net"
	And Asocio el parametro "Marca" igual a "1" vía bodAnd request
	And Asocio el parámetro "Cliente" igual a "(("#$%)" vía bodAnd request
	When Realizo una llamada GET al Request URI "/api/reference"
	Then Recibo un código de respuesta http "400"
	And Termino prueba

Scenario: Maestro Referencias - Consulta sin token de autorización
	Given No obtengo un token de autorización válido
	And Creo un cliente http al servidor "http://renting-masters.azurewebsites.net"
	And Asocio el parametro "VehicleType" igual a "1" vía bodAnd request
	And Asocio el parametro "Brand" igual a "1" vía bodAnd request
	And Asocio el parametro "Reference" igual a "1" vía bodAnd request
	And Asocio el parametro "Cliente" igual a "<cliente>" vía bodAnd request
	When Realizo una llamada GET al Request URI "/api/reference"
	Then Recibo un código de respuesta http "401"
	And Termino prueba
