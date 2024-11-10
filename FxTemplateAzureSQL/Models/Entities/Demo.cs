using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FxTemplateAzureSQL.Models.Entities
{
    [Table("NombreTablaEnBD")]
    public class Demo
    {
        //La estructura de esta clase se basa en todos los campos de la tabla de la base de datos sobre la cual
        //se van a realizar las operaciones CRUD, por lo que los nombres y tipos de datos deben
        //ser iguales no olvide poner el nombre de la tabla en el decorador de la linea 10 [Table("NombreTablaEnBD")]
        //Si no necesita todos los campos de la base de datos use un Dto.

        [Key] //Establece este aatributo como la llave primaria
        public int Cantidad { get; set; }

        public string Moneda { get; set; }

        public string CorreoElectronico { get; set; }
    }
}