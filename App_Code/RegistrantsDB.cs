using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public class RegistrantsDB
{
	public RegistrantsDB() {}

    public static int AddRegistrant(Registrant registrant)
    {
        //Connection
        SqlConnection conn = DBConnections.GetConnection();

        //Statement
        string insertstatement =
            "INSERT Registrant " +
                "(FirstName, LastName, MidInitial, Gender, DOB, Height, Weight, " +
                "HairColor, EyeColor, Race, Complexion, Build, " +
                "Phone1, Phone2, Email, " +
                "Disability, VerbalAbility, MedConditions, Medications, SafetyConcerns, " +
                "Characteristics, Clothing, Hobbies, Fascinations, FreqLocations, Misc, Active) " +
            "VALUES (@FirstName, @LastName, @MidInitial, @Gender, @DOB, @Height, @Weight, " +
                "@HairColor, @EyeColor, @Race, @Complexion, @Build," +
                "@Phone1,@Phone2,@Email," +
                "@Disability,@Verbal,@MedConditions,@Medications,@SafetyConcerns, " +
                "@Characteristics,@Clothing,@Hobbies,@Fascinations,@FreqLocations,@Misc,@Active)";
        //Command
        SqlCommand insertCmd = new SqlCommand(insertstatement, conn);

        //Parameters
        insertCmd.Parameters.AddWithValue("@FirstName", registrant.FirstName);
        insertCmd.Parameters.AddWithValue("@LastName", registrant.LastName);
        if (registrant.MidInitial == "")
        {
            insertCmd.Parameters.AddWithValue("@MidInitial", DBNull.Value);
        }
        else
        {
            insertCmd.Parameters.AddWithValue("@MidInitial", registrant.MidInitial);
        }
        insertCmd.Parameters.AddWithValue("@Gender", registrant.Gender);
        if (registrant.DoB == "")
        {
            insertCmd.Parameters.AddWithValue("@DOB", DBNull.Value);
        }
        else
        {
            insertCmd.Parameters.AddWithValue("@DOB", registrant.DoB);
        }
        insertCmd.Parameters.AddWithValue("@Height", Formatting.ConvertHeightToInches(registrant.HeightIn, registrant.HeightFt));
        insertCmd.Parameters.AddWithValue("@Weight", registrant.Weight);
        insertCmd.Parameters.AddWithValue("@HairColor", registrant.HairColor);
        insertCmd.Parameters.AddWithValue("@EyeColor", registrant.EyeColor);
        if (registrant.Race == "")
        {
            insertCmd.Parameters.AddWithValue("@Race", DBNull.Value);
        }
        else
        {
            insertCmd.Parameters.AddWithValue("@Race", registrant.Race);
        }
        if (registrant.Complexion == "")
        {
            insertCmd.Parameters.AddWithValue("@Complexion", DBNull.Value);
        }
        else
        {
            insertCmd.Parameters.AddWithValue("@Complexion", registrant.Complexion);
        }
        if (registrant.Build == "")
        {
            insertCmd.Parameters.AddWithValue("@Build", DBNull.Value);
        }
        else
        {
            insertCmd.Parameters.AddWithValue("@Build", registrant.Build);
        }

        if (registrant.Phone1 == "")
        {
            insertCmd.Parameters.AddWithValue("@Phone1", DBNull.Value);
        }
        else
        {
            insertCmd.Parameters.AddWithValue("@Phone1", registrant.Phone1);
        }
        if (registrant.Phone2 == "")
        {
            insertCmd.Parameters.AddWithValue("@Phone2", DBNull.Value);
        }
        else
        {
            insertCmd.Parameters.AddWithValue("@Phone2", registrant.Phone2);
        }
        if (registrant.Email == "")
        {
            insertCmd.Parameters.AddWithValue("@Email", DBNull.Value);
        }
        else
        {
            insertCmd.Parameters.AddWithValue("@Email", registrant.Email);
        }

        if (registrant.Disability == "")
        {
            insertCmd.Parameters.AddWithValue("@Disability", DBNull.Value);
        }
        else
        {
            insertCmd.Parameters.AddWithValue("@Disability", registrant.Disability);
        }
        if (registrant.VerbalAbility == "")
        {
            insertCmd.Parameters.AddWithValue("@Verbal", DBNull.Value);
        }
        else
        {
            insertCmd.Parameters.AddWithValue("@Verbal", registrant.VerbalAbility);
        }
        if (registrant.MedConditions == "")
        {
            insertCmd.Parameters.AddWithValue("@MedConditions", DBNull.Value);
        }
        else
        {
            insertCmd.Parameters.AddWithValue("@MedConditions", registrant.MedConditions);
        }
        if (registrant.Medications == "")
        {
            insertCmd.Parameters.AddWithValue("@Medications", DBNull.Value);
        }
        else
        {
            insertCmd.Parameters.AddWithValue("@Medications", registrant.Medications);
        }
        if (registrant.SafetyConcerns == "")
        {
            insertCmd.Parameters.AddWithValue("@SafetyConcerns", DBNull.Value);
        }
        else
        {
            insertCmd.Parameters.AddWithValue("@SafetyConcerns", registrant.SafetyConcerns);
        }
        if (registrant.Characteristics == "")
        {
            insertCmd.Parameters.AddWithValue("@Characteristics", DBNull.Value);
        }
        else
        {
            insertCmd.Parameters.AddWithValue("@Characteristics", registrant.Characteristics);
        }
        if (registrant.Clothing == "")
        {
            insertCmd.Parameters.AddWithValue("@Clothing", DBNull.Value);
        }
        else
        {
            insertCmd.Parameters.AddWithValue("@Clothing", registrant.Clothing);
        }
        if (registrant.Hobbies == "")
        {
            insertCmd.Parameters.AddWithValue("@Hobbies", DBNull.Value);
        }
        else
        {
            insertCmd.Parameters.AddWithValue("@Hobbies", registrant.Hobbies);
        }
        if (registrant.Fascinations == "")
        {
            insertCmd.Parameters.AddWithValue("@Fascinations", DBNull.Value);
        }
        else
        {
            insertCmd.Parameters.AddWithValue("@Fascinations", registrant.Fascinations);
        }
        if (registrant.FreqLocations == "")
        {
            insertCmd.Parameters.AddWithValue("@FreqLocations", DBNull.Value);
        }
        else
        {
            insertCmd.Parameters.AddWithValue("@FreqLocations", registrant.FreqLocations);
        }
        if (registrant.Misc == "")
        {
            insertCmd.Parameters.AddWithValue("@Misc", DBNull.Value);
        }
        else
        {
            insertCmd.Parameters.AddWithValue("@Misc", registrant.Misc);
        }
        insertCmd.Parameters.AddWithValue("@Active", registrant.Active);

        try
        {
            //Open connection and execute insert command
            conn.Open();
            insertCmd.ExecuteNonQuery();

            //Execute select statement to get back new record ID number
            string selectStatement =
                "SELECT IDENT_CURRENT('Registrant') FROM Registrant";
            SqlCommand selectCommand = new SqlCommand(selectStatement, conn);
            int regID = Convert.ToInt32(selectCommand.ExecuteScalar());
            return regID;
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

    public static int UpdateRegistrant(Registrant registrant)
    {
        SqlConnection conn = DBConnections.GetConnection();

        string updateStatement =
            "UPDATE Registrant " +
                "SET FirstName = @FirstName, " +
                "    LastName = @LastName, " +
                "    MidInitial = @MidInitial, " +
                "    Gender = @Gender, " +
                "    DOB = @DOB, " +
                "    Height = @Height, " +
                "    Weight = @Weight, " +
                "    HairColor = @HairColor, " +
                "    EyeColor = @EyeColor, " +
                "    Race = @Race, " +
                "    Complexion = @Complexion, " +
                "    Build = @Build, " +
                "    Phone1 = @Phone1, " +
                "    Phone2 = @Phone2, " +
                "    Email = @Email, " +
                "    Disability = @Disability, " +
                "    VerbalAbility = @VerbalAbility, " +
                "    MedConditions = @MedConditions, " +
                "    Medications = @Medications, " +
                "    SafetyConcerns = @SafetyConcerns, " +
                "    Characteristics = @Characteristics, " +
                "    Clothing = @Clothing, " +
                "    Hobbies = @Hobbies, " +
                "    Fascinations = @Fascinations, " +
                "    FreqLocations = @FreqLocations, " +
                "    Misc = @Misc " +
                "WHERE RegistrantID = @regID";

        SqlCommand updateCmd = new SqlCommand(updateStatement, conn);

        updateCmd.Parameters.AddWithValue("@FirstName", registrant.FirstName);
        updateCmd.Parameters.AddWithValue("@LastName", registrant.LastName);
        if (registrant.MidInitial == "")
        {
            updateCmd.Parameters.AddWithValue("@MidInitial", DBNull.Value);
        }
        else
        {
            updateCmd.Parameters.AddWithValue("@MidInitial", registrant.MidInitial);
        }
        updateCmd.Parameters.AddWithValue("@Gender", registrant.Gender);
        if (registrant.DoB == "")
        {
            updateCmd.Parameters.AddWithValue("@DOB", DBNull.Value);
        }
        else
        {
            updateCmd.Parameters.AddWithValue("@DOB", registrant.DoB);
        }
        updateCmd.Parameters.AddWithValue("@Height", Formatting.ConvertHeightToInches(registrant.HeightIn, registrant.HeightFt));
        updateCmd.Parameters.AddWithValue("@Weight", registrant.Weight);
        updateCmd.Parameters.AddWithValue("@HairColor", registrant.HairColor);
        updateCmd.Parameters.AddWithValue("@EyeColor", registrant.EyeColor);
        if (registrant.Race == "")
        {
            updateCmd.Parameters.AddWithValue("@Race", DBNull.Value);
        }
        else
        {
            updateCmd.Parameters.AddWithValue("@Race", registrant.Race);
        }
        if (registrant.Complexion == "")
        {
            updateCmd.Parameters.AddWithValue("@Complexion", DBNull.Value);
        }
        else
        {
            updateCmd.Parameters.AddWithValue("@Complexion", registrant.Complexion);
        }
        if (registrant.Build == "")
        {
            updateCmd.Parameters.AddWithValue("@Build", DBNull.Value);
        }
        else
        {
            updateCmd.Parameters.AddWithValue("@Build", registrant.Build);
        }

        if (registrant.Phone1 == "")
        {
            updateCmd.Parameters.AddWithValue("@Phone1", DBNull.Value);
        }
        else
        {
            updateCmd.Parameters.AddWithValue("@Phone1", registrant.Phone1);
        }
        if (registrant.Phone2 == "")
        {
            updateCmd.Parameters.AddWithValue("@Phone2", DBNull.Value);
        }
        else
        {
            updateCmd.Parameters.AddWithValue("@Phone2", registrant.Phone2);
        }
        if (registrant.Email == "")
        {
            updateCmd.Parameters.AddWithValue("@Email", DBNull.Value);
        }
        else
        {
            updateCmd.Parameters.AddWithValue("@Email", registrant.Email);
        }

        if (registrant.Disability == "")
        {
            updateCmd.Parameters.AddWithValue("@Disability", DBNull.Value);
        }
        else
        {
            updateCmd.Parameters.AddWithValue("@Disability", registrant.Disability);
        }
        if (registrant.VerbalAbility == "")
        {
            updateCmd.Parameters.AddWithValue("@VerbalAbility", DBNull.Value);
        }
        else
        {
            updateCmd.Parameters.AddWithValue("@VerbalAbility", registrant.VerbalAbility);
        }
        if (registrant.MedConditions == "")
        {
            updateCmd.Parameters.AddWithValue("@MedConditions", DBNull.Value);
        }
        else
        {
            updateCmd.Parameters.AddWithValue("@MedConditions", registrant.MedConditions);
        }
        if (registrant.Medications == "")
        {
            updateCmd.Parameters.AddWithValue("@Medications", DBNull.Value);
        }
        else
        {
            updateCmd.Parameters.AddWithValue("@Medications", registrant.Medications);
        }
        if (registrant.SafetyConcerns == "")
        {
            updateCmd.Parameters.AddWithValue("@SafetyConcerns", DBNull.Value);
        }
        else
        {
            updateCmd.Parameters.AddWithValue("@SafetyConcerns", registrant.SafetyConcerns);
        }
        if (registrant.Characteristics == "")
        {
            updateCmd.Parameters.AddWithValue("@Characteristics", DBNull.Value);
        }
        else
        {
            updateCmd.Parameters.AddWithValue("@Characteristics", registrant.Characteristics);
        }
        if (registrant.Clothing == "")
        {
            updateCmd.Parameters.AddWithValue("@Clothing", DBNull.Value);
        }
        else
        {
            updateCmd.Parameters.AddWithValue("@Clothing", registrant.Clothing);
        }
        if (registrant.Hobbies == "")
        {
            updateCmd.Parameters.AddWithValue("@Hobbies", DBNull.Value);
        }
        else
        {
            updateCmd.Parameters.AddWithValue("@Hobbies", registrant.Hobbies);
        }
        if (registrant.Fascinations == "")
        {
            updateCmd.Parameters.AddWithValue("@Fascinations", DBNull.Value);
        }
        else
        {
            updateCmd.Parameters.AddWithValue("@Fascinations", registrant.Fascinations);
        }
        if (registrant.FreqLocations == "")
        {
            updateCmd.Parameters.AddWithValue("@FreqLocations", DBNull.Value);
        }
        else
        {
            updateCmd.Parameters.AddWithValue("@FreqLocations", registrant.FreqLocations);
        }
        if (registrant.Misc == "")
        {
            updateCmd.Parameters.AddWithValue("@Misc", DBNull.Value);
        }
        else
        {
            updateCmd.Parameters.AddWithValue("@Misc", registrant.Misc);
        }
        updateCmd.Parameters.AddWithValue("@regID", registrant.RegistrationID);

        try
        {
            //Open connection and execute command
            conn.Open();
            int count = updateCmd.ExecuteNonQuery();
            return count;
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

    public static DataTable GetRegistrant(int regID)
    {
        SqlConnection conn = DBConnections.GetConnection();
        DataTable results = new DataTable();

        string selectStatement = "SELECT * FROM Registrant " + 
            "LEFT OUTER JOIN Address ON Registrant.RegistrantID = Address.RegistrantID " + 
            "LEFT OUTER JOIN Caretaker ON Registrant.RegistrantID = Caretaker.RegistrantID " + 
            "WHERE Registrant.RegistrantID = @regID";

        SqlCommand cmdSelect = new SqlCommand(selectStatement, conn);

        cmdSelect.Parameters.AddWithValue("@regID", regID);

        SqlDataAdapter sqlDa = new SqlDataAdapter(cmdSelect);

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

	public static bool UpdateActiveField(int regID, int status)
	{
		SqlConnection conn = DBConnections.GetConnection();

		string updateStatement = 
			"UPDATE Registrant " + 
				"SET Active = @status " +
				"WHERE RegistrantID = @regID";

		SqlCommand updateCmd = new SqlCommand(updateStatement, conn);

		updateCmd.Parameters.AddWithValue("@regID", regID);
		updateCmd.Parameters.AddWithValue("@status", status);

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

	public static void DeleteRegistrant(int regID)
	{
		SqlConnection conn = DBConnections.GetConnection();

		string deleteStatement =
			"DELETE FROM Registrant " +
			"WHERE RegistrantID = @regID";

		SqlCommand deleteCmd = new SqlCommand(deleteStatement, conn);
		deleteCmd.Parameters.AddWithValue("@regID", regID);

		AddressDB.DeleteAddress(regID);
		AlertDB.DeleteRegistrantAlerts(regID);
		CaretakerDB.DeleteCaretaker(regID);
		PoliceRecDB.DeleteRegistrantPoliceRec(regID);
		ImageDB.DeleteRegsitrantImages(regID);

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

	public static int GetProfileStatus(int regID)
	{
		DataTable results = new DataTable();
		SqlConnection conn = DBConnections.GetConnection();

		string selectStatement =
			"SELECT Active " +
			"FROM Registrant " +
			"WHERE RegistrantID = @regID";

		SqlCommand selectCmd = new SqlCommand(selectStatement, conn);

		selectCmd.Parameters.AddWithValue("@regID", regID);

		SqlDataAdapter sqlDa = new SqlDataAdapter(selectCmd);

		try
		{
			sqlDa.Fill(results);
			if (results.Rows.Count > 0)
			{
				return Convert.ToInt32(results.Rows[0]["Active"]);
			}
			else
			{
				return 1;
			}
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