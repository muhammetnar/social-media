<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="userfollowers_tr.aspx.cs" Inherits="mnwebproject.userfollowers_tr" %>
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
             width: 691px;
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
             <asp:GridView ID="uyeprofilfoto" runat="server" AutoGenerateColumns="False" CellPadding="0"   DataKeyNames="ID" BorderColor="#CCCCCC" BorderStyle="NotSet" BorderWidth="0px" >
                                <Columns >
                                     <asp:ImageField DataImageUrlField="PROFILE_PHOTO_URL" DataImageUrlFormatString="~\profilephoto\{0}" ControlStyle-Height="130" ControlStyle-Width="130"  />
                                </Columns>
                                <HeaderStyle   CssClass="label" Font-Size="0px" BorderWidth="0px" />     
             </asp:GridView>
  </td>
  </tr>
        </table>
       <table>
  <tr>
  <th>
  <asp:Label ID="lbladi" runat="server" Text="" CssClass="label" Font-Size="15px" ></asp:Label>
  </th>
  </tr>
  <tr>
  <th>
  <asp:Label ID="lblsoyadi" runat="server" Text="" CssClass="label"  Font-Size="15px"></asp:Label>
  <asp:Label ID="lblid" runat="server" Text="" Visible="false" ></asp:Label>
      <hr />
      <table>
          <tr>
              <th>
                  <asp:Label ID="Label6" runat="server" Text="Takip Edilenler" CssClass="label" Font-Size="12px"></asp:Label></th>
              <th>
                  <asp:Label ID="Label7" runat="server" Text="Takipçiler" CssClass="label" Font-Size="12px"></asp:Label></th>
          </tr>
          <tr>
              <th><asp:Label ID="lblfollowing" runat="server" Text="" CssClass="label" Font-Size="15px"></asp:Label></th>
              <th><asp:Label ID="lblfollowers" runat="server" Text="" CssClass="label" Font-Size="15px"></asp:Label></th>
          </tr>
      </table>
      <hr />
      <asp:Label ID="lblemail" runat="server" Text="Label" Visible="false"></asp:Label>
     <asp:TextBox ID="uyeid" runat="server" Visible="false"></asp:TextBox>

  </th>
  </tr>
  <tr>
  <td>
      <asp:Button ID="BtnAnasayfa" runat="server" Text="Anasayfa" CssClass="buttonyan" PostBackUrl="~/userhomepage_tr.aspx" /></td>
  </tr>
  <tr>
  <td>
      <asp:Button ID="BtnProfilAyarlari" runat="server" Text="Profil Ayarları" CssClass="buttonyan" PostBackUrl="~/usersettings_tr.aspx" /></td>
  </tr>
   <tr>
  <td>
      <asp:Button ID="BtnMakaleler" runat="server" Text="Makaleler" CssClass="buttonyan" PostBackUrl="~/userarticle_tr.aspx" /></td>
  </tr>
   <tr>
  <td>
      <asp:Button ID="BtnFotogaleri" runat="server" Text="Fotoğraflar" CssClass="buttonyan" PostBackUrl="~/userphotogallery_tr.aspx" /></td>
  </tr>
   <tr>
  <td>
      <asp:Button ID="BtnTakipistek" runat="server" Text="Takip İstekleri" CssClass="buttonyan" PostBackUrl="~/userfollowrequest_tr.aspx" /></td>
  </tr>
  <tr> 
  <td>
      <asp:Button ID="BtnTakipçiler" runat="server" Text="Takipçiler" CssClass="buttonyan" PostBackUrl="~/userfollowers_tr.aspx" /></td>
  </tr>
  <tr>
  <td>
      <asp:Button ID="BtnTakipEdilenler" runat="server" Text="Takip Edilenler" CssClass="buttonyan" PostBackUrl="~/userfollowing_tr.aspx" /></td>
  </tr>
   <tr>
  <td>
      <asp:Button ID="BtnGelenKutusu" runat="server" Text="Gelen Kutusu" CssClass="buttonyan" PostBackUrl="~/usermessages_tr.aspx" /></td>
  </tr>
  <tr>
  <td>
      <asp:Button ID="BtnIstekOneri" runat="server" Text="İstek Ve Öneri" CssClass="buttonyan" PostBackUrl="~/userrequestsuggestion.aspx" /></td>
  </tr>
  </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <table>
<tr>
<td class="style1"></td>
    <td class="style4">
    <asp:TextBox ID="TextSeaarch" runat="server" CssClass="inputs" Height="17px" Font-Size="10pt"  PlaceHolder="Kullanıcı Adı,İsim veya Soyisim Giriniz" Width="235px"></asp:TextBox>
    <asp:Button ID="BtnMainSearch" runat="server" Text="Üye Ara" CssClass="arabutton" OnClick="BtnMainSearch_Click" />
    </td>
<td class="stylelogout"> <asp:Label ID="lblwelcomemsg" runat="server" Text="" ></asp:Label></td>
<td><asp:Button ID="AdminLogout" runat="server" Text="Çıkış" CssClass="arabutton" onclick="AdminLogout_Click" /></td>
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
               <asp:Button ID="BtnKisiProfili" runat="server" CommandName="Details" CommandArgument='<%#Eval("FOLLOWING_USER_ID")%>' Text="Kişi Profili" CssClass="buttonyan" Font-Size="14px" />
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
                <asp:Button ID="BtnKisiProfili" runat="server" CommandName="Details" CommandArgument='<%#Eval("ID")%>' Text="Kişi Profili" CssClass="buttonyan" Font-Size="14px" />
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
