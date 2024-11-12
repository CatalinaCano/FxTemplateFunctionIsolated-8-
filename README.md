## <⚡> PLANTILLA PARA FUNCIONES HTTP



![8.jpeg](C:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\Resources\8.jpeg)

# Antes de Empezar

las dentro de servicebus.

La estructura del template contempla la utilización de las siguientes dependencias que se establecen como base transversal, esto no implica que en el futuro puedan adicionarse o reemplazarse por otros

![nuget1.png](C:\Users\Gimena\Downloads\Dependecias.png)

Para poder generar la plantilla debera clonar este repositorio, ejecutando el siguiente comando: 

```git
git clone https://EpadGroup@dev.azure.com/EpadGroup/Epad_Repositorios/_git/BackEnd_Template
```

1. Vaya a **Visual Studio 2022** y abra la solución descargada, verifique que todos los paquetes estén instalados correctamente ejecútela. Una vez identifique que corre de manera exitosa, proceda a generar el template, para ello, vaya a la opción **Proyecto -> Exportar Plantilla.**

![Template1.png](C:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\Resources\Template1.png)

2. Una vez allí se desplegará la siguiente ventana, deberá seleccionar Plantilla de Proyecto y cualquiera de los proyectos.

![Template2.png](C:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\Resources\Template2.png)

3. Asigne la siguiente configuración:

#Plantilla 1

| **Nombre de la Solución:**       | ![Azure-SQL-Database.png](C:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\Resources\Azure-SQL-Database.png) FxTemplateAzureSQL\. |
| -------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| **Nombre de la plantilla:**      | EPAD-PlantillaSQL\.                                                                                                                      |
| **Descripción de la plantilla:** | Plantilla que implementa los patrones repository y unit of work para conectarse a un motor relacional\.                                  |
| **Icono:**                       | /Resources/img/Azure-SQL-Database.png                                                                                                    |

RECUERDE QUE LAS OPCIONES **Importar la plantilla automáticamente en Visual Studio** y **Mostrar una ventana de explorador en la carpeta de archivos de salida** DEBEN ESTAR MARCADAS.
![Template3.png](C:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\Resources\Template3.png)

4. Una vez finalice automáticamente se abrirá una ventana del explorador donde se encuentra el template generado.

![Template4.png](C:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\Resources\Template4.png)

5. Verifique que al buscar la plantilla esta se encuentre disponible y cree un proyecto de prueba desde el nuevo template.

![Template5.png](C:\Users\Gimena\Downloads\FxTemplateFunctionIsolated-8-\Resources\Template5.png)

> **NOTA IMPORTANTE:** En el caso de que en el pasado haya generado una plantilla con el mismo nombre es importante que elimine los archivos .zip que se generan en las siguientes rutas y luego se proceda a generar nuevamente la plantilla




# # Requerimientos Técnicos

Todas las funciones serán desarrolladas utilizando .NET 8.0, y bajo los estandares definidos en la Wiki del proyecto.

##IDE

- [Visual Studio 2022](https://visualstudio.microsoft.com/es/vs/)
  ##GESTORES DE BASES DE DATOS
- [Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio?view=sql-server-ver16)
- [SQL Server Managment Studio](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16)
- [CosmosDb Studio](https://github.com/thomaslevesque/CosmosDBStudio)
  ##Herramienta para análisis de Código
- [SonarLint](https://marketplace.visualstudio.com/items?itemName=SonarSource.SonarLintforVisualStudio2022)
  ##Herramienta para limpieza de Código
- [CodeMaid](https://marketplace.visualstudio.com/items?itemName=SteveCadwallader.CodeMaid)

##Otras Herramientas

- [Postman](https://www.postman.com/downloads/)
- [SoapUI](https://www.soapui.org/downloads/soapui/)

# Enlaces Importantes

Si desea conocer mas acerca de esta tecnología siga los siguientes enlaces de interes:

- [Diplomado Gratuito de Azure AZ-900](https://azure.conosur.tech/azure-fundamentals-2021/)
- [Learning Path Azure Functions](https://docs.microsoft.com/es-es/learn/paths/implement-azure-functions/)
- [Que es la arquitectura Serverless](https://docs.microsoft.com/es-es/azure/architecture/serverless-quest/serverless-overview)
- [Inyección de Dependencias en Azure](https://docs.microsoft.com/es-es/azure/azure-functions/functions-dotnet-dependency-injection)
- [Personalización HTTP Endpoint en Azure Functions](https://docs.microsoft.com/en-us/azure/azure-functions/functions-bindings-http-webhook-trigger?tabs=in-process%2Cfunctionsv2&pivots=programming-language-csharp)
- [Documentación sobre cómo usar OpenApi en Azure Function](https://github.com/Azure/azure-functions-openapi-extension/blob/main/docs/openapi-core.md)
- [Ejemplo de validación de campos usando FluentValidation](https://www.enmilocalfunciona.io/valida-tu-modelo-de-datos-con-fluentvalidation-en-c/)
- [Learning Path Azure Key Vault](https://docs.microsoft.com/es-es/azure/key-vault/general/overview)
- [Herramienta para la generación de Clases](https://app.quicktype.io/#l=cs&r=json2csharp)
- [X-ROAD](https://x-road.thinkific.com/users/sign_in)
- [Ejemplos de Dapper](https://makolyte.com/csharp-map-query-results-to-multiple-objects-with-dapper/)
- [Dapper Contrib](https://dotnetcoretutorials.com/2019/08/05/dapper-in-net-core-part-4-dapper-contrib/)
- [Dapper CRUD](https://www.section.io/engineering-education/building-a-crud-api-dapper-aspnet-core/)
- [AutoMapper Ejemplo](https://dotnettutorials.net/lesson/automapper-with-nested-types/)
- [Métodos Dapper](https://www.learndapper.com/selecting-single-rows)
