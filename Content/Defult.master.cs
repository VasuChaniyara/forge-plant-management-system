using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Defult : System.Web.UI.MasterPage
{
    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/User/Login");
            }
            if (Session["FullName"] != null)
            {
                lblUserName.Text = Session["FullName"].ToString();
            }
            if (Session["Permission"] == true.ToString())
            {
                HyperLink3.Visible = true;
                HyperLink4.Visible = true;
                HyperLink4.Visible = true;
                HyperLink5.Visible = false;
                HyperLink6.Visible = false;
                HyperLink7.Visible = false;
                HyperLink8.Visible = false;
                HyperLink9.Visible = false;

            }

        }


    }
    #endregion Page_Load

    #region Logout_Click
    protected void hlLogout_Click(object sender, EventArgs e)
    {
        Session["UserName"] = null;
        Response.Redirect("~/User/Login");
    }
}
    #endregion Logout_Click
