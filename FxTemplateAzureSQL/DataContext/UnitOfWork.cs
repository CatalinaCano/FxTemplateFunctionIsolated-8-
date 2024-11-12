using AutoMapper;
using FxTemplateAzureSQL.Interfaces.RepositoryPattern;
using FxTemplateAzureSQL.Repositories;
using Microsoft.Extensions.Configuration;
using System.Data;

namespace FxTemplateAzureSQL.DataContext
{
    public class UnitOfWork : IUnitOfWork
    {
        public readonly IConfiguration _config;

        private IDbConnection? _connection;
        private IDbTransaction? _transaction;

        private IDemoRepository? _demoRepository;

        private bool _disposed = false;
        public readonly DapperContext _context;

        private readonly IMapper _mapper;

        public UnitOfWork(IConfiguration configuration, DapperContext context, IMapper mapper)
        {
            _config = configuration;
            _context = context;

            _connection = context.CreateConnection();
            _connection.Open();
            _transaction = _connection.BeginTransaction();
            _mapper = mapper;
        }

        public IDemoRepository DemoRepository
        {
            get { return _demoRepository ??= new DemoRepository(_transaction, _mapper); }
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Major Code Smell", "S2589:Boolean expressions should not be gratuitous", Justification = "<Pending>")]
        public void Commit()
        {
            try
            {
                _transaction?.Commit();
            }
            catch
            {
                _transaction?.Rollback();
                throw;
            }
            finally
            {                
                _transaction?.Dispose();
                _transaction = _connection?.BeginTransaction();
                ResetRepositories();
            }
        }

        private void ResetRepositories()
        {
            _demoRepository = null;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!_disposed)
            {
                if (disposing)
                {
                    if (_transaction != null)
                    {
                        _transaction.Dispose();
                        _transaction = null;
                    }
                    if (_connection != null)
                    {
                        _connection.Dispose();
                        _connection = null;
                    }
                }
                _disposed = true;
            }
        }

        ~UnitOfWork()
        {
            Dispose(false);
        }
    }
}