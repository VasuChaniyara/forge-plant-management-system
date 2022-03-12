<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Defult.master" AutoEventWireup="true" CodeFile="SalesAddEdit.aspx.cs" Inherits="AdminPanel_Sales_SalesAddEdit" %>

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
            <label class="col-sm-2 col-form-lable">ProductName</label>
            <div class="col-sm-4">
                <asp:DropDownList ID="ddlProduct" runat="server" CssClass="form-control" ></asp:DropDownList>
            </div> 
        </div>

        <div class="form-group row">
             <label class="col-sm-2 col-form-table">SalesAmount</label>
             <div class="col-sm-4">
                 <asp:TextBox ID="txtSalesAmount" runat="server" CssClass="form-control" placeholder="Enter Sales Amount"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rfvSalesAmount" runat="server" ControlToValidate="txtSalesAmount" Display="Dynamic" ErrorMessage="Enter Sales Amount" ForeColor="Red" ValidationGroup="Sales"></asp:RequiredFieldValidator>
             </div> 
            </div>
        <div class="form-group row">
             <label class="col-sm-2 col-form-lable">AvailableQuantity</label>
             <div class="col-sm-4">
                 <asp:TextBox ID="txtAvailableQuantity" runat="server" CssClass="form-control" placeholder="Enter Available Quantity"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rfvAvailableQuantity" runat="server" ControlToValidate="txtAvailableQuantity" Display="Dynamic" ErrorMessage="Enter Available Quantity" ForeColor="Red" ValidationGroup="Sales"></asp:RequiredFieldValidator>
             </div>
         </div> 


        <div class="form-group row">
            <div class="col-sm-4"></div>
            <div class="col-sm-2">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary pull-right" OnClick="btnSave_Click"  ValidationGroup="Sales" />&nbsp;
                <asp:HyperLink ID="hlCancel" runat="server" Text="Cancel" NavigateUrl="~/SalesList" CssClass="btn btn-danger" ></asp:HyperLink>
             </div>
        </div>    
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScript" runat="server"></asp:Content>


