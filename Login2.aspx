<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login2.aspx.cs" Inherits="_Default" UnobtrusiveValidationMode="None"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
	<link rel="stylesheet" type="text/css" href="CssLogin.css"/>
	<style>
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
        th{
            width:200px;
            height:50px;
            text-align:left;
            
        }

	</style>

</head>
<body>
  <div class="login-page">
  <div class="form">
      <form class="login-form" runat="server">
		<table runat="server">
<tr>
	<th>
		<asp:TextBox runat="server" ID="UserName" placeholder="User Name"></asp:TextBox>
	</th>
	<th>
		<asp:RequiredFieldValidator CssClass="validation" Text="Enter User Name" ControlToValidate="UserName" runat="server"></asp:RequiredFieldValidator> 
		<br />
		<asp:RegularExpressionValidator CssClass="validation" runat="server" ControlToValidate="UserName" Text="Enter valid user name"  ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" EnableClientScript="False">       
</asp:RegularExpressionValidator>
	</th>
</tr>
<tr>
	<th>
		 <asp:TextBox runat="server" ID="Password" TextMode="Password" placeholder="Password"></asp:TextBox>
	</th>
<th><asp:RequiredFieldValidator CssClass="validation" Text="Enter Password" ControlToValidate="Password" runat="server"></asp:RequiredFieldValidator></th>
</tr>
<tr>
	<th>
		 <p class="login_type">Select login type :</p>
   </th>
	<th>
	
		 <asp:DropDownList id="DropDownList1" 
           runat="server" >
         <asp:ListItem Value="1">User</asp:ListItem>
         <asp:ListItem Value="2"> Employee</asp:ListItem>
         <asp:ListItem Value="3">Admin</asp:ListItem>
         <asp:ListItem Value="4">Agent</asp:ListItem> 
      </asp:DropDownList>
	</th>
</tr>
<tr>
	<td colspan="2">
 <button class="loginbutton">login</button>
	</td>
</tr>
<tr>
	<td colspan="2">
		<p class="message">Not registered? <a href="Register.aspx">Create an account</a></p>
	</td>
</tr>




        </table>  
 </form>     
  </div>
</div>

</body>
</html>
