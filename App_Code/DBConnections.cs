using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for DBConnections
/// </summary>
public class DBConnections
{
	public DBConnections()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static SqlConnection GetConnection()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);
        return conn;
    }

}