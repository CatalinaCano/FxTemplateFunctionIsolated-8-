namespace FxTemplateAzureSQL.Interfaces.RepositoryPattern
{
    public interface IUnitOfWork : IDisposable
    {
        IDemoRepository DemoRepository { get; }

        public void Commit();
    }
}