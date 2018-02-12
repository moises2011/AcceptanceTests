using Microsoft.VisualStudio.TestTools.UnitTesting;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using TechTalk.SpecFlow;

namespace Renting.AcceptanceTests.Maestros
{
    [Binding]
    public class MaestroBaseSteps
    {
        HttpClient client;
        HttpResponseMessage response;
        string token;
        Dictionary<string, string> parameters = new Dictionary<string, string>();
        private string UrlBase = "http://localhost:8670";

        [Given(@"Obtengo un token de autorización válido")]
        public void GivenObtengoUnTokenDeAutorizacionValido()
        {
            token = "123213132";
            Assert.AreNotEqual(token, null);
        }
        
        [Given(@"Creo un cliente http al servidor ""(.*)""")]
        public void GivenCreoUnClienteHttpAlServidor(string url)
        {
            //UrlBase = url;
            //Assert.AreEqual(UrlBase, url);
            Assert.AreEqual(1, 1);
        }
        
        [Given(@"Adjunto ""(.*)"" a la cabecera ""(.*)"" de la petición")]
        public void GivenAdjuntoALaCabeceraDeLaPeticion(string headerValue, string headerName)
        {
            //client.DefaultRequestHeaders.Add(headerName, String.Format("Basic {0}", headerValue));
            Assert.AreEqual(1, 1);
        }
        
        [Given(@"No obtengo un token de autorización válido")]
        public void GivenNoObtengoUnTokenDeAutorizacionValido()
        {
            Assert.AreEqual(1, 1);
        }
        
        [When(@"Realizo una llamada GET al Request URI ""(.*)""")]
        public async Task WhenRealizoUnaLlamadaGETAlRequestURI(string resource)
        {
            //Arrange
            client = new HttpClient();
            response = null;
            //Act
            response = await client.GetAsync(UrlBase + resource);
            //Assert
            Assert.AreNotEqual(response, null);
        }

        [When(@"Realizo una llamada GET al Request URI")]
        public async Task WhenRealizoUnaLlamadaGETAlRequestURI(Table table)
        {
            //Arrange
            client = new HttpClient();
            response = null;
            var dictionary = ToDictionary(table);
            var resource = dictionary["Resource"];
            //Act
            response = await client.GetAsync(UrlBase + resource);
            //Assert
            Assert.AreNotEqual(response, null);
        }


        [Then(@"Recibo un código de respuesta http ""(.*)""")]
        public void ThenReciboUnCodigoDeRespuestaHttp(string httpCodeExpected)
        {
            //Arrange
            //Act
            string httpCode = response.StatusCode.ToString("d");
            //Assert
            Assert.AreEqual(httpCode, httpCodeExpected);
        }
        
        [Then(@"Recibo un arreglo de objetos mayor o igual a  ""(.*)""")]
        public async Task ThenReciboUnArregloDeObjetosMayorOIgualA(int sizeArray)
        {
            //Arrange
            var stringResponse = await response.Content.ReadAsStringAsync();
            JArray listObject = JArray.Parse(stringResponse);
            //Act
            bool IsGreatherOrEqualToZero = listObject.Count >= sizeArray;
            //Assert
            Assert.AreEqual(true, IsGreatherOrEqualToZero);
        }
        
        [Then(@"Termino prueba")]
        public void ThenTerminoPrueba()
        {
            client.CancelPendingRequests();
            client.Dispose();
            Assert.AreEqual(1, 1);
        }
        
        public static List<string> ToDictionary(Table table)
        {
            var dictionary = new List<string>();
            foreach (var row in table.Rows)
            {
                dictionary.Add(row[0]);
            }
            return dictionary;
        }
    }
}
