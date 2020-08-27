<%@ Page Title="" Language="C#" MasterPageFile="~/user_en.Master" AutoEventWireup="true" CodeBehind="userfollowers_en.aspx.cs" Inherits="mnwebproject.userfollowers_en" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style type="text/css">
         .style1 {
             width: 230px;
         }

         .style2 {
             width: 400px;
         }

         .style3 {
             width: 130px;
         }

         .style4 {
             width: 677px;
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
    <td class="style4">
    <asp:TextBox ID="TextSeaarch" runat="server" CssClass="inputs" Height="17px" Font-Size="10pt"  PlaceHolder="Enter Username,Name or Surname" Width="235px"></asp:TextBox>
    <asp:Button ID="BtnMainSearch" runat="server" Text="Search User" CssClass="arabutton" OnClick="BtnMainSearch_Click" />
    </td>
<td class="stylelogout"> <asp:Label ID="lblwelcomemsg" runat="server" Text="" ></asp:Label></td>
<td><asp:Button ID="AdminLogout" runat="server" Text="Logout" CssClass="arabutton" onclick="AdminLogout_Click" /></td>
</tr>
</table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
     <asp:Panel ID="PnlTakipci" runat="server">
    <asp:Label ID="lblbosmsg" runat="server" Text="" Visible="false" CssClass="label" ForeColor="Red"></asp:Label>
<table>
<tr>
<td></td>
<td>
<div style="text-align: center">
    <div id="content" style="text-align: justify">
        <asp:DataList ID="DataList1" runat="server" DataKeyField="ID" RepeatColumns="5" 
            FooterStyle-VerticalAlign="Bottom" onitemcommand="DataList1_ItemCommand" 
            RepeatDirection="Horizontal">
            <ItemTemplate>

            <table border="0" cellpadding="0" cellspacing="0" style="border: 2px inset #E2E2E2; margin-right: 3px; margin-bottom: 5px;">
                <tr>
                    <td style="text-align: center">
        <asp:Image ID="Image1" runat="server" Height="138px" ImageUrl='<%# Eval("PROFILE_PHOTO_URL", "profilephoto/{0}") %>'   Width="168px" /></td>
                </tr>
                <tr>
                    <td style="height: 25px; background-color: #E2E2E2; text-align: center; width:168px;">
                        <asp:Label ID="Label1" runat="server" style="font-style:normal; font-family:Verdana; color:Black; width:168px; font-Size:14px; margin:0px 1px 0px 0px;"
                            Text='<%# Eval("USER_NAME") %>'></asp:Label>
                            <asp:Label ID="Label2" runat="server" style="font-style:normal; font-family:Verdana; color:Black; width:168px; font-Size:14px; margin:0px 5px 0px 0px;"
                            Text='<%# Eval("USER_SURNAME") %>'></asp:Label>
                            </td>
                </tr>
                <tr>
                <td style="height: 25px; background-color: #E2E2E2; text-align: center; width:168px;">
               <asp:Button ID="BtnKisiProfili" runat="server" CommandName="Details" CommandArgument='<%#Eval("FOLLOWING_USER_ID")%>' Text="User Profile" CssClass="buttonyan" Font-Size="14px" />
                </td>
                </tr>
            </table>    
            </ItemTemplate>
        </asp:DataList></div>

    </div>
</td>
</tr>
</table>
    </asp:Panel>
      <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">  
<table>
<tr>
<td ></td>
<td>
<div style="text-align: center">
    <div id="Div1" style="text-align: justify">    
        <asp:DataList ID="DataList2" runat="server" DataKeyField="ID" RepeatColumns="5" 
            FooterStyle-VerticalAlign="Bottom" onitemcommand="DataList2_ItemCommand" 
            RepeatDirection="Horizontal">
            <ItemTemplate>
            <table cellpadding:"0"; cellspacing="0"; style="border: 2px inset #E2E2E2; margin-right: 3px; margin-bottom: 5px; border:0; ">
                <tr>
                    <td style="text-align: center">
        <asp:Image ID="Image2" runat="server" Height="138px" ImageUrl='<%# Eval("PROFILE_PHOTO_URL", "profilephoto/{0}") %>'   Width="168px" /></td>
                </tr>
                       <tr>
                            <td style="height: 25px; background-color: #E2E2E2; text-align: center; width:168px;">
                            <asp:Label ID="lbldatausername" runat="server" style="font-style:normal; font-family:Verdana; color:Black; width:168px; font-Size:14px; margin:0px 1px 0px 0px;"
                            Text='<%# Eval("USER_NAME") %>'></asp:Label>
                            <asp:Label ID="lbldatausersurname" runat="server" style="font-style:normal; font-family:Verdana; color:Black; width:168px; font-Size:14px; margin:0px 5px 0px 0px;"
                            Text='<%# Eval("USER_SURNAME") %>'></asp:Label>
                            </td>
                       </tr>
                <tr>
                <td style="height: 25px; background-color: #E2E2E2; text-align: center; width:168px;">
                <asp:Button ID="BtnKisiProfili" runat="server" CommandName="Details" CommandArgument='<%#Eval("ID")%>' Text="User Profile" CssClass="buttonyan" Font-Size="14px" />
                </td>
                </tr>
            </table>
            </ItemTemplate>
        </asp:DataList></div>

    </div>
</td>
</tr>
</table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <asp:Label ID="lblaramasonucmsg" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>
        </asp:View>
    </asp:MultiView>
</asp:Content>
