<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ModifyCars.aspx.cs" Inherits="ModifyCars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>
        Modify Cars
    </title>
    <style>
         .division {
    width: 1000px;
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
            <asp:GridView AutoGenerateColumns="false" CssClass="grid" HeaderStyle-HorizontalAlign="Center" BorderColor="black" GridLines="vertical" ID="modifycars" EmptyDataText="You Have not added any cars yet" DataKeyNames="VehicleID" runat="server" 
            OnRowUpdating="modifycars_RowUpdating" OnRowCancelingEdit="modifycars_RowCancelingEdit" OnRowEditing="modifycars_RowEditing" OnPageIndexChanging="modifycars_PageIndexChanging" >
        <Columns>
                        <asp:TemplateField ItemStyle-Width="20px" HeaderText="SR.NO" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="vcID" runat="server"
                                  Text='<%#Eval("VehicleID")%>' Visible="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="200px" HeaderText="Model">
                            <ItemTemplate>
                                <asp:Label ID="vcModel" runat="server" Text='<%#
                                         Eval("Model")%>'></asp:Label>
                           </ItemTemplate>
                            </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="200px" HeaderText="Color">
                            <ItemTemplate>
                                <asp:Label ID="vcColor" runat="server" Text='<%#
                                         Eval("Color")%>'></asp:Label>
                           </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%#Eval("Color")%>' ID="txtColor"></asp:TextBox>
                            </EditItemTemplate>
                            </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="150px" HeaderText="Price">
                            <ItemTemplate>
                                <asp:Label ID="vcPrice" runat="server" Text='<%#
                                         Eval("Price")%>'></asp:Label>
                           </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%#Eval("Price")%>' ID="txtPrice"></asp:TextBox>
                            </EditItemTemplate>
                            </asp:TemplateField>
             <asp:TemplateField ItemStyle-Width="150px" HeaderText="Quantity">
                            <ItemTemplate>
                                <asp:Label ID="vcQuantity" runat="server" Text='<%#
                                         Eval("Quantity")%>'></asp:Label>
                           </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%#Eval("Quantity")%>' ID="txtQuantity"></asp:TextBox>
                            </EditItemTemplate>
                            </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="220px" HeaderText="Image">
                            <ItemTemplate>
                               <asp:Image CssClass="image"  runat="server" ImageUrl='<%#"data:Image/png;base64,"+Convert.ToBase64String((byte[])Eval("Image"))%>' /> 
                           </ItemTemplate>
                            </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="200px" HeaderText="Fuel Type">
                            <ItemTemplate>
                                <asp:Label ID="vcFuelType" runat="server" Text='<%#
                                         Eval("FuelType")%>' ></asp:Label>
                           </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList id="DropDownList2" 
           runat="server" DataTextField='<%#Eval("FuelType")%>'>
         <asp:ListItem Value="Petrol" Selected="True"></asp:ListItem>
         <asp:ListItem Value="Gas"> </asp:ListItem>
         <asp:ListItem Value="Diesel"></asp:ListItem>
                                    </asp:DropDownList>
                            </EditItemTemplate>
                            </asp:TemplateField>
                         <asp:TemplateField ItemStyle-Width="200px" ItemStyle-HorizontalAlign="Center" HeaderText="Transmission">
                            <ItemTemplate>
                                <asp:Label ID="vcTrs" runat="server" Text='<%#
                                         Eval("Transmission")%>'></asp:Label>
                           </ItemTemplate>
                         <EditItemTemplate>
 <asp:DropDownList id="DropDownList3" 
           runat="server" >
         <asp:ListItem Value="Manual" Selected="True"></asp:ListItem>
         <asp:ListItem Value="Automatic"> </asp:ListItem>
         
      </asp:DropDownList>
                         </EditItemTemplate>   
                             </asp:TemplateField>
            <asp:TemplateField ItemStyle-Width="200px" HeaderText="Vehicle Type">
                            <ItemTemplate>
                                <asp:Label ID="vcVehicleType" runat="server" Text='<%#
                                         Eval("VehicleType")%>' ></asp:Label>
                           </ItemTemplate>
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
                             </asp:TemplateField>
                        
            <asp:CommandField ShowEditButton="true" HeaderStyle-Width="60px"/>
            <asp:TemplateField HeaderText="status" Visible="false">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("Status")%>' Visible="false"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
          <asp:TemplateField>
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