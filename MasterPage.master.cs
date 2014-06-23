using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (!Request.IsAuthenticated)
		{
			hylHome.Visible = false;
			hylSearch.Visible = false;
			lbtnLogout.Visible = false;
		}
		else
		{
			//Check if session varible was created on login
			if (Session["username"] != null)
			{
				//Re-create session variables to reset expiration time
				Session["username"] = Session["username"].ToString();
				Session["admin"] = true;
			}
		}
    }

    protected void lbtnLogout_Click(object sender, EventArgs e)
    {
		Session.Clear();
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }
}
