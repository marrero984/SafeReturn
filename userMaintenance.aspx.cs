using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class userMaintenance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (Session["admin"] == null)
		{
			Response.Redirect("home.aspx");
		}

        if (!IsPostBack)
        {
			if (Request.QueryString["src"] != null)
			{
				if (Request.QueryString["src"].ToString() == "edit")
				{
					LoadUser(Convert.ToInt32(Request.QueryString["userID"].ToString()));
				}
			}
			else
			{
				LoadNewForm();
			}
        }
    }

    protected void LoadUser(int userID)
    {
        lblHeader.Text = "Edit User";
        lblUserID.Visible = true;
        lblUserIDNo.Visible = true;
        lblUserIDNo.Text = userID.ToString();
		pnlEditUser.Visible = true;
        hylDelete.Visible = true;
        btnSaveUpdate.Visible = true;
		pnlPasswordInfo.Visible = true;

        DataTable results = UserDB.GetUser(userID);

        if (results.Rows.Count == 1)
        {
            lblUsernameValue.Text = results.Rows[0]["Username"].ToString();
            ddlUserType.SelectedIndex = Convert.ToInt32(results.Rows[0]["UserTypeID"]);

			if (results.Rows[0]["Username"].ToString().Equals(Session["Username"].ToString()))
			{
				hylDelete.Visible = false;
			}
        }
    }

    protected void LoadNewForm()
    {
        lblHeader.Text = "Add New User";
		pnlNewUser.Visible = true;
		rfvUsername.Enabled = true;
		rfvPassword1.Enabled = true;
		rfvPassword2.Enabled = true;
		btnSaveNew.Visible = true;
    }

    protected void btnSaveUpdate_Click(object sender, EventArgs e)
    {
		//If both password fields blank
		if (txtPassword1.Text == "" && txtPassword2.Text == "")
		{
			//Update user without password
			if (UserDB.UpdateUser(Convert.ToInt32(lblUserIDNo.Text), ddlUserType.SelectedIndex))
			{
				//If update returns true, return to user list
				Response.Redirect("userList.aspx?src=update");
			}
			else
			{
				//If update fails display error alert
				litMessage.Text =
					"<div class='alert alert-error'>" +
						"<button type='button' class='close' data-dismiss='alert'>&times;</button>" +
						"Update failed." +
						"</div>";
			}
		}
		//Else if password1 = password2 and both are not blank
		else if (txtPassword1.Text.Equals(txtPassword2.Text) && txtPassword1.Text != "")
        {
			//Update user with password
            if (UserDB.UpdateUser(Convert.ToInt32(lblUserIDNo.Text), ddlUserType.SelectedIndex))
            {
				//If update returns true, return to user list
                Response.Redirect("userList.aspx?src=update");
            }
            else
            {
				//If update fails display error alert
                litMessage.Text =
					"<div class='alert alert-error'>" +
						"<button type='button' class='close' data-dismiss='alert'>&times;</button>" +
						"Update failed." +
						"</div>";
            }
        }
		//Else if password1 does not equal password2
        else if (!txtPassword1.Text.Equals(txtPassword2.Text))
        {
			//Display does not match label
			lblPasswordMatch.Visible = true;
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("userlist.aspx");
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (UserDB.DeleteUser(Convert.ToInt32(lblUserIDNo.Text)))
        {
            Response.Redirect("userlist.aspx?src=delete");
        }
        else
        {
            Response.Redirect(Request.Url + "&fail=delete");
        }
    }

    protected void btnSaveNew_Click(object sender, EventArgs e)
    {
		//Check if username already used
		if (UserDB.CheckForUsername(txtUsername.Text))
		{
			//Username already used
			litMessage.Text =
				"<div class='alert alert-error'>" +
					"<button type='button' class='close' data-dismiss='alert'>&times;</button>" +
					"Username is already used.  Please try another." +
					"</div>";
            litMessage.Visible = true;
		}
        //Else if password1 = password2 and both are not blank
        else if (txtPassword1.Text.Equals(txtPassword2.Text) && txtPassword1.Text != "")
        {
            //Update user with password
            if (UserDB.AddUser(txtUsername.Text, ddlUserType.SelectedIndex, txtPassword1.Text) != null)
            {
                //If insert returns ID, return to user list
                Response.Redirect("userList.aspx?src=added");
            }
            else
            {
                //If update fails display error alert
                litMessage.Text =
                    "<div class='alert alert-error'>" +
                        "<button type='button' class='close' data-dismiss='alert'>&times;</button>" +
                        "Create user failed." +
                        "</div>";
            }
        }
        //Else if password1 does not equal password2
        else if (!txtPassword1.Text.Equals(txtPassword2.Text))
        {
            //Display does not match label
            lblPasswordMatch.Visible = true;
        }
    }
}