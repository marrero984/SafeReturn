using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public class AddressDB
{
	public AddressDB() {}

    public static int AddAddress(Address address)
    {
        SqlConnection conn = DBConnections.GetConnection();

        string insertStatement =
            "INSERT Address " +
                "(Street1, Street2, City, State, Zip, Country, RegistrantID) " +
                "VALUES (@Street1, @Street2, @City, @State, @Zip, @Country, @RegistrantID)";

        SqlCommand insertCmd = new SqlCommand(insertStatement, conn);

		if (address.Street1 == "")
		{
			insertCmd.Parameters.AddWithValue("@Street1", DBNull.Value);
		}
		else
		{
			insertCmd.Parameters.AddWithValue("@Street1", address.Street1);
		}
		if (address.Street2 == "")
		{
			insertCmd.Parameters.AddWithValue("Street2", DBNull.Value);
		}
		else
		{
			insertCmd.Parameters.AddWithValue("@Street2", address.Street2);
		}
		if (address.City == "")
		{
			insertCmd.Parameters.AddWithValue("@City", DBNull.Value);
		}
		else
		{
			insertCmd.Parameters.AddWithValue("@City", address.City);
		}
		if (address.State == "")
		{
			insertCmd.Parameters.AddWithValue("@State", DBNull.Value);
		}
		else
		{
			insertCmd.Parameters.AddWithValue("@State", address.State);
		}
		if (address.Zip == "")
		{
			insertCmd.Parameters.AddWithValue("@Zip", DBNull.Value);
		}
		else
		{
			insertCmd.Parameters.AddWithValue("@Zip", address.Zip);
		}
		if (address.Country == "")
		{
			insertCmd.Parameters.AddWithValue("@Country", DBNull.Value);
		}
		else
		{
			insertCmd.Parameters.AddWithValue("@Country", address.Country);
		}

        insertCmd.Parameters.AddWithValue("@RegistrantID", address.RegistrantID);

        try
        {
            conn.Open();
            insertCmd.ExecuteNonQuery();

            //Execute select statement to get back new record ID number
            string selectStatement =
                "SELECT IDENT_CURRENT('Address') FROM Address";
            SqlCommand selectCommand = new SqlCommand(selectStatement, conn);
            int addressID = Convert.ToInt32(selectCommand.ExecuteScalar());
            return addressID;
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

	public static int UpdateAddress (Address address)
	{
        SqlConnection conn = DBConnections.GetConnection();

        string updateStatement =
            "UPDATE Address " +
			"SET Street1 = @Street1, " +
				"Street2 = @Street2, " +
				"City = @City, " +
				"State = @State, " +
				"Zip = @Zip, " +
				"Country = @Country " +
			"WHERE RegistrantID = @regID";

        SqlCommand updateCmd = new SqlCommand(updateStatement, conn);

		if (address.Street1 == "")
		{
			updateCmd.Parameters.AddWithValue("@Street1", DBNull.Value);
		}
		else
		{
			updateCmd.Parameters.AddWithValue("@Street1", address.Street1);
		}
		if (address.Street2 == "")
		{
			updateCmd.Parameters.AddWithValue("Street2", DBNull.Value);
		}
		else
		{
			updateCmd.Parameters.AddWithValue("@Street2", address.Street2);
		}
		if (address.City == "")
		{
			updateCmd.Parameters.AddWithValue("@City", DBNull.Value);
		}
		else
		{
			updateCmd.Parameters.AddWithValue("@City", address.City);
		}
		if (address.State == "")
		{
			updateCmd.Parameters.AddWithValue("@State", DBNull.Value);
		}
		else
		{
			updateCmd.Parameters.AddWithValue("@State", address.State);
		}
		if (address.Zip == "")
		{
			updateCmd.Parameters.AddWithValue("@Zip", DBNull.Value);
		}
		else
		{
			updateCmd.Parameters.AddWithValue("@Zip", address.Zip);
		}
		if (address.Country == "")
		{
			updateCmd.Parameters.AddWithValue("@Country", DBNull.Value);
		}
		else
		{
			updateCmd.Parameters.AddWithValue("@Country", address.Country);
		}

        updateCmd.Parameters.AddWithValue("@regID", address.RegistrantID);

        try
        {
            conn.Open();
            return updateCmd.ExecuteNonQuery();
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

	public static void DeleteAddress(int regID)
	{
		SqlConnection conn = DBConnections.GetConnection();

		string deleteStatement =
			"DELETE FROM Address " +
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