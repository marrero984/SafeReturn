using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class profileCreateConfirmation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (Session["admin"] == null)
		{
			Response.Redirect("home.aspx");
		}

        if (!IsPostBack)
        {
            if (Session["CreateSession"] != null)
            {
				SetControlValues(Page);
            }
        }
    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        Registrant registrant = new Registrant();
            registrant.Active = 1;
            PopulateObject(registrant);

        Address address = new Address();
            PopulateObject(address);

        Caretaker caretaker = new Caretaker();
            PopulateObject(caretaker);

            int newRegID = RegistrantsDB.AddRegistrant(registrant);
            address.RegistrantID = newRegID;
            caretaker.RegistrantID = newRegID;

            int addressID = AddressDB.AddAddress(address);
            int caretakerID = CaretakerDB.AddCaretaker(caretaker);

            Response.Redirect("profileCreateImages.aspx?RegistrantID=" + newRegID + 
                "&Origin=Create");
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
		Response.Redirect("profileCreateEContact.aspx");
    }

	protected void SetControlValues(Control Parent)
	{

		if (Parent is Label)
		{
			if (Session[Parent.ID] != null)
			{
				if (Parent.ID.Substring(0, 3) == "txt")
				{
					((Label)Parent).Text = Session[Parent.ID].ToString();
				}
				else if (Parent.ID.Substring(0, 3) == "ddl")
				{
					((Label)Parent).Text = Formatting.GetDDLValue(Convert.ToInt32(Session[Parent.ID].ToString()), Parent.ID.Substring(3));
				}
			}
		}
		else
		{
			foreach (Control c in Parent.Controls)
			{
				SetControlValues(c);
			}
		}
	}

    protected void PopulateObject(Object obj)
    {
        PropertyInfo[] objPropInfo = obj.GetType().GetProperties();
        foreach (PropertyInfo propInfo in objPropInfo)
        {
            if (Session["txt" + propInfo.Name.ToString()] != null)
            {
                if (propInfo.PropertyType.ToString() == "System.String")
                {
                    propInfo.SetValue(obj, Session["txt" + propInfo.Name.ToString()].ToString());
                }
                else if (propInfo.PropertyType.ToString() == "System.Int32")
                {
                    int txtValue = Convert.ToInt32(Session["txt" + propInfo.Name.ToString()].ToString());
                    propInfo.SetValue(obj, txtValue);
                }
            }
            else if (Session["ddl" + propInfo.Name.ToString()] != null)
            {
                int indexValue = Convert.ToInt32(Session["ddl" + propInfo.Name.ToString()].ToString());
                string ddlName = propInfo.Name.ToString();
                string ddlValue = Formatting.GetDDLValue(indexValue, ddlName);
                propInfo.SetValue(obj, ddlValue);
            }
        }
    }
}