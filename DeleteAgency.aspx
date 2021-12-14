<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DeleteAgency.aspx.cs" Inherits="DeleteAgency" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>
        Delete User
    </title>
    <style>
        
         .grid th {
             padding:10px 5px;
             text-align:center;
         }
         .grid td{
             padding:10px 5px;
              text-align:center;
         }
         .division {
    width: 680px;
    padding: 8% 0 0;
    margin: auto;
    position: relative;
    z-index: 1;
    background: #FFFFFF;
    max-width: 1000px;
  
    padding: 45px;
    text-align:center;
    margin-top: 20px;
    box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
          .headin{
               font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
               font-weight:bolder;
            }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server">
       <div class="division">
           <h2 class="headin">
         Delete Agency
        </h2>
            <asp:GridView AutoGenerateColumns="false" CssClass="grid" ID="deleteAgency" EmptyDataText="There are no agencies" DataKeyNames="AgencyID" runat="server" 
            OnRowCancelingEdit="deleteAgency_RowCancelingEdit" OnRowEditing="deleteAgency_RowEditing" OnPageIndexChanging="deleteAgency_PageIndexChanging" >
        <Columns>
                        <asp:TemplateField ItemStyle-Width="20px" HeaderText="Agency ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="AID" runat="server"
                                  Text='<%#Eval("AgencyID")%>' Visible="false"></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="250px" HeaderText="Agency Name">
                            <ItemTemplate>
                                <asp:Label ID="Name" runat="server" Text='<%#
                                         Eval("AName")%>'></asp:Label>
                           </ItemTemplate>
                            </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="250px" HeaderText="Agency Email">
                            <ItemTemplate>
                                <asp:Label ID="Email" runat="server" Text='<%#
                                         Eval("AEmailID")%>'></asp:Label>
                           </ItemTemplate>
                            </asp:TemplateField>      
                             
                        
            
            <asp:TemplateField HeaderText="Status" ItemStyle-Width="150px">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#(int)Eval("Status")==0?" Not Active":"Active"%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
          <asp:TemplateField ItemStyle-Width="160px">
        <ItemTemplate>
        <asp:Button ID="btnstatus" runat="server" Text='<%# (int)Eval("Status")==0?"Activate":"Deactivate"%>' OnClick="btnstatus_Click"/>
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

