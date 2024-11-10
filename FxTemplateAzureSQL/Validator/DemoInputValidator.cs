using FluentValidation;
using FxTemplateAzureSQL.Models.Input;
using Microsoft.Extensions.Configuration;

namespace FxTemplateAzureSQL.Validator
{
    public class DemoInputValidator : AbstractValidator<DemoInput>
    {
        public readonly IConfiguration _configuration;

        //private readonly IUnitOfWork _unitOfWork;

        //Ejemplo de una clase validor usar unicamente si es necesario
        //Documentacion disponible en https://docs.fluentvalidation.net/en/latest/built-in-validators.html
        public DemoInputValidator(IConfiguration configuration)
        {
            _configuration = configuration;

            RuleFor(x => x.Amount)
           .NotNull().NotEmpty().WithMessage("{PropertyName} inválido no puede ser nulo.")
           .GreaterThan(0).WithMessage("{PropertyName}  debe ser mayor que 0.");

            RuleFor(property => property.Email)
           .NotNull().NotEmpty().WithMessage("{PropertyName} inválido no puede ser nulo.")
           .Matches(_configuration["RegexExpression:email"]).WithMessage("{PropertyName}  Inválida.");
            //.Must((usuario, CorreoElecronico) => VerificarExistencia(CorreoElecronico, usuario))
            //.WithMessage("La dirección de correo electrónico enviada ya se encuentra registrada.");

            RuleFor(property => property.Currency)
            .NotNull().NotEmpty().WithMessage("{PropertyName} inválido no puede ser nulo.")
            .Must(x => x.Length == 3).WithMessage("{PropertyName}  debe tener exactamente 3 caracteres segun la norma ISO 4217.");
        }

        //Ejemplo de validacion hacia la Base de datos
        //private bool VerificarExistencia(string filter, DemoInput data)
        //{
        //    var response = _unitOfWork.DemoRepository.ValidarData(filter, data.Email);
        //    if (response == null)
        //        return true;
        //    return false;
        //}
    }
}