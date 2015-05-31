using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Projekt2.CardsDataSetTableAdapters;

namespace Projekt2
{
    public partial class Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ChangePassword_Click(object sender, EventArgs e)
        {
            if (Master.UserId == null)
            {
                Master.ErrorMessage = "Użytkownik musi być zalogowany.";
                return;
            }

            if (UserPass.Text != UserPassConfirm.Text)
            {
                Master.ErrorMessage = "Hasła muszą być takie same.";
                return;
            }

            var mySetting = ConfigurationManager.ConnectionStrings["s11027ConnectionString"];
            if (mySetting == null || string.IsNullOrEmpty(mySetting.ConnectionString))
                throw new Exception("Fatal error: missing connecting string in web.config file");

            using (var conn = new SqlConnection(mySetting.ConnectionString))
            {
                conn.Open();
                var cmd = new SqlCommand("uzytkownik_zmien_haslo", conn)
                {
                    CommandType = CommandType.StoredProcedure
                };

                cmd.Parameters.Add(new SqlParameter("@id_uzytkownika", Master.UserId.Value));
                cmd.Parameters.Add(new SqlParameter("@haslo", UserPass.Text));
                cmd.Parameters.Add(new SqlParameter("@potwierdzenie_hasla", UserPassConfirm.Text));

                using (var rdr = cmd.ExecuteReader())
                {
                    rdr.Read();

                    if ((int)rdr["WYNIK"] > 0)
                    {
                        Master.SuccessMessage = string.Format("Hasło zmienione poprawnie. Nowy hash hasła: {0}", (string)rdr["HASH_HASLA"]);
                    }
                    else
                    {
                        Master.ErrorMessage = "Nieznany błąd.";
                    }

                }
            }

        }
    }
}