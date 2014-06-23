using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Reflection;
using System.Text.RegularExpressions;

public partial class profileEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (Session["admin"] == null)
		{
			Response.Redirect("home.aspx");
		}
		
		if (!IsPostBack)
        {
            //Sets valid date range for DoB based on current date
		    rvDoB.MinimumValue = DateTime.Today.AddYears(-125).ToShortDateString();
		    rvDoB.MaximumValue = DateTime.Today.ToShortDateString();
			
		    //Get registrantID from URL
            if (Request.QueryString["RegistrantID"] != null)
            {
                int registrantID = Convert.ToInt32(Request.QueryString["RegistrantID"].ToString());
                hfRegID.Value = registrantID.ToString();

                //Get data from DB and display
                DisplayRegistrant(registrantID);
                LoadPoliceRecTable(registrantID);
                LoadAlertHistoryTable(registrantID);
                GetProfileImage(registrantID);
                LoadImageTable(registrantID);

                //Check profile status and show label if inactive
                CheckProfileStatus(registrantID);

                hylCreateImages.NavigateUrl = "profileCreateImages.aspx?RegistrantID=" + registrantID + "&Origin=Edit";
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

    private void DisplayRegistrant(int regID)
    {
        DataTable results = RegistrantsDB.GetRegistrant(regID);

        if (results.Rows.Count == 1)
        {
            //Full name
            string fullName = results.Rows[0]["FirstName"].ToString() + " " + results.Rows[0]["LastName"].ToString();
            lblFullName.Text = fullName;

            //Names
            txtFirstName.Text = results.Rows[0]["FirstName"].ToString();
            txtMidInitial.Text = results.Rows[0]["MidInitial"].ToString();
            txtLastName.Text = results.Rows[0]["LastName"].ToString();

            //Use gender to get dropdown list index value
            string genderDB = results.Rows[0]["Gender"].ToString();
            ddlGender.SelectedIndex = Formatting.GetGenderIndex(genderDB);

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
            txtHeightFt.Text = Formatting.GetHeightFeet(heightDB);
            txtHeightIn.Text = Formatting.GetHeightInches(heightDB);

            //Weight
            txtWeight.Text = results.Rows[0]["Weight"].ToString();

            //Use hair color to get dropdown list index value
            ddlHairColor.SelectedIndex = Formatting.GetHairColorIndex(results.Rows[0]["HairColor"].ToString());

            //Use eye color to get dropdown list index value
            ddlEyeColor.SelectedIndex = Formatting.GetEyeColorIndex(results.Rows[0]["EyeColor"].ToString());

            //Use eye color to get dropdown list index value
            ddlRace.SelectedIndex = Formatting.GetRaceIndex(results.Rows[0]["Race"].ToString());

            //Complexion and build
			ddlComplexion.SelectedIndex = Formatting.GetComplexionIndex(results.Rows[0]["Complexion"].ToString());
			ddlBuild.SelectedIndex = Formatting.GetBuildIndex(results.Rows[0]["Build"].ToString());

            //Address
            txtStreet1.Text = results.Rows[0]["Street1"].ToString();
            txtStreet2.Text = results.Rows[0]["Street2"].ToString();
            txtCity.Text = results.Rows[0]["City"].ToString();
            txtState.Text = results.Rows[0]["State"].ToString();
            txtZip.Text = results.Rows[0]["Zip"].ToString();
            txtCountry.Text = results.Rows[0]["Country"].ToString();

            //Contact info
            txtPhone1.Text = results.Rows[0]["Phone1"].ToString();
            txtPhone2.Text = results.Rows[0]["Phone2"].ToString();
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

    protected void LoadAlertHistoryTable(int regID)
    {
        DataTable alertHistory = AlertDB.GetAlertHistory(regID);

        for (int i = 0; i < alertHistory.Rows.Count; i++)
        {
            TableRow tr = new TableRow();

            TableCell tcNum = new TableCell();
            tcNum.Text = (i + 1).ToString();
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

    protected void LoadPoliceRecTable(int regID)
    {
		DataTable results = PoliceRecDB.GetRegistrantPoliceRec(regID);

        gdvPoliceRec.DataSource = results;
        gdvPoliceRec.DataBind();
    }

    protected void LoadImageTable(int regID)
    {
        DataTable images = ImageDB.GetRegistrantImages(regID);

        for (int i = 0; i < images.Rows.Count; i++)
        {
            string imageID = images.Rows[i]["ImageID"].ToString();

            TableRow tr = new TableRow();
            tr.ID = imageID;

            TableCell tcimage = new TableCell();
            TableCell tccpation = new TableCell();
            TableCell tcprimary = new TableCell();
			TableCell tcedit = new TableCell();
			TableCell tcdelete = new TableCell();

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
                tcprimary.Text = "X";
            }
            else
            {
                tcprimary.Text = "";
            }
			tr.Cells.Add(tcprimary);

			HyperLink hylEdit = new HyperLink();
            hylEdit.CssClass = "btn btn-primary btn-block";
			hylEdit.Text = "<i class='icon-pencil icon-white'></i>";
            hylEdit.NavigateUrl = "editImage.aspx?imageID=" + imageID;
			tcedit.Controls.Add(hylEdit);
			tr.Cells.Add(tcedit);

            tblImages.Rows.Add(tr);
        }
    }

    protected void btnSavePoliceRec_Click(object sender, EventArgs e)
    {
		PoliceRec policeRec = new PoliceRec();
		policeRec.PoliceRecNo = txtPoliceRecNo.Text;
        policeRec.RegistrantID = Convert.ToInt32(Request.QueryString["RegistrantID"].ToString());

        PoliceRecDB.AddPoliceRec(policeRec);

        Response.Redirect(Request.Url.ToString());
    }

	protected void btnChangeProfileStatus_Click(object sender, EventArgs e)
	{
		int registrantID = Convert.ToInt32(hfRegID.Value.ToString());
		int status = Convert.ToInt32(hfStatus.Value.ToString());

		if (registrantID != 0)
		{
			if (status == 0)
			{
				RegistrantsDB.UpdateActiveField(registrantID, 1);
			}
			else
			{
				RegistrantsDB.UpdateActiveField(registrantID, 0);
			}
			Response.Redirect(Request.Url.ToString());
		}
	}

    protected void btnSaveChanges_Click(object sender, EventArgs e)
	{
        int registrantID = Convert.ToInt32(Request.QueryString["RegistrantID"].ToString());

        Registrant registrant = new Registrant();
        Caretaker caretaker = new Caretaker();
        Address address = new Address();

        registrant.FirstName = txtFirstName.Text;
        registrant.MidInitial = txtMidInitial.Text;
        registrant.LastName = txtLastName.Text;
        registrant.DoB = txtDoB.Text;
        registrant.Gender = Formatting.GetGenderValue(ddlGender.SelectedIndex);
        registrant.HeightFt = Convert.ToInt32(txtHeightFt.Text);
        registrant.HeightIn = Convert.ToInt32(txtHeightIn.Text);
        registrant.Weight = Convert.ToInt32(txtWeight.Text);
        registrant.HairColor = Formatting.GetHairColorValue(ddlHairColor.SelectedIndex);
        registrant.EyeColor = Formatting.GetEyeColorValue(ddlEyeColor.SelectedIndex);
        registrant.Race = Formatting.GetRaceValue(ddlRace.SelectedIndex);
		registrant.Complexion = Formatting.GetComplexionValue(ddlComplexion.SelectedIndex);
		registrant.Build = Formatting.GetBuildValue(ddlBuild.SelectedIndex);
        registrant.Disability = txtDisability.Text;
        registrant.VerbalAbility = txtVerbal.Text;
        registrant.MedConditions = txtMedical.Text;
        registrant.Medications = txtMedications.Text;
        registrant.SafetyConcerns = txtSafety.Text;
        registrant.Characteristics = txtCharacteristics.Text;
        registrant.Clothing = txtClothing.Text;
        registrant.Hobbies = txtHobbies.Text;
        registrant.Fascinations = txtFascinations.Text;
        registrant.FreqLocations = txtFreqLocations.Text;
        registrant.Misc = txtMisc.Text;
        registrant.Phone1 = txtPhone1.Text;
        registrant.Phone2 = txtPhone2.Text;
        registrant.Email = txtEmail.Text;
        registrant.RegistrationID = registrantID;

        address.Street1 = txtStreet1.Text;
        address.Street2 = txtStreet2.Text;
        address.City = txtCity.Text;
        address.State = txtState.Text;
        address.Zip = txtZip.Text;
        address.Country = txtCountry.Text;
        address.RegistrantID = registrantID;

        caretaker.ECFirstName = txtECFirstName.Text;
        caretaker.ECLastName = txtECLastName.Text;
        caretaker.ECRelationship = txtECRelatoinship.Text;
        caretaker.ECStreet1 = txtECStreet1.Text;
        caretaker.ECStreet2 = txtECStreet2.Text;
        caretaker.ECCity = txtECCity.Text;
        caretaker.ECState = txtECState.Text;
        caretaker.ECZip = txtECZip.Text;
        caretaker.ECCountry = txtECCountry.Text;
        caretaker.ECPhone1 = txtECPhone.Text;
        caretaker.ECPhone2 = txtECMobile.Text;
        caretaker.ECEmail = txtECEmail.Text;
        caretaker.RegistrantID = registrantID;

        int count = RegistrantsDB.UpdateRegistrant(registrant);
        
        //AddressDB.UpdateAddress(address);
        //CaretakerDB.UpdateCaretaker(caretaker);

        Response.Redirect("profile.aspx?RegistrantID=" + registrantID + "&" + count);
        
        //else
        //{
            //litMessage.Text =
            //    "<div class='alert alert-error'>" +
            //        "<button type='button' class='close' data-dismiss='alert'>&times;</button>" +
            //        count +
            //        "</div>";
        //}
	}

	protected void CheckProfileStatus(int regID)
	{
		if (RegistrantsDB.GetProfileStatus(regID) == 0)
		{
			lblProfileStatus.Visible = true;
			hylChangeStatus.CssClass = "btn btn-primary btn-block";
			hylChangeStatus.NavigateUrl = "#mdlActivateProfile";
			hylChangeStatus.Text = "Activate";

			hfStatus.Value = "0";
		}
		else
		{
			hfStatus.Value = "1";
		}
	}
	protected void btnDeleteProfile_Click(object sender, EventArgs e)
	{
		RegistrantsDB.DeleteRegistrant(Convert.ToInt32(hfRegID.Value));

		Response.Redirect("home.aspx?src=Delete&ref=" + hfRegID.Value.ToString());
	}

    protected void gdvPoliceRec_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Int32.Parse(e.CommandArgument.ToString());

        GridViewRow selectedRow = gdvPoliceRec.Rows[index];
        int recID = Int32.Parse(selectedRow.Cells[1].Text.ToString());

        PoliceRecDB.DeletePoliceRec(recID);

        Response.Redirect(Request.Url.ToString());
    }

}