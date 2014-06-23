using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class quicksearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (!IsPostBack)
			txtRecordNo.Focus();
    }

    protected void search_Click(object sender, EventArgs e)
    {
		//Bool used to determine if parameter is first parameter to be added to statement
		bool firstParameterCompleted = false;

		string selectStatement =
			"SELECT Images.ImageURL, " +
				"Registrant.FirstName + ' ' + Registrant.LastName AS Name, " +
				"Registrant.DOB, Registrant.Gender, Registrant.Height, Registrant.Weight, Registrant.RegistrantID " +
			"FROM Registrant " +
			"LEFT OUTER JOIN Images ON Registrant.RegistrantID = Images.RegistrantID ";

		if (txtRecordNo.Text != "")
		{
			selectStatement += "WHERE Registrant.RegistrantID = " + txtRecordNo.Text + " ";
			firstParameterCompleted = true;
		}

		if (txtFirstName.Text != "" && firstParameterCompleted)
		{
			selectStatement += "AND Registrant.FirstName = '" + txtFirstName.Text + "' ";
		}
		else if (txtFirstName.Text != "" && !firstParameterCompleted)
		{
			selectStatement += "WHERE Registrant.FirstName = '" + txtFirstName.Text + "' ";
			firstParameterCompleted = true;
		}

		if (txtLastName.Text != "" && firstParameterCompleted)
		{
			selectStatement += "AND Registrant.LastName = '" + txtLastName.Text + "' ";
		}
		else if (txtLastName.Text != "" && !firstParameterCompleted)
		{
			selectStatement += "WHERE Registrant.LastName = '" + txtLastName.Text + "' ";
			firstParameterCompleted = true;
		}

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