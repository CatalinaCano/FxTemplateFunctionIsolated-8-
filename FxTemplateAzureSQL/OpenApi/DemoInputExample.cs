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
                        Amount = 100,
                        Currency = "COP",
                        Email = "test@test.com"
                    },
                    namingStrategy
                ));

            return this;
        }
    }
}