using FxTemplateAzureSQL.OpenApi;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;
using Newtonsoft.Json;

namespace FxTemplateAzureSQL.Models.Input
{
    [OpenApiExample(typeof(DemoInputExample))]
    public class DemoInput
    {
        [JsonProperty("amount")]
        [OpenApiProperty(Description = "Monto de la transaccion, Sólo son validos números mayores a 0.", Nullable = false)]
        public int Amount { get; set; }

        [JsonProperty("currency")]
        [OpenApiProperty(Description = "Moneda de la transaccion, Sólo son validas letras. Debe tener minímo 2 carácteres y máximo 3.", Nullable = false)]
        public string Currency { get; set; }

        [JsonProperty("email")]
        [OpenApiProperty(Description = "Correo electronico, debe coindidir con un correo válido.", Nullable = false)]
        public string Email { get; set; }
    }
}