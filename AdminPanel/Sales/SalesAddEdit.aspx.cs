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

public partial class AdminPanel_Sales_SalesAddEdit : System.Web.UI.Page
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
            if (Request.QueryString["SalesID"] != null)
            {
                #region Load Data in Edit Mode
                LoadControls(Convert.ToInt32(Request.QueryString["SalesID"]));
                lblPageHeader.Text = "Sales Product Edit";
                #endregion Load Data in Edit Mode
            }
            else
            {
                lblPageHeader.Text = "Sales Product Add";
            }
        }
    }
    #endregion

    #region FillDropDownList
    private void FillDropDownList(Int32 UserID)
    {
        SqlConnection objConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ForgePlantManagementConnectionString"].ConnectionString);
        objConnection.Open();
        SqlCommand objCmd = objConnection.CreateCommand();
        objCmd.CommandType = CommandType.StoredProcedure;
        objCmd.CommandText = "PR_Sales_SelectDropDownListByUserID";
        objCmd.Parameters.AddWithValue("@UserID", UserID);

        // objCmd.Parameters.AddWithValue("@UserName", Session["UserName"].ToString());

        objCmd.CommandText = "PR_Product_SelectDropDownListByUserID";
        SqlDataReader objSDRProduct = objCmd.ExecuteReader();
        ddlProduct.DataSource = objSDRProduct;
        ddlProduct.DataTextField = "ProductName";
        ddlProduct.DataValueField = "ProductID";
        ddlProduct.DataBind();
        ddlProduct.Items.Insert(0, "Select Product Name");
        objSDRProduct.Close();

        objConnection.Close();
    }
    #endregion

    #region LoadControls
    private void LoadControls(Int32 SalesID)
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
                     objCmd.CommandText = "PR_Sales_SelectByPK";
                     objCmd.Parameters.AddWithValue("@SalesID", SalesID);
                     #endregion Prepare Command

                    #region ReadData and Set Controls
                    SqlDataReader objSDR = objCmd.ExecuteReader();

        if (objSDR.HasRows == true)
        {
            while (objSDR.Read() == true)
            {

                if (!objSDR["SalesAmount"].Equals(DBNull.Value))
                {
                    txtSalesAmount.Text = objSDR["SalesAmount"].ToString();
                }

                if (!objSDR["AvailableQuantity"].Equals(DBNull.Value))
                {
                    txtAvailableQuantity.Text = objSDR["AvailableQuantity"].ToString();
                }

                if (!objSDR["ProductID"].Equals(DBNull.Value))
                {
                    ddlProduct.SelectedValue = objSDR["ProductID"].ToString();
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
        SqlString strSalesAmount = SqlString.Null;
        SqlString strAvailableQuantity = SqlString.Null;



        if (txtSalesAmount.Text.Trim() != "")
            strSalesAmount = txtSalesAmount.Text.Trim();
        if (txtAvailableQuantity.Text.Trim() != "")
            strAvailableQuantity = txtAvailableQuantity.Text.Trim();



        using (SqlConnection objConn = new SqlConnection(DatabaseConfig.ConnectionString))
        {
            objConn.Open();
            using (SqlCommand objCmd = objConn.CreateCommand())
            {
                try
                {
                    #region Prepare Command
                    objCmd.CommandType = CommandType.StoredProcedure;

        if (Request.QueryString["SalesID"] == null)
        {
            objCmd.CommandText = "PR_Sales_Insert";
            objCmd.Parameters.AddWithValue("@ProductID", ddlProduct.SelectedValue);

            objCmd.Parameters.AddWithValue("@SalesAmount", strSalesAmount);
            objCmd.Parameters.AddWithValue("@AvailableQuantity", strAvailableQuantity);
            objCmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(Session["UserID"]));
           


        }
        else
        {
            objCmd.CommandText = "PR_Sales_UpdateByPK";
            objCmd.Parameters.AddWithValue("@ProductID", ddlProduct.SelectedValue);

            objCmd.Parameters.AddWithValue("@SalesID", Request.QueryString["SalesID"].ToString());
            objCmd.Parameters.AddWithValue("@SalesAmount", strSalesAmount);
            objCmd.Parameters.AddWithValue("@AvailableQuantity", strAvailableQuantity);
            objCmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(Session["UserID"]));
        

        }
                #endregion Prepare Command
        objCmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message.ToString();
                }
                finally
                {
                    if (Request.QueryString["SalesID"] == null)
                    {
                         lblMessage.Text = "Data Inserted Successfuly.....";
                         txtSalesAmount.Text = "";
                         txtAvailableQuantity.Text = "";
                         txtSalesAmount.Focus();
                    }
        else
        {
            Response.Redirect("~/SalesList");
        }
                    if (objConn.State == ConnectionState.Open)
                        objConn.Close();
                }
            }
        }
    }
    #endregion
}