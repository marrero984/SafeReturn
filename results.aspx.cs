using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class results : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowCommand(Object sender, GridViewCommandEventArgs e)
    {
        // Convert the row index stored in the CommandArgument
        // property to an Integer.
        int index = Convert.ToInt32(e.CommandArgument);
        String selectedID = GridView1.DataKeys[index].Value.ToString();
        Response.Redirect("profile.aspx?RegistrantID=" + selectedID);
    }
}