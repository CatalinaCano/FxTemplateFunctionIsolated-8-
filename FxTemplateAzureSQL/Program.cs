using Azure.Identity;
using Azure.Security.KeyVault.Secrets;
using FluentValidation;
using FxTemplateAzureSQL.Interfaces;
using FxTemplateAzureSQL.Models.Input;
using FxTemplateAzureSQL.Services;
using FxTemplateAzureSQL.Validator;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Abstractions;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Configurations;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System.Net.Http.Headers;
using System.Text;

var host = new HostBuilder()
    .ConfigureFunctionsWebApplication()
    .ConfigureAppConfiguration((context, config) =>
    {
        // Cargar la configuración desde local.settings.json
        var env = context.HostingEnvironment.EnvironmentName;
        config.SetBasePath(Directory.GetCurrentDirectory())
              .AddJsonFile("local.settings.json", optional: true, reloadOnChange: true)
              .AddEnvironmentVariables().Build();

        var keyVaultName = Environment.GetEnvironmentVariable("KEY_VAULT_NAME");
        var keyVaultUrl = $"https://{keyVaultName}.vault.azure.net/";

        var tenantId = Environment.GetEnvironmentVariable("AzureTenantId");
        // Configurar DefaultAzureCredential con TenantId especificado
        var credentialOptions = new DefaultAzureCredentialOptions
        {
            TenantId = tenantId
        };
        var credential = new DefaultAzureCredential(credentialOptions);

        // Crear el cliente de SecretClient usando las credenciales configuradas
        var client = new SecretClient(new Uri(keyVaultUrl), credential);

        // Cargar secretos de Key Vault manualmente y añadirlos a la configuración
        foreach (var secret in client.GetPropertiesOfSecrets())
        {
            var secretValue = client.GetSecret(secret.Name).Value.Value;
            config.AddInMemoryCollection([new KeyValuePair<string, string>(secret.Name, secretValue)]);
        }
    })
    .ConfigureServices((context, services) =>
    {
        services.AddSingleton<IConfiguration>(context.Configuration);


        //SI SU SOLUCION NO USA UN CLIENTE HTTP POR FAVOR ELIMINE TODA LA REGION HttpClient

        #region HttpClient


        

        // Configura HttpClient con la URL base y el encabezado Accept para application/json
        services.AddHttpClient("ClienteHttp", client =>
        {            
            client.DefaultRequestHeaders.Add("Accept", "application/json");
            client.Timeout = TimeSpan.FromSeconds(30);
        });

        // Registro de servicios dependientes de HttpClient
        services.AddTransient<IHttpService, HttpService>();

        #endregion HttpClient

        #region Mapper

        services.AddAutoMapper(typeof(Program));

        #endregion Mapper

        // Registrar los repositorios (si tienes repositorios como IUnitOfWork, DemoService, etc.)

        #region Repositorios

        // Ejemplo de registro de repositorio o servicio con diferentes tipos de ciclo de vida
        // services.AddScoped<IUnitOfWork, UnitOfWork>(); // Usando Scoped para repositorios o servicios relacionados con la DB

        #endregion Repositorios

        #region Validator

        //Ejemplo de inyeccion de dependencias para las validaciones, dada nuevo validador que exista debera registrarlo aqui
        services.AddScoped<IValidator<DemoInput>, DemoInputValidator>();

        #endregion Validator
    })
    .Build();

host.Run();