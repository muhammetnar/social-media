﻿<%@ Page Title="" Language="C#" MasterPageFile="~/adminmain.Master" AutoEventWireup="true" CodeBehind="adminhomepage.aspx.cs" Inherits="mnwebproject.adminhomepage" %>

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
                <asp:Label ID="Label31" runat="server" Text="Admin Anasayfası" Style="color: White; font-size: large;"></asp:Label>
            </td>
            <td class="style2">
                <asp:Label ID="lblwelcomemsg" runat="server" Text="" Style="color: White"></asp:Label></td>
            <td>
                <asp:Button ID="AdminLogout" runat="server" Text="Çıkış" CssClass="button" OnClick="AdminLogout_Click" /></td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>