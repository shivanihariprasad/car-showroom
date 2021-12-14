<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register2.aspx.cs" Inherits="Register" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="CRegister.css" />
    <title>Register Page</title>
    <style>
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
        th{
            width:200px;
            height:50px;
            text-align:left;
            
        }
        .Radio{

            font-size:12px;
            text-align:left;
        }
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form">
            <table runat="server">
                <tr>
                    <th>
                        <asp:TextBox runat="server" ID="FirstName" placeholder="First Name"></asp:TextBox>
                    </th>
                    <th>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName" Text="First name is required" CssClass="validation"></asp:RequiredFieldValidator>
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:TextBox runat="server" ID="LastName" placeholder="Last Name"></asp:TextBox>
                    </th>
                    <th>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="LastName" Text="Last name is required" CssClass="validation"></asp:RequiredFieldValidator>
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:TextBox runat="server" ID="Email" placeholder="Email"></asp:TextBox>
                    </th>
                    <th>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" Text="Email is required" CssClass="validation"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator CssClass="validation" runat="server" ControlToValidate="Email" Text="Enter valid email" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" EnableClientScript="False">       
                        </asp:RegularExpressionValidator>
                    </th>

                </tr>
                <tr>
                    <th>
                        <asp:TextBox runat="server" placeholder="Password" ID="Password" TextMode="Password"></asp:TextBox>

                    </th>
                    <th>
                        <asp:RequiredFieldValidator CssClass="validation" Text="Enter Password" ControlToValidate="Password" runat="server"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator runat="server"
                            ErrorMessage="Password length must be minimum 7 characters" ControlToValidate="Password" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,100}$" CssClass="validation" />
                    </th>

                </tr>
                <tr>
                    <th>
                        <asp:TextBox runat="server" placeholder="Re-enter Password" ID="CPassword" TextMode="Password"></asp:TextBox>

                    </th>
                    <th>
                        <asp:RequiredFieldValidator CssClass="validation" Text="Enter Password" ControlToValidate="CPassword" runat="server"></asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator
                            runat="server"
                            ControlToCompare="Password"
                            ControlToValidate="CPassword"
                            ErrorMessage="Your passwords do not match"
                            Display="Dynamic" CssClass="validation" />
                    </th>

                </tr>
                <tr>

                    <th>
                        <asp:Label Text="Gender" runat="server" CssClass="login_type"></asp:Label>
                    </th>


                    <th>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="Radio">
                            <asp:ListItem Value="Male"></asp:ListItem>
                            <asp:ListItem Value="Female" Selected="True"></asp:ListItem>

                        </asp:RadioButtonList>
                    </th>
                </tr>
                <tr>
                    <th>

                        <asp:TextBox Rows="4" runat="server" ID="Address" placeholder="Address"></asp:TextBox>
                    </th>
                    <th>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Address" Text="Address is required" CssClass="validation"></asp:RequiredFieldValidator>
                        <br />
                    </th>
                </tr>
                <tr>
                    <th>

                        <asp:TextBox runat="server" ID="Dob" placeholder="Date of Birth"></asp:TextBox>
                    </th>
                    <th>
                        <asp:RangeValidator runat="server" ControlToValidate="Dob" Display="Dynamic" ErrorMessage="Enter date before 2000 " MaximumValue="1/1/2000" MinimumValue="01/01/1900" SetFocusOnError="True" Type="Date"></asp:RangeValidator>
                        <br />
                        <asp:RegularExpressionValidator CssClass="validation" runat="server" ControlToValidate="Dob" Text="Enter valid date(DD/MM/YYYY)" ValidationExpression="[0-9]{2}[-|\/]{1}[0-9]{2}[-|\/]{1}[0-9]{4}" EnableClientScript="False">       
                        </asp:RegularExpressionValidator>
                    </th>
                </tr>
                <tr>
                    <th colspan="2">
                        <button class="RegisterButton">Register</button>
                    </th>
                </tr>
                <tr>
                    <td colspan="2">
                        <p class="message">Already registered? <a href="Login.aspx">Login</a></p>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
