<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DeleteEmployee.aspx.cs" Inherits="DeleteEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>
Delete Employee    </title>
    <style>
        
         .grid th {
             padding:10px 5px;
              text-align:center;
         }
         .grid td{
             padding:10px 5px;
              text-align:center;
         }
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server">
       <div class="division">
             <h2 class="headin">
          Delete or Modify Employee
        </h2>
            <asp:GridView AutoGenerateColumns="false" CssClass="grid" ID="deleteEmployee" EmptyDataText="There are no employees" DataKeyNames="EmployeeID" runat="server" 
            OnRowUpdating="deleteEmployee_RowUpdating" OnRowCancelingEdit="deleteEmployee_RowCancelingEdit" OnRowEditing="deleteEmployee_RowEditing" OnPageIndexChanging="deleteEmployee_PageIndexChanging" >
        <Columns>
                        <asp:TemplateField ItemStyle-Width="20px" HeaderText="Employee ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="empID" runat="server"
                                  Text='<%#Eval("EmployeeID")%>' Visible="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="150px" HeaderText="Employee Name">
                            <ItemTemplate>
                                <asp:Label ID="fname" runat="server" Text='<%#
                                         Eval("Name")%>'></asp:Label>
                           </ItemTemplate>
                            </asp:TemplateField>
                   
            <asp:TemplateField ItemStyle-Width="150px" HeaderText="Email">
                            <ItemTemplate>
                                <asp:label runat="server" Text='<%#Eval("EEmailID")%>' ID="email"></asp:label>
                            </ItemTemplate>
                            </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="150px" HeaderText="Address">
                            <ItemTemplate>
                                <asp:Label ID="Address" runat="server" Text='<%#
                                         Eval("EAddress")%>'></asp:Label>
                           </ItemTemplate>
                            </asp:TemplateField>

                
                        <asp:TemplateField ItemStyle-Width="200px" HeaderText="Date of Birth">
                            <ItemTemplate>
                                 <asp:Label ID="dob" runat="server" Text='<%#Eval("EDOB").ToString().Substring(0,10)%>'></asp:Label>
                           </ItemTemplate>
                            </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="200px" HeaderText="Date Of Joining">
                            <ItemTemplate>
                                <asp:Label ID="doj" runat="server" Text='<%#Eval("DOJ").ToString().Substring(0,10)%>' ></asp:Label>
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
                                <asp:TemplateField HeaderText="Basic Salary" HeaderStyle-Width="100px">
                                    <ItemTemplate>
                    <asp:Label ID="LabelBS" runat="server" Text='<%#Eval("BasicSalary")%>'></asp:Label>
                         </ItemTemplate>
                                    <EditItemTemplate >
                                        
                                         <asp:Textbox runat="server" ID="TextBS" Text='<%#Eval("BasicSalary")%>' TextMode="Number"></asp:Textbox>

                                    </EditItemTemplate>


                                </asp:TemplateField>
            
                         <asp:TemplateField HeaderText="Incentive" HeaderStyle-Width="100px">
                                    <ItemTemplate>
                    <asp:Label ID="LabelI" runat="server" Text='<%#Eval("Incentive")%>'></asp:Label>
                         </ItemTemplate>
                               <EditItemTemplate >
                                        
                                         <asp:Textbox runat="server" ID="textI" Text='<%#Eval("Incentive")%>' TextMode="Number"></asp:Textbox>

                                    </EditItemTemplate>
                                    
                                </asp:TemplateField>
                         <asp:TemplateField HeaderText="Gross Salary" HeaderStyle-Width="150px">
                                    <ItemTemplate>
                    <asp:Label ID="GrossSal" runat="server" Text='<%#Eval("GrossSalary")%>'></asp:Label>
                         </ItemTemplate>
                                    
                                </asp:TemplateField>
                        
            <asp:CommandField ShowEditButton="true" HeaderStyle-Width="60px"/>
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