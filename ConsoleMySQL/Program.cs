// written by CHris
// with HELP by:
//
//

Logan
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Management;
using System.Text;
using System.Threading.Tasks;

using MySqlConnector;

namespace ConsoleMySQL
{
    internal class Program
    {
        static MySqlConnection connection;

        private static bool tryConnect(string sUserName, string sPassword, int portNumber)
        {
            if (connection != null)
                connection.Dispose();
            connection = null;

            //log.Info("Trying MySQL; user=" + sUserName + ", port=" + portNumber);
            connection = new MySqlConnection("server=localhost;Port=" + portNumber + ";database=DevTools;userid=" + sUserName + ";password=" + sPassword);
            try
            {
                Console.WriteLine("MySQL:Login, User=" + sUserName + ", Port=" + portNumber + " ...");
                connection.Open();
                Console.WriteLine("Login Success !");
                return true;
            }
            catch (Exception ex)
            { Console.WriteLine("MySQL:Login Ex=" + ex.GetType() + ":" + ex.Message); return false; }
        }

        private static void tryReadTable()
        {
            MySqlCommand cmd = new MySqlCommand("SELECT description, price FROM MenuItem", connection);
            using (MySqlDataReader reader = cmd.ExecuteReader())
                while (reader.Read())
                {
                    string desc = reader.GetString(0);

                    object o = reader.GetValue(1);

                    int price = reader.GetInt32(1);

                    Console.WriteLine(desc + " " + price);
                }
        }

        static void Main(string[] args)
        {
            if (tryConnect("DevToolsUser", "DevTools", 3306))
                tryReadTable();
            Console.WriteLine("All done");
            Console.ReadLine();
        }
    }
}
