using FxTemplateAzureSQL.Models;
using Microsoft.AspNetCore.Mvc;

namespace FxTemplateAzureSQL.Utils
{
    public static class HttpResponseHelper
    {
        public static ObjectResult SuccessfulResponse(object response, SupportedResponses? mensaje = null, string? mensajePersonalizado = null)
        {
            var responseOK = new ResponseResult()
            {
                Message = mensaje is null ? mensajePersonalizado : ObtenerMensaje(mensaje),
                Code = 200,
                Data = response
            };
            return Response(responseOK.Code, responseOK);
        }

        public static ObjectResult NoContent()
        {
            var responseNoContent = new ResponseResult()
            {
                Message = ObtenerMensaje(SupportedResponses.Registro_no_encontrado),
                Code = 400
            };
            return Response(responseNoContent.Code, responseNoContent);
        }

        public static ObjectResult SuccessfullOperation(SupportedResponses mensaje)
        {
            var responseSuccessfullOperation = new ResponseResult()
            {
                Message = ObtenerMensaje(mensaje),
                Code = 200
            };
            return Response(responseSuccessfullOperation.Code, responseSuccessfullOperation);
        }

        public static ObjectResult BadRequest(SupportedResponses? mensaje = null, string? mensajePersonalizado = null)
        {
            string mensajeFinal = mensajePersonalizado is null ? " " : mensajePersonalizado.ToString();
            var responseFailedOperation = new ResponseResult()
            {
                Message = mensaje is null ? mensajeFinal : ObtenerMensaje(mensaje),
                Code = 400
            };

            return Response(responseFailedOperation.Code, responseFailedOperation);
        }

        public static ObjectResult InternalServerError(string mensaje)
        {
            var responseNoContent = new ResponseResult()
            {
                Message = mensaje,
                Code = 500
            };
            return Response(responseNoContent.Code, responseNoContent);
        }

        public static ObjectResult Response(int code, object value)
        {
            var result = new ObjectResult(value)
            {
                StatusCode = code
            };
            return result;
        }

        public static string ObtenerMensaje(SupportedResponses? mensaje)
        {            
            return mensaje is null ? "Sin Mensaje" : mensaje.ToString().Replace('_', ' ');
        }
    }
}