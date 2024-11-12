using FxTemplateAzureSQL.Models.ResponseAPI;

namespace FxTemplateAzureSQL.Interfaces
{
    public interface IHttpService
    {
        public Task<ResponseApi> GetDataAsync(int index);
    }
}