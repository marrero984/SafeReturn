using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class editImage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (Session["admin"] == null)
		{
			Response.Redirect("home.aspx");
		}

		if (!IsPostBack)
		{
			int imageID = Convert.ToInt32(Request.QueryString["ImageID"]);

			if (imageID != 0)
			{
				GetImage(imageID);
			}
		}
    }

	protected void GetImage(int imageID)
	{
		DataTable results = ImageDB.GetImage(imageID);

		if (results.Rows.Count == 1)
		{
			imgEdit.ImageUrl = results.Rows[0]["ImageURL"].ToString();
			txtCaption.Text = results.Rows[0]["ImageCaption"].ToString();

			if (Convert.ToInt32(results.Rows[0]["ImagePrimary"].ToString()) == 1)
			{
				cbPrimaryPhoto.Checked = true;
			}
			else
			{
				cbPrimaryPhoto.Checked = false;
			}
			hfRegistrantID.Value = results.Rows[0]["RegistrantID"].ToString();
            hfImageID.Value = imageID.ToString();
		}
	}

	protected void btnSave_Click(object sender, EventArgs e)
	{
		RegImages image = new RegImages();
		image.ImageCaption = txtCaption.Text;
		if (cbPrimaryPhoto.Checked == true)
		{
			image.Primary = 1;
		}
		else
		{
			image.Primary = 0;
		}
		image.ImageID = Convert.ToInt32(hfImageID.Value.ToString());
        
        int registrantID = Convert.ToInt32(hfRegistrantID.Value.ToString());
        image.RegistrantID = registrantID;

		ImageDB.UpdateImage(image);

        Response.Redirect("profileEdit.aspx?registrantID=" + registrantID);
	}

	protected void btnCancel_Click(object sender, EventArgs e)
	{
        int registrantID = Convert.ToInt32(hfRegistrantID.Value.ToString());
		Response.Redirect("profileEdit.aspx?registrantID=" + registrantID);
	}

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int imageID = Convert.ToInt32(hfImageID.Value.ToString());
        int registrantID = Convert.ToInt32(hfRegistrantID.Value.ToString());
		string filePath = Server.MapPath("~/" + imgEdit.ImageUrl);

		if (System.IO.File.Exists(filePath))
		{
			System.IO.File.Delete(filePath);
		}
        
        ImageDB.DeleteImage(imageID);

        Response.Redirect("profileEdit.aspx?registrantID=" + registrantID);
    }
}