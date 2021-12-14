<%@ Page Title="Login" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <title>Login</title>
	<link rel="stylesheet" type="text/css" href="CssLogin.css"/>
    
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style>
     .login-page {
	width: 420px;
	padding: 4% 0 0;
	margin: auto;
}

.form {width:400px;
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 400px;
	margin: 0 auto 100px;
	padding: 25px;
	text-align: left;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    
}

			

	.form .login_type {
		color: #b3b3b3;
		text-align: justify;
	}

		.form .login_type select {
			text-align: left;
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
		}

        h1{font-weight:bold;
            text-align:center;}
        .labels
        {font-weight:bold;
         font-size:14px;
         padding-bottom:5px;

        }
		.loginbutton {
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
        .loginbutton:hover, .loginbutton:active, .loginbutton:focus {
			background: #43A047;
		}
		.validation {
			font-size:12px;
			color:red;
            text-align:left;
		}
    
        .Invalid
        {
            color:red;
            font-size:12px;
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
             height:100px;
             width:100px;
             margin-left:53px;

             
         }
	</style>
</asp:Content>



    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--  <div class="login-page">--%>
     
    <div class="login-page">
     
  <div class="form">
      <div class="image">
           <img src="Images/lo.jpg" class="image" />
      </div>
      <br />
      <form class="login-form" runat="server">
		
             <asp:Label Text="Email : " runat="server" CssClass="labels"></asp:Label>

		<asp:TextBox runat="server" ID="UserName" placeholder="Email" CssClass="form-control"></asp:TextBox>

                
		<asp:RequiredFieldValidator CssClass="validation" Text="Email is Required" ControlToValidate="UserName" runat="server"></asp:RequiredFieldValidator> 
		<br />
		<asp:RegularExpressionValidator CssClass="validation" runat="server" ControlToValidate="UserName" Text="Enter valid email"  ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">       
</asp:RegularExpressionValidator><br />
     <asp:Label Text="Password : " runat="server" CssClass="labels"></asp:Label>

		 <asp:TextBox runat="server" ID="Password" TextMode="Password" placeholder="Password" CssClass="form-control"></asp:TextBox>

    <asp:RequiredFieldValidator CssClass="validation" Text="Password is Required" ControlToValidate="Password" runat="server"></asp:RequiredFieldValidator></>
<br />
          <br />

<asp:Label Text="Select Login Type :    " runat="server" CssClass="labels"></asp:Label>
		 <asp:DropDownList id="DropDownList1" 
           runat="server" style="margin-left:10px">
         <asp:ListItem Value="1">User</asp:ListItem>
         <asp:ListItem Value="2"> Employee</asp:ListItem>
         <asp:ListItem Value="3">Admin</asp:ListItem>
         <asp:ListItem Value="4">Agent</asp:ListItem> 
      </asp:DropDownList>
          <br />
          <br />
          <br />
	
 <asp:button runat="server" Text="Login" class="loginbutton" OnClick="Login_Click"></asp:button>


         <asp:Label id="message" runat="server" CssClass="Invalid"></asp:Label>


		<p class="message">Not registered? <a href="Register.aspx">Create an account</a></p>           



 </form>    
      </div>
        </div>
<%--</div>--%>
</asp:Content>