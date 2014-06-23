using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class AlertDB
{
    public AlertDB() {}

    public static int AddAlert(Alert alert)
    {
        SqlConnection conn = DBConnections.GetConnection();

        string insertStatement = 
            "INSERT Alerts " + 
                "(AlertDate, AlertTime, AlertDesc, RegistrantID) " +
                "VALUES (@AlertDate, @AlertTime, @AlertDesc, @RegistrantID)";

        SqlCommand insertCmd = new SqlCommand(insertStatement, conn);

        insertCmd.Parameters.AddWithValue("@AlertDate", alert.CreateDate);
        insertCmd.Parameters.AddWithValue("@AlertTime", alert.CreateTime);
        insertCmd.Parameters.AddWithValue("@AlertDesc", alert.AlertInfo);
        insertCmd.Parameters.AddWithValue("@RegistrantID", alert.RegistrantID);

        try
        {
            conn.Open();
            insertCmd.ExecuteNonQuery();

            //Execute select statement to get back new record ID number
            string selectStatement =
                "SELECT IDENT_CURRENT('Alerts') FROM Alerts";
            SqlCommand selectCommand = new SqlCommand(selectStatement, conn);
            int alertID = Convert.ToInt32(selectCommand.ExecuteScalar());
            return alertID;
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

    public static bool UpdateAlert(Alert alert)
    {
        SqlConnection conn = DBConnections.GetConnection();

        string updateStatement =
            "UPDATE Alerts " +
                "SET AlertEndDate = @NewEndDate, " + 
                "AlertEndTime = @NewEndTime " +
                "WHERE AlertID = @AlertID";

        SqlCommand updateCmd = new SqlCommand(updateStatement, conn);

        updateCmd.Parameters.AddWithValue("@NewEndDate", alert.EndDate);
        updateCmd.Parameters.AddWithValue("@NewEndTime", alert.EndTime);
        updateCmd.Parameters.AddWithValue("@AlertID", alert.AlertID);

        try
        {
            conn.Open();
            int count = updateCmd.ExecuteNonQuery();
            if (count > 0)
                return true;
            else
                return false;
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

    public static DataTable GetAlertHistory(int regID)
    {
        SqlConnection conn = DBConnections.GetConnection();
        DataTable results = new DataTable();

        string selectStatement =
            "SELECT AlertDate, AlertTime, AlertEndDate, AlertEndTime, AlertDesc FROM Alerts " +
                "WHERE RegistrantID = @regID";

        SqlCommand selectCmd = new SqlCommand(selectStatement, conn);

        selectCmd.Parameters.AddWithValue("@regID", regID);

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

    //Returns datatable with all active alerts
    public static DataTable GetActiveAlerts()
    {
        SqlConnection conn = DBConnections.GetConnection();
        DataTable results = new DataTable();

		string selectStatement =
			"SELECT Alerts.AlertDate, Alerts.AlertTime, Alerts.AlertDesc, " +
				"Registrant.FirstName, Registrant.LastName, Registrant.RegistrantID " +
			"FROM Alerts " +
				"LEFT OUTER JOIN Registrant ON Alerts.RegistrantID = Registrant.RegistrantID " +
			"WHERE Alerts.AlertEndDate IS NULL";

        SqlCommand selectCmd = new SqlCommand(selectStatement, conn);

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

    //Returns datatable with active alerts for single registrant
    public static DataTable CheckRegistrantAlerts(int regID)
    {
        SqlConnection conn =  DBConnections.GetConnection();
        DataTable results = new DataTable();

        string selectStatement = 
            "SELECT AlertID, AlertDate, AlertTime, AlertDesc " +
                "FROM Alerts " +
                "WHERE RegistrantID = @regID " +
                "AND AlertEndDate IS NULL";

        SqlCommand selectCmd = new SqlCommand(selectStatement, conn);

        selectCmd.Parameters.AddWithValue("@regID", regID);

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

	public static void DeleteRegistrantAlerts(int regID)
	{
		SqlConnection conn = DBConnections.GetConnection();

		string deleteStatement =
			"DELETE FROM Alerts " +
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
}