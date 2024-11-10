using System.Runtime.Serialization;

namespace FxTemplateAzureSQL.Utils
{
    public enum SupportedResponses
    {
        [EnumMember(Value = "Consulta exitosa")]
        Consulta_exitosa,

        [EnumMember(Value = "No se encontraron registros")]
        No_se_encontraron_registros,

        [EnumMember(Value = "Registro encontrado")]
        Registro_encontrado,

        [EnumMember(Value = "Registro no encontrado")]
        Registro_no_encontrado,

        [EnumMember(Value = "Registro creado exitosamente")]
        Registro_creado_exitosamente,

        [EnumMember(Value = "Registro actualizado exitosamente")]
        Registro_actualizado_exitosamente,

        [EnumMember(Value = "Registro eliminado exitosamente")]
        Registro_eliminado_exitosamente,
    }
}