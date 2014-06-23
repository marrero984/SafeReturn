using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UserMaintenance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (Session["admin"] == null)
		{
			Response.Redirect("home.aspx");
		}

        if (!IsPostBack)
        {
            LoadUserGridview();

            if (Request.QueryString["src"] != null)
            {
                LoadAlertMessage(Request.QueryString["src"].ToString());
            }
        }
    }

    protected void LoadUserGridview()
    {
        gdvUsers.DataSource = UserDB.GetAllUsers();
        gdvUsers.DataBind();
    }

    protected void LoadAlertMessage(string messagetype)
    {
        if (messagetype == "update")
        {
            litMessage.Text =
                "<div class='alert alert-info'>" +
                    "<button type='button' class='close' data-dismiss='alert'>&times;</button>" +
                    "User updated." +
                    "</div>";
        }
        else if (messagetype == "delete")
        {
            litMessage.Text =
                "<div class='alert alert-info'>" +
                    "<button type='button' class='close' data-dismiss='alert'>&times;</button>" +
                    "User deleted." +
                    "</div>";
        }
        else if (messagetype == "added")
        {
            litMessage.Text =
                "<div class='alert alert-info'>" +
                    "<button type='button' class='close' data-dismiss='alert'>&times;</button>" +
                    "User added." +
                    "</div>";
        }
        litMessage.Visible = true;
    }

    protected void gdvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Edits")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            string userID = gdvUsers.Rows[index].Cells[0].Text;
            Response.Redirect("usermaintenance.aspx?src=edit&userID=" + userID);
        }
    }

	protected void gdvUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gdvUsers.PageIndex = e.NewPageIndex;
		gdvUsers.DataBind();
	}

	protected void btnSearch_Click(object sender, EventArgs e)
	{
		string selectStatement =
			"SELECT Users.UserID, Users.UserName, UserType.UserType " +
			"FROM Users " +
			"LEFT OUTER JOIN UserType ON Users.UserTypeID = UserType.UserTypeID ";

		if (txtUsername.Text != "")
		{
			selectStatement += "WHERE Users.UserName = '" + txtUsername.Text + "' ";
		}

		DataTable results = SearchDB.GenericSearch(selectStatement);

		gdvUsers.DataSource = results;
		gdvUsers.DataBind();
	}
}