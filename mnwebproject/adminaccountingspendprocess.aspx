<%@ Page Title="" Language="C#" MasterPageFile="~/adminaccounting.Master" AutoEventWireup="true" CodeBehind="adminaccountingspendprocess.aspx.cs" Inherits="mnwebproject.adminaccountingspendprocess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2 {
            width: 150px;
        }

        .style100 {
            width: 180px;
        }

        .style101 {
            width: 715px;
        }

        .style11 {
            width: 150px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table>
        <tr>
            <td class="style100"></td>
            <td class="style101">
                <asp:Label ID="Label31" runat="server" Text="Muhasebe Harcama İşlemleri" Style="color: White; font-size: large;"></asp:Label>
            </td>
            <td class="style2">
                <asp:Label ID="lblwelcomemsg" runat="server" Text="" Style="color: White"></asp:Label></td>
            <td>
                <asp:Button ID="AdminLogout" runat="server" Text="Çıkış" CssClass="button" OnClick="AdminLogout_Click" /></td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <table>
        <tr>
            <td></td>
            <td>
                <asp:Label ID="Label1" runat="server" Text="İşlem Seçiniz" CssClass="label"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Text=":" CssClass="label"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="inputs">
                    <asp:ListItem>Bir İşlem Seçiniz</asp:ListItem>
                    <asp:ListItem>Ekle</asp:ListItem>
                    <asp:ListItem>Güncelle</asp:ListItem>
                    <asp:ListItem>Sil</asp:ListItem>
                    <asp:ListItem>Listele</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="BtnOpen" runat="server" Text="Aç" CssClass="button" OnClick="BtnOpen_Click" />
            </td>
            <td>
                <asp:Label ID="lblopenmsg" runat="server" Text="" CssClass="label" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table>
                <tr>
                    <td></td>
                    <td class="style100">
                        <asp:Label ID="Label3" runat="server" Text="Kategori Başlığı" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text=":" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropAddCatTitle" runat="server" Width="200px" CssClass="inputs" OnSelectedIndexChanged="DropAddCatTitle_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        <asp:Label ID="lblAddcattitle" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:TextBox ID="TextAddCatid" runat="server" Visible="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Alt Kategori Başlığı" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text=":" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropAddSubCatTitle" runat="server" Width="200px" CssClass="inputs" OnSelectedIndexChanged="DropAddSubCatTitle_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        <asp:Label ID="lblAddsubcattitle" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:TextBox ID="TextAddSubCatid" runat="server" Visible="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Harcama Başlığı" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text=":" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextSpendTitle" runat="server" CssClass="inputs"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="Açıklama" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label10" runat="server" Text=":" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextSpendContent" runat="server" CssClass="inputs"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="Harcama Miktarı" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label12" runat="server" Text=":" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextSpendAmount" runat="server" CssClass="inputs"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="Label13" runat="server" Text="Tarih" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label14" runat="server" Text=":" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:Calendar ID="Calendar1" runat="server"
                            OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White"
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
                        <asp:TextBox ID="TextSpendDate" runat="server" Visible="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="lblspendid" runat="server" Text="Label" Visible="false" AutoPostBack="true"></asp:Label>
                    </td>
                    <td></td>
                    <td>
                        <asp:Button ID="BtnAdd" runat="server" Text="Ekle" CssClass="button" OnClick="BtnAdd_Click" AutoPostBack="true" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <asp:Label ID="lbladdmsg" runat="server" Text="" CssClass="label" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table>
                <tr>
                    <td class="style8"></td>
                    <td>
                        <asp:Label ID="Label15" runat="server" Text="Kategori" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label18" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="DropUpdateCatTitle" runat="server" Width="200px" CssClass="inputs" OnSelectedIndexChanged="DropUpdateCatTitle_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        <asp:Label ID="lblupdatecattitle" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:TextBox ID="TextUpdateCatId" runat="server" Visible="false"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>
                        <asp:Label ID="Label16" runat="server" Text="Alt Kategori" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label17" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="DropUpdateSubCatTitle" runat="server" Width="200px" CssClass="inputs" OnSelectedIndexChanged="DropUpdateSubCatTitle_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        <asp:Label ID="lblupdatesubcattitle" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:TextBox ID="TextUpdateSubCatId" runat="server" Visible="false"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="BtnUpdateOpen" runat="server" Text="Aç" CssClass="button" OnClick="BtnUpdateOpen_Click" />
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblupdateopenmsg" runat="server" Text="" Visible="false" CssClass="label" Font-Size="Small" ForeColor="Red"></asp:Label></td>
                </tr>
            </table>
            <br />
            <hr style="height: 2px;" />
            <br />
            <table>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                            CellPadding="3" DataKeyNames="ID" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:TemplateField HeaderText="Başlık" ItemStyle-Height="30px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblspendid" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>'
                                            runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="lblspendtitle" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ACCO_SPEND_TITLE") %>'
                                            runat="server" Width="510px" Visible="true"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ücret" ItemStyle-Height="30px">
                                    <ItemTemplate>

                                        <asp:Label ID="lblspendamount" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ACCO_SPEND_AMOUNT") %>'
                                            runat="server" Width="250px" Visible="true"></asp:Label>
                                        <asp:Label ID="lblspendcomment" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ACCO_SPEND_COMMENT") %>'
                                            runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="lblspenddate" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ACCO_SPEND_DATE") %>'
                                            runat="server" Visible="false"></asp:Label>


                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:CommandField ButtonType="Button" SelectText="Ayrıntılar"
                                    ShowSelectButton="True" ItemStyle-Height="30px">

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

                        <asp:Label ID="lblupdatemsg" runat="server" CssClass="label"
                            ForeColor="Red" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Panel ID="Pnlupdate" runat="server" Visible="false" Width="900px">
                            <br />
                            <br />
                            <br />
                            <table>
                                <tr>
                                    <td class="style103">&nbsp;</td>
                                    <td class="style11">
                                        <asp:Label ID="Label24" runat="server" CssClass="label" Text="Başlık"></asp:Label>
                                    </td>
                                    <td class="style39">
                                        <asp:Label ID="Label25" runat="server" CssClass="label" Text=":"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="id" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="title" runat="server" CssClass="label"
                                            Visible="False"></asp:Label>
                                        <asp:TextBox ID="textId" runat="server" Visible="False"></asp:TextBox>
                                        <asp:TextBox ID="texttitle" runat="server" CssClass="inputs"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style103">&nbsp;</td>
                                    <td class="style11">
                                        <asp:Label ID="Label19" runat="server" CssClass="label" Text="Ucret"></asp:Label>
                                    </td>
                                    <td class="style39">
                                        <asp:Label ID="Label20" runat="server" CssClass="label" Text=":"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="amount" runat="server" CssClass="label"
                                            Visible="False"></asp:Label>
                                        <asp:TextBox ID="textamount" runat="server" CssClass="inputs"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style103">&nbsp;</td>
                                    <td class="style11">
                                        <asp:Label ID="Label21" runat="server" Text="Açıklama" CssClass="label"></asp:Label></td>
                                    <td class="style39">
                                        <asp:Label ID="Label111" runat="server" Text=":" CssClass="label"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="comment" runat="server" CssClass="label" Visible="False"></asp:Label>
                                        <asp:TextBox ID="textcomment" runat="server" CssClass="inputs"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style103">&nbsp;</td>
                                    <td class="style11">
                                        <asp:Label ID="Label22" runat="server" Text="Tarih" CssClass="label"></asp:Label></td>
                                    <td class="style39">
                                        <asp:Label ID="Label23" runat="server" Text=":" CssClass="label"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="date" runat="server" CssClass="label"
                                            Visible="False"></asp:Label>
                                        <asp:Calendar ID="dtUpdate" runat="server" BackColor="White"
                                            BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest"
                                            CssClass="label" Font-Size="9pt" ForeColor="Black" Height="180px"
                                            Width="200px">
                                            <DayHeaderStyle BackColor="#6680A6" Font-Bold="True" ForeColor="White" Font-Size="7pt" />
                                            <NextPrevStyle VerticalAlign="Bottom" ForeColor="White" />
                                            <OtherMonthDayStyle ForeColor="#808080" />
                                            <SelectedDayStyle BackColor="#566F96" Font-Bold="True" ForeColor="White" CssClass="label" Font-Size="9pt" />
                                            <SelectorStyle BackColor="#CCCCCC" />
                                            <TitleStyle BackColor="#566F96" BorderColor="Black" Font-Bold="True" ForeColor="White" />
                                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                            <WeekendDayStyle BackColor="#FFFFCC" />
                                        </asp:Calendar>
                                       
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style103">&nbsp;</td>
                                    <td class="style11">&nbsp;</td>
                                    <td class="style39">&nbsp;</td>
                                    <td>
                                        <asp:Button ID="BtnUpdate" runat="server" Text="Guncelle" CssClass="button" OnClick="BtnUpdate_Click" />
                                        <asp:Button ID="BtnUpdateCancel" runat="server" Text="İptal" CssClass="button" OnClick="BtnUpdateCancel_Click" />

                                    </td>
                                </tr>
                                <tr>
                                    <td class="style103">&nbsp;</td>
                                    <td class="style11">&nbsp;</td>
                                    <td class="style39" colspan="2">&nbsp;</td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <table>
                <tr>
                    <td class="style8"></td>
                    <td>
                        <asp:Label ID="Label26" runat="server" Text="Kategori" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label27" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="DropDeleteCatTitle" runat="server" Width="200px" CssClass="inputs" OnSelectedIndexChanged="DropDeleteCatTitle_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        <asp:Label ID="lbldeletecattitle" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:TextBox ID="TextDeleteCatId" runat="server" Visible="false"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>
                        <asp:Label ID="Label29" runat="server" Text="Alt Kategori" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label30" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="DropDeleteSubCatTitle" runat="server" Width="200px" CssClass="inputs" OnSelectedIndexChanged="DropDeleteSubCatTitle_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        <asp:Label ID="lbldeletesubcattitle" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:TextBox ID="TextDeleteSubCatId" runat="server" Visible="false"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="BtnDeleteOpen" runat="server" Text="Aç" CssClass="button" OnClick="BtnDeleteOpen_Click" />
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lbldeleteopenmsg" runat="server" Text="" Visible="false" CssClass="label" Font-Size="Small" ForeColor="Red"></asp:Label></td>
                </tr>
            </table>
            <br />
            <hr style="height: 2px;" />
            <br />
            <table>
                <tr>
                    <td class="style8">&nbsp;</td>
                    <td>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
                            CellPadding="3"
                            DataKeyNames="ID"
                            BackColor="White"
                            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                            <Columns>
                                <asp:TemplateField HeaderText="Id" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblId" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>'
                                            runat="server" Width="100px" Visible="false"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Başlık" ItemStyle-Height="30px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTitle" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ACCO_SPEND_TITLE") %>'
                                            runat="server" Width="510px" Visible="true"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ücret" ItemStyle-Height="30px">
                                    <ItemTemplate>

                                        <asp:Label ID="lblAmount" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ACCO_SPEND_AMOUNT") %>'
                                            runat="server" Width="250px" Visible="true"></asp:Label>
                                        <asp:Label ID="lblComment" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ACCO_SPEND_COMMENT") %>'
                                            runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="lblDate" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ACCO_SPEND_DATE") %>'
                                            runat="server" Visible="false"></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ButtonType="Button" SelectText="Ayrıntılar" ItemStyle-Height="30px"
                                    ShowSelectButton="True">

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
                        <asp:Label ID="lbldeletemsg" runat="server" CssClass="label" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Panel ID="Pnldelete" runat="server" Visible="false" Width="900px">
                            <br />
                            <br />
                            <br />
                            <table>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td class="style11">
                                        <asp:Label ID="Label28" runat="server" Text="Id" CssClass="label"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label32" runat="server" Text=":" CssClass="label"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lbldeleteid" runat="server" CssClass="label"></asp:Label>
                                        <asp:TextBox ID="Textdeleteid" runat="server" Visible="False"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td class="style11">
                                        <asp:Label ID="Label39" runat="server" Text="Başlık" CssClass="label"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label40" runat="server" Text=":" CssClass="label"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lbldeletetitle" runat="server" CssClass="label"></asp:Label>
                                        <asp:TextBox ID="Textdeletetitle" runat="server" Visible="False"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td class="style11">
                                        <asp:Label ID="Label33" runat="server" Text="Ücret" CssClass="label"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label34" runat="server" Text=":" CssClass="label"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lbldeleteamount" runat="server" CssClass="label"></asp:Label>
                                        <asp:TextBox ID="Textdeleteamount" Visible="false" runat="server" CssClass="inputs"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td class="style11">
                                        <asp:Label ID="Label35" runat="server" Text="Açıklama" CssClass="label"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label36" runat="server" Text=":" CssClass="label"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lbldeletecomment" runat="server" CssClass="label"></asp:Label>
                                        <asp:TextBox ID="Textdeletecomment" Visible="false" runat="server" CssClass="inputs"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td class="style11">
                                        <asp:Label ID="Label37" runat="server" Text="Tarih" CssClass="label"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label38" runat="server" Text=":" CssClass="label"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lbldeletedate" runat="server" CssClass="label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td class="style11">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Button ID="BtnDelete" runat="server" Text="Sil" CssClass="button" OnClick="BtnDelete_Click" />
                                        <asp:Button ID="BtnDeleteCancel" runat="server" Text="İptal" CssClass="button" OnClick="BtnDeleteCancel_Click" />
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
                    <td class="style8"></td>
                    <td>
                        <asp:Label ID="Label41" runat="server" Text="Kategori" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label42" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="DropListCatTitle" runat="server" Width="200px" CssClass="inputs" OnSelectedIndexChanged="DropListCatTitle_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        <asp:Label ID="lbllistcattitle" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:TextBox ID="TextListCatId" runat="server" Visible="false"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>
                        <asp:Label ID="Label44" runat="server" Text="Alt Kategori" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label45" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="DropListSubCatTitle" runat="server" Width="200px" CssClass="inputs" OnSelectedIndexChanged="DropListSubCatTitle_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        <asp:Label ID="lbllistsubcattitle" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:TextBox ID="TextListSubCatId" runat="server" Visible="false"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="BtnListOpen" runat="server" Text="Aç" CssClass="button" OnClick="BtnListOpen_Click" />
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lbllistopenmsg" runat="server" Text="" Visible="false" CssClass="label" Font-Size="Small" ForeColor="Red"></asp:Label></td>
                </tr>
            </table>
            <br />
            <hr style="height: 2px;" />
            <br />
            <table>
                <tr>
                    <td></td>
                    <td>
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False"
                            CellPadding="3"
                            DataKeyNames="ID"
                            BackColor="White"
                            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                            <Columns>
                                <asp:TemplateField HeaderText="Id" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblId" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>'
                                            runat="server" Visible="false"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Başlık">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTitle" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ACCO_SPEND_TITLE") %>'
                                            runat="server" Width="150px" Visible="true" Font-Size="Small"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ücret">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAmount" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ACCO_SPEND_AMOUNT") %>'
                                            runat="server" Width="90px" Visible="true" Font-Size="Small"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Açıklama">
                                    <ItemTemplate>

                                        <asp:Label ID="lblContent" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ACCO_SPEND_COMMENT") %>'
                                            runat="server" Width="485px" Visible="true" Font-Size="Small"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tarih">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDate" CssClass="label" DataFormatString="{0:dd/MM/yyyy}" Text='<%# DataBinder.Eval(Container,"DataItem.ACCO_SPEND_DATE","{0:dd/MM/yyyy}") %>'
                                            runat="server" Width="150px" Visible="true" Font-Size="Small"></asp:Label>

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
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="BtnWordTransfer" runat="server" Text="Word'e Aktar" Visible="false"
                            CssClass="button" OnClick="BtnWordTransfer_Click" />
                        <asp:Button ID="BtnExcelTransfer" runat="server" Text="Excel'e Aktar" Visible="false"
                            CssClass="button" OnClick="BtnExcelTransfer_Click" />
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
