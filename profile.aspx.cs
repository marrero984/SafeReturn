using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
		{
			if (Session["admin"] != null)
			{
				btnUpdateProfile.Visible = true;
			}

			int registrantID = Convert.ToInt32(Request.QueryString["RegistrantID"]);

            if (registrantID != 0)
            {
                DisplayRegistrant(registrantID);
                BuildPoliceRecTable(registrantID);
                BuildAlertHistoryTable(registrantID);
                CheckForActiveAlert(registrantID);
                GetProfileImage(registrantID);
                LoadImageTable(registrantID);

				//Check profile status and show label if inactive
				CheckProfileStatus(registrantID);

				hfRegID.Value = registrantID.ToString();
            }
        }
    }

    private void GetProfileImage(int regID)
    {
        //Database function to get image location
		DataTable profileImage = ImageDB.GetPrimaryProfileImg(regID);
		if (profileImage.Rows.Count > 0)
		{
			string imgURL = profileImage.Rows[0][0].ToString();
			imgProPrimaryPic.ImageUrl = imgURL;
		}
    }

    //Checks for active alerts for registrant and links accordingly
    private void CheckForActiveAlert(int regID)
    {
        DataTable activeAlert = AlertDB.CheckRegistrantAlerts(regID);
        if (activeAlert.Rows.Count != 0)
        {
            hylCreateAlert.CssClass = "btn btn-danger btn-block";
            hylCreateAlert.Text = "End Alert";
            hylCreateAlert.NavigateUrl = "#mdlEndAlert";
            hfAlertRecID.Value = (activeAlert.Rows[0]["AlertID"].ToString());
        }          
    }

    private void DisplayRegistrant(int regID)
    {
        DataTable results = RegistrantsDB.GetRegistrant(regID);

        if (results.Rows.Count == 1)
        {
            //Full name
            string fullName = results.Rows[0]["FirstName"].ToString() + " " + results.Rows[0]["LastName"].ToString();
            lblFullName.Text = fullName;
            lblFullNameAlertModal.Text = fullName;
            lblFullNameEndAlertModal.Text = fullName;
            
            //Names
            txtFirstName.Text = results.Rows[0]["FirstName"].ToString();
            txtMidInitial.Text = results.Rows[0]["MidInitial"].ToString();
            txtLastName.Text = results.Rows[0]["LastName"].ToString();
            
            //Use gender to get dropdown list index value
            ddlGender.Text = results.Rows[0]["Gender"].ToString();

            //Create datetime object from results and trim off date before displaying
            if (results.Rows[0]["DOB"].ToString() != "")
            {
                DateTime DOB = Convert.ToDateTime(results.Rows[0]["DOB"].ToString());
                txtDoB.Text = DOB.ToShortDateString();
            }
            else
            {
                txtDoB.Text = "";
            }

            //Get height value and format into feet and inches
            string heightDB = results.Rows[0]["Height"].ToString();
            txtHeightFt.Text = Formatting.GetHeightFeet(heightDB) + "\' " + Formatting.GetHeightInches(heightDB);

            //Weight
            txtWeight.Text = results.Rows[0]["Weight"].ToString();
            
            //Use hair color to get dropdown list index value
            ddlHairColor.Text = results.Rows[0]["HairColor"].ToString();

            //Use eye color to get dropdown list index value
            ddlEyeColor.Text = results.Rows[0]["EyeColor"].ToString();

            //Use eye color to get dropdown list index value
            ddlRace.Text = results.Rows[0]["Race"].ToString();

            //Complexion and build
            txtComplexion.Text = results.Rows[0]["Complexion"].ToString();
            txtBuild.Text = results.Rows[0]["Build"].ToString();

            //Address
            txtStreet1.Text = results.Rows[0]["Street1"].ToString();
            txtStreet2.Text = results.Rows[0]["Street2"].ToString();
            txtCity.Text = results.Rows[0]["City"].ToString();
            txtState.Text = results.Rows[0]["State"].ToString();
            txtZip.Text = results.Rows[0]["Zip"].ToString();
            txtCountry.Text = results.Rows[0]["Country"].ToString();

            //Contact info
            txtPhone.Text = results.Rows[0]["Phone1"].ToString();
            txtMobile.Text = results.Rows[0]["Phone2"].ToString();
            txtEmail.Text = results.Rows[0]["Email"].ToString();

            //Emergency contact infomration
            txtECFirstName.Text = results.Rows[0]["CTFirstName"].ToString();
            txtECLastName.Text = results.Rows[0]["CTLastName"].ToString();
            txtECRelatoinship.Text = results.Rows[0]["CTRelationship"].ToString();
            txtECStreet1.Text = results.Rows[0]["CTStreet1"].ToString();
            txtECStreet2.Text = results.Rows[0]["CTStreet2"].ToString();
            txtECCity.Text = results.Rows[0]["CTCity"].ToString();
            txtECState.Text = results.Rows[0]["CTState"].ToString();
            txtECZip.Text = results.Rows[0]["CTZip"].ToString();
            txtECCountry.Text = results.Rows[0]["CTCountry"].ToString();
            txtECPhone.Text = results.Rows[0]["CTPhone1"].ToString();
            txtECMobile.Text = results.Rows[0]["CTPhone2"].ToString();
            txtECEmail.Text = results.Rows[0]["CTEmail"].ToString();

            //General information
            txtDisability.Text = results.Rows[0]["Disability"].ToString();
            txtVerbal.Text = results.Rows[0]["VerbalAbility"].ToString();
            txtMedical.Text = results.Rows[0]["MedConditions"].ToString();
            txtMedications.Text = results.Rows[0]["Medications"].ToString();
            txtSafety.Text = results.Rows[0]["SafetyConcerns"].ToString();
            txtCharacteristics.Text = results.Rows[0]["Characteristics"].ToString();
            txtClothing.Text = results.Rows[0]["Clothing"].ToString();
            txtHobbies.Text = results.Rows[0]["Hobbies"].ToString();
            txtFascinations.Text = results.Rows[0]["Fascinations"].ToString();
            txtFreqLocations.Text = results.Rows[0]["FreqLocations"].ToString();
            txtMisc.Text = results.Rows[0]["Misc"].ToString();
        }
    }

    protected void BuildAlertHistoryTable(int regID)
    {
        DataTable alertHistory = AlertDB.GetAlertHistory(regID);

        for (int i = 0; i < alertHistory.Rows.Count; i++)
        {
            TableRow tr = new TableRow();

            TableCell tcNum = new TableCell();
            int rowID = i + 1;
            tcNum.Text = rowID.ToString();
            tr.Cells.Add(tcNum);

            for (int j = 0; j < alertHistory.Columns.Count; j++)
            {
                TableCell tc = new TableCell();
                tc.Text = alertHistory.Rows[i][j].ToString();
                tr.Cells.Add(tc);
            }
            tblAlertHistory.Rows.Add(tr);
        }
    }

    protected void BuildPoliceRecTable(int regID)
    {
        DataTable results = PoliceRecDB.GetRegistrantPoliceRec(regID);

        for (int i = 0; i < results.Rows.Count; i++)
        {
            TableRow tr = new TableRow();
            TableCell tc1 = new TableCell();

            tc1.Text = results.Rows[i]["RecordNo"].ToString();

            tr.Cells.Add(tc1);

            tblPoliceRec.Rows.Add(tr);
        } 
    }

    protected void LoadImageTable(int regID)
    {
        DataTable images = ImageDB.GetRegistrantImages(regID);

        for (int i = 0; i < images.Rows.Count; i++)
        {
            TableRow tr = new TableRow();
            TableCell tcimage = new TableCell();
            TableCell tccpation = new TableCell();
            TableCell tcprimary = new TableCell();

            HyperLink imageLink = new HyperLink();
            imageLink.NavigateUrl = images.Rows[i]["ImageURL"].ToString();
            imageLink.ImageUrl = images.Rows[i]["ImageURL"].ToString();
            imageLink.Target = "_blank";
            tcimage.Controls.Add(imageLink);
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

    protected void btnSaveAlert_Click(object sender, EventArgs e)
    {
        int registrantID = Convert.ToInt32(hfRegID.Value.ToString());

        Alert alertNew = new Alert();
        alertNew.CreateDate = DateTime.Now.ToShortDateString();
        alertNew.CreateTime = DateTime.Now.ToShortTimeString();
        alertNew.AlertInfo = txtAlertInfo.Text;
        alertNew.RegistrantID = registrantID;

        int alertNum = AlertDB.AddAlert(alertNew);

        Response.Redirect("profile.aspx?RegistrantID=" + registrantID);
    }

    protected void btnEndAlert_Click(object sender, EventArgs e)
    {
        int registrantID = Convert.ToInt32(Request.QueryString["RegistrantID"]);
        int alertRecID = Convert.ToInt32(hfAlertRecID.Value.ToString());

        if (alertRecID != 0)
        {
            lblFullName.Text = alertRecID.ToString();
            Alert alertUpdate = new Alert();
            alertUpdate.RegistrantID = registrantID;
            alertUpdate.EndDate = DateTime.Now.ToShortDateString();
            alertUpdate.EndTime = DateTime.Now.ToShortTimeString();
            alertUpdate.AlertID = alertRecID;
            bool checkUpdate = AlertDB.UpdateAlert(alertUpdate);

            if (checkUpdate == true)
            {
                Response.Redirect("profile.aspx?RegistrantID=" + registrantID);
            }
            else
            {
                lblFullName.Text = "Update failed";
            }
        }
        else
        {
            Response.Write("Missing alertRecID");
        }
    }

	protected void CheckProfileStatus(int regID)
	{
		if (RegistrantsDB.GetProfileStatus(regID) == 0)
		{
			lblProfileStatus.Visible = true;
		}
	}

    protected void btnUpdateProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("profileEdit.aspx?RegistrantID=" + hfRegID.Value.ToString());
    }
}