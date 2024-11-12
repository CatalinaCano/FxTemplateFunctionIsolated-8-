namespace FxTemplateAzureSQL.Models.Records
{
    public record DemoRecord
    {
        //La estructura de esta clase se basa los datos parciales de una tabla
        public required string Nombre { get; set; }
        public required string Apellido { get; set; }
        public required int Edad { get; set; }
        public required string Mail { get; set; }
    }
}