﻿<%@ Page Title="" Language="C#" MasterPageFile="~/user_en.Master" AutoEventWireup="true" CodeBehind="userhomepage_en.aspx.cs" Inherits="mnwebproject.userhomepage_en" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style type="text/css">
        .style1 {
            width: 911px;
        }

        .style2 {
            width: 400px;
        }

        .style3 {
            width: 130px;
        }

        .stylelogout {
            width: 224px;
        }
    </style>
    <style type="text/css">
        a.sayfabasi {
            position: fixed;
            bottom: 15px;
            right: 10px;
            text-transform: uppercase;
        }

        .style36 {
            width: 390px;
        }

        .style38 {
            width: 460px;
        }

        .style39 {
            width: 117px;
        }

        .style40 {
            width: 116px;
        }

        .style42 {
            width: 135px;
        }

        .style43 {
            width: 690px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
      <table>
        <tr>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="uyeprofilfoto" runat="server" AutoGenerateColumns="False" CellPadding="0" DataKeyNames="ID" BorderColor="#CCCCCC" BorderStyle="NotSet" BorderWidth="0px">
                    <Columns>
                        <asp:ImageField DataImageUrlField="PROFILE_PHOTO_URL" DataImageUrlFormatString="~\profilephoto\{0}" ControlStyle-Height="130" ControlStyle-Width="130" />
                    </Columns>
                    <HeaderStyle CssClass="label" Font-Size="0px" BorderWidth="0px" />
                </asp:GridView>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <th>
                <asp:Label ID="lbladi" runat="server" Text="" CssClass="label" Font-Size="15px"></asp:Label>
            </th>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblsoyadi" runat="server" Text="" CssClass="label" Font-Size="15px"></asp:Label>
                <asp:Label ID="lblid" runat="server" Text="" Visible="false"></asp:Label>
                <hr />
                <table>
                    <tr>
                        <th style="width:75px;">
                            <asp:Label ID="Label6" runat="server" Text="Following" CssClass="label" Font-Size="12px"></asp:Label></th>
                        <th>
                            <asp:Label ID="Label7" runat="server" Text="Followers" CssClass="label" Font-Size="12px"></asp:Label></th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="lblfollowing" runat="server" Text="" CssClass="label" Font-Size="15px"></asp:Label></th>
                        <th>
                            <asp:Label ID="lblfollowers" runat="server" Text="" CssClass="label" Font-Size="15px"></asp:Label></th>
                    </tr>
                </table>
                <hr />
            </th>
        </tr>
        <tr>
            <td>
                <asp:Button ID="BtnAnasayfa" runat="server" Text="Homepage" CssClass="buttonyan" PostBackUrl="~/userhomepage_en.aspx" /></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="BtnProfilAyarlari" runat="server" Text="Profile Settings" CssClass="buttonyan" PostBackUrl="~/usersettings_en.aspx" /></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="BtnMakaleler" runat="server" Text="Articles" CssClass="buttonyan" PostBackUrl="~/userarticle_en.aspx" /></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="BtnFotogaleri" runat="server" Text="Photos" CssClass="buttonyan" PostBackUrl="~/userphotogallery_en.aspx" /></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="BtnTakipistek" runat="server" Text="Notifications" CssClass="buttonyan" PostBackUrl="~/userfollowrequest_en.aspx" /></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="BtnTakipçiler" runat="server" Text="Followers" CssClass="buttonyan" PostBackUrl="~/userfollowers_en.aspx" /></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="BtnTakipEdilenler" runat="server" Text="Following" CssClass="buttonyan" PostBackUrl="~/userfollowing_en.aspx" /></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="BtnGelenKutusu" runat="server" Text="Inbox" CssClass="buttonyan" PostBackUrl="~/usermessages_en.aspx" /></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="BtnIstekOneri" runat="server" Text="Request" CssClass="buttonyan" PostBackUrl="~/userreguestsuggestion_en.aspx" /></td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <table>
        <tr>
            <td class="style1"></td>
            <td class="stylelogout">
                <asp:Label ID="lblwelcomemsg" runat="server" ForeColor="Black" Text=""></asp:Label></td>
            <td>
                <asp:Button ID="AdminLogout" runat="server" Text="Logout" CssClass="arabutton" OnClick="AdminLogout_Click" /></td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
      <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table>
                <tr>
                    <td>
                        <div class="duyurular" style="float: left; width: 955px; height: auto">
                            <div class="ust" style="float: left; width: 938px; height: 44px; line-height: 44px; padding-left: 15px; border: 1px solid #ccc; color: #555; background-color: #c7e0e7;">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text="Following Articles" CssClass="label" ForeColor="Black" Font-Bold="true"></asp:Label></td>
                                        <td class="style36"></td>
                                        <td></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="alt" style="float: left; width: 920px; height: auto; padding: 16.5px; border: 1px solid #ccc; background-color: #fff;">
                                <asp:ListView ID="lstDuyuru" runat="server">

                                    <ItemTemplate>
                                        <div class="duyuru-wrap" style="float: left; width: 920px; height: auto;">
                                            <asp:Label ID="Label11" runat="server" CssClass="label" Text='<%# Eval("ARTICLE_TITLE") %>' Font-Size="Medium" ForeColor="Red" Font-Bold="True"></asp:Label><br />
                                            <br />
                                            <%--<asp:Label ID="Label22" runat="server" CssClass="label" Font-Size="Medium" Text='<%# Eval("MAKALE") %>'></asp:Label>--%>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("ARTICLE_CONTENT") %>' TextMode="MultiLine" Width="915px" Height="150px" Wrap="False" ReadOnly="True" Font-Names="courier"></asp:TextBox><br />
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label3" runat="server" Text="Author :" Font-Size="Medium" CssClass="label"></asp:Label>
                                                    </td>
                                                    <td style="width: 680px;">
                                                        <asp:Label ID="Label1" runat="server" ForeColor="Blue" Font-Size="Medium" CssClass="label" Text='<%# Eval("USER_NAME") %>'></asp:Label>
                                                        <asp:Label ID="Label2" runat="server" ForeColor="Blue" Font-Size="Medium" CssClass="label" Text='<%# Eval("USER_SURNAME") %>'></asp:Label></td>
                                                    <td style="width: 160px;">
                                                        <asp:Label ID="Label5" runat="server" ForeColor="Blue" Font-Size="Medium" CssClass="label" DataFormatString="{0:dd/MM/yyyy}" Text='<%# Eval("ARTICLE_DATE","{0:dd/MM/yyyy}") %>'></asp:Label></td>
                                                </tr>
                                            </table>
                                            <hr />
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
