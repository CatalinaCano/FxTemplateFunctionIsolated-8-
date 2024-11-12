using AutoMapper;
using FxTemplateAzureSQL.Models.Entities;
using FxTemplateAzureSQL.Models.Input;
using FxTemplateAzureSQL.Models.Records;
using FxTemplateAzureSQL.Models.ResponseAPI;

namespace FxTemplateAzureSQL.Mappers
{
    public class MappingProfileDemo : Profile
    {
        public MappingProfileDemo()
        {
            //Ejemplo Mapper
            //Documentacion Oficial en https://docs.automapper.org/en/stable/Configuration-validation.html
            CreateMap<ResponseApi, DemoRecord>()
           .ForMember(dest => dest.Nombre,
                      opt => opt.MapFrom(src => src.Name))
           .ForMember(dest => dest.Apellido,
                      opt => opt.MapFrom(src => src.Species))
              .ForMember(dest => dest.Edad,
                      opt => opt.MapFrom(src => src.Id))
           .ForMember(dest => dest.Mail,
                      opt => opt.MapFrom(src =>  src.Name.Trim().ToLower() +"@test.com"));
        }
    }
}