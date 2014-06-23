using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public class ImageDB
{
    public ImageDB() { }

    public static void AddImage(RegImages image)
    {
        SqlConnection conn = DBConnections.GetConnection();

        //If new image is primary, clear previous primary
        if (image.Primary == 1)
        {
            ClearPrimaryImage(image.RegistrantID);
        }

        string insertStatement =
            "INSERT Images " +
                "(ImageURL, ImageCaption, ImagePrimary, RegistrantID) " +
                "VALUES (@ImageURL, @ImageCaption, @ImagePrimary, @RegistrantID)";

        SqlCommand insertCmd = new SqlCommand(insertStatement, conn);

        insertCmd.Parameters.AddWithValue("@ImageURL", image.ImageURL);
        if (image.ImageCaption == "")
        {
            insertCmd.Parameters.AddWithValue("@ImageCaption", DBNull.Value);
        }
        else
        {
            insertCmd.Parameters.AddWithValue("@ImageCaption", image.ImageCaption);
        }
        insertCmd.Parameters.AddWithValue("@ImagePrimary", image.Primary);
        insertCmd.Parameters.AddWithValue("@RegistrantID", image.RegistrantID);

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

    public static DataTable GetPrimaryProfileImg(int regID)
    {
        SqlConnection conn = DBConnections.GetConnection();
        DataTable results = new DataTable();
		string imageURL;

        string selectStatement =
            "SELECT ImageURL " +
                "FROM Images " +
                "WHERE RegistrantID = @regID " +
                "AND ImagePrimary = 1";

        SqlCommand selectCmd = new SqlCommand(selectStatement, conn);

        selectCmd.Parameters.AddWithValue("@regID", regID);

        SqlDataAdapter sqlDA = new SqlDataAdapter(selectCmd);

        try
        {
            sqlDA.Fill(results);
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

    //gets all Primary Images to be displayed on the Image Gallery along with First and Last Name
    public static DataTable GetAllPrimaryImg()
    {
        SqlConnection conn = DBConnections.GetConnection();
        DataTable results = new DataTable();

        string selectStatement =
            "SELECT * FROM Images, Registrant WHERE Images.ImagePrimary = 1 AND Images.RegistrantID = Registrant.RegistrantID ORDER BY Registrant.LastName ASC";

        SqlCommand selectCmd = new SqlCommand(selectStatement, conn);

        SqlDataAdapter sqlDA = new SqlDataAdapter(selectCmd);

        try
        {
            sqlDA.Fill(results);
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

    public static DataTable GetRegistrantImages(int regID)
    {
        SqlConnection conn = DBConnections.GetConnection();
        DataTable results = new DataTable();

        string selectStatement =
            "SELECT * " +
                "FROM Images " +
                "WHERE RegistrantID = @regID";

        SqlCommand selectCmd = new SqlCommand(selectStatement, conn);
        SqlDataAdapter sqlDa = new SqlDataAdapter(selectCmd);

        selectCmd.Parameters.AddWithValue("@regID", regID);

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

    public static void ClearPrimaryImage(int regID)
    {
        SqlConnection conn = DBConnections.GetConnection();

        string updateStatement =
            "UPDATE Images " +
                "SET ImagePrimary = 0 " +
                "WHERE RegistrantID = @regID";

        SqlCommand updateCmd = new SqlCommand(updateStatement, conn);

        updateCmd.Parameters.AddWithValue("@regID", regID);

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

    public static void SetNewPrimaryImage(int imageID)
    {
        SqlConnection conn = DBConnections.GetConnection();

        string updateStatement =
            "UPDATE Images " +
            "SET ImagePrimary = 1 " +
            "WHERE ImageID = @imageID";

        SqlCommand updateCmd = new SqlCommand(updateStatement, conn);

        updateCmd.Parameters.AddWithValue("@imageID", imageID);

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

    public static void UpdateImage(RegImages image)
    {
        if (image.Primary == 1)
        {
            ClearPrimaryImage(image.RegistrantID);
        }
        
        SqlConnection conn = DBConnections.GetConnection();

        string updateStatement =
            "UPDATE Images " +
            "SET ImageCaption = @ImageCaption, " +
                "ImagePrimary = @ImagePrimary " +
            "WHERE ImageID = @imageID";

        SqlCommand updateCmd = new SqlCommand(updateStatement, conn);

        if (image.ImageCaption == "")
        {
            updateCmd.Parameters.AddWithValue("@ImageCaption", DBNull.Value);
        }
        else
        {
            updateCmd.Parameters.AddWithValue("@ImageCaption", image.ImageCaption);
        }
        updateCmd.Parameters.AddWithValue("@ImagePrimary", image.Primary);
        updateCmd.Parameters.AddWithValue("@imageID", image.ImageID);

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


    public static DataTable GetImage(int imageID)
    {
        SqlConnection conn = DBConnections.GetConnection();
        DataTable results = new DataTable();

        string selectStatement =
            "SELECT * " +
            "FROM Images " +
            "WHERE ImageID = @imageID";

        SqlCommand selectCmd = new SqlCommand(selectStatement, conn);
        selectCmd.Parameters.AddWithValue("@imageID", imageID);

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

    public static void DeleteImage(int imageID)
    {
        SqlConnection conn = DBConnections.GetConnection();

        string deleteStatement =
            "DELETE FROM Images " +
            "WHERE ImageID = @imageID";

        SqlCommand deleteCmd = new SqlCommand(deleteStatement, conn);
        deleteCmd.Parameters.AddWithValue("@imageID", imageID);

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

    public static void DeleteRegsitrantImages(int regID)
    {
        SqlConnection conn = DBConnections.GetConnection();

        string deleteStatement =
            "DELETE FROM Images " +
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