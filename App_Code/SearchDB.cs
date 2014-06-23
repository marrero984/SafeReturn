using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public class SearchDB
{
	public SearchDB(){}

	public static DataTable GenericSearch(string queryString)
	{
		DataTable results = new DataTable();
		SqlConnection conn = DBConnections.GetConnection();
		SqlCommand selectCmd = new SqlCommand(queryString, conn);
		SqlDataAdapter sqlDa = new SqlDataAdapter(selectCmd);

		try
		{
			sqlDa.Fill(results);
			return results;
		}
		catch (SqlException ex)
		{
			throw ex;
		}
		finally
		{
			conn.Close();
		}
	}
}