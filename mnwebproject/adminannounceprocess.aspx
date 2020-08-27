<%@ Page Title="" Language="C#" MasterPageFile="~/adminmain.Master" AutoEventWireup="true" CodeBehind="adminannounceprocess.aspx.cs" Inherits="mnwebproject.adminannounceprocess" %>
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
        width: 412px;
    }
    .style103
    {
        width: 413px;
    }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table>
<tr>
<td class="style100">
</td>
<td class="style101">
    <asp:Label ID="Label31" runat="server" Text="Duyuru İşlemleri Sayfası" style="color:White; font-size:large;"></asp:Label>
</td>
<td class="style2"> <asp:Label ID="lblwelcomemsg" runat="server" Text="" style="color:White"></asp:Label></td>
<td><asp:Button ID="AdminLogout" runat="server" Text="Çıkış" CssClass="button" OnClick="AdminLogout_Click" 
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
    <td><asp:Button ID="BtnOpen" runat="server" Text="Panel Aç" CssClass="button" OnClick="BtnOpen_Click" 
         /></td>
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
                <td class="style10">
                    <asp:Label ID="Label1" runat="server" Text="Duyuru Başlık" CssClass="label"></asp:Label>
                </td>
                <td class="style11">
                    <asp:Label ID="Label4" runat="server" Text=":" CssClass="label"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="textduyurubaslikekle" runat="server" CssClass="inputs" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style10">
                    <asp:Label ID="Label2" runat="server" Text="Duyuru" CssClass="label"></asp:Label>
                </td>
                <td class="style11">
                    <asp:Label ID="Label5" runat="server" Text=":" CssClass="label"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="textduyuruekle" runat="server" TextMode="MultiLine" Height="50px" CssClass="inputs"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style10">
                    <asp:Label ID="Label3" runat="server" Text="Duyuru Tarih" CssClass="label"></asp:Label>
                </td>
                <td class="style11">
                    <asp:Label ID="Label6" runat="server" Text=":" CssClass="label"></asp:Label>
                </td>
                <td>
                    <asp:Calendar ID="Calendar1" runat="server" 
                        onselectionchanged="Calendar1_SelectionChanged" BackColor="White" 
                        BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                        CssClass="label" Font-Size="9pt" ForeColor="Black" Height="180px" 
                        Width="202px">
                       <DayHeaderStyle BackColor="#6680A6" Font-Bold="True" ForeColor="White" Font-Size="7pt" />
         <NextPrevStyle VerticalAlign="Bottom" ForeColor="White" />
         <OtherMonthDayStyle ForeColor="#808080" />
         <SelectedDayStyle BackColor="#566F96" Font-Bold="True" ForeColor="White" CssClass="label" Font-Size="9pt" />
         <SelectorStyle BackColor="#CCCCCC" />
         <TitleStyle BackColor="#566F96" BorderColor="Black" Font-Bold="True" ForeColor="White" />
         <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
         <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                    <asp:TextBox ID="textduyurutarihekle" runat="server" Visible="false" ></asp:TextBox>
                    
                </td>
            </tr>
            <tr>
            <td class="style8">
                    &nbsp;</td>
                <td class="style10">
                    <asp:Label ID="Label18" runat="server" Text="Dil" CssClass="label"></asp:Label></td>
                <td class="style11">
                   <asp:Label ID="Label17" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                    <asp:DropDownList ID="DropdownDil" runat="server" CssClass="inputs" 
                            Style="width:203px" 
                           >
                    <asp:ListItem>Dil Seçiniz</asp:ListItem>
                    <asp:ListItem>Türkçe</asp:ListItem>
                    <asp:ListItem>İngilizce</asp:ListItem>
                    </asp:DropDownList>
                       
                    </td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style10">
                    &nbsp;</td>
                <td class="style11">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="BtnAdd" runat="server" Text="Ekle"  CssClass="button" OnClick="BtnAdd_Click" />
                    
                    <asp:Button ID="BtnAnnounceAddCancel" runat="server" Text="İptal" 
                         CssClass="button" OnClick="BtnAnnounceAddCancel_Click" />
                    
                </td>
            </tr>
             <tr>
                 <td class="style8">
                     &nbsp;</td>
                 <td class="style10">
                     &nbsp;</td>
                 <td class="style11">
                     &nbsp;</td>
                 <td>
                     <asp:Label ID="lblmsgekle" runat="server" Text="" CssClass="label" ForeColor="Red"></asp:Label>
                 </td>
             </tr>
        </table>
        </asp:View>

        <asp:View ID="View2" runat="server">
          <table class="auto-style1">
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style102">
                 
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        CellPadding="3" DataKeyNames="ID" 
                         BackColor="White" 
                         BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                        <asp:TemplateField HeaderText="ID" Visible="false"><ItemTemplate><asp:Label ID="lblDuyuruID" runat="server" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>' 
                                        Visible="true"></asp:Label></ItemTemplate></asp:TemplateField>

                            <asp:TemplateField HeaderText="Duyuru Başlık"><ItemTemplate><asp:Label ID="lblDuyuruBaslik" Width="160px" runat="server" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ANNOUNCE_TITLE") %>' 
                                        Visible="true"></asp:Label></ItemTemplate></asp:TemplateField>
                            <asp:TemplateField HeaderText="Tarih"><ItemTemplate><asp:Label ID="lblDuyuruTarih" runat="server" CssClass="label" 
                                        Text='<%# DataBinder.Eval(Container,"DataItem.ANNOUNCE_DATE") %>' Visible="true" Width="100px"></asp:Label><asp:Label ID="lblDuyuru" runat="server" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ANNOUNCE_CONTENT") %>' 
                                        Visible="false"></asp:Label></ItemTemplate></asp:TemplateField>
                           <asp:CommandField ButtonType="Button" SelectText="Ayrıntılar" 
                                       ShowSelectButton="True" ><ControlStyle CssClass="button" /></asp:CommandField>
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
                    <asp:Label ID="lblmsgguncelle" runat="server" Text="" CssClass="label" ForeColor="Red"></asp:Label>
                </td>
                <td>
                 <asp:Panel ID="PnlGuncelleme" runat="server" Width="500px" Visible="false">
                   <table>
                   <tr>
                   <td class="style10">
                       <asp:Label ID="Label7" runat="server" Text="Duyuru Başlık" CssClass="label"></asp:Label>
                       </td>
                   <td class="style11">
                       <asp:Label ID="Label9" runat="server" Text=":" CssClass="label"></asp:Label>
                       </td>
                   <td>
                       <asp:TextBox ID="textduyurubaslikguncelle" runat="server" CssClass="inputs"></asp:TextBox>
                       <asp:TextBox ID="textduyuruidguncelle" runat="server" Visible="false" ></asp:TextBox>
                       </td>
                   </tr>
                   <tr>
                   <td class="style10">
                       <asp:Label ID="Label8" runat="server" Text="Duyuru" CssClass="label"></asp:Label>
                       </td>
                   <td class="style11">
                       <asp:Label ID="Label10" runat="server" Text=":" CssClass="label"></asp:Label>
                       </td>
                   <td>
                       <asp:TextBox ID="textduyuruguncelle" runat="server" TextMode="MultiLine" Height="50px" CssClass="inputs"></asp:TextBox>
                       </td>
                   </tr>
                   <tr>
                   <td class="style10"> &nbsp;</td>
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
            <td class="style103">
                
                 <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        CellPadding="3" DataKeyNames="ID" 
                         BackColor="White" 
                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" 
                      >

                    


                        <Columns>
                        <asp:TemplateField HeaderText="ID" Visible="false"><ItemTemplate><asp:Label ID="lblDuyuruIDSil" runat="server" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>' 
                                        Visible="true"></asp:Label></ItemTemplate></asp:TemplateField>

                            <asp:TemplateField HeaderText="Duyuru Başlık"><ItemTemplate><asp:Label ID="lblDuyuruBaslikSil" Width="160px" runat="server" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ANNOUNCE_TITLE") %>' 
                                        Visible="true"></asp:Label></ItemTemplate></asp:TemplateField>
                            <asp:TemplateField HeaderText="Tarih"><ItemTemplate><asp:Label ID="lblDuyuruTarihSil" runat="server" CssClass="label"
                                        Text='<%# DataBinder.Eval(Container,"DataItem.ANNOUNCE_DATE") %>' Visible="true" Width="100px"></asp:Label><asp:Label ID="lblDuyuruSil" runat="server" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ANNOUNCE_CONTENT") %>' 
                                        Visible="false"></asp:Label></ItemTemplate></asp:TemplateField>
                            <asp:CommandField ButtonType="Button" SelectText="Ayrıntılar" 
                                       ShowSelectButton="True" ><ControlStyle CssClass="button" /></asp:CommandField>
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
                   
              
                 <asp:Label ID="lblmsgsil" runat="server" Text="" CssClass="label" ForeColor="Red" Visible="false"></asp:Label>
                   
              
                </td>
            <td>
                 <asp:Panel ID="PnlSilme" runat="server" Width="500px" Visible="false" >
                     <table class="auto-style1">
                         <tr>
                             <td class="style10">
                                 <asp:Label ID="Label11" runat="server" Text="Duyuru Başlık" CssClass="label"></asp:Label>
                             </td>
                             <td class="style11">
                                 <asp:Label ID="Label111" runat="server" Text=":" CssClass="label"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="lblduyurubasliksil" runat="server" CssClass="label"></asp:Label>
                                 <asp:TextBox ID="textduyuruidsil" runat="server" Visible="false"></asp:TextBox>
                             </td>
                         </tr>
                         <tr>
                             <td class="style10">
                                 <asp:Label ID="Label122" runat="server" Text="Duyuru" CssClass="label"></asp:Label>
                             </td>
                             <td class="style11">
                                 <asp:Label ID="Label15" runat="server" Text=":" CssClass="label"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="lblduyurusil" runat="server" CssClass="label"></asp:Label>
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
                                 <asp:Label ID="lblduyurutarihsil" runat="server" CssClass="label"></asp:Label>
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
                        <asp:TemplateField HeaderText="ID" Visible="false"><ItemTemplate><asp:Label ID="lblDuyuruIDListe" runat="server" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>' 
                                        Visible="true"></asp:Label></ItemTemplate></asp:TemplateField>

                            <asp:TemplateField HeaderText="Duyuru Başlık"><ItemTemplate><asp:Label ID="lblDuyuruBaslikListe" Width="220px" runat="server" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ANNOUNCE_TITLE") %>' 
                                        Visible="true"></asp:Label></ItemTemplate></asp:TemplateField>
                            <asp:TemplateField HeaderText="Duyuru"><ItemTemplate><asp:Label ID="lblDuyuruListe" runat="server" Width="450px" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ANNOUNCE_CONTENT") %>' 
                                        ></asp:Label></ItemTemplate></asp:TemplateField>
                            <asp:TemplateField HeaderText="Tarih"><ItemTemplate><asp:Label ID="lblDuyuruTarihListe" runat="server" Width="200px" CssClass="label"
                                        Text='<%# DataBinder.Eval(Container,"DataItem.ANNOUNCE_DATE") %>' Visible="true" ></asp:Label></ItemTemplate></asp:TemplateField>
                            
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
