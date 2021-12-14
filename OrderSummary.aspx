<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrderSummary.aspx.cs" Inherits="OrderSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .extra
        {
            float:left;

        }
        .help{
            background:	#FFF8DC;
            margin:10px;
            width:235px;
            float:left;
            padding:10px;
            font-weight:bolder;
            text-align:center;
             height:150px;
             margin-top:25px;
           
        }
        .help h4, .guarantee h4
        {
            font-weight:bold;
        }
        .guarantee
        
        {   text-align:center;
            width:235px;
            padding:10px;
            margin:10px;
            margin-top:25px;
            background:#FFF8DC;
            float:right;
            font-weight:bolder;
            height:150px;
        }
         .form
        {
             width: 650px;
    padding: 8% 0 0;
    position: relative;
    z-index: 1;
    background: #FFFFFF;
    max-width: 650px;
    padding: 45px;
    text-align:left;
    margin-top: 20px;
    height:1300px;
    box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
            top: 5px;
            left: 0px;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 100px;
        }
         .order{
             float:left;
             
         }
         .address{width:200px;
             float:right;
             padding-left:20px;
             text-align:right;
         }
         .image{
             float:left;
         }
         .table{
             border:none;
         }
         .left
         {      font-size:14px;
                font-weight:bolder;
             text-align:left;
         }
         .right
         {  font-size:14px;
             text-align:right;
             width:40px;
             font-weight:bolder;
         }
         .image{
         float:left;
         border:none;
         width:250px;
         height:220px;

         }
          .icons
        {
            width:18px;
            height:18px;
        }
           .other
        {
                   }

              .Carname{
            font-size:18px;
            line-height:40px;
            font-weight:bolder;
        }
         .summary{
             float:left;
         }
        .spec {
            float: right;
            width: 250px;
            border: none;
            height:250px;
            line-height:20px;
            text-align:justify;
        }
        .price{
            float:left;
            border:none;
            width:500px;
        }

  .gray
        {
            display:inline;
           
            font-size:14px;
            font-weight:bold;
        } 
         .onroad{
             padding-left:5px;
             float:left;
             font-weight:bold;
             font-size:20px;
         }
         .onroadprice{
             float:right;
             font-weight:bold;
             font-size:20px;
         }
         .table
         {text-align:center;
             padding-left:30px;
             
         }
         h1,h2,p{
             text-align:center;
         }
         h1{
             font-weight:bold;
             font-size:40px;
         }
         h3
         {  padding-left:2px;
             font-weight:bold;
             background:#FFF8DC;
             padding-top:5px;
             padding-bottom:5px;
         }
         h4
         {font-weight:bold;}
         .thanks
         {
             width:320px;
             position:relative;
             left:100px;
             font-weight:bolder;
         }
         .anchor{
             position:relative;
             top:20px;
         }
         .a
         {
             text-align:center;}
        .CarImage1 {
            height: 60px;
            width: 80px;
           
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server" class="form">
    
     <div style="margin-left:225px; width:80px;"><img src="Images/if_Mercedes__SL_88293.ico" class="CarImage1" /></div><h1>Carvanza</h1>

        <h2><b>THANKS FOR YOUR BOOKING</b></h2>
        <p class="thanks">Hi <asp:Label runat="server" ID="fName"></asp:Label>, we have received your booking
        #<asp:Label runat="server"  ID="OrderNo"></asp:Label>. One of our employees will surely attend you.</p>
        <h3>ORDER INFORMATION</h3>
        <div>
        <div class="order">
            <h4>ORDER DETAILS</h4>
            
            <b>Customer Name : </b><asp:Label runat="server" ID="fName2"></asp:Label>&nbsp;<asp:Label runat="server" Text="lname" ID="LName"></asp:Label>
            <br />
            <b>Order# : </b><asp:Label runat="server" ID="OrderNo2"></asp:Label>
            <br />
            <b>Customer# : </b><asp:Label runat="server"  ID="CustomerID"></asp:Label>
        </div>
        <div class="address">
            <h4>ADDRESS</h4>

            <asp:Label runat="server"  ID="Address"></asp:Label>

        </div>
        </div>
        <br />
        <div class="summary">
            <h3>CAR BOOKED</h3>
            <br />
            <div class="image">
                <asp:Image runat="server" ID="Image" Width="200px" Height="200px"/>
               

            </div>
            <div class="spec">
                
                 <asp:Label ID="CarName" runat="server" CssClass="Carname"></asp:Label>
                <br />
                  <div class="gray">Transmission :&nbsp;</div>
            <asp:Label ID="Transmission" runat="server"  CssClass="other"></asp:Label>
           <br />
            <div class="gray"> Category &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp; </div>
            <asp:Label ID="Category" runat="server"  CssClass="other"></asp:Label>
            <br />
            
            <div class="gray">
            Fuel Type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;</div>
            <asp:Label ID="Fuel" runat="server"  CssClass="other"></asp:Label>
            <br />
        
            <div class="gray">
            Colour &nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;</div>
            <asp:Label ID="Color" runat="server" CssClass="other"></asp:Label>
            <br />
                </div>


            <div class="price">
                <h3>BOOKING SUMMARY</h3>
                <br />
                <table runat="server" class="table">
                    <tr>
                        <td class="left">
                            Ex-showroom Price
                        </td>
                        <td class="right">
                            <asp:Label runat="server"  ID="Price"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">
                           RTO
                        </td>
                        <td class="right">
                            <asp:Label runat="server"  ID="RTO"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">
                            Insurance
                        </td>
                        <td class="right">
                            <asp:Label runat="server" ID="Insurance"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">
                            Others
                        </td>
                        <td class="right">
                            <asp:Label runat="server" Text=" ₹10000"  ID="Others"></asp:Label>
                        </td>
                    </tr>
                </table>
              
                <div class="onroad">ON ROAD PRICE</div>
                <asp:Label runat="server"  ID="onRoad" CssClass="onroadprice"></asp:Label>

            </div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <div class="extra">
            <div class="help">
                <h4>WE'RE HERE TO HELP</h4>
                <p>Call +91 9986037081/ +91 998061929 or send us an email to carvanza@gmail.com for expert assistance</p>
            </div>
            <div class="guarantee">
            <h4>OUR GUARANTEE</h4>
            <p>Your satisfaction is 100% guaranteed</p>
                </div>
        </div>
        <br />
        <a href="CHome.aspx" class="anchor"><div class="a">&lt&lt Back</div></a>
        </form>
</asp:Content>

