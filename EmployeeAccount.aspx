<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EmployeeAccount.aspx.cs" Inherits="EmployeeAccount" %>


<asp:Content ID="Content3" ContentPlaceHolderID="head" Runat="Server">
    <title>Account</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootsrapcdn.com/bootstrap/3.3.7/cc/bootstrap.min.css" />
    <style>
        .division{
	position: relative;
    
	z-index: 1;
	background: #FFFFFF;
	max-width: 400px;
	margin: 0 auto 100px;
	padding: 45px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    
}
        .Table
        {
           
           padding:10px 5px;

        }
        th{
            text-align:right;
            line-height:30px;
            font-size:18px;
        }
        td{
            line-height:30px;
            font-size:18px;
            text-align:left;
        }
        .image {
            height: 100px;
            width: 100px;
            margin-left: 45px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server">
 <div class="division">
    <div class="image"><img src="Images/user.png" class="image"/></div>
     <br />

          <table runat="server" id="table1" class="Table">
          <tr>
              <th>
                  Name    :
              </th>
              <td>
                  <asp:Label runat="server" ID="Name"></asp:Label>
              </td>
          </tr>
          <tr>
             <th>
                 Email ID     :
             </th>
              <td>
                 <asp:Label runat="server" ID="Email"></asp:Label>
              </td>
          </tr>
          <tr>
              <th>
                   Address    :
              </th>
              <td>
                  <asp:Label runat="server" ID="Address"></asp:Label>
              </td>
          </tr>
          <tr>
              <th>
                  Date of Birth        :
              </th>
              <td>
                  <asp:Label runat="server" ID="Dob"></asp:Label>
              </td>
          </tr>
          <tr>
              <th>
                  Date of Joining :
              </th>
              <td>
                   <asp:Label runat="server" ID="Doj"></asp:Label>
              </td>
          </tr>
                 <tr>
              <th>
                  Basic Salary :
              </th>
              <td>
                   <asp:Label runat="server" ID="BSalary"></asp:Label>
              </td>
          </tr>
                 <tr>
              <th>
                  Incentive :
              </th>
              <td>
                   <asp:Label runat="server" ID="Incentive"></asp:Label>
              </td>
          </tr>
                 <tr>
              <th>
                  Gross Salary :
              </th>
              <td>
                   <asp:Label runat="server" ID="GSalary"></asp:Label>
              </td>
          </tr>
          
      </table>
 </div>
        <div class="orders">


        </div>
    </form>
</asp:Content>
