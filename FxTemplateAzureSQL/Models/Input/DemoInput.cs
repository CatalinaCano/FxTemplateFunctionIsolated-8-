﻿using FxTemplateAzureSQL.OpenApi;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;
using Newtonsoft.Json;

namespace FxTemplateAzureSQL.Models.Input
{
    [OpenApiExample(typeof(DemoInputExample))]
    public class DemoInput
    {
        [JsonProperty("nombre")]
        [OpenApiProperty(Description = "Nombre de la persona.", Nullable = false)]
        public string Nombre { get; set; }

        [JsonProperty("apellido")]
        [OpenApiProperty(Description = "Apellido de la persona", Nullable = false)]
        public string Apellido { get; set; }

        [JsonProperty("edad")]
        [OpenApiProperty(Description = "Edad de la persona", Nullable = false)]
        public int Edad { get; set; }

        [JsonProperty("email")]
        [OpenApiProperty(Description = "Correo electronico, debe coindidir con un correo válido.", Nullable = false)]
        public string Email { get; set; }
    }
}