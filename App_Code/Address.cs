using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Address
{
    private int addressID;
    private string street1;
    private string street2;
    private string city;
    private string state;
    private string zip;
    private string country;
    private int registrantID;

    public Address() {}

    public int AddressID
    {
        get
        {
            return addressID;
        }
        set
        {
            addressID = value;
        }
    }

    public string Street1
    {
        get
        {
            return street1;
        }
        set
        {
            street1 = value;
        }
    }

    public string Street2
    {
        get
        {
            return street2;
        }
        set
        {
            street2 = value;
        }
    }

    public string City
    {
        get
        {
            return city;
        }
        set
        {
            city = value;
        }
    }

    public string State
    {
        get
        {
            return state;
        }
        set
        {
            state = value;
        }
    }

    public string Zip
    {
        get
        {
            return zip;
        }
        set
        {
            zip = value;
        }
    }

    public string Country
    {
        get
        {
            return country;
        }
        set
        {
            country = value;
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