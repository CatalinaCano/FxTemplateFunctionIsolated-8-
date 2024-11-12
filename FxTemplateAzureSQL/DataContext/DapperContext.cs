using Microsoft.Extensions.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace FxTemplateAzureSQL.DataContext
{
    public class DapperContext
    {
        private readonly IConfiguration _config;
        private readonly string? secretName;

        public DapperContext(IConfiguration configuration)
        {
            _config = configuration;
            secretName = _config["SecretsNames:ConDataBase"];
        }

        public IDbConnection CreateConnection()
        {
            return new SqlConnection(_config[secretName]);
        }
    }
}