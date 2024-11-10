namespace FxTemplateAzureSQL.Interfaces
{
    public interface IHttpService
    {
        public Task<string> GetDataAsync();
     
    }
}