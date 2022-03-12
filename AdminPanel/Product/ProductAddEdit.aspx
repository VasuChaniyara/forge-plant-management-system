<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Defult.master" AutoEventWireup="true" CodeFile="ProductAddEdit.aspx.cs" Inherits="AdminPanel_Product_ProductAddEdit" %>

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
            <label for="txtProductName" class="col-sm-2 col-form-lable">Product Name</label>
            <div class="col-sm-10">
                <asp:TextBox runat="server" ID="txtProductName" CssClass="form-control" placeholder="Enter Product Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvProductName" runat="server" ControlToValidate="txtProductName" Display="Dynamic" ErrorMessage="Enter Product Name" ForeColor="Red" ValidationGroup="Productad"></asp:RequiredFieldValidator>
            </div> 
        </div>
        <div class="form-group row">
            <label for="txtProductWiseUse" class="col-sm-2 col-form-lable">ProductWiseUse</label>
            <div class="col-sm-10">
                <asp:TextBox runat="server" ID="txtProductWiseUse" CssClass="form-control" placeholder="Enter Product Wise Use"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvProductWiseUse" runat="server" ControlToValidate="txtProductWiseUse" Display="Dynamic" ErrorMessage="Enter Product Wise Use" ForeColor="Red"  ValidationGroup="Productad"></asp:RequiredFieldValidator>
            </div> 
        </div>
         <div class="form-group row">
            <label for="txtQuantityAmount" class="col-sm-2 col-form-lable">QuantityAmount</label>
            <div class="col-sm-4">
                <asp:TextBox runat="server" ID="txtQuantityAmount" CssClass="form-control" placeholder="Enter Quantity Amount"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvQuantityAmount" runat="server" ControlToValidate="txtQuantityAmount" Display="Dynamic" ErrorMessage="Enter Quantity Amount" ForeColor="Red"  ValidationGroup="Productad"></asp:RequiredFieldValidator>
            </div> 
        </div>
        <div class="form-group row">
            <div class="col-sm-10"></div>
            <div class="col-sm-2">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary pull-right" OnClick="btnSave_Click"  ValidationGroup="Productad"/>&nbsp;
                <asp:HyperLink ID="hlCancel" runat="server" Text="Cancel" NavigateUrl="~/ProductList" CssClass="btn btn-danger" ></asp:HyperLink>
             </div>
        </div>    
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScript" runat="server"></asp:Content>
