<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddCars.aspx.cs" Inherits="AddCars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Add Cars</title>
    <style>
        .validation {
			font-size:12px;
			color:red;
            text-align:left;
		}
        .Table1{
            border-spacing:20px 20px;
            width:600px;
            max-width:600px;
            padding:10px 2px;
            text-align:left;
        }
        
        .button {
			width:60px;
			align-content:center;
            font-family: "Roboto", sans-serif;
		text-transform: uppercase;
		outline: 0;
		background: #4CAF50;
		width: auto;
		border: 0;
		padding: 15px;
		color: #FFFFFF;
		font-size: 14px;
		-webkit-transition: all 0.3 ease;
		transition: all 0.3 ease;
		cursor: pointer;
		}
        .button:hover, .button:active, .button:focus {
			background: #43A047;
		}
        .Division{
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 700px;
	margin: 0 auto 100px;
	padding: 45px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    
}
        .Label{
           font-weight:bolder;
        }
        td{
            padding:10px;
        }
        .headin{
               font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
               font-weight:bolder;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server">
       <div class="Division">
            <h2 class="headin">
         Add New Cars
        </h2>
            <table runat="server" class="Table1">
            <tr>
                <td>
                    <asp:Label runat="server" Text="Model :" CssClass="Label"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="Model" runat="server" ></asp:TextBox>
                </td>
                <td>
		<asp:RequiredFieldValidator CssClass="validation" Text="Model is Required" ControlToValidate="Model" runat="server"></asp:RequiredFieldValidator> 
		</td>
            </tr>
                 <tr>
                <td>
                    <asp:Label runat="server" Text="Color :" CssClass="Label"></asp:Label>
                </td>
                    
                <td>
                    <asp:TextBox ID="Color" runat="server" ></asp:TextBox>
                </td>
                <td>
		<asp:RequiredFieldValidator CssClass="validation" Text="Color is Required" ControlToValidate="Color" runat="server"></asp:RequiredFieldValidator> 
		</td>
            </tr>
            <tr>
                <td >
                   <asp:Label runat="server" Text="Description :" CssClass="Label"></asp:Label>
                </td>
                <td>
                     <asp:textbox  Rows="4" TextMode="multiline" Width="200px" id="Description" runat="server"></asp:textbox>
                </td>
                <td>
		<asp:RequiredFieldValidator CssClass="validation" Text="Description is Required" ControlToValidate="Description" runat="server"></asp:RequiredFieldValidator> 
		</td>
            </tr>
            <tr>
                <td>
                   <asp:Label runat="server" Text="Price :" CssClass="Label"></asp:Label>
                </td>
                <td>
                    <asp:textbox runat="server" ID="Price" TextMode="Number"></asp:textbox>
                </td>
                <td>
		<asp:RequiredFieldValidator CssClass="validation" Text="Price is Required" ControlToValidate="Price" runat="server"></asp:RequiredFieldValidator> 
		</td>
            </tr>
                      <tr>
                <td>
                   <asp:Label runat="server" Text="Quantity :" CssClass="Label"></asp:Label>
                </td>
                <td>
                    <asp:textbox runat="server" ID="Quantity" TextMode="Number"></asp:textbox>
                </td>
                <td>
		<asp:RequiredFieldValidator CssClass="validation" Text="Quantity is Required" ControlToValidate="Quantity" runat="server"></asp:RequiredFieldValidator> 
		</td>
            </tr>
            <tr>
                <td >
                    <asp:Label runat="server" Text="Image :" CssClass="Label"></asp:Label>
                </td>
                <td>
                   <asp:FileUpload ID="FileUpload1" runat="server" /> 
                </td>
                <td>
                    <asp:RequiredFieldValidator CssClass="validation" Text="Image File is Required" ControlToValidate="FileUpload1" runat="server"></asp:RequiredFieldValidator>  <br />
                    <asp:RegularExpressionValidator CssClass="validation" runat="server" ControlToValidate="FileUpload1" Text="Enter valid image file path"  ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg)$" >       
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
                 <tr>
                <td>
                   <asp:Label runat="server" Text="Vehicle Type :" CssClass="Label"></asp:Label>
                </td>
                <td>
                 
	
		 <asp:DropDownList id="DropDownList1" 
           runat="server" >
         <asp:ListItem Value="Convertible"></asp:ListItem>
         <asp:ListItem Value="SUV"> </asp:ListItem>
         <asp:ListItem Value="MiniVan"></asp:ListItem>
         <asp:ListItem Value="Sedan" Selected="True"></asp:ListItem> 
         <asp:ListItem Value="Wagon"> </asp:ListItem>
         <asp:ListItem Value="CrossOver"></asp:ListItem>
         <asp:ListItem Value="Hatchback"></asp:ListItem>
             <asp:ListItem Value="Sports"></asp:ListItem>
      </asp:DropDownList>
	     </td>
                <%--<td>
		<asp:RequiredFieldValidator CssClass="validation" Text="Quantity is Required" ControlToValidate="Quantity" runat="server"></asp:RequiredFieldValidator> 
		</td>--%>
            </tr>
                <tr>
                <td>
                   <asp:Label runat="server" Text="Fuel type :" CssClass="Label"></asp:Label>
                </td>
                <td>
                 
	
		 <asp:DropDownList id="DropDownList2" 
           runat="server" >
         <asp:ListItem Value="Petrol" Selected="True"></asp:ListItem>
         <asp:ListItem Value="Gas"> </asp:ListItem>
         <asp:ListItem Value="Diesel"></asp:ListItem>
        
      </asp:DropDownList>
	     </td>
                <%--<td>
		<asp:RequiredFieldValidator CssClass="validation" Text="Quantity is Required" ControlToValidate="Quantity" runat="server"></asp:RequiredFieldValidator> 
		</td>--%>
            </tr>
                <tr>
                <td class="auto-style1">
                   <asp:Label runat="server" Text="Transimission:" CssClass="Label"></asp:Label>
                </td>
                <td>
                 
	
		 <asp:DropDownList id="DropDownList3" 
           runat="server" >
         <asp:ListItem Value="Manual" Selected="True"></asp:ListItem>
         <asp:ListItem Value="Automatic"> </asp:ListItem>
         
      </asp:DropDownList>
	     </td>
                <%--<td>
		<asp:RequiredFieldValidator CssClass="validation" Text="Quantity is Required" ControlToValidate="Quantity" runat="server"></asp:RequiredFieldValidator> 
		</td>--%>
            </tr>
            <tr>
                <td>
                    <asp:Button runat="server" text="Upload Cars" OnClick="Save_Click1" CssClass="button"/>
                </td>
                <td> <asp:Button runat="server" Text="cancel" CausesValidation="false" OnClick="Cancel_Click" CssClass="button" BackColor="Red" /></td>
            </tr>
        </table>
       </div>
    </form>
</asp:Content>

