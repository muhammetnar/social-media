<%@ Page Title="" Language="C#" MasterPageFile="~/adminaccounting.Master" AutoEventWireup="true" CodeBehind="adminaccountingcategoryprocess.aspx.cs" Inherits="mnwebproject.adminaccountingcategoryprocess" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table>
        <tr>
            <td class="style100"></td>
            <td class="style101">
                <asp:Label ID="Label31" runat="server" Text="Muhasebe Kategori İşlemleri" Style="color: White; font-size: large;"></asp:Label>
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
                    <td class="style2">
                        <asp:Label ID="Label3" runat="server" Text="Kategori Başlığı" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text=":" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextCatTitle" runat="server" CssClass="inputs"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <asp:Button ID="BtnAdd" runat="server" Text="Ekle" CssClass="button" OnClick="BtnAdd_Click" />
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
                    <td></td>
                    <td class="style4">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="ID" Width="400px"
                            CellPadding="4" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                            BackColor="White" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:TemplateField HeaderText="ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblId" Width="120px" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>'
                                            runat="server" Visible="false"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Kategori Başlığı">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCategory" Width="400px" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ACCO_CAT_TITLE") %>'
                                            runat="server" Visible="true"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:CommandField ButtonType="Button" SelectText="Aç"
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
                        <asp:Label ID="lblupdatemsg" runat="server" Text="" CssClass="label" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <asp:Panel ID="Pnlupdate" runat="server" Visible="false">
                <table>
                    <tr>
                        <td></td>
                        <td class="style2">
                            <asp:Label ID="Label5" runat="server" Text="Kategori Adı" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text=":" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblcategoryid" runat="server" Text="" Visible="false"></asp:Label><asp:TextBox ID="txtcategoryid" runat="server" CssClass="inputs" Visible="false"></asp:TextBox>
                            <asp:Label ID="lblcategoryname" runat="server" Text="" Visible="false"></asp:Label><asp:TextBox ID="txtcategoryname" runat="server" CssClass="inputs"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <asp:Button ID="Btnupdate" runat="server" Text="Güncelle" CssClass="button" OnClick="Btnupdate_Click" />
                            <asp:Button ID="Updatecancelbtn" runat="server" Text="İptal"
                                CssClass="button" OnClick="Updatecancelbtn_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <table>
                <tr>
                    <td></td>
                    <td>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="ID" Width="320px" BorderColor="#CCCCCC"
                            BorderStyle="None" BorderWidth="1px"
                            CellPadding="4" BackColor="White" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                            <Columns>
                                <asp:TemplateField HeaderText="ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDeleteId" Width="120px" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>'
                                            runat="server" Visible="false"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Kategori Başlığı">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDeleteCategoryName" Width="400px" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ACCO_CAT_TITLE") %>'
                                            runat="server" Visible="true"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:CommandField ButtonType="Button" SelectText="Aç"
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
                        <asp:Label ID="lbldeletemsg" runat="server" Text="" CssClass="label" ForeColor="Red" Visible="false"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <asp:Panel ID="PnlDeleteCategory" runat="server" Visible="false">
                <table>
                    <tr>
                        <td></td>
                        <td class="style2">
                            <asp:Label ID="Label7" runat="server" Text="Kategori Adı" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text=":" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:Label ID="lbldeletecategoryname" runat="server" Text="Kategori Adı" CssClass="label">
                                <asp:Label ID="lbldeletecategoryid" runat="server" Text="" CssClass="label"></asp:Label></asp:Label><asp:TextBox ID="txtdeletecategoryid"
                                    runat="server" Visible="false"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <asp:Button ID="Btndeletecategory" runat="server" Text="Sil" CssClass="button" OnClick="Btndeletecategory_Click" />
                            <asp:Button ID="Btndeletecategorycancel" runat="server" Text="İptal" CssClass="button" OnClick="Btndeletecategorycancel_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:View>
        <asp:View ID="View4" runat="server">
            <table>
                <tr>
                    <td></td>
                    <td>
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="ID" Width="900px" BorderColor="#CCCCCC"
                            BorderStyle="None" BorderWidth="1px"
                            CellPadding="4" BackColor="White">
                            <Columns>
                                <asp:TemplateField HeaderText="ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblListId" Width="10px" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>'
                                            runat="server" Visible="false"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Kategori Başlığı">
                                    <ItemTemplate>
                                        <asp:Label ID="lblListCategory" Width="900px" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ACCO_CAT_TITLE") %>'
                                            runat="server" Visible="true"></asp:Label>
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
