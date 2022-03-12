using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Employee_EmployeeAddEdit : System.Web.UI.Page
{
    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            if (Session["UserID"] != null)
            {
                FillDropDownList(Convert.ToInt32(Session["UserID"]));
            }
            if (Request.QueryString["EmployeeID"] != null)
            {
                LoadControls(Convert.ToInt32(Request.QueryString["EmployeeID"]));
                lblPageHeader.Text = "Customer Edit";
            }
            else
            {
                lblPageHeader.Text = "Customer Add";
            }
        }
    }
    #endregion

    #region FillDropDownList
    private void FillDropDownList(Int32 UserID)
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
                         objCmd.CommandText = "PR_Employee_SelectDropDownListByUserID";
                         objCmd.Parameters.AddWithValue("@UserID", UserID);
                        #endregion Prepare Command

        

                    objCmd.CommandText = "PR_EmployeeWiseCategory_SelectDropDownListByUserID";
                    SqlDataReader objSDREmployeeWiseCategory = objCmd.ExecuteReader();
                    ddlEmployeeWiseCategory.DataSource = objSDREmployeeWiseCategory;
                    ddlEmployeeWiseCategory.DataTextField = "CategoryName";
                    ddlEmployeeWiseCategory.DataValueField = "EmployeeWiseCategoryID";
                    ddlEmployeeWiseCategory.DataBind();
                    ddlEmployeeWiseCategory.Items.Insert(0, "Select Category Name");
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

    #region LoadControls
    private void LoadControls(Int32 EmployeeID)
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
                    objCmd.CommandText = "PR_Employee_SelectByPK";
                    objCmd.Parameters.AddWithValue("@EmployeeID", EmployeeID);
                    #endregion Prepare Command

                    #region ReadData and Set Controls
                    SqlDataReader objSDR = objCmd.ExecuteReader();

        if (objSDR.HasRows == true)
        {
            while (objSDR.Read() == true)
            {
                if (!objSDR["EmployeeName"].Equals(DBNull.Value))
                {
                    txtEmployeeName.Text = objSDR["EmployeeName"].ToString();
                }
                if (!objSDR["Address"].Equals(DBNull.Value))
                {
                    txtAddress.Text = objSDR["Address"].ToString();
                }

               
               
                if (!objSDR["MobileNo"].Equals(DBNull.Value))
                {
                    txtMobileNo.Text = objSDR["MobileNo"].ToString();
                }

                if (!objSDR["EmployeeWiseCategoryID"].Equals(DBNull.Value))
                {
                    ddlEmployeeWiseCategory.SelectedValue = objSDR["EmployeeWiseCategoryID"].ToString();
                }

            }
        }
                     #endregion ReadData and Set Controls
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


    #region btnSave_Click
    protected void btnSave_Click(object sender, EventArgs e)
    {
        #region Local Variables
        SqlString strEmployeeName = SqlString.Null;
        SqlString strAddress = SqlString.Null;
        SqlString strMobile = SqlString.Null;
        #endregion Local Variables


        #region Read Data
        if (txtEmployeeName.Text.Trim() != "")
            strEmployeeName = txtEmployeeName.Text.Trim();
        if (txtAddress.Text.Trim() != "")
            strAddress = txtAddress.Text.Trim();
        
        if (txtMobileNo.Text.Trim() != "")
            strMobile = txtMobileNo.Text.Trim();
        #endregion Read Data

        using (SqlConnection objConn = new SqlConnection(DatabaseConfig.ConnectionString))
        {
            objConn.Open();
            using (SqlCommand objCmd = objConn.CreateCommand())
            {
                try
                {
                    #region Prepare Command
                    objCmd.CommandType = CommandType.StoredProcedure;
                    objCmd.Parameters.AddWithValue("@EmployeeName", strEmployeeName);
                    objCmd.Parameters.AddWithValue("@Address", strAddress);
                    objCmd.Parameters.AddWithValue("@MobileNo", strMobile);
                    objCmd.Parameters.AddWithValue("@EmployeeWiseCategoryID", ddlEmployeeWiseCategory.SelectedValue);

                    if (Request.QueryString["EmployeeID"] == null)
                    {
                        objCmd.CommandText = "PR_Employee_Insert";
                        objCmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(Session["UserID"]));
                    }
                    else
                    {
                        objCmd.CommandText = "PR_Employee_UpdateByPK";
                        objCmd.Parameters.AddWithValue("@EmployeeID", Request.QueryString["EmployeeID"].ToString());
                    }
                    #endregion Prepare Command

                    objCmd.ExecuteNonQuery();
                    if (Request.QueryString["EmployeeID"] == null)
                    {
                        lblMessage.Text = "Data Inserted Successfuly.....";
                        txtEmployeeName.Text = "";
                        txtAddress.Text = "";
                        txtMobileNo.Text = "";
                        txtEmployeeName.Focus();
                    }
                    else
                    {
                        Response.Redirect("~/EmployeeList");
                    }
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
}