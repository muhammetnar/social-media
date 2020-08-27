<%@ Page Title="" Language="C#" MasterPageFile="~/user_en.Master" AutoEventWireup="true" CodeBehind="userreguestsuggestion_en.aspx.cs" Inherits="mnwebproject.userreguestsuggestion_en" %>
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
     <asp:Label ID="Label1" runat="server" Text="You can send request and suggestions from this page to admin.Your message will definitely be taken into consideration." CssClass="label" ForeColor="Red" Font-Size="11pt"></asp:Label>
    <br />
    <br />
    <table>
        <tr>
            <td class="style3">
                <asp:Label ID="Label2" runat="server" Text="E-Mail Address" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label4" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
                <asp:TextBox ID="Textemail" runat="server" CssClass="inputs"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Topic" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label5" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
                <asp:TextBox ID="TextTopic" runat="server" CssClass="inputs"></asp:TextBox></td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Your Message" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label9" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
                <asp:TextBox ID="TextMessage" runat="server" CssClass="inputs" TextMode="MultiLine" Height="70px"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td>
                <asp:Button ID="BtnSend" runat="server" Text="Send" OnClick="BtnSend_Click" CssClass="icerikbutton" /></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td>
                <asp:Label ID="lblmsg" runat="server" Text="" CssClass="label" ForeColor="Red"></asp:Label></td>
        </tr>
    </table>
</asp:Content>
