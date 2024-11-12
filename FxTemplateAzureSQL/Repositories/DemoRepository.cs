using AutoMapper;
using Dapper;
using FxTemplateAzureSQL.Interfaces.RepositoryPattern;
using FxTemplateAzureSQL.Models.Records;
using FxTemplateAzureSQL.Models.ResponseAPI;
using System.Data;

namespace FxTemplateAzureSQL.Repositories
{
    //RECUERDE QUE PUEDE VALIDAR EL TIPO DE METODO A USAR DE DAPPER POR https://www.learndapper.com/selecting-single-rows
    public class DemoRepository(IDbTransaction transaction, IMapper mapper) : RepositoryBase(transaction), IDemoRepository
    {
        private readonly IMapper _mapper = mapper;

        public async Task InsertData(ResponseApi demo, string correo)
        {
            DemoRecord data = _mapper.Map<DemoRecord>(demo);
            string sqlQuery = @"INSERT INTO [dbo].[Usuarios]
                               ([Nombre]
                               ,[Apellido]
                               ,[Edad]
                               ,[Correo])
                                VALUES
                               (@Nombre
                               ,@Apellido
                               ,@Edad
                               ,@Correo)";


            var parameters = new DynamicParameters();
            parameters.Add("@Nombre", data.Nombre, DbType.String);
            parameters.Add("@Apellido", data.Apellido, DbType.String);
            parameters.Add("@Edad", data.Edad, DbType.Int32);
            parameters.Add("@Correo", correo, DbType.String);
            await Connection.QueryAsync(sqlQuery, parameters, Transaction, commandType: CommandType.Text);
            Transaction.Commit();
        }

        public DemoRecord ValidarData(string filter, string value)
        {
            string sqlQuery = $@"SELECT [Correo]
                                FROM [dbo].[Usuarios] WHERE {filter} = @{filter}";
            var parameters = new DynamicParameters();
            parameters.Add(filter, value, DbType.String);

            DemoRecord data = Connection.QueryFirstOrDefault<DemoRecord>(sqlQuery, parameters, Transaction);
            Transaction.Commit();
            return data;
        }
    }
}
