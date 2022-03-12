using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel_Sales_SalesList : System.Web.UI.Page
{
    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["UserID"] != null)
            {
                FillSalesGridView(Convert.ToInt32(Session["UserID"]));
            }
        }

    }
    #endregion

    #region FillSalesGridView
    private void FillSalesGridView(Int32 UserID)
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
                    objCmd.CommandText = "PR_Sales_SelectAllByUserID";
                    objCmd.Parameters.AddWithValue("@UserID", UserID);
                    #endregion Prepare Command

                    SqlDataReader objSDR = objCmd.ExecuteReader();
                    DataTable dtSales = new DataTable();
                    dtSales.Load(objSDR);

                    gvSales.DataSource = dtSales;
                    gvSales.DataBind();
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

    #region gvSales_RowCommand
    protected void gvSales_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRecord" && e.CommandArgument != null)
        {
            DeleteSales(Convert.ToInt32(e.CommandArgument));
            FillSalesGridView(Convert.ToInt32(Session["UserID"]));
        }
    }
    #endregion

    #region DeleteSales
    private void DeleteSales(Int32 SalesID)
    {
        SqlConnection objConnection = new SqlConnection(DatabaseConfig.ConnectionString);
        objConnection.Open();
        try
        { 
            SqlCommand objCmd = new SqlCommand();
            objCmd.Connection = objConnection;
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandText = "PR_Sales_DeleteByPK";
            objCmd.Parameters.AddWithValue("@SalesID", SalesID);
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