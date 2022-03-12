<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Defult.master" AutoEventWireup="true" CodeFile="SalesList.aspx.cs" Inherits="AdminPanel_Sales_SalesList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" Runat="Server">
     <div class="container" style="padding-top:10px;">
        <div class="row">
            <div class="col-md-12"><br /><br /><br />
                <h1>Order Product List</h1>
                
               <br />
            </div>
            <asp:HyperLink ID="hlSalesADD" runat="server" Text="Add New Order Product" NavigateUrl="~/SalesAddEdit" CssClass="btn btn-primary"></asp:HyperLink>
        </div>
        <div class="row">
            <div class="col-md-12">
                 <asp:Label runat="server" ID="Label" EnableViewState="false" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <h3 style="text-align:center"><i>Display List Of Order Product</i></h3><br />
                <asp:GridView ID="gvSales" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover" OnRowCommand="gvSales_RowCommand" >
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink runat="server" ID="hlEdit" CssClass="btn btn-warning"  Text="Edit" NavigateUrl='<%# "~/SalesAddEdit?SalesID=" + Eval("SalesID").ToString().Trim() %>'><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp;EDIT</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" CommandName="DeleteRecord" CommandArgument=<%# Eval("SalesID") %> ><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>&nbsp;DELETE</asp:LinkButton>&nbsp;
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                        <asp:BoundField DataField="SalesAmount" HeaderText="Sales Product Amount" />
                        <asp:BoundField DataField="AvailableQuantity" HeaderText="AvailableQuantity" />
                        
                    </Columns>
                    <HeaderStyle BackColor="#b6b7bc" ForeColor="Red" Font-Names="Arial" Font-Size="18px"

                Font-Bold="true" HorizontalAlign="Center" />

            <AlternatingRowStyle BackColor="#D5E6F9" ForeColor="#284775" />

            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Names="Arial" Font-Size="15px"

                HorizontalAlign="Center" />

            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />

            <FooterStyle HorizontalAlign="Center" BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"

                Font-Names="Arial" Font-Size="9px" />
                </asp:GridView>
                <br />
                <asp:Label runat="server" ID="lblMessage" EnableViewState="false"></asp:Label>
            </div>
        </div>
       
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScript" runat="server"></asp:Content>




