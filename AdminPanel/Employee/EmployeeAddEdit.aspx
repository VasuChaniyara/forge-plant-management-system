<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Defult.master" AutoEventWireup="true" CodeFile="EmployeeAddEdit.aspx.cs" Inherits="AdminPanel_Employee_EmployeeAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" Runat="Server">
    <br /><br /><br />
    <div class="container" style="padding-top: 10px;">
        <div class="row">
            <div class="col-md-12"><h1>
                <asp:Label ID="lblPageHeader" runat="server"></asp:Label>
                </h1>
                <br />
                <asp:Label ID="lblMessage" runat="server" EnableViewState="false"></asp:Label>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-lable">Customer Name</label>
            <div class="col-sm-10">
                <asp:TextBox runat="server" ID="txtEmployeeName" CssClass="form-control" placeholder="Enter Customer Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmployeeName" runat="server" ControlToValidate="txtEmployeeName" Display="Dynamic" ErrorMessage="Enter Customer Name" ForeColor="Red" ValidationGroup="Employee"></asp:RequiredFieldValidator>
            </div> 
        </div>

         <div class="form-group row">
             <label class="col-sm-2 col-form-lable">Address</label>
             <div class="col-sm-10">
                 <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Address"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" Display="Dynamic" ForeColor="Red" ErrorMessage="Enter Address" ValidationGroup="Employee"></asp:RequiredFieldValidator>
             </div>
         </div>


        <div class="form-group row">
            <label class="col-sm-2 col-form-lable">CategoryName</label>
            <div class="col-sm-4">
                <asp:DropDownList ID="ddlEmployeeWiseCategory" runat="server" CssClass="form-control" >
               
                </asp:DropDownList>
            </div> 
        </div>

       <div class="form-group row">
             <label class="col-sm-2 col-form-lable">Mobile No.</label>
             <div class="col-sm-4">
                 <asp:TextBox ID="txtMobileNo" runat="server" TextMode="Phone" CssClass="form-control" placeholder="Enter Mobile Number" MaxLength="10"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rfvMobileNo" runat="server" ControlToValidate="txtMobileNo" Display="Dynamic" ErrorMessage="Enter Mobile Numner" ForeColor="Red" ValidationGroup="Employee"></asp:RequiredFieldValidator>
             </div>
           </div>
          


        <div class="form-group row">
            <div class="col-sm-10"></div>
            <div class="col-sm-2">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary pull-right" OnClick="btnSave_Click"  ValidationGroup="Employee"/>&nbsp;
                <asp:HyperLink ID="hlCancel" runat="server" Text="Cancel" NavigateUrl="~/EmployeeList" CssClass="btn btn-danger" ></asp:HyperLink>
             </div>
        </div>    
    </div>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScript" runat="server"></asp:Content>


