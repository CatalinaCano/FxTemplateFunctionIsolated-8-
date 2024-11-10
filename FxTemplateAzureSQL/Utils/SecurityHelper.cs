using System.Security.Cryptography;
using System.Text;

namespace FxTemplateAzureSQL.Utils
{
    public static class SecurityHelper
    {
        //Algoritmo compatible con SQL SERVER para SHA256
        public static string SHA256Encrypt(string text)
        {
            SHA256 sha256 = SHA256.Create();
            ASCIIEncoding encoding = new();
            StringBuilder sb = new();
            byte[] stream = sha256.ComputeHash(encoding.GetBytes(text));
            for (int i = 0; i < stream.Length; i++) sb.AppendFormat("{0:x2}", stream[i]);
            return "0x" + sb.ToString().ToUpper();
        }

        public static string CalcularLlave()
        {
            return SHA256Encrypt(
                                  string.Concat(
                                                DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"),
                                                Guid.NewGuid().ToString()
                                                ));
        }
    }
}