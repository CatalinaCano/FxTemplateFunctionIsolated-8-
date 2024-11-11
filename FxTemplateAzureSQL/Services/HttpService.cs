using FxTemplateAzureSQL.Interfaces;
using Microsoft.Extensions.Configuration;

namespace FxTemplateAzureSQL.Services
{
    public class HttpService(IHttpClientFactory clientFactory, IConfiguration configuration) : IHttpService
    {
        private readonly HttpClient _httpClient = clientFactory.CreateClient("ClienteHttp");
        public readonly IConfiguration _configuration = configuration;

        public async Task<string> GetDataAsync()
        {
            var response = await _httpClient.GetStringAsync(_configuration["HttpClientSettings:BaseAddress"]);
            return response;
        }
    }
}