<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Account</title>
  
    <link rel="stylesheet" href="https://maxcdn.bootsrapcdn.com/bootstrap/3.3.7/cc/bootstrap.min.css" />
    <style>
        .division{
           
	position: relative;
    float:left;
	z-index: 1;
	background: #FFFFFF;
    width:430px;
	max-width: 430px;
	margin-left:20px;
	padding: 10px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
   
    
}
        .division1{
            position: relative;
    float:right;
	z-index: 1;
	background: #FFFFFF;
    width:800px;
	max-width: 800px;
	margin-right:30px;
	padding: 30px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }
        .Table
        {
           font-size:16px;
           padding:10px 5px;

        }
        th{
            text-align:right;
            padding-right:2px;
            padding-left:2px;
            padding-top:5px;
            padding-bottom:5px;
            width:120px;

        }
        td {
             padding-right:2px;
            padding-left:2px;
            padding-top:5px;
            padding-bottom:5px;
            text-align: left;
            padding: 2px;
        }
       .grid th{
            text-align:center;
            padding:3px;
        }
        .grid td{ padding:3px;
            color:#808080;
            text-align:center;
        }
        .image{
            height:100px;
            width:100px;
            margin-left:35px;
        }
        .image1{
            height:145px;
            width:175px;
            padding:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server">
 <div class="division">
<div class="image"><img src="Images/user.png" class="image"/></div>
     <br />
          <table runat="server" id="table1" class="Table">
          <tr>
              <th>
                  First Name    :
              </th>
              <td>
                  <asp:Label runat="server" ID="FName"></asp:Label>
              </td>
          </tr>
          <tr>
             <th>
                 Last Name     :
             </th>
              <td>
                 <asp:Label runat="server" ID="LName"></asp:Label>
              </td>
          </tr>
          <tr>
              <th>
                  Email ID      :
              </th>
              <td>
                  <asp:Label runat="server" ID="Email"></asp:Label>
              </td>
          </tr>
          <tr>
              <th>
                  Address        :
              </th>
              <td colspan="2">
                  <asp:Label runat="server" ID="Address"></asp:Label>
              </td>
          </tr>
          <tr>
              <th>
                  Date of Birth :
              </th>
              <td>
                   <asp:Label runat="server" ID="Dob"></asp:Label>
              </td>
          </tr>          
      </table>
 </div>
        <%--<div><asp:HyperLink Text="Order Summary" NavigateUrl="~/OrderSummary.aspx" runat="server" ForeColor="Red" Font-Size="25px"></asp:HyperLink>
        </div>--%>
     <div class="division1">
          <asp:GridView AutoGenerateColumns="false" CssClass="grid" ID="orderDetails" EmptyDataText="You have not booked any cars yet. Book now to own a new car" DataKeyNames="OrderID" runat="server" >

        <Columns>
                        <asp:TemplateField ItemStyle-Width="20px" HeaderText="Order ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="OID" runat="server"
                                  Text='<%#Eval("OrderID")%>' Visible="false"></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="200px" HeaderText="Model Name">
                            <ItemTemplate>
                                <asp:Label ID="Model" runat="server" Text='<%#
                                         Eval("Model")%>'></asp:Label>
                           </ItemTemplate>
                            </asp:TemplateField>
                         <asp:TemplateField ItemStyle-Width="200px" HeaderText="Image">
                            <ItemTemplate>
                               <asp:Image CssClass="image1"  runat="server" ImageUrl='<%#"data:Image/png;base64,"+Convert.ToBase64String((byte[])Eval("Image"))%>' /> 
                           </ItemTemplate>
                            </asp:TemplateField>
             <asp:TemplateField HeaderText="Date" ItemStyle-Width="150px">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("Date").ToString().Substring(0,10)%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>            
            
            <asp:TemplateField HeaderText="Status" ItemStyle-Width="100px">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#(int)Eval("OrderStatus")==0?"Pending":"Accepted"%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            

          <asp:TemplateField HeaderText="Order Summary" ItemStyle-Width="150px">
              <ItemTemplate>
                  <asp:LinkButton Text=" View Order Summary" ID="btnorder" OnClick="Unnamed_Click" runat="server" ForeColor="Red" Font-Size="15px"> </asp:LinkButton>
              </ItemTemplate>
          </asp:TemplateField>
                    </Columns>
            
                 <HeaderStyle BackColor="#333333" ForeColor="White" HorizontalAlign="Center"/>
                 <AlternatingRowStyle BackColor=" #e6e6ff" HorizontalAlign="Center" />
                 <RowStyle BackColor="#e6e6e6" HorizontalAlign="Center" />
                </asp:GridView>
     </div>
    </form>
</asp:Content>

