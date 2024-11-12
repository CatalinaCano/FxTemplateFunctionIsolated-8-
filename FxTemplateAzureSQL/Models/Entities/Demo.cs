using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FxTemplateAzureSQL.Models.Entities
{
    [Table("Usuarios")] // [Table("NombreTablaEnBD")]
    public class Demo
    {
        //La estructura de esta clase se basa en todos los campos de la tabla de la base de datos sobre la cual
        //se van a realizar las operaciones CRUD, por lo que los nombres y tipos de datos deben
        //ser iguales no olvide poner el nombre de la tabla en el decorador de la linea 10 [Table("NombreTablaEnBD")]
        //Si no necesita todos los campos de la base de datos use un Dto.

        [Key] //Establece este aatributo como la llave primaria
        public required string Nombre { get; set; }

        public required string Apellido { get; set; }

        public required string Edad { get; set; }

        public required string Correo { get; set; }
    }
}