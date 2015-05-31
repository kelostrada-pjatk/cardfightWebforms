using System;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using Projekt2.CardsDataSetTableAdapters;

namespace Projekt2
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                Response.Redirect("/");
            }
        }

        protected void Logon_Click(object sender, EventArgs e)
        {
            var tableAdapter = new uzytkownik_selTableAdapter();
            var result = tableAdapter.GetData(UserName.Text, UserPass.Text);

            if (result.Count > 0)
            {
                var row = result.First();
                var userId = row.ID_UZYTKOWNIKA;
                var userName = row.LOGIN;

                var ticket = new FormsAuthenticationTicket(1,
                    userName,
                    DateTime.Now,
                    DateTime.Now.AddMinutes(30),
                    Persist.Checked,
                    userId.ToString(),
                    FormsAuthentication.FormsCookiePath);

                // Encrypt the ticket.
                var encTicket = FormsAuthentication.Encrypt(ticket);

                // Create the cookie.
                Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, encTicket));

                Session["SuccessMessage"] = string.Format("Użytkownik {0} zalogowany!", userName);

                // Redirect back to original URL.
                Response.Redirect(FormsAuthentication.GetRedirectUrl(userName, Persist.Checked));
            }
            else
            {
                Master.ErrorMessage = "Niepoprawne dane logowania. Spróbuj ponownie!";
            }
        }
    }
}