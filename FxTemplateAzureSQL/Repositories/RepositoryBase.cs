using System.Data;

namespace FxTemplateAzureSQL.Repositories
{
    public abstract class RepositoryBase(IDbTransaction? transaction)
    {
        protected IDbTransaction? Transaction { get; private set; } = transaction;

        protected IDbConnection? Connection
        {
            get { return Transaction?.Connection; }
        }
    }

}