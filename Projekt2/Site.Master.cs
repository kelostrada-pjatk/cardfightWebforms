using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Projekt2
{
    public partial class SiteMaster : MasterPage
    {
        public IIdentity User
        {
            get { return Context.User.Identity; }
        }

        public int? UserId
        {
            get
            {
                var cookie = Request.Cookies[FormsAuthentication.FormsCookieName];
                if (cookie == null) return null;

                var ticket = FormsAuthentication.Decrypt(cookie.Value);
                if (ticket == null) return null;

                int userId;
                if (!int.TryParse(ticket.UserData, out userId)) return null;
                
                return userId;
            }
        }

        public string ErrorMessage
        {
            get { return MsgError.Text; }
            set { MsgError.Text = value; }
        }

        public string SuccessMessage
        {
            get { return MsgSuccess.Text; }
            set { MsgSuccess.Text = value; }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserId"] = UserId;

            if (Session["SuccessMessage"] != null)
            {
                SuccessMessage = Session["SuccessMessage"].ToString();
                Session["SuccessMessage"] = null;
            }
            if (Session["ErrorMessage"] != null)
            {
                ErrorMessage = Session["ErrorMessage"].ToString();
                Session["ErrorMessage"] = null;
            }

        }

        protected void Signout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("Login");
        }
    }
}