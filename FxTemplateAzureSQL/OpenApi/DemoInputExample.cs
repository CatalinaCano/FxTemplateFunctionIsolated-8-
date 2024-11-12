using FxTemplateAzureSQL.Models.Input;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Abstractions;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Resolvers;
using Newtonsoft.Json.Serialization;

namespace FxTemplateAzureSQL.OpenApi
{
    public class DemoInputExample : OpenApiExample<DemoInput>
    {
        public override IOpenApiExample<DemoInput> Build(NamingStrategy? namingStrategy = null)
        {
            Examples.Add(
                OpenApiExampleResolver.Resolve(
                    "ParametersExample",
                    new DemoInput()
                    {
                        Nombre = "User",
                        Apellido = "1",
                        Edad = 10,
                        Email ="user@test.com"
                    },
                    namingStrategy
                ));

            return this;
        }
    }
}