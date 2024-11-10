using FxTemplateAzureSQL.Models;
using FxTemplateAzureSQL.Utils;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Abstractions;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Resolvers;
using Newtonsoft.Json.Serialization;

namespace FxTemplateAzureSQL.OpenApi
{
    public class ResponseResultExample : OpenApiExample<ResponseResult>
    {
        public override IOpenApiExample<ResponseResult> Build(NamingStrategy? namingStrategy = null)
        {
            Examples.Add(
                OpenApiExampleResolver.Resolve(
                    "ParametersExample",
                     HttpResponseHelper.NoContent(),
                    namingStrategy
                ));

            return this;
        }
    }
}