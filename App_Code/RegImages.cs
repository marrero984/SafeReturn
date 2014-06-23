using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class RegImages
{
    private int imageID;
    private string imageCaption;
    private string imageURL;
    private int primary;
    private int registrantID;

    public RegImages() {}

    public int ImageID
    {
        get
        {
            return imageID;
        }
        set
        {
            imageID = value;
        }
    }

    public string ImageCaption
    {
        get
        {
            return imageCaption;
        }
        set
        {
            imageCaption = value;
        }
    }

    public string ImageURL
    {
        get
        {
            return imageURL;
        }
        set
        {
            imageURL = value;
        }
    }

    public int Primary
    {
        get
        {
            return primary;
        }
        set
        {
            primary = value;
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