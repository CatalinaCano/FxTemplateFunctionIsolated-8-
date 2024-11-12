using FxTemplateAzureSQL.Models.Records;
using FxTemplateAzureSQL.Models.ResponseAPI;

namespace FxTemplateAzureSQL.Interfaces.RepositoryPattern
{
    public interface IDemoRepository
    {
        public Task InsertData(ResponseApi demo, string correo);

        public DemoRecord ValidarData(string filter, string value);
    }
}