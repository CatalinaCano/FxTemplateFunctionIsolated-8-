using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;
using Newtonsoft.Json;

namespace FxTemplateAzureSQL.Models
{
    public class ResponseResult
    {
        [JsonProperty("message")]
        [OpenApiProperty(Description = "Mensaje de la operación ejecutada", Nullable = false)]
        public string Message { get; set; }

        [JsonProperty("code")]
        [OpenApiProperty(Description = "Código que indica el tipo de operación", Nullable = false)]
        public int Code { get; set; }

#nullable enable

        [JsonProperty("data")]
        [OpenApiProperty(Description = "Datos a retornar", Nullable = true)]
        public dynamic? Data { get; set; }

#nullable disable
    }
}