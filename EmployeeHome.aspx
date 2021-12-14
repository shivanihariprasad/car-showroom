<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EmployeeHome.aspx.cs" Inherits="EmployeeHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>
        Modify Cars
    </title>
    <style>
         .division {
   
    padding: 8% 0 0;
    margin: auto;
    position: relative;
    z-index: 1;
    background: #FFFFFF;
    max-width: 1000px;
    margin: 0 auto 100px;
    padding: 15px;
    text-align:center;
    margin-top: 20px;
    box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
            .image{
             padding:5px;
             height:120px;
             width:170px;
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
         Ordered Cars
        </h2>
            <asp:GridView AutoGenerateColumns="false" BorderColor="#000066"  ID="ordercars" EmptyDataText="No orders have been placed yet" DataKeyNames="OrderID" runat="server"  OnRowEditing="ordercars_RowEditing">
        <Columns>
                        <asp:TemplateField HeaderText="Order No" ItemStyle-Width="90px">
                            <ItemTemplate>
                                <asp:Label ID="OrderID" runat="server"
                                  Text='<%#Eval("OrderID")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
             <asp:TemplateField  HeaderText="Vehicle ID"  ItemStyle-Width="90px">
                            <ItemTemplate>
                                <asp:Label ID="VehicleID" runat="server" Text='<%#
                                         Eval("VehicleID")%>' ></asp:Label>
                           </ItemTemplate>
                
                            </asp:TemplateField>
                        <asp:TemplateField HeaderText="Model"  ItemStyle-Width="200px">
                            <ItemTemplate>
                                <asp:Label ID="vcModel" runat="server" Text='<%#
                                         Eval("Model")%>'></asp:Label>
                           </ItemTemplate>
                            </asp:TemplateField>
                   
             <asp:TemplateField  HeaderText="Price"  ItemStyle-Width="150px">
                            <ItemTemplate>
                                <asp:Label ID="Price" runat="server" Text='<%#
                                         Eval("Price")%>' ></asp:Label>
                           </ItemTemplate>
                
                            </asp:TemplateField>
            <asp:TemplateField  HeaderText="Image"  ItemStyle-Width="190px">
                            <ItemTemplate>
                               <asp:Image CssClass="image"  runat ="server" ImageUrl='<%#"data:Image/png;base64,"+Convert.ToBase64String((byte[])Eval("Image"))%>' /> 
                           </ItemTemplate>
                            </asp:TemplateField>
                     
            
          <asp:TemplateField HeaderText="Status"  ItemStyle-Width="120px">
        <ItemTemplate>
        <asp:Label ID="btnstatus" runat="server" Text='<%# (int)Eval("OrderStatus")==0?"Pending":"Accepted"%>'/>
        </ItemTemplate>
        </asp:TemplateField>
             <asp:TemplateField  ItemStyle-Width="120px">
                <ItemTemplate>
<asp:Button ID="btnAccept" onclick="btnAccept_Click" runat="server" Text="Accept" />
                </ItemTemplate>
            </asp:TemplateField>
                    </Columns>
            
                 <HeaderStyle BackColor="#333333" ForeColor="White" HorizontalAlign="Center" />
                    <AlternatingRowStyle BackColor=" #e6e6ff" HorizontalAlign="Center" />
                 <RowStyle BackColor="#e6e6e6"  HorizontalAlign="Center"/>
                </asp:GridView>
       </div>
      
    </form>
</asp:Content>

