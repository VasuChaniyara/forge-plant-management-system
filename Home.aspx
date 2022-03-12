<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Defult.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" Runat="Server">
    <br />
    <br />
    <br />
   <div class="container"><br /><br />
       <div class="row">
           <div class="col-md-12">
    <asp:Image runat="server" ID="imgLogo" ImageAlign="Left" ImageUrl="~/Image/literary_fiction_nonfiction.jpg" Height="400px" Width="800px" />
              
           
                <h2 style="text-align:right"><i><asp:Label ID="lblum" runat="server"></asp:Label></i></h2><br />
                <h3 style="text-align:right"><i><asp:Label ID="lblun" runat="server"></asp:Label></i></h3>
               </div>
            </div>
   </div> 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScript" Runat="Server">
</asp:Content>

