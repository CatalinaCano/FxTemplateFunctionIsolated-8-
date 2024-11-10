using FxTemplateAzureSQL.Interfaces;
using Microsoft.Extensions.Configuration;

namespace FxTemplateAzureSQL.Services
{
    public class HttpService : IHttpService
    {
        private readonly HttpClient _httpClient;
        public readonly IConfiguration _configuration;

        public HttpService(IHttpClientFactory clientFactory , IConfiguration configuration) {
            _httpClient = clientFactory.CreateClient("ClienteHttp");
            _configuration = configuration;
        } 

        
        public async Task<string> GetDataAsync()
        {
            var response = await _httpClient.GetStringAsync(_configuration["HttpClientSettings:BaseAddress"]);
            return response;
        }
    }
}