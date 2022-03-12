<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="AdminPanel_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
     <link href="~/Content/css/bootstrap.min.css" rel="stylesheet" />
    <link href="~/Content/css/bootstrap-theme.min.css" rel="stylesheet" />
    <script src="~/content/js/bootstrap.min.js" ></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container" style="padding-top: 50px;">
        <div class="row">
            <div class="col-md-12"><h1>
                Forge Plant Supply Chain Management
                </h1>
                <br />
                <asp:Label ID="lblMessage" runat="server" EnableViewState="false"></asp:Label>
            </div>
        </div>
        <div class="form-group row">
            <label for="txtUserName" class="col-sm-2 col-form-lable">User Name</label>
            <div class="col-sm-4">
                <asp:TextBox runat="server" ID="txtUserName" CssClass="form-control" placeholder="Enter User Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="Enter User Name" ForeColor="Red"></asp:RequiredFieldValidator>
            </div> 
        </div>
        <div class="form-group row">
            <label for="txtPassword" class="col-sm-2 col-form-lable">Password</label>
            <div class="col-sm-4">
                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" placeholder="Enter Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
            </div> 
        </div>
        <div class="form-group row">
            
            <div class="col-sm-4">
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary pull-right" OnClick="btnLogin_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="hlCancel" runat="server" Text="Cancel" NavigateUrl="~/User/Login" CssClass="btn btn-danger" ></asp:HyperLink>
             </div>
        </div>    
       <h4 style="padding:10px;padding-left:95px">New here? Create an account now
         <asp:HyperLink ID="h1Add" runat="server" NavigateUrl="~/User/AddUser">Sign Up</asp:HyperLink></h4><br />
    </div>
    </form>
</body>
</html>