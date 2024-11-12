using FxTemplateAzureSQL.Interfaces;
using FxTemplateAzureSQL.Models.ResponseAPI;
using Microsoft.Extensions.Configuration;
using System.Text.Json;

namespace FxTemplateAzureSQL.Services
{
    public class HttpService(IHttpClientFactory clientFactory, IConfiguration configuration) : IHttpService
    {
        private readonly HttpClient _httpClient = clientFactory.CreateClient("ClienteHttp");
        public readonly IConfiguration _configuration = configuration;

        public async Task<ResponseApi> GetDataAsync(int index)
        {           
            var response = await _httpClient.GetAsync($"{_configuration["HttpClientSettings:BaseAddress"]}{index}");
            response.EnsureSuccessStatusCode();
            var jsonResponse = await response.Content.ReadAsStringAsync();
            return JsonSerializer.Deserialize<ResponseApi>(jsonResponse);
        }
    }
}