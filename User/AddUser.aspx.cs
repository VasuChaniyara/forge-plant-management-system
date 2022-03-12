using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_AddUser : System.Web.UI.Page
{
    #region Page Load Event
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    #endregion

    #region btnSave_click
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (txtPassword.Text == txtRePassword.Text)
        {
            SqlConnection objConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ForgePlantManagementConnectionString"].ConnectionString);
            objConnection.Open();

            SqlCommand objCmd = new SqlCommand();
            objCmd.Connection = objConnection;
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandText = "PR_User_CheckUser";
            objCmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
            SqlDataReader objSDR = objCmd.ExecuteReader();
            //SqlDataAdapter objSDA = new SqlDataAdapter(objCmd);
            DataTable dtUser = new DataTable();
            dtUser.Load(objSDR);

            if (dtUser != null && dtUser.Rows.Count > 0)
            {
                lblMessage.Text = "User Already Exist!!";
                lblMessage.ForeColor = Color.Red;
            }
            else
            {
                SqlCommand objCmd1 = new SqlCommand();
                objCmd1.Connection = objConnection;
                objCmd1.CommandType = CommandType.StoredProcedure;
                objCmd1.CommandText = "PR_User_Add";
                objCmd1.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                objCmd1.Parameters.AddWithValue("@Password", txtRePassword.Text.Trim());
                objCmd1.Parameters.AddWithValue("@FullName", txtFullName.Text.Trim());
                objCmd1.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                objCmd1.Parameters.AddWithValue("@EmailID", txtEmailID.Text.Trim());
                objCmd1.Parameters.AddWithValue("@Permission", 0);
                objCmd1.ExecuteNonQuery();

                lblMessage.Text = "New User Add Succecfully.....";
            }






            objConnection.Close();

        }
        else
        {
            lblerror.Text = "Enter Correct Password.";
        }
    }
    #endregion
}