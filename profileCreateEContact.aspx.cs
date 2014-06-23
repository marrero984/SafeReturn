using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class profileCreateEContact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
	{
		if (Session["admin"] == null)
		{
			Response.Redirect("home.aspx");
		}

		if (!IsPostBack)
        {
			if (Session["CreateSession"] != null)
			{
				GetSessionValues(Page);
			}
        }
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
		SetSessionVariables(Page);

        Response.Redirect("profileCreateConfirmation.aspx");
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        SetSessionVariables(Page);
        
        Response.Redirect("profileCreateGenInfo.aspx");
    }

	protected void SetSessionVariables(Control Parent)
	{

		if (Parent is TextBox)
		{
			Session[(Parent.ID)] = ((TextBox)Parent).Text;
		}
		else if (Parent is DropDownList)
		{
			Session[Parent.ID] = ((DropDownList)Parent).SelectedIndex;
		}
		else
		{
			foreach (Control c in Parent.Controls)
			{
				SetSessionVariables(c);
			}
		}
	}

	protected void GetSessionValues(Control Parent)
	{

		if (Parent is TextBox)
		{
			if (Session[Parent.ID] != null)
			{
				((TextBox)Parent).Text = Session[Parent.ID].ToString();
			}
		}
		else if (Parent is DropDownList)
		{
			if (Session[Parent.ID] != null)
			{
				((DropDownList)Parent).SelectedIndex = Convert.ToInt32(Session[Parent.ID].ToString());
			}
		}
		else
		{
			foreach (Control c in Parent.Controls)
			{
				GetSessionValues(c);
			}
		}
	}
}