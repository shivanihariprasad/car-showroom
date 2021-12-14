<%@ Page Title="Register" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       
    <link rel="stylesheet" type="text/css" href="CRegister.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <title>Register Page</title>
    <style>
        .form {
    width: 500px;
    padding: 8% 0 0;
    margin: auto;
    position: relative;
    z-index: 1;
    background: #FFFFFF;
    max-width: 500px;
    margin: 0 auto 100px;
    padding: 45px;
    text-align:left;
    margin-top: 20px;
    box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
        h1{font-weight:bold;
            text-align:center;}
        .labels
        {font-weight:bold;
         font-size:14px;
         padding-bottom:5px;

        }
    .form .message {
        margin: 15px 0 0;
        color: #b3b3b3;
        font-size: 12px;
        text-align:center;
    }

        .form .message a {
            color: #4CAF50;
            text-decoration: none;
            text-align:center;
            width:600px;
        }

    .form .login_type {
        color: #b3b3b3;
        text-align:left;
    }
        .RegisterButton {
			width:60px;
			align-content:center;
            font-family: "Roboto", sans-serif;
		text-transform: uppercase;
		outline: 0;
		background: #4CAF50;
		width: 100%;
		border: 0;
		padding: 15px;
		color: #FFFFFF;
		font-size: 14px;
		-webkit-transition: all 0.3 ease;
		transition: all 0.3 ease;
		cursor: pointer;
		}
        .RegisterButton:hover, .RegisterButton:active, .RegisterButton:focus {
			background: #43A047;
		}
		.validation {
			font-size:12px;
			color:red;
            text-align:left;
		}
     
        .Radio{

            font-size:12px;
            text-align:left;
        }
        
         body{
            background: #008AC2; /* fallback for old browsers */
    background: -webkit-linear-gradient(right, #008AC2, #8DC26F);
    background: -moz-linear-gradient(right, #008AC2, #8DC26F);
    background: -o-linear-gradient(right, #008AC2, #8DC26F);
    background: linear-gradient(to left, #008AC2, #8DC26F);
    font-family: "Roboto", sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
      }
          .image{
             height:75px;
             width:200px;
             margin-left:50px;

             
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <div class="form">
              <div class="image">
           <img src="Images/reg.jpg" class="image" />
      </div>
            <br />
                        <asp:Label Text="First Name : " runat="server" CssClass="labels"></asp:Label>
             
                        <asp:TextBox runat="server" ID="FirstName" placeholder="First Name"  CssClass="form-control"></asp:TextBox>
                 
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName" Text="First name is required" CssClass="validation"></asp:RequiredFieldValidator>
                        <br /><br />
             <asp:Label Text="Last Name : " runat="server" CssClass="labels"></asp:Label>
                        <asp:TextBox runat="server" ID="LastName" placeholder="Last Name"   CssClass="form-control"></asp:TextBox>
                
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="LastName" Text="Last name is required" CssClass="validation"></asp:RequiredFieldValidator>
                <br /><br />
            <asp:Label Text="Email : " runat="server" CssClass="labels"></asp:Label>
                        <asp:TextBox runat="server" ID="Email" placeholder="Email"   CssClass="form-control"></asp:TextBox>
               <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" Text="Email is required" CssClass="validation"></asp:RequiredFieldValidator>
                        <br /> 
                                    <asp:RegularExpressionValidator CssClass="validation" runat="server" ControlToValidate="Email" Text="Enter valid email" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">       
                        </asp:RegularExpressionValidator><br />
                  <asp:Label Text="Password : " runat="server" CssClass="labels"></asp:Label>
                        <asp:TextBox runat="server" placeholder="Password" CssClass="form-control" ID="Password" TextMode="Password"  ></asp:TextBox>

                  
                        <asp:RequiredFieldValidator CssClass="validation" Text="Password is required" ControlToValidate="Password" runat="server"></asp:RequiredFieldValidator>
                        <br />
                                     <asp:RegularExpressionValidator runat="server"
                            ErrorMessage="Should be atleast 7 characters" ControlToValidate="Password" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,100}$" CssClass="validation" /><br/>
              <asp:Label Text="Re-enter Password : " runat="server" CssClass="labels"></asp:Label>    
                        <asp:TextBox runat="server" CssClass="form-control" placeholder="Re-enter Password" ID="CPassword" TextMode="Password"  ></asp:TextBox>

                  
                        <asp:RequiredFieldValidator CssClass="validation" Text="Enter Password" ControlToValidate="CPassword" runat="server"></asp:RequiredFieldValidator>
                    <br />    
                        <asp:CompareValidator
                            runat="server"
                            ControlToCompare="Password"
                            ControlToValidate="CPassword"
                            ErrorMessage="Your passwords do not match"
                            Display="Dynamic" CssClass="validation" />
              <br />
                        <asp:Label Text="Gender :" runat="server" CssClass="labels"></asp:Label>
               
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="Radio">
                            <asp:ListItem Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F" Selected="True">Female</asp:ListItem>

                        </asp:RadioButtonList>
                  
                  <br />  
             <asp:Label Text="Address : " runat="server" CssClass="labels"></asp:Label>
                        <asp:TextBox Rows="4" runat="server" TextMode="multiline" ID="Address" CssClass="form-control" placeholder="Address"  ></asp:TextBox>
               
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Address" Text="Address is required" CssClass="validation"></asp:RequiredFieldValidator>
                        <br />
             <br />
                         <asp:Label Text="Date of Birth (YYYY-MM-DD) : " runat="server" CssClass="labels"></asp:Label>
                        <asp:TextBox CssClass="form-control" runat="server" ID="Dob" placeholder="Date of Birth"></asp:TextBox>
                 

            
                        <asp:RangeValidator runat="server" ControlToValidate="Dob" Display="Dynamic" ErrorMessage="Enter date before 2000 " MaximumValue="2000-01-01" MinimumValue="1945-01-01" SetFocusOnError="True" Type="Date"></asp:RangeValidator>
                        <br />
                        <asp:RegularExpressionValidator CssClass="validation" runat="server" ControlToValidate="Dob" Text="Enter valid date(YYYY-MM-DD)" ValidationExpression="^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$" >       
                        </asp:RegularExpressionValidator>
                
                        <asp:button  runat="server" CssClass="RegisterButton" onclick="Register_Button" Text="Register"></asp:button>
                
                        <p class="message">Already registered? <a href="Login.aspx">Login</a></p>
                 
        </div>
    </form>
</asp:Content>

