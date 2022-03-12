using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class AdminPanel_Login : System.Web.UI.Page
{
    #region Page Load Event
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    #endregion

    #region btnLogin_click
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection objConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ForgePlantManagementConnectionString"].ConnectionString);
        // SqlCommand objCmd = new SqlCommand("Select * from[dbo].[User] where username=@UserName and password=@Password",objConnection);
        objConnection.Open();
        SqlCommand objCmd = new SqlCommand();
        objCmd.Connection = objConnection;
        objCmd.CommandType = CommandType.StoredProcedure;
        objCmd.CommandText = "PR_User_SelectByUserNamePassword";
        objCmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
        objCmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
     

        SqlDataReader objSDR = objCmd.ExecuteReader();
        //SqlDataAdapter objSDA = new SqlDataAdapter(objCmd);
        DataTable dtUser = new DataTable();
        dtUser.Load(objSDR);

        //objConnection.Open();
        objConnection.Close();

        if (dtUser != null && dtUser.Rows.Count > 0)
        {
            foreach (DataRow drUser in dtUser.Rows)
            {
                if (!drUser["UserID"].Equals(DBNull.Value))
                {
                    Session["UserID"] = drUser["UserID"].ToString();
                }
                if (!drUser["UserName"].Equals(DBNull.Value))
                {
                    Session["UserName"] = drUser["UserName"].ToString();
                }
                if (!drUser["FullName"].Equals(DBNull.Value))
                {
                    Session["FullName"] = drUser["FullName"].ToString();
                }
                if (!drUser["Permission"].Equals(DBNull.Value))
                {
                    Session["Permission"] = drUser["Permission"].ToString();
                }
                break;
            }

            // Session["UserName"] = txtUserName.Text.ToString();
            Response.Redirect("~/Home");
        }
        else
        {
            lblMessage.Text = "Your Username or Password is Incorrect.";
            lblMessage.ForeColor = Color.Red;
            txtUserName.Text = "";
            txtPassword.Text = "";
            txtUserName.Focus();

        }
    }
    #endregion
}