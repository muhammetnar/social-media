<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="usersettings_tr.aspx.cs" Inherits="mnwebproject.usersettings_tr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            width: 925px;
        }

        .style2 {
            width: 400px;
        }

        .style3 {
            width: 150px;
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
                        <th>
                            <asp:Label ID="Label21" runat="server" Text="Takip Edilenler" CssClass="label" Font-Size="12px"></asp:Label></th>
                        <th>
                            <asp:Label ID="Label22" runat="server" Text="Takipçiler" CssClass="label" Font-Size="12px"></asp:Label></th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="lblfollowing" runat="server" Text="" CssClass="label" Font-Size="15px"></asp:Label></th>
                        <th>
                            <asp:Label ID="lblfollowers" runat="server" Text="" CssClass="label" Font-Size="15px"></asp:Label></th>
                    </tr>
                </table>
                <hr />
                <asp:Label ID="Label23" runat="server" Text="Label" Visible="false"></asp:Label>
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
            <td class="stylelogout">
                <asp:Label ID="lblwelcomemsg" runat="server" Text=""></asp:Label></td>
            <td>
                <asp:Button ID="AdminLogout" runat="server" Text="Çıkış" CssClass="arabutton" OnClick="AdminLogout_Click" /></td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <table>
        <tr>
            <td class="style3">
                <asp:Label ID="Label2" runat="server" Text="Profil Fotoğrafınız" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label4" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
                <asp:GridView ID="uyeprofilfotoduzenlegrid" runat="server" AutoGenerateColumns="False" CellPadding="0" DataKeyNames="ID" BorderColor="#CCCCCC" BorderStyle="NotSet" BorderWidth="0px">
                    <Columns>
                        <asp:ImageField DataImageUrlField="PROFILE_PHOTO_URL" DataImageUrlFormatString="~\profilephoto\{0}" ControlStyle-Height="145" ControlStyle-Width="145" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <HeaderStyle ForeColor="White" CssClass="label" Font-Size="0px" BorderWidth="0px" />
                </asp:GridView>
                <asp:Label ID="lblresimadi" runat="server" Text="" Visible="false"></asp:Label>
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td>
                <asp:TextBox ID="Textphotodate" runat="server" Visible="false"></asp:TextBox>
                <asp:FileUpload ID="FileUpload1" runat="server" Visible="false" CssClass="inputs" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td>
                <asp:Button ID="BtnchangeUpdateProfilePhoto" runat="server"
                    Text="Profil Fotoğrafını Değiştir" CssClass="icerikbutton"
                    OnClick="BtnchangeUpdateProfilePhoto_Click" />
                <asp:Button ID="BtnUpdateProfilePhoto" runat="server" Text="Onayla"
                    CssClass="icerikbutton" Visible="false" OnClick="BtnUpdateProfilePhoto_Click" />
                <asp:Button ID="BtnCancelProfilephoto" runat="server" Text="İptal" Visible="false"
                    CssClass="icerikbutton" OnClick="BtnCancelProfilephoto_Click" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td>
                <asp:Label ID="lblmsgprofildegistirme" runat="server" Text="" Visible="false" CssClass="label" ForeColor="Red"></asp:Label></td>
        </tr>
    </table>

    <table>
        <tr>
            <td class="style3">
                <asp:Label ID="Label5" runat="server" Text="İsim" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label6" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="lblname" runat="server" Text="" CssClass="label"></asp:Label>
                <asp:TextBox ID="Textname" runat="server" Visible="false" CssClass="inputs"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Soyisim" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label8" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="lblsurname" runat="server" Text="" CssClass="label"></asp:Label>
                <asp:TextBox ID="Textsurname" runat="server" Visible="false" CssClass="inputs"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Cinsiyet" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label10" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="lblgender" runat="server" Text="" CssClass="label"></asp:Label>
                <asp:Label ID="lblmale" runat="server" Text="Male" Visible="false"></asp:Label>
                <asp:Label ID="lblfemale" runat="server" Text="Female" Visible="false"></asp:Label>
                <asp:DropDownList ID="dropgender" runat="server" Visible="false" CssClass="inputs" Width="202px">
                    <asp:ListItem>Erkek</asp:ListItem>
                    <asp:ListItem>Kadın</asp:ListItem>
                </asp:DropDownList>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label11" runat="server" Text="E-Mail" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label12" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="lblemail" runat="server" Text="" CssClass="label"></asp:Label>
                <asp:TextBox ID="Textemail" runat="server" Visible="false" CssClass="inputs"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label17" runat="server" Text="İş" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label18" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="lbljob" runat="server" Text="" CssClass="label"></asp:Label>
                <asp:TextBox ID="Textjob" runat="server" Visible="false" CssClass="inputs"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label15" runat="server" Text="Ülke" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label16" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>

                <asp:Label ID="lblcountryid" runat="server" Text="" Visible="false"></asp:Label>
                <asp:Label ID="lblcountryname" runat="server" Text="" CssClass="label"></asp:Label>
                <asp:DropDownList ID="DropCountry" runat="server" CssClass="inputs" Width="202px" Visible="false" OnSelectedIndexChanged="DropCountry_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                <asp:Label ID="lblcountry" runat="server" Text="" Visible="false"></asp:Label>
                <asp:TextBox ID="textcountry" runat="server" Visible="false"></asp:TextBox>
                <%--<asp:DropDownList ID="Dropsehir" runat="server" Visible="false" CssClass="inputs" Width="202px">
                    <asp:ListItem>Adana</asp:ListItem>
                    <asp:ListItem>Adıyaman</asp:ListItem>
                    <asp:ListItem>Afyon</asp:ListItem>
                    <asp:ListItem>Ağrı</asp:ListItem>
                    <asp:ListItem>Amasya</asp:ListItem>
                    <asp:ListItem>Ankara</asp:ListItem>
                    <asp:ListItem>Artvin</asp:ListItem>
                    <asp:ListItem>Aydın</asp:ListItem>
                    <asp:ListItem>Balıkesir</asp:ListItem>
                    <asp:ListItem>Bilecik</asp:ListItem>
                    <asp:ListItem>Bingöl</asp:ListItem>
                    <asp:ListItem>Bitlis</asp:ListItem>
                    <asp:ListItem>Bolu</asp:ListItem>
                    <asp:ListItem>Burdur</asp:ListItem>
                    <asp:ListItem>Bursa</asp:ListItem>
                    <asp:ListItem>Çanakkale</asp:ListItem>
                    <asp:ListItem>Çankırı</asp:ListItem>
                    <asp:ListItem>Çorum</asp:ListItem>
                    <asp:ListItem>Denizli</asp:ListItem>
                    <asp:ListItem>Diyarbakır</asp:ListItem>
                    <asp:ListItem>Edirne</asp:ListItem>
                    <asp:ListItem>Elazığ</asp:ListItem>
                    <asp:ListItem>Erzincan</asp:ListItem>
                    <asp:ListItem>Erzurum</asp:ListItem>
                    <asp:ListItem>Eskişehir</asp:ListItem>
                    <asp:ListItem>Gaziantep</asp:ListItem>
                    <asp:ListItem>Giresun</asp:ListItem>
                    <asp:ListItem>Gümüşhane</asp:ListItem>   
                    <asp:ListItem>Hakkari</asp:ListItem>
                    <asp:ListItem>Hatay</asp:ListItem> 
                    <asp:ListItem>Isparta</asp:ListItem>
                    <asp:ListItem>Mersin</asp:ListItem>
                    <asp:ListItem>İstanbul</asp:ListItem>
                    <asp:ListItem>İzmir</asp:ListItem>    
                    <asp:ListItem>Kars</asp:ListItem>
                    <asp:ListItem>Kastamonu</asp:ListItem>
                    <asp:ListItem>Kayseri</asp:ListItem>
                    <asp:ListItem>Kırklareli</asp:ListItem>
                    <asp:ListItem>Kırşehir</asp:ListItem>
                    <asp:ListItem>Kocaeli</asp:ListItem>
                    <asp:ListItem>Konya</asp:ListItem>
                    <asp:ListItem>Kütahya</asp:ListItem>
                    <asp:ListItem>Malatya</asp:ListItem>
                    <asp:ListItem>Manisa</asp:ListItem> 
                    <asp:ListItem>Kahramanmaraş</asp:ListItem>
                    <asp:ListItem>Mardin</asp:ListItem>  
                    <asp:ListItem>Muğla</asp:ListItem>
                    <asp:ListItem>Muş</asp:ListItem> 
                    <asp:ListItem>Nevşehir</asp:ListItem>
                    <asp:ListItem>Niğde</asp:ListItem>
                    <asp:ListItem>Ordu</asp:ListItem>
                    <asp:ListItem>Rize</asp:ListItem>   
                    <asp:ListItem>Sakarya</asp:ListItem>
                    <asp:ListItem>Samsun</asp:ListItem> 
                    <asp:ListItem>Siirt</asp:ListItem>
                    <asp:ListItem>Sinop</asp:ListItem>
                    <asp:ListItem>Sivas</asp:ListItem>
                    <asp:ListItem>Tekirdağ</asp:ListItem>
                    <asp:ListItem>Tokat</asp:ListItem>
                    <asp:ListItem>Trabzon</asp:ListItem>
                    <asp:ListItem>Tunceli</asp:ListItem>
                    <asp:ListItem>Şanlıurfa</asp:ListItem>
                    <asp:ListItem>Uşak</asp:ListItem>
                    <asp:ListItem>Van</asp:ListItem> 
                    <asp:ListItem>Yozgat</asp:ListItem>
                    <asp:ListItem>Zonguldak</asp:ListItem> 
                    <asp:ListItem>Aksaray</asp:ListItem>
                    <asp:ListItem>Bayburt</asp:ListItem>  
                    <asp:ListItem>Karaman</asp:ListItem>
                    <asp:ListItem>Kırıkkale</asp:ListItem>
                    <asp:ListItem>Batman</asp:ListItem>
                    <asp:ListItem>Şırnak</asp:ListItem>
                    <asp:ListItem>Bartın</asp:ListItem>
                    <asp:ListItem>Ardahan</asp:ListItem>
                    <asp:ListItem>Iğdır</asp:ListItem>
                    <asp:ListItem>Yalova</asp:ListItem>
                    <asp:ListItem>Karabük</asp:ListItem>
                    <asp:ListItem>Kilis</asp:ListItem>
                    <asp:ListItem>Osmaniye</asp:ListItem>
                    <asp:ListItem>Düzce</asp:ListItem>
                    <asp:ListItem></asp:ListItem> 
    </asp:DropDownList>--%>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label19" runat="server" Text="Şehir" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label20" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="lblcityid" runat="server" Text="" Visible="false"></asp:Label>
                <asp:Label ID="lblcityname" runat="server" Text="" CssClass="label"></asp:Label>
                <asp:DropDownList ID="DropCity" runat="server" CssClass="inputs" Width="202px" Visible="false" OnSelectedIndexChanged="DropCity_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                <asp:Label ID="lblcity" runat="server" Text="" Visible="false"> </asp:Label>
                <asp:TextBox ID="textcity" runat="server" Visible="false"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label13" runat="server" Text="Eğitim" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label14" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="lbleducation" runat="server" Text="" CssClass="label"></asp:Label>
                <asp:TextBox ID="Texteducation" runat="server" Visible="false" CssClass="inputs"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td>
                <asp:Button ID="BtnTransfer" runat="server" Text="Bilgilerini Düzenle" CssClass="icerikbutton" OnClick="BtnTransfer_Click" />
                <asp:Button ID="BtnUpdate" runat="server" Text="Bitti" CssClass="icerikbutton"
                    Visible="false" OnClick="BtnUpdate_Click" />
                <asp:Button ID="BtnCancel" runat="server" Text="İptal" CssClass="icerikbutton"
                    Visible="false" OnClick="BtnCancel_Click" />
            </td>
        </tr>
    </table>

    <table>
        <tr>
            <td class="style3">
                <asp:Label ID="Label1" runat="server" Text="Kullanıcı Adı" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label24" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="lblusername" runat="server" Text="" CssClass="label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Şifre" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label25" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="lblpassword" runat="server" Text="" CssClass="label"></asp:Label>
                <asp:TextBox ID="Textpassword" runat="server" Visible="false" CssClass="inputs"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblrepeatpassword" runat="server" Text="Şifre Tekrar" CssClass="label" Visible="false"></asp:Label></td>
            <td>
                <asp:Label ID="Labelrepeatpassword" runat="server" Text=":" CssClass="label" Visible="false"></asp:Label></td>
            <td>
                <asp:TextBox ID="Textrepeatpassword" runat="server" Visible="false" CssClass="inputs"></asp:TextBox><asp:CompareValidator ID="CompareValidator1"
                    runat="server" ErrorMessage="Şifreler Eşleşmiyor" ForeColor="Red" CssClass="label"
                    ControlToCompare="Textrepeatpassword" ControlToValidate="Textpassword"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td>
                <asp:Button ID="BtnTransferPassword" runat="server" Text="Şifreni Değiştir"
                    CssClass="icerikbutton" OnClick="BtnTransferPassword_Click" />
                <asp:Button ID="BtnUpdatePassword" runat="server" Text="Bitti" Visible="false"
                    CssClass="icerikbutton" OnClick="BtnUpdatePassword_Click" />
                <asp:Button ID="BtnCancelPassword" runat="server" Text="İptal"
                    CssClass="icerikbutton" Visible="false" OnClick="BtnCancelPassword_Click" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td>
                <asp:Label ID="lblmsg" runat="server" Text="" ForeColor="Red" CssClass="label"></asp:Label></td>
        </tr>
    </table>
</asp:Content>
