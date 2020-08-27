<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="contact_tr.aspx.cs" Inherits="mnwebproject.contact_tr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <style type="text/css">
        .style9 {
            width: 20px;
        }

        .style10 {
            width: 20px;
            height: 9px;
        }

        .style11 {
            height: 9px;
        }

        .style12 {
        }

        .style13 {
            width: 1px;
        }

        .style14 {
            width: 111px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table class="style1">
        <tr>
            <td class="style10"></td>
            <td class="style11"></td>
        </tr>
        <tr>
            <td class="style9">&nbsp;</td>
            <td>

                <asp:Label ID="Label4" runat="server" Text="Benimle İletişime Geç" CssClass="label" ForeColor="Red"></asp:Label>

                <table class="style1">
                    <tr>
                        <td class="style14">&nbsp;</td>
                        <td class="style13">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style14">


                            <asp:Label ID="Label3" runat="server" Text="Adınız" CssClass="label"></asp:Label>

                        </td>
                        <td class="style13">
                            <asp:Label ID="Label2" runat="server" Text=":" CssClass="label"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="textname" runat="server" CssClass="inputs"></asp:TextBox>
                             <asp:Label ID="namechecklabel" runat="server" Text="*" Visible="false" CssClass="label" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label5" runat="server" Text="Soyadınız" CssClass="label"></asp:Label>
                        </td>
                        <td class="style13">

                            <asp:Label ID="Label6" runat="server" Text=":" CssClass="label"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="textsurname" runat="server" CssClass="inputs"></asp:TextBox>
                           <asp:Label ID="surnamechecklabel" runat="server" Text="*" Visible="false" CssClass="label" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            <asp:Label ID="Label8" runat="server" Text="E-Mail" CssClass="label"></asp:Label>
                        </td>
                        <td class="style13">
                            <asp:Label ID="Label9" runat="server" Text=":" CssClass="label"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="textemail" runat="server" CssClass="inputs"></asp:TextBox>
                            <asp:Label ID="emailchecklabel" runat="server" Text="*" Visible="false" CssClass="label" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">

                            <asp:Label ID="Label11" runat="server" Text="Mesajınız" CssClass="label"></asp:Label>
                        </td>
                        <td class="style13">

                            <asp:Label ID="Label12" runat="server" Text=":" CssClass="label"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="textmessage" runat="server" TextMode="MultiLine" CssClass="inputs" Height="70px"></asp:TextBox>
                            <asp:Label ID="messagechecklabel" runat="server" Text="*" Visible="false" CssClass="label" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">&nbsp;</td>
                        <td class="style13">&nbsp;</td>
                        <td>
                            <asp:Button ID="BtnSend" runat="server" Text="Gönder" CssClass="icerikbutton"  OnClick="BtnSend_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style12" colspan="3">
                            <asp:Label ID="lblmsg" runat="server" CssClass="label" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

</asp:Content>
