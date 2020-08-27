<%@ Page Title="" Language="C#" MasterPageFile="~/adminmain.Master" AutoEventWireup="true" CodeBehind="adminaboutprocess.aspx.cs" Inherits="mnwebproject.adminaboutprocess" %>
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
        .style104
        {
            width: 10px;
        }
        .style105
        {
            width: 61px;
        }
    </style>
    <link href="~/Styles/Admin.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table>
<tr>
<td class="style100">
</td>
<td class="style101">
    <asp:Label ID="Label31" runat="server" Text="Hakkımda İşlemleri Sayfası" 
        style="color:White; font-size:large;"></asp:Label>
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
    <td class="style104">
        &nbsp;</td>
    <td class="style105">
        <asp:Label ID="Label1" runat="server" Text="Başlık" CssClass="label"></asp:Label></td>
    <td>
    <asp:Label ID="lblid" runat="server" Text="" Visible="false" CssClass="label"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text=":" CssClass="label"></asp:Label></td>
    <td>
     <asp:Label ID="lblbaslik" runat="server" Text="" CssClass="label"></asp:Label>
    <asp:TextBox ID="txtid" runat="server" Visible="false"></asp:TextBox><asp:TextBox ID="txtbaslik"
        runat="server" CssClass="inputs" Visible="false"></asp:TextBox></td>
    </tr>
    <tr>
    <td class="style104">&nbsp;</td>
    <td class="style105">
        <asp:Label ID="Label3" runat="server" Text="İçerik" CssClass="label"></asp:Label></td>
    <td>
        <asp:Label ID="Label4" runat="server" Text=":" CssClass="label"></asp:Label></td>
    <td> <asp:Label ID="lblicerik" runat="server" Text="" CssClass="label"></asp:Label>
    <asp:TextBox ID="txticerik" runat="server" CssClass="inputs" Visible="false" TextMode="MultiLine" Width="300px" Height="200px" ></asp:TextBox></td>
    </tr>
    <tr>
    <td class="style104">&nbsp;</td>
    <td class="style105"></td>
    <td></td>
    <td><asp:Button ID="aktar" runat="server" Text="Düzenle" onclick="aktar_Click" CssClass="button" />
     <asp:Button ID="BtnDuzenle"
        runat="server" Text="Bitti" CssClass="button" 
        onclick="BtnDuzenle_Click" visible="false" />
        <asp:Button ID="BtnIptal" runat="server" Text="İptal" CssClass="button" 
            onclick="BtnIptal_Click" Visible="false" />
        </td>
    </tr>
    <tr>
    <td class="style104">&nbsp;</td>
    <td class="style105">&nbsp;</td>
    <td>&nbsp;</td>
    <td>
        <asp:Label ID="lblmssg" runat="server" Text="" CssClass="label" ForeColor="Red" Visible="false" ></asp:Label>
        </td>
    </tr>
    </table>
    


    <table>
    <tr>
    <td class="style104">
        &nbsp;</td>
    <td class="style105">
        <asp:Label ID="Label5" runat="server" Text="Title" CssClass="label"></asp:Label></td>
    <td>
    <asp:Label ID="lbliden" runat="server" Text="" Visible="false" CssClass="label"></asp:Label>
        <asp:Label ID="Label7" runat="server" Text=":" CssClass="label"></asp:Label></td>
    <td>
     <asp:Label ID="lbltitleen" runat="server" CssClass="label"></asp:Label>
    <asp:TextBox ID="textiden" runat="server" Visible="false"></asp:TextBox>
        <asp:TextBox ID="texttitleen"
        runat="server" CssClass="inputs" Visible="false"></asp:TextBox></td>
    </tr>
    <tr>
    <td class="style104">&nbsp;</td>
    <td class="style105">
        <asp:Label ID="Label9" runat="server" Text="Content" CssClass="label"></asp:Label></td>
    <td>
        <asp:Label ID="Label10" runat="server" Text=":" CssClass="label"></asp:Label></td>
    <td> <asp:Label ID="lblcontenten" runat="server" CssClass="label"></asp:Label>
    <asp:TextBox ID="textcontenten" runat="server" CssClass="inputs" Visible="false" 
            TextMode="MultiLine" Width="300px" Height="200px" ></asp:TextBox></td>
    </tr>
    <tr>
    <td class="style104">&nbsp;</td>
    <td class="style105"></td>
    <td></td>
    <td><asp:Button ID="Btnup" runat="server" Text="Update" 
            CssClass="button" onclick="Btnup_Click" />
     <asp:Button ID="BtnUpdate"
        runat="server" Text="Done" CssClass="button" 
         visible="false" onclick="BtnUpdate_Click" />
        <asp:Button ID="Btncancel" runat="server" Text="Cancel" CssClass="button" 
             Visible="false" onclick="Btncancel_Click" />
        </td>
    </tr>
    <tr>
    <td class="style104">&nbsp;</td>
    <td class="style105">&nbsp;</td>
    <td>&nbsp;</td>
    <td>
        <asp:Label ID="lblmsgen" runat="server" CssClass="label" ForeColor="Red" 
            Visible="False" ></asp:Label>
        </td>
    </tr>
    </table>
</asp:Content>
