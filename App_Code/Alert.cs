using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Alert
{
    private int alertID;
    private string createDate;
    private string createTime;
    private string endDate;
    private string endTime;
    private string alertInfo;
    private int registrantID;

	public Alert() {}

    public int AlertID
    {
        get
        {
            return alertID;
        }
        set
        {
            alertID = value;
        }
    }

    public string CreateDate
    {
        get
        {
            return createDate;
        }
        set
        {
            createDate = value;
        }
    }

    public string CreateTime
    {
        get
        {
            return createTime;
        }
        set
        {
           createTime = value;
        }
    }

    public string EndDate
    {
        get
        {
            return endDate;
        }
        set
        {
            endDate = value;
        }
    }

    public string EndTime
    {
        get
        {
            return endTime;
        }
        set
        {
            endTime = value;
        }
    }

    public string AlertInfo
    {
        get
        {
            return alertInfo;
        }
        set
        {
            alertInfo = value;
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