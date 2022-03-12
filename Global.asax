﻿<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        RegisterRoutes(System.Web.Routing.RouteTable.Routes);
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

    public static void RegisterRoutes(System.Web.Routing.RouteCollection routes)
    {
        routes.Ignore("{resource}.axd/{*pathInfo}");

        routes.MapPageRoute(
            "LoginRoute",
            "User/Login",
            "~/User/Login.aspx");

        routes.MapPageRoute(
            "LoginAddRoute",
            "User/AddUser",
            "~/User/AddUser.aspx");


        routes.MapPageRoute(
            "HomeRoute",
            "Home",
            "~/Home.aspx");
        
        
         routes.MapPageRoute(
            "EmployeeRoute",
            "EmployeeList",
            "~/AdminPanel/Employee/EmployeeList.aspx");

         routes.MapPageRoute(
            "EmployeeAddRoute",
            "EmployeeAddEdit",
            "~/AdminPanel/Employee/EmployeeAddEdit.aspx");

         routes.MapPageRoute(
             "ProductRoute",
             "ProductList",
             "~/AdminPanel/Product/ProductList.aspx");

         routes.MapPageRoute(
           "ProductAddRoute",
           "ProductAddEdit",
           "~/AdminPanel/Product/ProductAddEdit.aspx");

         routes.MapPageRoute(
             "SalesRoute",
             "SalesList",
             "~/AdminPanel/Sales/SalesList.aspx");

         routes.MapPageRoute(
           "SalesAddRoute",
           "SalesAddEdit",
           "~/AdminPanel/Sales/SalesAddEdit.aspx");

         routes.MapPageRoute(
           "AboutUsRoute",
           "AboutUs",
           "~/AdminPanel/AboutUs/AboutUs.aspx");

         routes.MapPageRoute(
           "QualityRoute",
           "Quality",
           "~/AdminPanel/Quality/Quality.aspx");

         routes.MapPageRoute(
            "ProcessRoute",
            "Process",
            "~/AdminPanel/Process/Process.aspx");

         routes.MapPageRoute(
             "InfrastructureRoute",
             "Infrastructure",
             "~/AdminPanel/Infrastructure/Infrastructure.aspx");

         routes.MapPageRoute(
              "ContactUsRoute",
              "ContactUs",
              "~/AdminPanel/ContactUs/ContactUs.aspx");
        
    }
       
</script>
