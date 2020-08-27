<%@ Page Title="" Language="C#" MasterPageFile="~/adminmain.Master" AutoEventWireup="true" CodeBehind="adminnewsprocess.aspx.cs" Inherits="mnwebproject.adminnewsprocess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .style2
        {
            width: 150px;
        }
            .style100
        {
            width: 180px;
            }
            .style101
        {
            width: 715px;
            }
        .style102
        {
            width: 112px;
        }
        .style104
        {
            width: 129px;
        }
        .style105
        {
            width: 411px;
        }
        .style106
        {
            width: 412px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table>
<tr>
<td class="style100">
</td>
<td class="style101">
    <asp:Label ID="Label31" runat="server" Text="Haber İşlemleri Sayfası" style="color:White; font-size:large;"></asp:Label>
</td>
<td class="style2"> <asp:Label ID="lblwelcomemsg" runat="server" Text="" style="color:White"></asp:Label></td>
<td><asp:Button ID="AdminLogout" runat="server" Text="Çıkış" CssClass="button" onclick="AdminLogout_Click" 
         /></td>
</tr>
</table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table>
   <tr>
   <td></td>
   <td>
       <asp:Label ID="Label13" runat="server" Text="İşlem Seçiniz" CssClass="label"></asp:Label></td>
   <td>
       <asp:Label ID="Label14" runat="server" Text=":" CssClass="label"></asp:Label></td>
   <td>
    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="inputs" Style="width:180px">
    <asp:ListItem>Bir İşlem Seçiniz</asp:ListItem>
    <asp:ListItem>Ekle</asp:ListItem>
    <asp:ListItem>Güncelle</asp:ListItem>
    <asp:ListItem>Sil</asp:ListItem>
    <asp:ListItem>Listele</asp:ListItem>
    </asp:DropDownList></td>
    <td><asp:Button ID="BtnOpen" runat="server" Text="Panel Aç" CssClass="button" OnClick="BtnOpen_Click" /></td>
    <td><asp:Label ID="lblduyuruislemlerimsg" runat="server" Text="" CssClass="label" ForeColor="Red"></asp:Label></td>
   </tr>
   </table>
    
    <br />
    <br />
     <asp:MultiView ID="MultiView1" runat="server">
         <asp:View ID="View1" runat="server">
          <table class="auto-style1">
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style104">
                    <asp:Label ID="Label1" runat="server" Text="Haber Başlık" CssClass="label" ></asp:Label>
                </td>
                <td class="style11">
                    <asp:Label ID="Label4" runat="server" Text=":" CssClass="label"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="texthaberbaslikekle" runat="server"  CssClass="inputs" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style104">
                    <asp:Label ID="Label2" runat="server" Text="Haber" CssClass="label"></asp:Label>
                </td>
                <td class="style11">
                    <asp:Label ID="Label5" runat="server" Text=":" CssClass="label"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="texthaberekle" runat="server" TextMode="MultiLine" Height="50px" CssClass="inputs"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style104">
                    <asp:Label ID="Label3" runat="server" Text="Haber Tarih" CssClass="label"></asp:Label>
                </td>
                <td class="style11">
                    <asp:Label ID="Label6" runat="server" Text=":" CssClass="label"></asp:Label>
                </td>
                <td>
                    <asp:Calendar ID="Calendar1" runat="server" 
                        BackColor="White" 
                        BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                        CssClass="label" Font-Size="9pt" ForeColor="Black" Height="180px" 
                        Width="202px" onselectionchanged="Calendar1_SelectionChanged">
                        <DayHeaderStyle BackColor="#6680A6" Font-Bold="True" ForeColor="White" Font-Size="7pt" />
         <NextPrevStyle VerticalAlign="Bottom" ForeColor="White" />
         <OtherMonthDayStyle ForeColor="#808080" />
         <SelectedDayStyle BackColor="#566F96" Font-Bold="True" ForeColor="White" CssClass="label" Font-Size="9pt" />
         <SelectorStyle BackColor="#CCCCCC" />
         <TitleStyle BackColor="#566F96" BorderColor="Black" Font-Bold="True" ForeColor="White" />
         <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
         <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                    <asp:TextBox ID="texthabertarihekle" runat="server" Visible="false" ></asp:TextBox>
                </td>
            </tr>
            <tr>
            <td class="style8">
                    &nbsp;</td>
                <td class="style104">
                    <asp:Label ID="Label17" runat="server" Text="Dil" CssClass="label"></asp:Label></td>
                <td class="style11">
                    <asp:Label ID="Label18" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="Dropdowndil" runat="server" CssClass="inputs" Style="width:203px">
                        <asp:ListItem>Dil Seçiniz</asp:ListItem>
                        <asp:ListItem>Türkçe</asp:ListItem>
                        <asp:ListItem>İngilizce</asp:ListItem>
                        </asp:DropDownList>
                    </td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style104">
                    &nbsp;</td>
                <td class="style11">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="BtnAdd" runat="server" Text="Ekle" CssClass="button" OnClick="BtnAdd_Click" />
                    <asp:Button ID="BtnCancel" runat="server" Text="İptal" CssClass="button" OnClick="BtnCancel_Click" />
                    
                </td>
            </tr>
            
              <tr>
                  <td class="style8">
                      &nbsp;</td>
                  <td class="style104">
                      &nbsp;</td>
                  <td class="style11">
                      &nbsp;</td>
                  <td>
                      <asp:Label ID="lbleklemsg" runat="server" Text="" ForeColor="Red" CssClass="label" Visible="false"></asp:Label>
                  </td>
              </tr>
            
        </table>
         </asp:View>

         <asp:View ID="View2" runat="server">
          <table class="auto-style1">
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style106">
                 
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        CellPadding="3" DataKeyNames="ID" 
                       BackColor="White" 
                         BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
                      >
                        <Columns>
                        <asp:TemplateField HeaderText="ID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblHaberID" runat="server" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>' 
                                        Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Haber Başlık">
                                <ItemTemplate>
                                    <asp:Label ID="lblHaberBaslik" Width="160px" runat="server" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.NEWS_TITLE") %>' 
                                        Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tarih">
                                <ItemTemplate>
                                    <asp:Label ID="lblHaberTarih" runat="server" CssClass="label" 
                                        Text='<%# DataBinder.Eval(Container,"DataItem.NEWS_DATE") %>' Visible="true" Width="100px"></asp:Label>
                                    <asp:Label ID="lblHaber" runat="server" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.NEWS_CONTENT") %>' 
                                        Visible="false"></asp:Label>
                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" SelectText="Ayrıntılar" 
                                       ShowSelectButton="True" >
                                
                                   <ControlStyle CssClass="button" />
                                   </asp:CommandField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#566F96" ForeColor="White" CssClass="label" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:Label ID="Lblguncellemsg" runat="server" Text="" ForeColor="Red" CssClass="label" ></asp:Label>
                </td>
                <td>
                 <asp:Panel ID="PnlGuncelleme" runat="server" Width="500px" Visible="false">
                   <table>
                   <tr>
                   <td class="style102">
                       <asp:Label ID="Label7" runat="server" Text="Haber Başlık" CssClass="label"></asp:Label>
                       </td>
                   <td class="style11">
                       <asp:Label ID="Label9" runat="server" Text=":" CssClass="label"></asp:Label>
                       </td>
                   <td>
                       <asp:TextBox ID="texthaberbaslikguncelle" runat="server" CssClass="inputs"></asp:TextBox>
                       <asp:TextBox ID="texthaberidguncelle" runat="server" Visible="false" ></asp:TextBox>
                       </td>
                   </tr>
                   <tr>
                   <td class="style102">
                       <asp:Label ID="Label8" runat="server" Text="Haber" CssClass="label"></asp:Label>
                       </td>
                   <td class="style11">
                       <asp:Label ID="Label10" runat="server" Text=":" CssClass="label"></asp:Label>
                       </td>
                   <td>
                       <asp:TextBox ID="texthaberguncelle" runat="server" TextMode="MultiLine" Height="50px" CssClass="inputs"></asp:TextBox>
                       </td>
                   </tr>
                   <tr>
                   <td class="style102"> &nbsp;</td>
                   <td class="style11"> &nbsp;</td>
                        <td>
                            <asp:Button ID="BtnUpdate" runat="server" Text="Güncelle" 
                                CssClass="button" OnClick="BtnUpdate_Click" />
                            <asp:Button ID="BtnUpdateCancel" runat="server" Text="İptal" 
                                 CssClass="button" OnClick="BtnUpdateCancel_Click" />
                      
                       </td>
                   </tr>
                   
                  
                   </table>
                   </asp:Panel>
                   </td>
            </tr>
             
        </table>
         </asp:View>

         <asp:View ID="View3" runat="server">
         <table class="auto-style1">
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style105">
               
                 <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        CellPadding="3" DataKeyNames="ID" 
                       BackColor="White" 
                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" >
                        <Columns>
                        <asp:TemplateField HeaderText="ID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblHaberIDSil" runat="server" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>' 
                                        Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Haber Başlık">
                                <ItemTemplate>
                                    <asp:Label ID="lblHaberBaslikSil" Width="160px" runat="server" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.NEWS_TITLE") %>' 
                                        Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tarih">
                                <ItemTemplate>
                                    <asp:Label ID="lblHaberTarihSil" runat="server" CssClass="label"
                                        Text='<%# DataBinder.Eval(Container,"DataItem.NEWS_DATE") %>' Visible="true" Width="100px"></asp:Label>
                                    <asp:Label ID="lblHaberSil" runat="server" Font-Bold="true" Font-Names="Arno Pro" 
                                        Font-Size="Large" Text='<%# DataBinder.Eval(Container,"DataItem.NEWS_CONTENT") %>' 
                                        Visible="false"></asp:Label>
                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                           <asp:CommandField ButtonType="Button" SelectText="Ayrıntılar" 
                                       ShowSelectButton="True" >
                                
                                   <ControlStyle CssClass="button" />
                                   </asp:CommandField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#566F96" ForeColor="White" CssClass="label" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
              
                 <asp:Label ID="lblmsgsil" runat="server" Text="" CssClass="label" ForeColor="Red" Visible="false" ></asp:Label>
              
                </td>
            <td>
                 <asp:Panel ID="PnlSilme" runat="server" Width="500px" Visible="false" >
                     <table class="auto-style1">
                         <tr>
                             <td class="style10">
                                 <asp:Label ID="Label11" runat="server" Text="Haber Başlık" CssClass="label"></asp:Label>
                             </td>
                             <td class="style11">
                                 <asp:Label ID="Label111" runat="server" Text=":" CssClass="label"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="lblhaberbasliksil" runat="server" CssClass="label"></asp:Label>
                                 <asp:TextBox ID="texthaberidsil" runat="server" Visible="false"></asp:TextBox>
                             </td>
                         </tr>
                         <tr>
                             <td class="style10">
                                 <asp:Label ID="Label122" runat="server" Text="Haber" CssClass="label"></asp:Label>
                             </td>
                             <td class="style11">
                                 <asp:Label ID="Label15" runat="server" Text=":" CssClass="label"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="lblhabersil" runat="server" CssClass="label"></asp:Label>
                             </td>
                         </tr>
                         <tr>
                             <td class="style10">
                                 <asp:Label ID="Label12" runat="server" Text="Tarih" CssClass="label"></asp:Label>
                             </td>
                             <td class="style11">
                                 <asp:Label ID="Label16" runat="server" Text=":" CssClass="label"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="lblhabertarihsil" runat="server" CssClass="label"></asp:Label>
                             </td>
                         </tr>
                         <tr>
                             <td class="style10">
                                 &nbsp;</td>
                             <td class="style11">
                                 &nbsp;</td>
                             <td>
                                 <asp:Button ID="BtnDelete" runat="server" Text="Sil"  CssClass="button" OnClick="BtnDelete_Click" />
                                 <asp:Button ID="BtnDeleteCancel" runat="server" Text="İptal" 
                                      CssClass="button" OnClick="BtnDeleteCancel_Click" />
                                 
                             </td>
                         </tr>
                     </table>

                 </asp:Panel>
                 </td>
        </tr>
    </table>
         </asp:View>
         <asp:View ID="View4" runat="server">
         <table>
         <tr>
         <td></td>
         <td>
         <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                        CellPadding="3" DataKeyNames="ID" 
                         BackColor="White" 
                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                      >
                        <Columns>
                        <asp:TemplateField HeaderText="ID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblHaberIDListe" runat="server" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>' 
                                        Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Haber Başlık">
                                <ItemTemplate>
                                    <asp:Label ID="lblHaberBaslikListe" Width="220px" runat="server" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.NEWS_TITLE") %>' 
                                        Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Haber ">
                                <ItemTemplate>
                                    <asp:Label ID="lblHaberListe" runat="server" Width="450px" CssClass="label"
                                        Font-Size="Large" Text='<%# DataBinder.Eval(Container,"DataItem.NEWS_CONTENT") %>' 
                                        ></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tarih">
                                <ItemTemplate>
                                    <asp:Label ID="lblHaberTarihListe" runat="server" CssClass="label"
                                        Text='<%# DataBinder.Eval(Container,"DataItem.NEWS_DATE") %>' Visible="true" Width="200px"></asp:Label>
                                    
                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#566F96" ForeColor="White" CssClass="label" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
         
         </td>
         </tr>
         </table>
          
         </asp:View>
     </asp:MultiView>
</asp:Content>
