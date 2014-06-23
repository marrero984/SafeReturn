using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		SetFocus(txtusername);
	}

	protected void btnLogin_Click(object sender, EventArgs e)
	{
        DataTable results = UserDB.CheckCredentials(txtusername.Text, txtpassword.Text);

		//If only row is returned
		if (results.Rows.Count == 1)
		{
			//If usertype value is admin
			if (results.Rows[0][0].ToString().ToLower() == "admin")
			{
				//Create session variables with username and role
				Session["username"] = txtusername.Text;
				Session["admin"] = true;
			}
			//Authenticate and redirect
			FormsAuthentication.RedirectFromLoginPage(txtusername.Text, false);
		}
		//User's credentials were invalid
		lblInvalidLogin.Visible = true;
	}
}