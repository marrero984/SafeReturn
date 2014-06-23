using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public class CaretakerDB
{
	public CaretakerDB(){}

    public static int AddCaretaker(Caretaker caretaker)
    {
        SqlConnection conn = DBConnections.GetConnection();

        string insertStatement =
            "INSERT Caretaker " +
                "(CTFirstName, CTLastName, CTPhone1, CTPhone2, CTEmail, " +
                "CTStreet1, CTStreet2, CTCity, CTState, CTZip, CTCountry, " +
                "RegistrantID, CTRelationship) " +
                "VALUES (@CTFirstName, @CTLastName, @CTPhone1, @CTPhone2, @CTEmail, " +
                "@CTStreet1, @CTStreet2, @CTCity, @CTState, @CTZip, @CTCountry, " +
                "@RegistrantID, @CTRelationship)";

        SqlCommand insertCmd = new SqlCommand(insertStatement, conn);

		if (caretaker.ECFirstName == "")
		{
			insertCmd.Parameters.AddWithValue("@CTFirstName", DBNull.Value);
		}
		else
		{
			insertCmd.Parameters.AddWithValue("@CTFirstName", caretaker.ECFirstName);
		}
		if (caretaker.ECLastName == "")
		{
			insertCmd.Parameters.AddWithValue("@CTLastName", DBNull.Value);
		}
		else
		{
			insertCmd.Parameters.AddWithValue("@CTLastName", caretaker.ECLastName);
		}
		if (caretaker.ECPhone1 == "")
		{
			insertCmd.Parameters.AddWithValue("@CTPhone1", DBNull.Value);
		}
        else
        {
            insertCmd.Parameters.AddWithValue("@CTPhone1", caretaker.ECPhone1);
        }
        if (caretaker.ECPhone2 == "")
        {
            insertCmd.Parameters.AddWithValue("@CTPhone2", DBNull.Value);
        }
        else
        {
            insertCmd.Parameters.AddWithValue("@CTPhone2", caretaker.ECPhone2);
        }
		if (caretaker.ECEmail == "")
		{
			insertCmd.Parameters.AddWithValue("@CTEmail", DBNull.Value);
		}
		else
		{
			insertCmd.Parameters.AddWithValue("@CTEmail", caretaker.ECEmail);
		}
		if (caretaker.ECStreet1 == "")
		{
			insertCmd.Parameters.AddWithValue("@CTStreet1", DBNull.Value);
		}
		else
		{
			insertCmd.Parameters.AddWithValue("@CTStreet1", caretaker.ECStreet1);
		}
		if (caretaker.ECStreet2 == "")
		{
			insertCmd.Parameters.AddWithValue("@CTStreet2", DBNull.Value);
		}
		else
		{
			insertCmd.Parameters.AddWithValue("@CTStreet2", caretaker.ECStreet2);
		}
		if (caretaker.ECCity == "")
		{
			insertCmd.Parameters.AddWithValue("@CTCity", DBNull.Value);
		}
		else
		{
			insertCmd.Parameters.AddWithValue("@CTCity", caretaker.ECCity);
		}
		if (caretaker.ECState == "")
		{
			insertCmd.Parameters.AddWithValue("@CTState", DBNull.Value);
		}
		else
		{
			insertCmd.Parameters.AddWithValue("@CTState", caretaker.ECState);
		}
		if (caretaker.ECZip == "")
		{
			insertCmd.Parameters.AddWithValue("@CTZip", DBNull.Value);
		}
		else
		{
			insertCmd.Parameters.AddWithValue("@CTZip", caretaker.ECZip);
		}
		if (caretaker.ECCountry == "")
		{
			insertCmd.Parameters.AddWithValue("@CTCountry", DBNull.Value);
		}
		else
		{
			insertCmd.Parameters.AddWithValue("@CTCountry", caretaker.ECCountry);
		}

        insertCmd.Parameters.AddWithValue("@RegistrantID", caretaker.RegistrantID);

		if (caretaker.ECRelationship == "")
		{
            insertCmd.Parameters.AddWithValue("@CTRelationship", DBNull.Value);
		}
		else
		{
            insertCmd.Parameters.AddWithValue("@CTRelationship", caretaker.ECRelationship);
		}

        try
        {
            conn.Open();
            insertCmd.ExecuteNonQuery();

            //Execute select statement to get back new record ID number
            string selectStatement =
                "SELECT IDENT_CURRENT('Caretaker') FROM Caretaker";
            SqlCommand selectCommand = new SqlCommand(selectStatement, conn);
            int ctID = Convert.ToInt32(selectCommand.ExecuteScalar());
            return ctID;
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

	public static void UpdateCaretaker(Caretaker caretaker)
	{
		SqlConnection conn = DBConnections.GetConnection();

		string updateStatement =
			"UPDATE Caretaker " +
			"SET CTFirstName = @CTFirstname, " +
				"CTLastName = @CTLastname, " +
				"CTPhone1 = @CTPhone1, " +
				"CTPhone2 = @CTPhone2, " +
				"CTEmail = @CTEmail, " +
				"CTStreet1 = @CTStreet1, " +
				"CTStreet2 = @CTStreet2, " +
				"CTCity = @CTCity, " +
				"CTState = @CTState, " +
				"CTZip = @CTZip, " +
				"CTCountry = @CTCountry, " +
				"CTRelationship = @CTRelationship " +
			"WHERE RegistrantID = @regID";


		SqlCommand updateCmd = new SqlCommand(updateStatement, conn);

		if (caretaker.ECFirstName == "")
		{
			updateCmd.Parameters.AddWithValue("@CTFirstName", DBNull.Value);
		}
		else
		{
			updateCmd.Parameters.AddWithValue("@CTFirstName", caretaker.ECFirstName);
		}
		if (caretaker.ECLastName == "")
		{
			updateCmd.Parameters.AddWithValue("@CTLastName", DBNull.Value);
		}
		else
		{
			updateCmd.Parameters.AddWithValue("@CTLastName", caretaker.ECLastName);
		}
		if (caretaker.ECPhone1 == "")
		{
			updateCmd.Parameters.AddWithValue("@CTPhone1", DBNull.Value);
		}
        else
        {
            updateCmd.Parameters.AddWithValue("@CTPhone1", caretaker.ECPhone1);
        }
        if (caretaker.ECPhone2 == "")
        {
            updateCmd.Parameters.AddWithValue("CTPhone2", DBNull.Value);
        }
        else
        {
            updateCmd.Parameters.AddWithValue("@CTPhone2", caretaker.ECPhone2);
        }
		if (caretaker.ECEmail == "")
		{
			updateCmd.Parameters.AddWithValue("@CTEmail", DBNull.Value);
		}
		else
		{
			updateCmd.Parameters.AddWithValue("@CTEmail", caretaker.ECEmail);
		}
		if (caretaker.ECStreet1 == "")
		{
			updateCmd.Parameters.AddWithValue("@CTStreet1", DBNull.Value);
		}
		else
		{
			updateCmd.Parameters.AddWithValue("@CTStreet1", caretaker.ECStreet1);
		}
		if (caretaker.ECStreet2 == "")
		{
			updateCmd.Parameters.AddWithValue("@CTStreet2", DBNull.Value);
		}
		else
		{
			updateCmd.Parameters.AddWithValue("@CTStreet2", caretaker.ECStreet2);
		}
		if (caretaker.ECCity == "")
		{
			updateCmd.Parameters.AddWithValue("@CTCity", DBNull.Value);
		}
		else
		{
			updateCmd.Parameters.AddWithValue("@CTCity", caretaker.ECCity);
		}
		if (caretaker.ECState == "")
		{
			updateCmd.Parameters.AddWithValue("@CTState", DBNull.Value);
		}
		else
		{
			updateCmd.Parameters.AddWithValue("@CTState", caretaker.ECState);
		}
		if (caretaker.ECZip == "")
		{
			updateCmd.Parameters.AddWithValue("@CTZip", DBNull.Value);
		}
		else
		{
			updateCmd.Parameters.AddWithValue("@CTZip", caretaker.ECZip);
		}
		if (caretaker.ECCountry == "")
		{
			updateCmd.Parameters.AddWithValue("@CTCountry", DBNull.Value);
		}
		else
		{
			updateCmd.Parameters.AddWithValue("@CTCountry", caretaker.ECCountry);
		}

		if (caretaker.ECRelationship == "")
		{
			updateCmd.Parameters.AddWithValue("@CTRelationship", DBNull.Value);
		}
		else
		{
			updateCmd.Parameters.AddWithValue("@CTRelationship", caretaker.ECRelationship);
		}

		updateCmd.Parameters.AddWithValue("@regID", caretaker.RegistrantID);

		try
		{
			conn.Open();
			updateCmd.ExecuteNonQuery();
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

	public static void DeleteCaretaker(int regID)
	{
		SqlConnection conn = DBConnections.GetConnection();

		string deleteStatement =
			"DELETE FROM Caretaker " +
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