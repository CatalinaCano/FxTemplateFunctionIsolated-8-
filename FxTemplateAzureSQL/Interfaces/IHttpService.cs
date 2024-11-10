namespace FxTemplateAzureSQL.Interfaces
{
    public interface IHttpService
    {
        public Task<HttpResponseMessage> PostAsync(string url, object request);
    }
}