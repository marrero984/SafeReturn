using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

public class UserDB
{
    public UserDB(){}

    public static int AddUser(string username, int usertype, string password)
    {
        SqlConnection conn = DBConnections.GetConnection();

        string insertStatement =
            "INSERT Users " +
                "(UserName, UserTypeID, UserPassword) " +
            "VALUES (@UserName, @UserTypeID, @UserPassword)";

        SqlCommand insertCmd = new SqlCommand(insertStatement, conn);

        insertCmd.Parameters.AddWithValue("@UserName", username);
        insertCmd.Parameters.AddWithValue("@UserTypeID", usertype);
        insertCmd.Parameters.AddWithValue("@UserPassword", password);

        try
        {
            conn.Open();
            insertCmd.ExecuteNonQuery();

            string selectStatement =
                "SELECT IDENT_CURRENT('Users') FROM Users";
            SqlCommand selectCmd = new SqlCommand(selectStatement, conn);
            int userID = Convert.ToInt32(selectCmd.ExecuteScalar());
            return userID;
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

    public static DataTable GetAllUsers()
    {
        SqlConnection conn = DBConnections.GetConnection();
        DataTable results = new DataTable();

        string selectStatement =
            "SELECT Users.UserID, Users.UserName, UserType.UserType " +
            "FROM Users " +
            "LEFT OUTER JOIN UserType ON Users.UserTypeID = UserType.UserTypeID " +
			"ORDER BY Users.UserName ASC";

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

    public static DataTable GetUser(int userID)
    {
        SqlConnection conn = DBConnections.GetConnection();
        DataTable results = new DataTable();

        string selectStatement =
            "SELECT * " +
            "FROM Users " +
            "WHERE UserID = @UserID";

        SqlCommand selectCmd = new SqlCommand(selectStatement, conn);
        selectCmd.Parameters.AddWithValue("@UserID", userID);

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

    public static bool UpdateUser(int userID, int usertype, string password)
    {
        SqlConnection conn = DBConnections.GetConnection();

        string updateStatement =
            "UPDATE Users " +
            "SET UserTypeID = @usertype, " +
                "UserPassword = @password " +
            "WHERE UserID = @UserID";

        SqlCommand updateCmd = new SqlCommand(updateStatement, conn);

        updateCmd.Parameters.AddWithValue("@usertype", usertype);
        updateCmd.Parameters.AddWithValue("@password", password);
        updateCmd.Parameters.AddWithValue("@UserID", userID);

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

    public static bool UpdateUser(int userID, int usertype)
    {
        SqlConnection conn = DBConnections.GetConnection();

        string updateStatement =
            "UPDATE Users " +
            "SET UserTypeID = @usertype " +
            "WHERE UserID = @UserID";

        SqlCommand updateCmd = new SqlCommand(updateStatement, conn);

        updateCmd.Parameters.AddWithValue("@usertype", usertype);
        updateCmd.Parameters.AddWithValue("@UserID", userID);

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

    public static bool DeleteUser (int userID)
    {
        SqlConnection conn = DBConnections.GetConnection();

        string deleteStatement =
            "DELETE FROM Users " +
            "WHERE UserID = @UserID";

        SqlCommand deleteCmd = new SqlCommand(deleteStatement, conn);

        deleteCmd.Parameters.AddWithValue("@UserID", userID);

        try
        {
            conn.Open();

            int count = deleteCmd.ExecuteNonQuery();

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

    public static DataTable CheckCredentials(string username, string password)
    {
        SqlConnection conn = DBConnections.GetConnection();
        DataTable results = new DataTable();

        string selectStatement =
            "SELECT UserType.UserType " +
            "FROM UserType " +
                "LEFT OUTER JOIN Users ON UserType.UserTypeID = Users.UserTypeID " +
            "WHERE Username = @Username " +
            "AND UserPassword = @Password";

        SqlCommand selectCmd = new SqlCommand(selectStatement, conn);

        selectCmd.Parameters.AddWithValue("@Username", username);
        selectCmd.Parameters.AddWithValue("@Password", password);

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

    //Check if username already used
    public static bool CheckForUsername(string username)
    {
        SqlConnection conn = DBConnections.GetConnection();
        DataTable results = new DataTable();

        string selectStatement =
            "SELECT username " +
            "FROM Users " +
            "WHERE Username = @Username";

        SqlCommand selectCmd = new SqlCommand(selectStatement, conn);

        selectCmd.Parameters.AddWithValue("@Username", username);

        SqlDataAdapter sqlDa = new SqlDataAdapter(selectCmd);

        try
        {
            sqlDa.Fill(results);

            if (results.Rows.Count > 0)
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
}