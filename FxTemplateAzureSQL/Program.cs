using Azure.Identity;
using Azure.Security.KeyVault.Secrets;
using FluentValidation;
using FxTemplateAzureSQL.DataContext;
using FxTemplateAzureSQL.Interfaces;
using FxTemplateAzureSQL.Interfaces.RepositoryPattern;
using FxTemplateAzureSQL.Models.Input;
using FxTemplateAzureSQL.Repositories;
using FxTemplateAzureSQL.Services;
using FxTemplateAzureSQL.Validator;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Newtonsoft.Json;

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
        services.AddSingleton(context.Configuration);
        services.AddSingleton<SecretClient>();
        services.AddSingleton<DapperContext>();
        services.AddAutoMapper(typeof(Program));
        services.AddMvcCore()
                .AddNewtonsoftJson(jsonOptions =>
                {
                    jsonOptions.SerializerSettings.NullValueHandling = NullValueHandling.Ignore;

                }); 


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
        
        // Registrar los repositorios (si tienes repositorios como IUnitOfWork, DemoService, etc.)
        #region Repositorios
        // Ejemplo de registro de repositorio o servicio con diferentes tipos de ciclo de vida
         services.AddTransient<IUnitOfWork, UnitOfWork>(); // Usando Scoped para repositorios o servicios relacionados con la DB
         services.AddTransient<IDemoRepository, DemoRepository>();

        #endregion Repositorios

        #region Validator
        //Ejemplo de inyeccion de dependencias para las validaciones, dada nuevo validador que exista debera registrarlo aqui
        services.AddScoped<IValidator<DemoInput>, DemoInputValidator>();
        #endregion Validator
    })
    .Build();

host.Run();