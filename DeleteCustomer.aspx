<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DeleteCustomer.aspx.cs" Inherits="DeleteCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>
        Delete Customer
    </title>
    <style>
         .headin{
               font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
               font-weight:bolder;
            }
  
         .division {
    width: 1200px;
    padding: 8% 0 0;
    margin: auto;
    position: relative;
    z-index: 1;
    background: #FFFFFF;
    max-width: 1200px;
    margin: 0 auto 100px;
    padding: 15px;
    text-align:center;
    margin-top: 20px;
    box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
         .grid th {
             padding:10px 5px;
              text-align:center;
         }
         .grid td{
             padding:10px 5px;
              text-align:center;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <form runat="server">
       <div class="division">
             <h2 class="headin">
         Delete Customer
        </h2>
            <asp:GridView AutoGenerateColumns="false" CssClass="grid" ID="deleteUser" EmptyDataText="There are no registered customers" DataKeyNames="CustomerID" runat="server" 
            O OnRowCancelingEdit="deleteUser_RowCancelingEdit" OnRowEditing="deleteUser_RowEditing" OnPageIndexChanging="deleteUser_PageIndexChanging" >
        <Columns>
                        <asp:TemplateField ItemStyle-Width="20px" HeaderText="Customer ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="CID" runat="server"
                                  Text='<%#Eval("CustomerID")%>' Visible="false"></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="200px" HeaderText="First Name">
                            <ItemTemplate>
                                <asp:Label ID="fname" runat="server" Text='<%#
                                         Eval("FName")%>'></asp:Label>
                           </ItemTemplate>
                            </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="200px" HeaderText="Last Name">
                            <ItemTemplate>
                                <asp:Label ID="lname" runat="server" Text='<%#
                                         Eval("LName")%>'></asp:Label>
                           </ItemTemplate>
                            </asp:TemplateField>
            <asp:TemplateField ItemStyle-Width="200px" HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("EmailID")%>' ID="email"></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="250px" HeaderText="Address">
                            <ItemTemplate>
                                <asp:Label ID="Address" runat="server" Text='<%#
                                         Eval("Address")%>'></asp:Label>
                           </ItemTemplate>
                            </asp:TemplateField>

                
                        <asp:TemplateField ItemStyle-Width="100px" HeaderText="Gender">
                            <ItemTemplate>
                                 <asp:Label ID="Gender" runat="server" Text='<%#
                                         Eval("Gender")%>'></asp:Label>
                           </ItemTemplate>
                            </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="200px" HeaderText="Date Of Birth">
                            <ItemTemplate>
                                <asp:Label ID="dob" runat="server" Text='<%#Eval("DOB").ToString().Substring(0,10)%>' ></asp:Label>
                           </ItemTemplate>
                           
                            </asp:TemplateField>
                        
                         <%--<EditItemTemplate>
                              <asp:DropDownList id="DropDownList1" 
           runat="server">
         <asp:ListItem Value="Convertible"></asp:ListItem>
         <asp:ListItem Value="SUV"> </asp:ListItem>
         <asp:ListItem Value="MiniVan"></asp:ListItem>
         <asp:ListItem Value="Sedan" Selected="True"></asp:ListItem> 
         <asp:ListItem Value="Wagon"> </asp:ListItem>
         <asp:ListItem Value="CrossOver"></asp:ListItem>
         <asp:ListItem Value="Hatchback"></asp:ListItem> 
      </asp:DropDownList>
                         </EditItemTemplate>   --%> 
                             
                        
           
            <asp:TemplateField HeaderText="Status" Visible="false">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("Status")%>' Visible="false"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
          <asp:TemplateField ItemStyle-Width="120px">
        <ItemTemplate>
        <asp:Button ID="btnstatus" runat="server" Text='<%# (int)Eval("Status")==0?"Activate":"Deactivate"%>'  OnClick="btnstatus_Click"/>
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

