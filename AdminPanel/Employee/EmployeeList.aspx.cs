using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Employee_EmployeeList : System.Web.UI.Page
{
    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!Page.IsPostBack)
        {
            if (Session["UserID"] != null)
            {
                FillEmployeeGridView(Convert.ToInt32(Session["UserID"]));
            }
        }

    }
    #endregion

    #region FillEmployeeGridView
    private void FillEmployeeGridView(Int32 UserID)
    {
        using (SqlConnection objConn = new SqlConnection(DatabaseConfig.ConnectionString))
        {
            objConn.Open();
            using (SqlCommand objCmd = objConn.CreateCommand())
            {
                try
                {
                    #region Prepare Command
                    objCmd.CommandType = CommandType.StoredProcedure;
                    objCmd.CommandText = "PR_Employee_SelectAllByUserID";
                    objCmd.Parameters.AddWithValue("@UserID", UserID);
                    #endregion Prepare Command

                    SqlDataReader objSDR = objCmd.ExecuteReader();
                    DataTable dtEmployee = new DataTable();
                    dtEmployee.Load(objSDR);
               
                    gvEmployee.DataSource = dtEmployee;
                    gvEmployee.DataBind();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message.ToString();
                }
                finally
                {
                    if (objConn.State == ConnectionState.Open)
                        objConn.Close();
                }
            }
        }
        
    }
    #endregion

    #region gvEmployee_RowCommand
    protected void gvEmployee_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecord" && e.CommandArgument != null)
        {
            DeleteEmployee(Convert.ToInt32(e.CommandArgument));
            FillEmployeeGridView(Convert.ToInt32(Session["UserID"]));
        }
    }
    #endregion

    #region DeleteEmployee
    private void DeleteEmployee(Int32 EmployeeID)
    {
        SqlConnection objConnection = new SqlConnection(DatabaseConfig.ConnectionString);
        try
        {
            objConnection.Open();
            SqlCommand objCmd = new SqlCommand();
            objCmd.Connection = objConnection;
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandText = "PR_Employee_DeleteByPK";
            objCmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
            objCmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
        finally
        {
            if (objConnection.State == ConnectionState.Open)
                objConnection.Close();
        }
      
    }
    #endregion
}