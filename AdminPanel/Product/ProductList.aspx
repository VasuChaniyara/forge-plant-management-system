<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Defult.master" AutoEventWireup="true" CodeFile="ProductList.aspx.cs" Inherits="AdminPanel_Product_ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" Runat="Server">
    <div class="container" style="padding-top:10px;">
        <div class="row">
            <div class="col-md-12"><br /><br /><br />
                <h1>Product List</h1>
                
               <br />
            </div>
            <asp:HyperLink ID="hlProductADD" runat="server" Text="Add New Product" NavigateUrl="~/ProductAddEdit" CssClass="btn btn-primary" Visible="False"></asp:HyperLink>
        </div>
        <br />

         <!-- Slideshow container -->
<div class="slideshow-container">

  <!-- Full-width images with number and caption text -->
  <div class="mySlides fade">
    <div class="numbertext">1 / 4</div>
    <asp:Image runat="server" ID="imgSide1" ImageUrl="~/Image/index.jpg" Width="100%" />
  </div>

  <div class="mySlides fade">
    <div class="numbertext">2 / 4</div>
    <asp:Image runat="server" ID="imgSide2" ImageUrl="~/Image/index2.jpg" Width="100%" />
  </div>

  <div class="mySlides fade">
    <div class="numbertext">3 / 4</div>
    <asp:Image runat="server" ID="Image1" ImageUrl="~/Image/index3.jpg" Width="100%" />
  </div>

    <div class="mySlides fade">
    <div class="numbertext">4 / 4</div>
    <asp:Image runat="server" ID="Image2" ImageUrl="~/Image/index4.jpg" Width="100%" />
  </div>

  <!-- Next and previous buttons -->
  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>
<br/>

<!-- The dots/circles -->
<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span>
  <span class="dot" onclick="currentSlide(2)"></span>
  <span class="dot" onclick="currentSlide(3)"></span>
  <span class="dot" onclick="currentSlide(4)"></span>
</div> 
  
        <div class="row">
            <div class="col-md-12">
                 <asp:Label runat="server" ID="Label" EnableViewState="false" />
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <h3 style="text-align:center"><i>Display List Of Product</i></h3><br />
                <asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="false" CssClass="table table-hover" OnRowCommand="gvProduct_RowCommand">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink runat="server" ID="hlEdit" CssClass="btn btn-warning" Text="Edit" NavigateUrl='<%# "~/ProductAddEdit?ProductID=" + Eval("ProductID").ToString().Trim() %>' Visible="True"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> &nbsp;EDIT</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-danger"  Text="Delete" CommandName="DeleteRecord" CommandArgument=<%# Eval("ProductID") %> Visible="True"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>&nbsp;DELETE</asp:LinkButton>&nbsp;
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ProductName" HeaderText="ProductName" />
                        <asp:BoundField DataField="ProductWiseUse" HeaderText="ProductWiseUse" />
                        <asp:BoundField DataField="QuantityAmount" HeaderText="QuantityAmount" />
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
<asp:Content ID="Content3" ContentPlaceHolderID="cphScript" runat="server">
     <script type="text/javascript">
         //write JavaScript code here  

         var slideIndex = 1;
         showSlides(slideIndex);

         // Next/previous controls
         function plusSlides(n) {
             showSlides(slideIndex += n);
         }

         // Thumbnail image controls
         function currentSlide(n) {
             showSlides(slideIndex = n);
         }

         function showSlides(n) {
             var i;
             var slides = document.getElementsByClassName("mySlides");
             var dots = document.getElementsByClassName("dot");
             if (n > slides.length) { slideIndex = 1 }
             if (n < 1) { slideIndex = slides.length }
             for (i = 0; i < slides.length; i++) {
                 slides[i].style.display = "none";
             }
             for (i = 0; i < dots.length; i++) {
                 dots[i].className = dots[i].className.replace(" active", "");
             }
             slides[slideIndex - 1].style.display = "block";
             dots[slideIndex - 1].className += " active";
         }
        </script>  
</asp:Content>
