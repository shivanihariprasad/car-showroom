
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Admin Home</title>
    <style>
          .icons
        {
            width:18px;
            height:18px;
        }
        .profile
        {
            display:inline-block;
             width: 300px;
    padding: 4% 0 0;
   
    position: relative;
    z-index: 1;
    background: #FFFFFF;
    max-width: 300px;
   
    padding: 20px;
    text-align:center;
    margin-top: 20px;
    margin-left:20px;
    margin-right:20px;
    box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }
        .hyperlink{
            font-size:16px;  
            font-weight:bolder;
            color:black;
        }
        h3{
            font-weight:bold;
        }
        .custImg
        {
            
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-left:165px">
     <div class="profile">
        <h3>Customer</h3>
         <br />
         <img src="Images/customer.ico" class="custImg"/>
        <br />
         <br />
        <img src="Images/edit.ico" class="icons" />
         <asp:HyperLink Text="Manage Customer" NavigateUrl="~/DeleteCustomer.aspx" runat="server" CssClass="hyperlink"></asp:HyperLink>
          
         <br />
         <br />
         

    </div>
    
    
    
    <div class="profile">
        <h3>Employee</h3>
        <br />
        <img src="Images/employee.ico" />
        <br />
        <br />
        <img src="Images/add.ico" class="icons" />
         <asp:HyperLink Text="Add Employee" NavigateUrl="~/AddEmloyee.aspx" runat="server" CssClass="hyperlink"></asp:HyperLink>
        <br /> 
        <img src="Images/edit.ico" class="icons" />
         <asp:HyperLink Text="Manage Employee" NavigateUrl="~/DeleteEmployee.aspx" runat="server" CssClass="hyperlink"></asp:HyperLink>

    </div>
     <div class="profile">
         <h3>Agency</h3>
         <br />
        <img src="Images/agent.ico" />
         <br />
        <br />
        <img src="Images/add.ico" class="icons" />
         <asp:HyperLink Text="Add Agency" NavigateUrl="~/AddAgency.aspx" runat="server" CssClass="hyperlink"></asp:HyperLink>
          <br /> 
        <img src="Images/edit.ico" class="icons" />
         <asp:HyperLink Text="Manage Agency" NavigateUrl="~/DeleteAgency.aspx" runat="server" CssClass="hyperlink"></asp:HyperLink>
    </div>
    </div>
  
    
   
</asp:Content>

