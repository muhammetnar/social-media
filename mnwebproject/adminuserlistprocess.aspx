<%@ Page Title="" Language="C#" MasterPageFile="~/adminuser.Master" AutoEventWireup="true" CodeBehind="adminuserlistprocess.aspx.cs" Inherits="mnwebproject.adminuserlistprocess" %>

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
                <asp:Label ID="Label31" runat="server" Text="Üye Listesi Sayfası" Style="color: White; font-size: large;"></asp:Label>
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
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
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
                        runat="server" Width="300px" Visible="true"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="İsim" ItemStyle-Height="30px">
                <ItemTemplate>
                   <asp:Label ID="lblname" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.USER_NAME") %>'
                        runat="server" Width="295px" Visible="true"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Soyisim" ItemStyle-Height="30px">
                <ItemTemplate>
                    <asp:Label ID="lblsurname" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.USER_SURNAME") %>'
                        runat="server" Width="295px" Visible="true" ></asp:Label>
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
</asp:Content>
