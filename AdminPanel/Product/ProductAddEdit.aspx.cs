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

public partial class AdminPanel_Product_ProductAddEdit : System.Web.UI.Page
{
    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
    if (!Page.IsPostBack)
        {
            if (Request.QueryString["ProductID"] != null)
            {
                LoadControls(Convert.ToInt32(Request.QueryString["ProductID"]));
                lblPageHeader.Text = "Product Edit";
            }
            else
            {
                lblPageHeader.Text = "Product Add";
            }
        }

    }
    #endregion

    #region LoadControls
    private void LoadControls(Int32 ProductID)
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
                    objCmd.CommandText = "PR_Product_SelectByPK";
                    objCmd.Parameters.AddWithValue("@ProductID", ProductID);
                    #endregion Prepare Command

                    #region ReadData and Set Controls
                    SqlDataReader objSDR = objCmd.ExecuteReader();

        if (objSDR.HasRows == true)
        {
            while (objSDR.Read() == true)
            {
                if (!objSDR["ProductName"].Equals(DBNull.Value))
                {
                    txtProductName.Text = objSDR["ProductName"].ToString();
                }
                if (!objSDR["ProductWiseUse"].Equals(DBNull.Value))
                {
                    txtProductWiseUse.Text = objSDR["ProductWiseUse"].ToString();
                }
                 if (!objSDR["QuantityAmount"].Equals(DBNull.Value))
                {
                    txtQuantityAmount.Text = objSDR["QuantityAmount"].ToString();
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
        SqlString strProductName = SqlString.Null;
        SqlString strProductWiseUse = SqlString.Null;
        SqlString strQuantityAmount = SqlString.Null;
        #endregion Local Variables

         #region Read Data
         if (txtProductName.Text.Trim() != "")
             strProductName = txtProductName.Text.Trim();

         if (txtProductWiseUse.Text.Trim() != "")
             strProductWiseUse = txtProductWiseUse.Text.Trim();

         if (txtQuantityAmount.Text.Trim() != "")
             strQuantityAmount = txtQuantityAmount.Text.Trim();
         #endregion Read Data

         using (SqlConnection objConn = new SqlConnection(DatabaseConfig.ConnectionString))
         {
             objConn.Open();
             using (SqlCommand objCmd = objConn.CreateCommand())
             {
                 try
                 {
                     objCmd.CommandType = CommandType.StoredProcedure;

                     if (Request.QueryString["ProductID"] == null)
                     {
                         objCmd.CommandText = "PR_Product_Insert";
                         objCmd.Parameters.AddWithValue("@ProductName", strProductName);
                         objCmd.Parameters.AddWithValue("@ProductWiseUse", strProductWiseUse);
                         objCmd.Parameters.AddWithValue("@QuantityAmount", strQuantityAmount);
                         objCmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(Session["UserID"]));
                     }
                     else
                     {
                         objCmd.CommandText = "PR_Product_UpdateByPK";
                         objCmd.Parameters.AddWithValue("@ProductID", Request.QueryString["ProductID"].ToString());
                         objCmd.Parameters.AddWithValue("@ProductName", strProductName);
                         objCmd.Parameters.AddWithValue("@ProductWiseUse", strProductWiseUse);
                         objCmd.Parameters.AddWithValue("@QuantityAmount", strQuantityAmount);
                         objCmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(Session["UserID"]));

                     }

                     objCmd.ExecuteNonQuery();
                     if (Request.QueryString["ProductID"] == null)
                     {
                         lblMessage.Text = "Data Inserted Successfuly.....";
                         txtProductName.Text = "";
                         txtProductWiseUse.Text = "";
                         txtQuantityAmount.Text = "";
                         txtProductName.Focus();
                     }
                     else
                     {
                         Response.Redirect("~/ProductList");
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