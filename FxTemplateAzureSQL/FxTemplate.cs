using FluentValidation;
using FxTemplateAzureSQL.Interfaces;
using FxTemplateAzureSQL.Models;
using FxTemplateAzureSQL.Models.Input;
using FxTemplateAzureSQL.Utils;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Enums;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json;
using System.Net;
using System.Runtime.InteropServices;
using AuthorizationLevel = Microsoft.Azure.Functions.Worker.AuthorizationLevel;

namespace FxTemplateAzureSQL
{
    public class FxTemplate
    {
       
        private readonly IValidator<DemoInput> _demoValidator;
        private readonly IHttpService _httpService;
        private readonly ILogger<FxTemplate> _logger;

        public FxTemplate(IValidator<DemoInput> demoValidator, IHttpService httpService, ILogger<FxTemplate> logger)
        {
            _demoValidator = demoValidator;
            _httpService = httpService; 
            _logger = logger;
        }

        //RECUERDE QUE
        //1. El nombre de su funcionalidad no puede superar 28 caracteres
        //2. El decorador de open api debe ser unico por cada funcion
        //3. Recuerde llamar todos los secretos con la siguente notacion  _configuration["SecretsNames:ConDataBase"];
        //4. Para todos los modelos de entrada y respuesta debe especificar el ejemplo en OpenApi vea la la clase DemoExample.cs
        //5. Todas las respuestas excepto los GET que retornan un modelo especifico, deben responder usando la clase ResponseResult
        //6. El nombramiento de las propiedades de los modelos de salida debe ser utilizando Camel case:  (idClient, fileName, subject)

        //PARÁMETROS QUE ACEPTA EL BACK
        //1. En los GET donde se solicita un único registro, se utiliza el envió del parámetro por ruta. miFX/miRuta/${idRegistro}
        //2. En los POST no se envía nada por ruta, y en el body se envía la propiedad “id” con valor null.
        //3. En los PUT, PATCH y DELETE se utiliza el envió del parámetro por ruta.miFX/miRuta/${idRegistro}

        [Function("Function1")]
        
        
        [OpenApiOperation(operationId: "NombreFuncionalidad", tags: ["NombreFuncionalidad"], Description = "Descripcion del end ponit", Summary = "Descripcion del endpoint")]
        [OpenApiSecurity("function_key", SecuritySchemeType.ApiKey, Name = "code", In = OpenApiSecurityLocationType.Query)]
        //[OpenApiParameter(name: "name", In = ParameterLocation.Query, Required = true, Type = typeof(string), Description = "The **Name** parameter")]// Documentacion de parametros en path, query etc.
        [OpenApiRequestBody(contentType: "application/json", bodyType: typeof(DemoInput), Required = true, Description = "Ejemplo de Request")]//Documentacion de los parametros en el Body
        //Ejemplo de respuestas utilice solo las que necesite
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(string), Description = "The OK response")]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.Created, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Respuesta de Creacion")] //Utiice solo las respuestas que utilice en su end point
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.NoContent, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "No Content")] //Utiice solo las respuestas que utilice en su end point
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.BadRequest, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Bad Request")] //Utiice solo las respuestas que utilice en su end point
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.InternalServerError, contentType: "application/json", bodyType: typeof(ResponseResult), Description = "Error en el servicio")] //Utiice solo las respuestas que utilice en su end point
        public async Task<IActionResult> NombreFuncionalidad(
            [HttpTrigger(AuthorizationLevel.Function, "get", Route = "V1.0/DEFINIR")] HttpRequest req)
        {
            try
            {
                _logger.LogInformation("C# HTTP trigger function processed a request.");
                var json = await req.ReadAsStringAsync();

                if(json is not null)
                {
                    DemoInput? request = JsonConvert.DeserializeObject<DemoInput>(json);
                    var validationResult = _demoValidator.Validate(request);
                    if (validationResult.IsValid)
                    {
                        //Implementar logica de la funcion
                        // await _unitOfWork.DemoRepository.CreateDemo(request);
                        object data = await _httpService.GetDataAsync();
                        return HttpResponseHelper.SuccessfulResponse(data);
                    }
                    else
                    {
                        string allErrors = string.Join(Environment.NewLine, validationResult.Errors.Select(e => e.ErrorMessage));
                        return HttpResponseHelper.BadRequest(null, allErrors);
                    }
                }

                return HttpResponseHelper.BadRequest(null, "No fue enviado el cuerpo de la peticion.");




            }
            catch (Exception ex)
            {
                _logger.LogError(ex,"Ocurrio un error");
                return HttpResponseHelper.InternalServerError(ex.Message);
            }
        }
    }
}