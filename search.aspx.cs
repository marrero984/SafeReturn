using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			SetFocus(txtFirstName);
		}
	}

    protected void search_Click(object sender, EventArgs e)
    {
        string selectStatement =
            "SELECT Images.ImageURL, " +
                "Registrant.FirstName + ' ' + Registrant.LastName AS Name, " + 
				"Registrant.DOB, Registrant.Gender, Registrant.Height, Registrant.Weight, Registrant.RegistrantID " +
            "FROM Registrant " +
            "LEFT OUTER JOIN Images ON Registrant.RegistrantID = Images.RegistrantID " +
            "WHERE Registrant.Active = 1 ";

        if (txtFirstName.Text != "")
            selectStatement += "AND Registrant.FirstName = '" + txtFirstName.Text + "' ";

        if (txtLastName.Text != "")
            selectStatement += "AND Registrant.LastName = '" + txtLastName.Text + "' ";

        if (ddlGender.SelectedIndex != 0)
            selectStatement += "AND Registrant.Gender = '" + Formatting.GetGenderValue(ddlGender.SelectedIndex) + "' ";

        if (ddlRace.SelectedIndex != 0)
            selectStatement += "AND Registrant.Race = '" + Formatting.GetRaceValue(ddlRace.SelectedIndex) + "' ";

        if (ddlHairColor.SelectedIndex != 0)
            selectStatement += "AND Registrant.HairColor = '" + Formatting.GetHairColorValue(ddlHairColor.SelectedIndex) + "' ";

        if (ddlEyeColor.SelectedIndex != 0)
            selectStatement += "AND Registrant.EyeColor = '" + Formatting.GetEyeColorValue(ddlEyeColor.SelectedIndex) + "' ";

        if (ddlComplexion.SelectedIndex != 0)
            selectStatement += "AND Registrant.Complexion = '" + Formatting.GetComplexionValue(ddlComplexion.SelectedIndex) + "' ";

        if (ddlBuild.SelectedIndex != 0)
            selectStatement += "AND Registrant.Build = '" + Formatting.GetBuildValue(ddlBuild.SelectedIndex) + "' ";

		//If only first height pair is completed
		if (txtHeightFt1.Text != "" && txtHeightFt2.Text == "")
		{
			if (txtHeightIn1.Text == "")
			{
				txtHeightIn1.Text = "0";
			}
			selectStatement += "AND Registrant.Height >= " + Formatting.ConvertHeightToInches(Int32.Parse(txtHeightIn1.Text), Int32.Parse(txtHeightFt1.Text)) + " ";
		}
		//If both height pairs are completed
		else if (txtHeightFt1.Text != "" && txtHeightFt2.Text != "")
		{
			if (txtHeightIn1.Text == "")
			{
				txtHeightIn1.Text = "0";
			}
			if (txtHeightIn2.Text == "")
			{
				txtHeightIn2.Text = "0";
			}
			selectStatement += "AND Registrant.Height >= " + Formatting.ConvertHeightToInches(Int32.Parse(txtHeightIn1.Text), Int32.Parse(txtHeightFt1.Text)) + " AND Registrant.Height <= " + Formatting.ConvertHeightToInches(Int32.Parse(txtHeightIn2.Text), Int32.Parse(txtHeightFt2.Text)) + " ";
		}
		//If only second height pair is completed
		else if (txtHeightFt1.Text == "" && txtHeightFt2.Text != "")
		{
			if (txtHeightIn2.Text == "")
			{
				txtHeightIn2.Text = "0";
			}
			selectStatement += "AND Registrant.Height <= " + Formatting.ConvertHeightToInches(Int32.Parse(txtHeightIn2.Text), Int32.Parse(txtHeightFt2.Text)) + " ";
		}

		//If only first weight field is completed
		if (txtWeightFrom.Text != "" && txtWeightTo.Text == "")
			selectStatement += "AND Registrant.Weight >= " + txtWeightFrom.Text + " ";
		//If both weight fields are completed
		else if (txtWeightFrom.Text != "" && txtWeightTo.Text != "")
			selectStatement += "AND Registrant.Weight >= " + txtWeightFrom.Text + " AND Registrant.Weight <= " + txtWeightTo.Text + " ";
		//If only second weight field is compeleted
		else if (txtWeightFrom.Text == "" && txtWeightTo.Text != "")
			selectStatement += "AND Registrant.Weight <= " + txtWeightTo.Text + " ";

		if (txtRecordNo.Text != "")
			selectStatement += "AND Registrant.RegistrantID = " + txtRecordNo.Text + " ";

		selectStatement += "ORDER BY Name ASC";

		DataTable results = SearchDB.GenericSearch(selectStatement);
		results.Columns.Add("FormattedHeight");
		results.Columns.Add("Age");

		for (int i = 0; i < results.Rows.Count; i++)
		{
			results.Rows[i]["FormattedHeight"] = Formatting.HeightToString(Int32.Parse(results.Rows[i]["Height"].ToString()));

			if (results.Rows[i]["DOB"] != DBNull.Value)
			{
				results.Rows[i]["Age"] = Formatting.CalculateAge(DateTime.Parse(results.Rows[i]["DOB"].ToString()));
			}
		}

		gdvResults.DataSource = results;
		gdvResults.DataBind();

    }

	protected void gdvResults_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gdvResults.PageIndex = e.NewPageIndex;
		gdvResults.DataBind();
	}
}