using FxTemplateAzureSQL.Interfaces;
using System.Net.Http.Json;

namespace FxTemplateAzureSQL.Services
{
    public class HttpService(HttpClient client) : IHttpService
    {
        private readonly HttpClient _client = client;

        public async Task<HttpResponseMessage> PostAsync(string url, object request)
        {
            return await _client.PostAsJsonAsync(new Uri(url), request);
        }
    }
}