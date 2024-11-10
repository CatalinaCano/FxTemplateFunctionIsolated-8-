namespace FxTemplateAzureSQL.Utils
{
    public static class TimeHelper
    {
        public const string REGIONID = "Eastern Standard Time";

        public static DateTime ConevrtirHora(string hora)
        {
            return DateTime.ParseExact(hora, "HH:mm", null);
        }

        public static bool ValidacionFecha(string fecha)
        {
            return ConvertirFecha(fecha).Date >= ObtenerFechaColombia().Date;
        }

        public static DateTime ObtenerFechaColombia()
        {
            TimeZoneInfo zonaColombia = TimeZoneInfo.FindSystemTimeZoneById(REGIONID);
            DateTime today = TimeZoneInfo.ConvertTime(DateTime.UtcNow, zonaColombia);
            return today;
        }

        //METODO PARA ALMACENAR LAS MARCAS DE TIEMPO
        public static long ObtenerMarcaTiempo()
        {
            return ObtenerFechaColombia().Ticks;
        }

        public static DateTime ConvertirFecha(string fecha)
        {
            try
            {
                var datos = fecha.Split("/");
                int year = int.Parse(datos[2].Split()[0]);
                int month = int.Parse(datos[1]);
                int day = int.Parse(datos[0]);
                TimeZoneInfo zonaColombia = TimeZoneInfo.FindSystemTimeZoneById(REGIONID);
                DateTime convertDate = new(year, month, day);

                DateTime fechaColombia = TimeZoneInfo.ConvertTime(convertDate, zonaColombia);

                return fechaColombia;
            }
            catch (Exception)
            {
                return new(1900, 1, 1);
            }
        }
    }
}