using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AlertTableLoad();

		if (Request.QueryString["src"] != null)
		{
			if (Request.QueryString["src"] == "Delete")
			{
				litMessage.Text =
					"<div class='alert alert-info'>" +
					"<button type='button' class='close' data-dismiss='alert'>&times;</button>" +
					"Profile ID# " + Request.QueryString["ref"].ToString() + " deleted." +
					"</div>";
				litMessage.Visible = true;
			}
		}

		if (Session["admin"] != null)
		{
			lblAdmin.Visible = true;
			hylCreateRecord.Visible = true;
			hylQuickSearch.Visible = true;
			hylUserMaintenance.Visible = true;
		}
    }

    protected void AlertTableLoad()
    {
        DataTable alerts = AlertDB.GetActiveAlerts();
        

        if (alerts.Rows.Count > 0)
        {
            for (int i = 0; i < alerts.Rows.Count; i++)
            {
                TableRow tr = new TableRow();
				int registrantID = Convert.ToInt32(alerts.Rows[i]["RegistrantID"].ToString());
                string profileURL = "profile.aspx?RegistrantID=" + registrantID;

                TableCell tcimage = new TableCell();
                HyperLink imageLink = new HyperLink();
                imageLink.NavigateUrl = profileURL;
				DataTable alertImage = ImageDB.GetPrimaryProfileImg(registrantID);
				if (alertImage.Rows.Count > 0)
				{
					imageLink.ImageUrl = alertImage.Rows[0]["ImageURL"].ToString();
				}
                tcimage.Controls.Add(imageLink);

                TableCell tcname = new TableCell();
                HyperLink nameLink = new HyperLink();
                nameLink.NavigateUrl = profileURL;
                nameLink.Text = alerts.Rows[i]["FirstName"].ToString() + " " + alerts.Rows[i]["LastName"].ToString();
                tcname.Controls.Add(nameLink);

                TableCell tcdatetime = new TableCell();
                HyperLink dateLink = new HyperLink();
                dateLink.NavigateUrl = profileURL;
                dateLink.Text = alerts.Rows[i]["AlertDate"].ToString() + " @ " + alerts.Rows[i]["AlertTime"].ToString();
                tcdatetime.Controls.Add(dateLink);

                TableCell tcinfo = new TableCell();
                HyperLink descLink = new HyperLink();
                descLink.NavigateUrl = profileURL;
                descLink.Text = alerts.Rows[i]["AlertDesc"].ToString();
                tcinfo.Controls.Add(descLink);

                tr.Cells.Add(tcimage);
                tr.Cells.Add(tcname);
                tr.Cells.Add(tcdatetime);
                tr.Cells.Add(tcinfo);

                tblAlerts.Rows.Add(tr);
            }
        }
    }
}