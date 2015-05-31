using System;
using System.Collections.Generic;
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
            var tableAdapter = new uzytkownik_zmien_hasloTableAdapter();
            var result = tableAdapter.GetData(Master.UserId.Value, UserPass.Text, UserPassConfirm.Text);

            if (result.Count > 0)
            {
                var row = result.First();
                if (row.WYNIK > 0)
                {
                    Master.SuccessMessage = string.Format("Hasło zmienione poprawnie. Nowy hash hasła: {0}", row.HASH_HASLA);
                }
                else
                {
                    Master.ErrorMessage = "Nieznany błąd.";
                }
            }
            else
            {
                Master.ErrorMessage = "Nieznany błąd.";
            }
        }
    }
}