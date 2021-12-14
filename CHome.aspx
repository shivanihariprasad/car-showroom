<%@ Page Title="Home" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CHome.aspx.cs" Inherits="CHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>Home</title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <style>
        .Division{
	position: relative;
	z-index: 1;
    width:1110px;
	background: #FFFFFF;
	max-width: 1110px;
	margin-right:10px;
	text-align: center;
    padding:5px;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    float:right;
   height:610px;
    
}
        .repeater
        {      float:left;
               width:200px;
               font-size:15px;
               background:black;
               color:white;
               margin-left:10px;
               padding:6px;
               text-shadow: 2px 2px 4px #0b2c9a;
               box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
               border: 1px solid white;
        }
        .cars{
            
            height:470px;
          max-height:470px;
            overflow-y:auto;
            width:1050px;
	z-index: 1;
	background: #FFFFFF;
   margin-left:15px;
	margin-right:5px;
	
    padding:4px;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    
   
        }
        table{
           float:left;
            border: 2px solid #808080;
            text-align:center;
            border: 2px solid #c19f9f;
            width: 230px;
            height:210px;
            padding:2px 2px 2px 2px;
            margin:12px;
           
        }
        th
        {
            text-align:center;
        }
       
        .image2{
            height:130px;
            width:185px;
            transition: height 2s width 2s;
          border: 2px solid white;
    -webkit-transition:  height 2s width 2s;

        }
        .image2:hover{
            height:140px;
            width:195px;
        }
        .imagebutton{
            height:35px;
            width:40px;
            position:relative;
            top:5px;

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <form runat="server" id="form1">
         <div class="repeater">
    Vehicle Type
      
             <asp:Repeater ID="outerRep" runat="server">
            <ItemTemplate>
                <li>
                    <asp:LinkButton Font-Size="Large" Font-Bold="true" ID="VehicleType" runat="server"
                        Text='<%# Eval("VehicleType") %>'  ForeColor="#ffcccc" OnClick="VehicleType_Click"/>
                </li>
               
                </ItemTemplate>
              
                </asp:Repeater>
             <br />
              Fuel Type
      
             <asp:Repeater ID="Repeater2" runat="server">
            <ItemTemplate>
                <li>
                    <asp:LinkButton Font-Size="Large" Font-Bold="true" ID="FuelType" runat="server"
                        Text='<%# Eval("FuelType") %>'  ForeColor="#ffcccc" OnClick="FuelType_Click"/>
                </li>
               
                </ItemTemplate>
              
                </asp:Repeater>
             <br />
               Transmission
      
             <asp:Repeater ID="Repeater3" runat="server">
            <ItemTemplate>
                <li>
                    <asp:LinkButton Font-Size="Large" Font-Bold="true" ID="TransmissionType" runat="server"
                        Text='<%# Eval("Transmission") %>'  ForeColor="#ffcccc" OnClick="TransmissionType_Click"/>
                </li>
               
                </ItemTemplate>
              
                </asp:Repeater>
               
    
               
    </div>   
    
         
   <div class="Division">
  <asp:textbox runat="server" placeholder="Type Model Name" Width="300px" Height="35px" ID="Find"></asp:textbox> &nbsp;&nbsp;  &nbsp; 
             <asp:DropDownList ID="dropdownlist2"  runat="server" Height="35px" Width="150px">
                 <asp:ListItem Value="0">Select Transmission</asp:ListItem>
                 <asp:ListItem Value="1">Manual</asp:ListItem>
                 <asp:ListItem Value="2">Automatic</asp:ListItem>
                 
             </asp:DropDownList>  &nbsp;  &nbsp;  &nbsp; 
              <asp:DropDownList ID="dropdownlist3"  runat="server" Height="35px" Width="150px">
                 <asp:ListItem Value="0">Select Fuel Type</asp:ListItem>
                 <asp:ListItem Value="1">Petrol</asp:ListItem>
                 <asp:ListItem Value="2">Diesel</asp:ListItem>
                  <asp:ListItem Value="2">Gas</asp:ListItem>
             </asp:DropDownList>  &nbsp; &nbsp;  &nbsp;  
              <asp:DropDownList ID="dropdownlist4"  runat="server" Height="35px" Width="150px">
                 <asp:ListItem Value="0">Select Vehicle Type</asp:ListItem>
                 <asp:ListItem Value="1">Sedan</asp:ListItem>
                 <asp:ListItem Value="2">Hatchback</asp:ListItem>
                  <asp:ListItem Value="3">SUV</asp:ListItem>
                  <asp:ListItem Value="4">Wagon</asp:ListItem>
                  <asp:ListItem Value="5">MiniVan</asp:ListItem>
                  <asp:ListItem Value="6">Crossover</asp:ListItem>
                  <asp:ListItem Value="7">Convertible</asp:ListItem>
                 <asp:ListItem Value="8">Sports</asp:ListItem>
             </asp:DropDownList>  &nbsp;  &nbsp;  &nbsp; 
            <asp:ImageButton ID="findby" OnClick="find_Click" ImageUrl="~/Images/if_67_111124.png" runat="server" CssClass="imagebutton"/>
       <br />
             <asp:DropDownList ID="dropdownlist1"  runat="server" Height="35px" Width="200px">
                 <asp:ListItem Value="0">Select option here...</asp:ListItem>
                 <asp:ListItem Value="1">Price High to Low</asp:ListItem>
                 <asp:ListItem Value="2">Price Low to High</asp:ListItem>
                 <asp:ListItem Value="3">Newly Added</asp:ListItem>
                 
             </asp:DropDownList>  &nbsp; 
             <asp:ImageButton ID="sortby" OnClick="sortby_Click" ImageUrl="~/Images/if_arrows-22_808395.png" runat="server" CssClass="imagebutton"/><br />
             <br />
             <%--<asp:GridView ID="vehicle" runat="server" CssClass="table  table-striped table-bordered table hover"
                     AutoGenerateColumns="false" DataKeyNames="VehicleID" GridLines="Vertical" EmptyDataText="No Cars Found">
                
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
                            </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="150px" HeaderText="Price">
                            <ItemTemplate>
                                <asp:Label ID="vcPrice" runat="server" Text='<%#
                                         Eval("Price")%>'></asp:Label>
                           </ItemTemplate>
                            </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="220px" HeaderText="Image">
                            <ItemTemplate>
                               <asp:Image Height="120px" Width="200px" runat="server" ImageUrl='<%#"data:Image/png;base64,"+Convert.ToBase64String((byte[])Eval("Image"))%>' /> 
                           </ItemTemplate>
                            </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="200px" HeaderText="Fuel Type" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="vcFuelType" runat="server" Text='<%#
                                         Eval("FuelType")%>' Visible="false"></asp:Label>
                           </ItemTemplate>
                            </asp:TemplateField>
                         <asp:TemplateField ItemStyle-Width="200px" HeaderText="Transmission" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="vcTrs" runat="server" Text='<%#
                                         Eval("Transmission")%>' Visible="false"></asp:Label>
                           </ItemTemplate>
                            
                             </asp:TemplateField>
                         <asp:TemplateField ItemStyle-Width="200px" HeaderText="Booking">
                            <ItemTemplate>
                             <asp:Button runat="server" Text="BOOK NOW" ID="BOOK" OnClick="BOOK_Click" ForeColor="WhiteSmoke" BackColor="#333333"/>
                           </ItemTemplate>
                            </asp:TemplateField>
                    </Columns>
                 <HeaderStyle BackColor="#333333" ForeColor="White" />
                 <AlternatingRowStyle BackColor="#ffff99" />
                 <RowStyle BackColor="#FFF78F" />
                </asp:GridView>--%>
           <div class="cars">
             <asp:Repeater ID="ViewCars" runat="server">
             <ItemTemplate>
                 <table>
                     <tr>
                         <td>
                              <asp:Label ID="vcID" runat="server" Text='<%#Eval("VehicleID")%>' Visible="false"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                          <th>
                              <asp:Label ID="vcModel" runat="server" Text='<%#Eval("Model")%>' ForeColor="#6600cc"></asp:Label>
                          </th>
                     </tr>
                     <tr>
                         <th>
                             <asp:Image  CssClass="image2" runat="server" ImageUrl='<%#"data:Image/png;base64,"+Convert.ToBase64String((byte[])Eval("Image"))%>' /> 
                
                         </th>
                     </tr>
                     <tr>
                         <th>
                             <asp:Label ID="vcPrice" runat="server" Text='<%#"₹ "+Eval("Price")%>' Font-Size="16px"></asp:Label>
                         </th>
                     </tr>
                     <tr>
                         <th>
                              <asp:LinkButton ID="details" runat="server" onclick="details_Click" Text="View Details"></asp:LinkButton>
                         </th>
                     </tr>
                     <tr>
                         <th>
                             
                                <asp:Label ID="vcFuelType" runat="server" Text='<%#
                                         Eval("FuelType")%>' Visible="false"></asp:Label>
                          
                       
                                <asp:Label ID="vcTrs" runat="server" Text='<%#
                                         Eval("Transmission")%>' Visible="false"></asp:Label>
                              <asp:Label ID="vcVehicleType" runat="server" Text='<%#
                                         Eval("VehicleType")%>' Visible="false"></asp:Label>
                      
                            
                         </th>
                     </tr>
                 </table>
                 
                
                 </ItemTemplate>
                
             </asp:Repeater>
               <div style="clear:both" ></div>
         </div>
             </div>
     </form>
</asp:Content>

