using AutoMapper;
using FxTemplateAzureSQL.Models.Entities;
using FxTemplateAzureSQL.Models.Input;

namespace FxTemplateAzureSQL.Mappers
{
    public class MappingProfileDemo : Profile
    {
        public MappingProfileDemo()
        {
            //Ejemplo Mapper
            //Documentacion Oficial en https://docs.automapper.org/en/stable/Configuration-validation.html
            CreateMap<DemoInput, Demo>()
           .ForMember(dest => dest.Cantidad,
                      opt => opt.MapFrom(src => src.Amount))
           .ForMember(dest => dest.Moneda,
                      opt => opt.MapFrom(src => src.Currency))
           .ForMember(dest => dest.CorreoElectronico,
                      opt => opt.MapFrom(src => src.Email));
        }
    }
}