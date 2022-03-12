using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Product_ProductList : System.Web.UI.Page
{
    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!Page.IsPostBack)
        {
            if (Session["UserID"] != null)
            {
                FillProductGridView(Convert.ToInt32(Session["UserID"]));
            }
            if (Session["Permission"] == true.ToString())
            {
                hlProductADD.Visible = true;   
            }
            else
            {
                gvProduct.Columns[0].Visible = false;
                gvProduct.Columns[1].Visible = false;
                gvProduct.Columns[4].Visible = false;
            }
        }
    }
    #endregion

    #region gvProduct_RowCommand
    protected void gvProduct_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        #region Delete Record
        if (e.CommandName == "DeleteRecord" && e.CommandArgument != null)
        {
            DeleteProduct(Convert.ToInt32(e.CommandArgument));
            FillProductGridView(Convert.ToInt32(Session["UserID"]));
        }
        #endregion Delete Record
    }
    #endregion


    #region FillProductGridView
    private void FillProductGridView(Int32 UserID)
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
                     objCmd.CommandText = "PR_Product_SelectAll";
                     //objCmd.Parameters.AddWithValue("@UserID", UserID);   
                    #endregion Prepare Command
                    SqlDataReader objSDR = objCmd.ExecuteReader();
                    DataTable dtProduct = new DataTable();
                    dtProduct.Load(objSDR);

                    gvProduct.DataSource = dtProduct;
                    gvProduct.DataBind();
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

    #region DeleteProduct
    private void DeleteProduct(Int32 ProductID)
    {
        SqlConnection objConnection = new SqlConnection(DatabaseConfig.ConnectionString);
         try
        {
            objConnection.Open();

        SqlCommand objcmd = new SqlCommand();
        objcmd.Connection = objConnection;
        objcmd.CommandType = CommandType.StoredProcedure;
        objcmd.CommandText = "PR_Delete_ForignKey";
        objcmd.Parameters.AddWithValue("@ProductID", ProductID);


        objcmd.ExecuteNonQuery();
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