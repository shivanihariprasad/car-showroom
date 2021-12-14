<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddEmloyee.aspx.cs" Inherits="AddEmloyee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Add Employee</title>
    <style>
        .form
        {
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
           .labels
        {font-weight:bold;
         font-size:14px;
         padding-bottom:10px;

        }

           .validation {
			font-size:12px;
			color:red;
            text-align:left;
		}
         
        h1{font-weight:bold;
            text-align:center;}
        .buttons{
           text-align:center;
           
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server">
        <div class="form">
            <h1>Add Employee</h1>
            <br />
            <asp:Label runat="server" Text="Employee Name" CssClass="labels"></asp:Label>
            <asp:TextBox runat="server" ID="EmployeeName" Placeholder="Employee Name" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="EmployeeName" Text="Employee Name is required" CssClass="validation"></asp:RequiredFieldValidator>
            <br />
            <br />
             <asp:Label runat="server" Text="Email ID" CssClass="labels"></asp:Label>
            <asp:TextBox runat="server" ID="Email" Placeholder="EmailID" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" Text="Email Name is required" CssClass="validation"></asp:RequiredFieldValidator>
            <br />
            <asp:RegularExpressionValidator CssClass="validation" runat="server" ControlToValidate="Email" Text="Enter valid email" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">       
                        </asp:RegularExpressionValidator><br />
              <asp:Label runat="server" Text="Password" CssClass="labels"></asp:Label>
            <asp:TextBox runat="server" ID="Password" Placeholder="Password" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" Text="Password is required" CssClass="validation"></asp:RequiredFieldValidator>
            <br />   <asp:RegularExpressionValidator runat="server"
                            ErrorMessage="Should be atleast 7 characters" ControlToValidate="Password" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,100}$" CssClass="validation" />

            
            <br />
          <asp:Label runat="server" Text="Address" CssClass="labels"></asp:Label>
            <asp:TextBox runat="server" ID="Address" Rows="5" Placeholder="Address" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Address" Text="Address is required" CssClass="validation"></asp:RequiredFieldValidator>
               
        <br />
            <br />
            
                         <asp:Label Text="Date of Birth (YYYY-MM-DD) " runat="server" CssClass="labels"></asp:Label>
                        <asp:TextBox CssClass="form-control" runat="server" ID="Dob" placeholder="Date of Birth"></asp:TextBox>
                 
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Dob" Text="Date of birth is required" CssClass="validation"></asp:RequiredFieldValidator>
            <br />
            
                        <asp:RangeValidator runat="server" ControlToValidate="Dob" Display="Dynamic" ErrorMessage="Enter date before 2000 " MaximumValue="2000/01/01" MinimumValue="1990/01/01" SetFocusOnError="True" Type="Date" CssClass="validation"></asp:RangeValidator>
                        <br />
                        <asp:RegularExpressionValidator CssClass="validation" runat="server" ControlToValidate="Dob" Text="Enter valid date(YYYY-MM-DD)" ValidationExpression="^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$"  >       
                        </asp:RegularExpressionValidator>
            <br />
            
                         <asp:Label Text="Date of Join (YYYY-MM-DD) " runat="server" CssClass="labels"></asp:Label>
                        <asp:TextBox CssClass="form-control" runat="server" ID="Doj" placeholder="Date of Join"></asp:TextBox>
                 
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Doj" Text="Date of join is required" CssClass="validation"></asp:RequiredFieldValidator>
            <br />
            
                        <asp:RegularExpressionValidator CssClass="validation" runat="server" ControlToValidate="Doj" Text="Enter valid date(YYYY-MM-DD)" ValidationExpression="^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$"  >       
                        </asp:RegularExpressionValidator>
            <br />
               
            <asp:Label runat="server" Text="Basic Salary" CssClass="labels"></asp:Label>
            <asp:TextBox runat="server" ID="Salary" Placeholder="Basic Salary" CssClass="form-control" TextMode="Number"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Salary" Text="Basic Salary is required" CssClass="validation"></asp:RequiredFieldValidator>
          <asp:RangeValidator runat="server" ControlToValidate="Salary" Display="Dynamic" ErrorMessage="Minimum Salary must be ?5280/- " MinimumValue="5280" MaximumValue="100000" SetFocusOnError="True" Type="Integer" CssClass="validation"></asp:RangeValidator>       
        <br />
            <br />
            <div class="buttons">
            <asp:Button runat="server" CssClass="btn btn-success" ID="Add"  Text="Add" onClick="Add_Employee" Width="100px" />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
            <asp:Button runat="server" CssClass="btn btn-danger" ID="Cancel" CausesValidation="false" Text="Cancel" Width="100px" OnClick="Cancel_Click"/>
                </div>







        </div>
    </form>


</asp:Content>

