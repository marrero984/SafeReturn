using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class profileCreateImages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (Session["admin"] == null)
		{
			Response.Redirect("home.aspx");
		}
		
		int registrantID = Convert.ToInt32(Request.QueryString["registrantID"]);
		string requestOrigin = Request.QueryString["Origin"];

		if (registrantID != 0)
		{
			LoadImageTable(registrantID);
		}

		//Checks for referring URL info and updates done button URL accordingly
        if (requestOrigin == "Edit")
        {
            hylProfile.NavigateUrl = "profileEdit.aspx?registrantID=" + registrantID;
        }
        else
        {
            hylProfile.NavigateUrl = "profile.aspx?registrantID=" + registrantID;
        }
    }

    protected void btnAddPhoto_Click(object sender, EventArgs e)
    {
        int registrantID = Convert.ToInt32(Request.QueryString["RegistrantID"].ToString());

		if (fuImageUpload.PostedFile.ContentType.ToLower().StartsWith
				("image") && fuImageUpload.HasFile)
		{
			string savelocation = Server.MapPath("Images/Gallery/");
			string fileExtension = System.IO.Path.GetExtension(fuImageUpload.FileName);
			//creating filename to avoid file name conflicts.
			string fileName = Guid.NewGuid().ToString();
			//saving file in savedImage folder.
			string savePath = savelocation + fileName + fileExtension;
			fuImageUpload.SaveAs(savePath);

			RegImages regImage = new RegImages();
			regImage.ImageURL = "Images/Gallery/" + fileName + fileExtension;
			regImage.ImageCaption = txtImgCaption.Text;
			regImage.RegistrantID = registrantID;
			if (cbPrimaryPhoto.Checked == true)
			{
				regImage.Primary = 1;
			}
			else
			{
				regImage.Primary = 0;
			}

			ImageDB.AddImage(regImage);

			Response.Redirect("profileCreateImages.aspx?registrantID=" + registrantID);
		}
		else
		{
			lblInvalidFile.Visible = true;
		}
    }

    protected void LoadImageTable(int registrantID)
    {
        DataTable images = ImageDB.GetRegistrantImages(registrantID);

        for (int i = 0; i <  images.Rows.Count; i++)
        {
            TableRow tr = new TableRow();
            TableCell tcimage = new TableCell();
            TableCell tccpation = new TableCell();
            TableCell tcprimary = new TableCell();
            
            Image tableImage = new Image();
            tableImage.ImageUrl = images.Rows[i]["ImageURL"].ToString();
            tableImage.CssClass = "img-polaroid";
            tableImage.Height = 200;
            tcimage.Controls.Add(tableImage);
            tr.Cells.Add(tcimage);

            tccpation.Text = images.Rows[i]["ImageCaption"].ToString();
            tr.Cells.Add(tccpation);

            if (images.Rows[i]["ImagePrimary"].ToString() == "1")
            {
                tcprimary.Text = "x";
            }
            else
            {
                tcprimary.Text = " ";
            }
            tr.Cells.Add(tcprimary);

            tblImages.Rows.Add(tr);
        }
    }
}