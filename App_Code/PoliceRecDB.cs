using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public class PoliceRecDB
{
	public PoliceRecDB(){}

    public static void AddPoliceRec(PoliceRec policeRec)
    {
        SqlConnection conn = DBConnections.GetConnection();

        string insertStatement =
            "INSERT PoliceReports " +
                "(RecordNo, RegistrantID) " +
                "VALUES (@RecordNo, @RegID)";

        SqlCommand insertCmd = new SqlCommand(insertStatement, conn);

        insertCmd.Parameters.AddWithValue("@RecordNo", policeRec.PoliceRecNo);
        insertCmd.Parameters.AddWithValue("@RegID", policeRec.RegistrantID);

        try
        {
            conn.Open();
            insertCmd.ExecuteNonQuery();
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

    public static DataTable GetRegistrantPoliceRec(int regID)
    {
        SqlConnection conn = DBConnections.GetConnection();
        DataTable results = new DataTable();

        string selectStatement =
            "SELECT * " +
			"FROM PoliceReports " + 
			"WHERE RegistrantID = @RegID";

        SqlCommand selectCmd = new SqlCommand(selectStatement, conn);

        selectCmd.Parameters.AddWithValue("@RegID", regID);
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

	public static void DeleteRegistrantPoliceRec(int regID)
	{
		SqlConnection conn = DBConnections.GetConnection();

		string deleteStatement =
			"DELETE FROM PoliceReports " +
			"WHERE RegistrantID = @regID";

		SqlCommand deleteCmd = new SqlCommand(deleteStatement, conn);
		deleteCmd.Parameters.AddWithValue("@regID", regID);

		try
		{
			conn.Open();
			deleteCmd.ExecuteNonQuery();
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

	public static void DeletePoliceRec(int recID)
	{
		SqlConnection conn = DBConnections.GetConnection();

		string deleteStatement =
			"DELETE FROM PoliceReports " +
			"WHERE RecordID = @recID";

		SqlCommand deleteCmd = new SqlCommand(deleteStatement, conn);
		deleteCmd.Parameters.AddWithValue("@recID", recID);

		try
		{
			conn.Open();
			deleteCmd.ExecuteNonQuery();
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