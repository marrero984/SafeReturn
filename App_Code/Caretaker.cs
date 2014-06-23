using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Caretaker
{

    private int caretakerID;
    private string ecFirstName;
    private string ecLastName;
    private string ecPhone1;
    private string ecPhone2;
    private string ecEmail;
    private string ecStreet1;
    private string ecStreet2;
    private string ecCity;
    private string ecState;
    private string ecZip;
    private string ecCountry;
    private string ecRelationship;
    private int registrantID;

	public Caretaker() {}

    public int CaretakerID
    {
        get
        {
            return caretakerID;
        }
        set
        {
            caretakerID = value;
        }
    }

    public string ECFirstName
    {
        get
        {
            return ecFirstName;
        }
        set
        {
            ecFirstName = value;
        }
    }

    public string ECLastName
    {
        get
        {
            return ecLastName;
        }
        set
        {
            ecLastName = value;
        }
    }

    public string ECPhone1
    {
        get
        {
            return ecPhone1;
        }
        set
        {
            ecPhone1 = value;
        }
    }

    public string ECPhone2
    {
        get
        {
            return ecPhone2;
        }
        set
        {
            ecPhone2 = value;
        }
    }

    public string ECEmail
    {
        get
        {
            return ecEmail;
        }
        set
        {
            ecEmail = value;
        }
    }

    public string ECStreet1
    {
        get
        {
            return ecStreet1;
        }
        set
        {
            ecStreet1 = value;
        }
    }

    public string ECStreet2
    {
        get
        {
            return ecStreet2;
        }
        set
        {
            ecStreet2 = value;
        }
    }

    public string ECCity
    {
        get
        {
            return ecCity;
        }
        set
        {
            ecCity = value;
        }
    }

    public string ECState
    {
        get
        {
            return ecState;
        }
        set
        {
            ecState = value;
        }
    }

    public string ECZip
    {
        get
        {
            return ecZip;
        }
        set
        {
            ecZip = value;
        }
    }

    public string ECCountry
    {
        get
        {
            return ecCountry;
        }
        set
        {
            ecCountry = value;
        }
    }

    public string ECRelationship
    {
        get
        {
            return ecRelationship;
        }
        set
        {
            ecRelationship = value;
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