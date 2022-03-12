<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddUser.aspx.cs" Inherits="User_AddUser" %>

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
                New User Login Here!!!
                </h1>
                <br />
                <asp:Label ID="lblMessage" runat="server" ForeColor="Black" EnableViewState="false"></asp:Label>
                <asp:Label ID="lblerror" runat="server" ForeColor="red" EnableViewState="false"></asp:Label>
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
            <label for="txtFullName" class="col-sm-2 col-form-lable">FullName</label>
            <div class="col-sm-4">
                <asp:TextBox runat="server" ID="txtFullName" CssClass="form-control" placeholder="Enter FullName Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName" Display="Dynamic" ErrorMessage="Enter Full Name" ForeColor="Red"></asp:RequiredFieldValidator>
            </div> 
        </div>
         <div class="form-group row">
            <label for="txtAddress" class="col-sm-2 col-form-lable">Address</label>
            <div class="col-sm-4">
                <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control" placeholder="Enter Address"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" Display="Dynamic" ErrorMessage="Enter Address" ForeColor="Red"></asp:RequiredFieldValidator>
            </div> 
        </div>
         <div class="form-group row">
            <label for="txtEmailID" class="col-sm-2 col-form-lable">EmailID</label>
            <div class="col-sm-4">
                <asp:TextBox runat="server" ID="txtEmailID" TextMode="Email" CssClass="form-control" placeholder="example@gmail.com"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmailID" runat="server" ControlToValidate="txtEmailID" Display="Dynamic" ErrorMessage="Enter EmailID" ForeColor="Red"></asp:RequiredFieldValidator>
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
            <label for="txtRe-Type Password" class="col-sm-2 col-form-lable">Re-Type Password</label>
            <div class="col-sm-4">
                <asp:TextBox runat="server" ID="txtRePassword" TextMode="Password" CssClass="form-control" placeholder="Enter  Re-Type Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvRePassword" runat="server" ControlToValidate="txtRePassword" Display="Dynamic" ErrorMessage="Enter Correct Password" ForeColor="Red"></asp:RequiredFieldValidator>
            </div> 
        </div>
        <div class="form-group row">
            
            <div class="col-sm-4">
                <asp:Button ID="btnSave" runat="server" Text="Submit" CssClass="btn btn-primary pull-right" OnClick="btnSave_Click"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="hlCancel" runat="server" Text="Cancel" NavigateUrl="~/User/Login" CssClass="btn btn-danger" ></asp:HyperLink>
             </div>
        </div>    
    </div>
   </form>
</body>
</html>