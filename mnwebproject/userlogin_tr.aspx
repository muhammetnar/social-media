<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="userlogin_tr.aspx.cs" Inherits="mnwebproject.userlogin_tr" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .style13
        {
            width: 20px;
        }
        .style14
        {
            width: 20px;
            height: 24px;
        }
        .style15
        {
            height: 24px;
        }
        .style16
        {
            height: 24px;
            width: 140px;
        }
        .style17
        {
            width: 140px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <table>
<tr>
<td class="style14"></td>
<td class="style16"></td>
<td class="style15"></td>
<td class="style15"></td>
</tr>
<tr>
<td class="style13"></td>
<td class="style17">
    <asp:Label ID="Label1" runat="server" Text="Kullanıcı Adı" CssClass="label"></asp:Label></td>
<td>
    <asp:Label ID="Label2" runat="server" Text=":" CssClass="label"></asp:Label></td>
<td>
    <asp:TextBox ID="kadi" runat="server" CssClass="inputs"></asp:TextBox></td>
</tr>
<tr>
<td class="style13"></td>
<td class="style17">
    <asp:Label ID="Label3" runat="server" Text="Şifre" CssClass="label"></asp:Label></td>
<td>
    <asp:Label ID="Label4" runat="server" Text=":" CssClass="label"></asp:Label></td>
<td>
    <asp:TextBox ID="sifre" runat="server" CssClass="inputs" TextMode="Password"></asp:TextBox></td>
</tr>
<tr>
<td class="style13"></td>
<td class="style17"></td>
<td></td>
<td>
    <asp:Button ID="BtnLogin" runat="server" Text="Giriş Yap" CssClass="icerikbutton" OnClick="BtnLogin_Click" />
    
    </td>
</tr>
<tr>
<td class="style13"></td>
<td class="style17"></td>
<td></td>
<td><asp:Button ID="Btnforgotpassword" runat="server" Text="Şifremi Unuttum" 
        CssClass="icerikbutton" /></td>
</tr>
<tr>
<td class="style13"></td>
<td class="style17"></td>
<td></td>
<td> <asp:Label ID="lblmsg" runat="server" Text="" CssClass="label" ForeColor="Red"></asp:Label> </td>
</tr>
</table>
<br />
<br />
</asp:Content>
