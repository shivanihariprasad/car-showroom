<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CarDetails.aspx.cs" Inherits="CarDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title></title>
    <style>
        .container{
             width: 1000px;
   
    position: relative;
    z-index: 1;
    background: #FFFFFF;
    max-width: 1125px;
    
    margin: 0 auto 50px;
    height:auto;
   
    text-align:left;
   
    
    box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        
        
              padding: 20px;
    border: 1px solid #77aaff;
    box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }
        .image
        { vertical-align:middle;
            padding:20px;
           padding-top:40px;
            /*border-right:solid;
            border-right-color:#b3b3b3;
            border-right-width:thin;*/
            width:295px;
            height:235px;
            display:inline-block;
            float:left;
            
        }
        .description{
          
            /*position:relative;
            bottom:250px;
            left:350px;*/
            float:right;
            width:600px;
             text-align:justify;
            font-family:Arial;
            padding:20px;
            border-left:solid;
            border-left-color:#b3b3b3;
            border-left-width:thin;
        }
        .gray
        {
            display:inline;
            color:#968b8b;
            font-size:14px;
            font-weight:bold;
        }
        .name{
            font-size:18px;
            font-weight:bolder;
        }
        .price
        {   display:inline;
            font-size:30px;
            font-weight:bold;

            
        }
        .other
        {
            font-weight:bolder;
        }
        .details{
            font-weight:500;
            line-height:25px;
            text-align:justify;
        }
        .icons
        {
            width:18px;
            height:18px;
        }
          .big_icon
        {   position:relative;
            width:30px;
            height:30px;
            bottom:5px;
        }
        .book{
            float:right;
          
           background: #f23d18;
    border: medium none;
    
    color: #fff;
    display: block;
    font-weight:bolder;
    font-size: 14px;
    height: 40px;
    text-transform: uppercase;
    
    width: 207px;
        }
        .terms{
            font-size:12px;
            position:relative;
            top:30px;
            left:10px;
            color:#b3b3b3;
        }
    </style>
    


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server">
       
    <div class="container">
        <div class="image">
             <asp:Image  CssClass="image" ID="Image" runat="server" ImageUrl='<%#Eval("Image")%>' /> 
        </div>
        <div class="description">
            
            <asp:Label ID="Name" runat="server" Text='<%#Eval("Model")%>'  CssClass="name"></asp:Label>
            <br />
            <img src="Images/money.ico" class="big_icon"/>
              <asp:Label ID="Price" runat="server" Text='<%#Eval("Price")%>' CssClass="price"></asp:Label><div class="price"><sup>*</sup></div>
            <br />
            <div class="gray"><img src="Images/transmission.ico" class="icons"/>  Transmission : </div>
            <asp:Label ID="Transmission" runat="server" Text='<%#Eval("Transmission")%>'  CssClass="other"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="Images/category.ico" class="icons"/> 
            <div class="gray"> Category : </div>
            <asp:Label ID="Category" runat="server" Text='<%#Eval("VehicleType")%>'  CssClass="other"></asp:Label>
            <br />
            <img src="Images/if_fuel_103260.ico" class="icons"/>
            <div class="gray">
            Fuel Type:</div>
            <asp:Label ID="Fuel" runat="server"  Text='<%#Eval("fuelType")%>' CssClass="other"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <img src="Images/color.ico" class="icons"/>
            <div class="gray">
            Colour:</div>
            <asp:Label ID="Color" runat="server" Text='<%#Eval("Color")%>'  CssClass="other"></asp:Label>
            <br />
            <br />
         <div class="gray">   Description:</div>
            <br />
            <asp:Label ID="Description" CssClass="details" runat="server" Text='<%#Eval("Description")%>' >
             </asp:Label>
            <br />
            <br /> 
            <div class="terms">*Price indicated is Ex-Showroom Price</div>
            <asp:Button ID="Book" Text="BOOK CAR" OnClick="Book_Click" CssClass="book" runat="server"></asp:Button>
        </div>

        </div>
    
        </form>

</asp:Content>


