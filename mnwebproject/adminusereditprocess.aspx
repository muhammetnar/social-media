<%@ Page Title="" Language="C#" MasterPageFile="~/adminuser.Master" AutoEventWireup="true" CodeBehind="adminusereditprocess.aspx.cs" Inherits="mnwebproject.adminusereditprocess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            width: 895px;
        }

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
                <asp:Label ID="Label31" runat="server" Text="Üye Düzenleme Sayfası" Style="color: White; font-size: large;"></asp:Label>
            </td>
            <td class="style2">
                <asp:Label ID="lblwelcomemsg" runat="server" Text="" Style="color: White"></asp:Label></td>
            <td>
                <asp:Button ID="AdminLogout" runat="server" Text="Çıkış" CssClass="button" OnClick="AdminLogout_Click" /></td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table>
        <tr>
            <td class="style100">
                <asp:Label ID="Label1" runat="server" Text="Kullanıcı Adı veya İsim" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label2" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
                <asp:TextBox ID="TextSearch" runat="server" CssClass="inputs"></asp:TextBox></td>
            <td>
                <asp:Button ID="BtnSearch" runat="server" Text="Ara" CssClass="button" OnClick="BtnSearch_Click" /></td>
        </tr>
    </table>
    <br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
        CellPadding="3"
        DataKeyNames="ID"
        BackColor="White"
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField HeaderText="Id" Visible="false">
                <ItemTemplate>
                    <asp:Label ID="lblId" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>'
                        runat="server" Width="100px" Visible="false"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kullanıcı Adı" ItemStyle-Height="30px">
                <ItemTemplate>
                    <asp:Label ID="lblusername" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.USER_USERNAME") %>'
                        runat="server" Width="260px" Visible="true"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="İsim" ItemStyle-Height="30px">
                <ItemTemplate>
                   <asp:Label ID="lblname" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.USER_NAME") %>'
                        runat="server" Width="255px" Visible="true"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Soyisim" ItemStyle-Height="30px">
                <ItemTemplate>
                    <asp:Label ID="lblsurname" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.USER_SURNAME") %>'
                        runat="server" Width="255px" Visible="true" ></asp:Label>
                    <asp:Label ID="lblgender" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.USER_GENDER") %>'
                        runat="server"  Visible="false" ></asp:Label>
                    <asp:Label ID="lblemail" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.USER_EMAIL") %>'
                        runat="server"  Visible="false" ></asp:Label>
                    <asp:Label ID="lbleducation" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.USER_EDUCATION") %>'
                        runat="server"  Visible="false" ></asp:Label>
                    <asp:Label ID="lbljob" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.USER_JOB") %>'
                        runat="server"  Visible="false" ></asp:Label>
                    <asp:Label ID="lblcountry" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.COUNTRY_NAME") %>'
                        runat="server"  Visible="false" ></asp:Label>
                    <asp:Label ID="lblcity" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.CITY_NAME") %>'
                        runat="server"  Visible="false" ></asp:Label>
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
    <br /><br />
    <asp:Panel runat="server" ID="PnlEdit" Visible="false">
        <table>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label3" runat="server" Text="Kullanıcı Adı" CssClass="label"></asp:Label></td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text=":" CssClass="label"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TextId" runat="server" Visible="false"></asp:TextBox>
                    <asp:TextBox ID="TextUsername" runat="server" CssClass="inputs"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="İsim" CssClass="label"></asp:Label></td>
                <td>
                    <asp:Label ID="Label6" runat="server" Text=":" CssClass="label"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TextName" runat="server" CssClass="inputs"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Soyisim" CssClass="label"></asp:Label></td>
                <td>
                    <asp:Label ID="Label8" runat="server" Text=":" CssClass="label"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TextSurname" runat="server" CssClass="inputs"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="Cinsiyet" CssClass="label"></asp:Label></td>
                <td>
                    <asp:Label ID="Label10" runat="server" Text=":" CssClass="label"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TextGender" runat="server" CssClass="inputs"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label11" runat="server" Text="Email" CssClass="label"></asp:Label></td>
                <td>
                    <asp:Label ID="Label12" runat="server" Text=":" CssClass="label"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TextEmail" runat="server" CssClass="inputs"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label13" runat="server" Text="Eğitim" CssClass="label"></asp:Label></td>
                <td>
                    <asp:Label ID="Label14" runat="server" Text=":" CssClass="label"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TextEducation" runat="server" CssClass="inputs"></asp:TextBox></td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="Label15" runat="server" Text="Meslek" CssClass="label"></asp:Label></td>
                <td>
                    <asp:Label ID="Label16" runat="server" Text=":" CssClass="label"></asp:Label></td>
                <td><asp:TextBox ID="TextJob" runat="server" CssClass="inputs"></asp:TextBox></td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="Label17" runat="server" Text="Ülke" CssClass="label"></asp:Label></td>
                <td>
                    <asp:Label ID="Label18" runat="server" Text=":" CssClass="label"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TextCountry" runat="server" CssClass="inputs" ReadOnly="true"></asp:TextBox></td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="Label19" runat="server" Text="Şehir" CssClass="label"></asp:Label></td>
                <td>
                    <asp:Label ID="Label20" runat="server" Text=":" CssClass="label"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TextCity" runat="server" CssClass="inputs" ReadOnly="true"></asp:TextBox></td>
            </tr>
             <tr>
                <td></td>
                <td></td>
                <td>
                    <asp:Button ID="BtnUpdate" runat="server" Text="Güncelle" CssClass="button" OnClick="BtnUpdate_Click" />
                    <asp:Button ID="BtnCancel" runat="server" Text="İptal" CssClass="button" OnClick="BtnCancel_Click"/>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
