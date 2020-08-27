<%@ Page Title="" Language="C#" MasterPageFile="~/adminuser.Master" AutoEventWireup="true" CodeBehind="adminuserarticleprocess.aspx.cs" Inherits="mnwebproject.adminuserarticleprocess" %>
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
        width: 130px;
    }
    .style103
    {
        width: 1px;
    }
    .style104
    {
        width: 102px;
    }
    .style105
    {
        width: 440px;
    }
    .style106
    {
        width: 103px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table>
<tr>
<td class="style100">
</td>
<td class="style101">
    <asp:Label ID="Label31" runat="server" Text="Makale İşlemleri Sayfası" style="color:White; font-size:large;"></asp:Label>
</td>
<td class="style2"> <asp:Label ID="lblwelcomemsg" runat="server" Text="" style="color:White"></asp:Label></td>
<td><asp:Button ID="AdminLogout" runat="server" Text="Çıkış" CssClass="button" onclick="AdminLogout_Click" 
         /></td>
</tr>
</table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
