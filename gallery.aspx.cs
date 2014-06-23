using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gallery : System.Web.UI.Page
{
    String queryString = "SELECT  ";

    protected void Page_Load(object sender, EventArgs e)
    {
        photoListView.DataSource = ImageDB.GetAllPrimaryImg();
        photoListView.DataBind();
        
    }//end Page_Load

}//end class