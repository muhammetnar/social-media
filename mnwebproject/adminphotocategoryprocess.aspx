<%@ Page Title="" Language="C#" MasterPageFile="~/adminmain.Master" AutoEventWireup="true" CodeBehind="adminphotocategoryprocess.aspx.cs" Inherits="mnwebproject.adminphotocategoryprocess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            width: 180px;
        }

        .style2 {
            width: 715px;
        }

        .style3 {
            width: 150px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table>
        <tr>
            <td class="style1"></td>
            <td class="style2">
                <asp:Label ID="Label31" runat="server" Text="Fotogaleri - Kategori İşlemleri Sayfası" Style="color: White; font-size: large;"></asp:Label>
            </td>
            <td class="style3">
                <asp:Label ID="lblwelcomemsg" runat="server" Text="" Style="color: White"></asp:Label></td>
            <td>
                <asp:Button ID="AdminLogout" runat="server" Text="Çıkış" CssClass="button" OnClick="AdminLogout_Click" /></td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <asp:Label ID="Label11" runat="server" Text="İşlem Seçiniz" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label12" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
                <asp:DropDownList ID="DropProcess" runat="server" CssClass="inputs">
                    <asp:ListItem>Bir İşlem Seçiniz</asp:ListItem>
                    <asp:ListItem>Ekle</asp:ListItem>
                    <asp:ListItem>Güncelle</asp:ListItem>
                    <asp:ListItem>Sil</asp:ListItem>
                    <asp:ListItem>Listele</asp:ListItem>
                </asp:DropDownList></td>
            <td>
                <asp:Button ID="BtnOpen" runat="server" Text="Aç" CssClass="button" OnClick="BtnOpen_Click" /></td>
            <td>
                <asp:Label ID="lblopenmsg" runat="server" Text="" ForeColor="Red" CssClass="label"></asp:Label></td>
        </tr>
    </table>
    <hr />
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table>
                <tr>
                    <td class="style3">
                        <asp:Label ID="Label1" runat="server" Text="Kategori İsmi" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextCatName" runat="server" CssClass="inputs"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Resim Seçiniz" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:FileUpload ID="fotoaddfile" runat="server" CssClass="inputs" /></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="Dil Seçiniz" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label10" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="DropAddLanguage" runat="server" CssClass="inputs" Width="202px">
                            <asp:ListItem>Bir Dil Seçiniz</asp:ListItem>
                            <asp:ListItem>Türkçe</asp:ListItem>
                            <asp:ListItem>İngilizce</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <asp:Button ID="BtnAdd" runat="server" Text="Ekle" CssClass="button" OnClick="BtnAdd_Click" />
                        <asp:Button ID="BtnAddCancel" runat="server" Text="İptal" CssClass="button" OnClick="BtnAddCancel_Click" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <asp:Label ID="lbladdmsg" runat="server" Text="" ForeColor="Red" CssClass="label"></asp:Label></td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                CellPadding="3" DataKeyNames="ID" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="Başlık">
                        <ItemTemplate>
                            <asp:Label ID="lblupdatecatid" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>'
                                runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="lblupdatecattitle" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.CATEGORY_TITLE") %>'
                                runat="server" Width="350px" Visible="true" Font-Size="14px"></asp:Label>
                            <asp:Label ID="lblupdatecaturl" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.CAT_PHOTO_URL") %>'
                                runat="server" Width="540px" Visible="false" Font-Size="13px"></asp:Label>
                            <asp:Label ID="lblupdatecatlanguage" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.CAT_PHOTO_LANGUAGE") %>'
                                runat="server" Visible="false"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField ButtonType="Button" SelectText="Ayrıntılar"
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
            <br />
            <br />
            <asp:Panel ID="PnlUpdate" runat="server" Width="900px" Visible="false">
                <table>
                    <tr>
                        <td class="Style3">
                            <asp:Label ID="Label13" runat="server" Text="Fotoğraf Başlığı" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label14" runat="server" Text=":" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="Textupdatecatid" runat="server" Visible="false"></asp:TextBox>
                            <asp:TextBox ID="Textupdatecattitle" runat="server" CssClass="inputs"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label17" runat="server" Text="Fotoğraf Seçiniz" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label18" runat="server" Text=":" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="textupdatecaturl" runat="server" Visible="false"></asp:TextBox>
                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="inputs" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label15" runat="server" Text="Fotoğraf İçeriği" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label16" runat="server" Text=":" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="Textupdatecatlanguage" runat="server" CssClass="inputs" Visible="false"></asp:TextBox>
                            <asp:DropDownList ID="DropUpdateLanguage" runat="server" CssClass="inputs" Width="202px">
                                <asp:ListItem>Bir Dil Seçiniz</asp:ListItem>
                                <asp:ListItem>Türkçe</asp:ListItem>
                                <asp:ListItem>İngilizce</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <asp:Button ID="BtnUpdate" runat="server" Text="Güncelle" OnClick="BtnUpdate_Click" CssClass="button" />
                            <asp:Button ID="BtnUpdateCancel" runat="server" Text="İptal" CssClass="button" OnClick="BtnUpdateCancel_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <asp:Label ID="lblupdatemsg" runat="server" Text="" ForeColor="Red" CssClass="label"></asp:Label></td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
                CellPadding="3" DataKeyNames="ID" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="Başlık">
                        <ItemTemplate>
                            <asp:Label ID="lbldeletecatid" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>'
                                runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="lbldeletecattitle" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.CATEGORY_TITLE") %>'
                                runat="server" Width="350px" Visible="true" Font-Size="14px"></asp:Label>
                            <asp:Label ID="lbldeletecaturl" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.CAT_PHOTO_URL") %>'
                                runat="server" Width="540px" Visible="false" Font-Size="13px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" SelectText="Ayrıntılar"
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
            <br />
            <br />
            <asp:Panel ID="PnlDelete" runat="server" Width="900px" Visible="false">
                <table>
                    <tr>
                        <td class="Style3">
                            <asp:Label ID="Label5" runat="server" Text="Fotoğraf Başlığı" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text=":" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="Textdeletecatid" runat="server" Visible="false" ReadOnly="true"></asp:TextBox>
                            <asp:TextBox ID="Textdeletecattitle" runat="server" CssClass="inputs"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <asp:Button ID="BtnDelete" runat="server" Text="Sil" CssClass="button" OnClick="BtnDelete_Click" />
                            <asp:Button ID="BtnDeleteCancel" runat="server" Text="İptal" CssClass="button" OnClick="BtnDeleteCancel_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <asp:Label ID="lbldeletemsg" runat="server" Text="" ForeColor="Red" CssClass="label"></asp:Label></td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:View>
        <asp:View ID="View4" runat="server">
            <br />
            <table>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False"
                            CellPadding="3" DataKeyNames="ID" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                            <Columns>
                                <asp:TemplateField HeaderText="Başlık">
                                    <ItemTemplate>
                                        <asp:Label ID="lbllistcatid" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>'
                                            runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="lbllistcattitle" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.CATEGORY_TITLE") %>'
                                            runat="server" Width="500px" Visible="true" Font-Size="14px"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Dil">
                                    <ItemTemplate>
                                        <asp:Label ID="lbllistcaturl" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.CAT_PHOTO_LANGUAGE") %>'
                                            runat="server" Width="120px" Visible="true" Font-Size="14px"></asp:Label>
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
            <br />
            <br />
        </asp:View>
    </asp:MultiView>
</asp:Content>
