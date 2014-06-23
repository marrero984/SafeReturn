using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class PoliceRec
{
    public PoliceRec() { }

    private int policeRecID;
    private string policeRecNo;
    private string policeAgency;
    private int registrantID;

    public int PoliceRecID
    {
        get
        {
            return policeRecID;
        }
        set
        {
            policeRecID = value;
        }
    }

    public string PoliceRecNo
    {
        get
        {
            return policeRecNo;
        }
        set
        {
            policeRecNo = value;
        }
    }

    public string PoliceAgency
    {
        get
        {
            return policeAgency;
        }
        set
        {
            policeAgency = value;
        }
    }

    public int RegistrantID
    {
        get
        {
            return registrantID;
        }
        set
        {
            registrantID = value;
        }
    }
}