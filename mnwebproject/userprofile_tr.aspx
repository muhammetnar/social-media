<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="userprofile_tr.aspx.cs" Inherits="mnwebproject.userprofile_tr" %>

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
    <script type="text/javascript" src="fancybox/photogalleryjs.js"></script>
    <script type="text/javascript" src="fancybox/jquery.fancybox-1.3.4.pack.js"></script>
    <link rel="stylesheet" type="text/css" href="fancybox/jquery.fancybox-1.3.4.css" media="screen" />

    <script type="text/javascript">
        $(document).ready(function () {
            $("a[rel=resim]").fancybox({
                'transitionIn': 'none',
                'transitionOut': 'none',
                'titlePosition': 'over',
                'titleFormat': function (title, currentArray, currentIndex, currentOpts) {
                    return '<span id="fancybox-title-over">Resim: ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table>
        <tr>
            <td>
                <asp:Label ID="lblgonderenid" runat="server" Text="" Visible="false"></asp:Label></td>
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
                <asp:Label ID="lblname" runat="server" CssClass="label" Font-Size="15px"></asp:Label>
            </th>
        </tr>
        <tr>
            <th>
                <asp:Label ID="lblsurname" runat="server" CssClass="label" Font-Size="15px"></asp:Label>
                <hr />
                <table>
                    <tr>
                        <th>
                            <asp:Label ID="Label4" runat="server" Text="Takip Edilenler" CssClass="label" Font-Size="12px"></asp:Label></th>
                        <th>
                            <asp:Label ID="Label5" runat="server" Text="Takipçiler" CssClass="label" Font-Size="12px"></asp:Label></th>
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
                <asp:Button ID="BtnUserProfile" runat="server" Text="Profil" CssClass="buttonyan" OnClick="BtnUserProfile_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="BtnArticles" runat="server" Text="Makaleler" CssClass="buttonyan" OnClick="BtnArticles_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="BtnUserPhotoGallery" runat="server" Text="Fotoğraflar" CssClass="buttonyan" OnClick="BtnUserPhotoGallery_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="BtnWriteMessage" runat="server" Text="Mesaj Yaz" CssClass="buttonyan" OnClick="BtnWriteMessage_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="BtnFollow" runat="server" Text="Takip Et" CssClass="buttonyan" Font-Size="15px" OnClick="BtnFollow_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="BtnLeaveFollow" runat="server" Text="Takipçiyi Kaldır" CssClass="buttonyan" ForeColor="Red" Font-Size="15px" Visible="false" OnClientClick="return confirm('Takipçiyi kaldırma işlemini onaylıyormusunuz?');" OnClick="BtnLeaveFollow_Click" />
            </td>
        </tr>
        <tr>
            <td></td>
        </tr>
        <tr>
            <td></td>
        </tr>
        <tr>
            <td></td>
        </tr>
    </table>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td class="style1"></td>
            <td class="style4">
                <asp:Button ID="BtnConfirm" runat="server" Text="Kabul Et" CssClass="arabutton" Visible="false" OnClick="BtnConfirm_Click" />
                <asp:Button ID="BtnNotConfirm" runat="server" Text="Reddet" CssClass="arabutton" Visible="false" OnClick="BtnNotConfirm_Click" />
            </td>
            <td class="stylelogout">
                <asp:Label ID="lblwelcomemsg" runat="server" Text=""></asp:Label>
            </td>
            <td>
                <asp:Button ID="AdminLogout" runat="server" Text="Çıkış" CssClass="arabutton" OnClick="AdminLogout_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table>
                <tr>
                    <td class="style3">
                        <asp:Label ID="Label25" runat="server" Text="Profil Fotoğrafı" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label26" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:GridView ID="profilfoto" runat="server" AutoGenerateColumns="False" CellPadding="0" DataKeyNames="ID" BorderColor="#CCCCCC" BorderStyle="NotSet" BorderWidth="0px">
                            <Columns>
                                <asp:ImageField DataImageUrlField="PROFILE_PHOTO_URL" DataImageUrlFormatString="~\profilephoto\{0}" ControlStyle-Height="90" ControlStyle-Width="90" />
                            </Columns>
                            <HeaderStyle CssClass="label" Font-Size="0px" BorderWidth="0px" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="Adı" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblid" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="lblusername" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="lblimg" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="labelname" runat="server" CssClass="label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label13" runat="server" Text="Soyadı" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label14" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="labelsurname" runat="server" CssClass="label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label15" runat="server" Text="Cinsiyet" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label16" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblcinsiyet" runat="server" CssClass="label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label17" runat="server" Text="E-Mail" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label18" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblemail" runat="server" CssClass="label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label19" runat="server" Text="Eğitim" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label20" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="lbleducation" runat="server" CssClass="label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Ülke" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblcountry" runat="server" CssClass="label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label21" runat="server" Text="Şehir" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label22" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblcity" runat="server" CssClass="label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label23" runat="server" Text="Meslek" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label24" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="lbljob" runat="server" CssClass="label"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table>
                <tr>
                    <td></td>
                    <td class="style3">
                        <asp:Label ID="Label10" runat="server" Text="Mesaj" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label12" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblmessageid" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:TextBox ID="TextTodayDate" runat="server" Visible="false"></asp:TextBox>
                        <asp:TextBox ID="TextSelectUser" runat="server" Visible="false"></asp:TextBox>
                        <asp:TextBox ID="TextMessageBox" runat="server" CssClass="inputs" TextMode="MultiLine" Height="130px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>

                        <asp:Button ID="BtnSendMessage" runat="server" Text="Gönder" CssClass="icerikbutton" OnClick="BtnSendMessage_Click" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        <asp:Label ID="lblmessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <asp:Label ID="lbldurum" runat="server" Text=""></asp:Label>
        </asp:View>
        <asp:View ID="View4" runat="server">
            <table>
                <tr>
                    <td>
                        <div class="duyurular" style="float: left; width: 955px; height: auto">
                            <div class="ust" style="float: left; width: 938px; height: 44px; line-height: 44px; padding-left: 15px; border: 1px solid #ccc; color: #555; background-color: #c7e0e7;">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text="Kullanıcının Makaleleri" CssClass="label" ForeColor="Black" Font-Bold="true"></asp:Label></td>
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
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("ARTICLE_CONTENT") %>' TextMode="MultiLine" Width="915px" Height="150px" Wrap="False" ReadOnly="True" Font-Names="courier"></asp:TextBox><br />
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label3" runat="server" Text="Yazar :" Font-Size="Medium" CssClass="label"></asp:Label>
                                                    </td>
                                                    <td style="width: 700px;">
                                                        <asp:Label ID="Label1" runat="server" ForeColor="Blue" Font-Size="Medium" CssClass="label" Text='<%# Eval("USER_NAME") %>'></asp:Label>
                                                        <asp:Label ID="Label2" runat="server" ForeColor="Blue" Font-Size="Medium" CssClass="label" Text='<%# Eval("USER_SURNAME") %>'></asp:Label></td>
                                                    <td style="width: 160px;">
                                                        <asp:Label ID="Label5" runat="server" ForeColor="Blue" Font-Size="Medium" CssClass="label" Text='<%# Eval("ARTICLE_DATE") %>'></asp:Label></td>
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
        <asp:View ID="View5" runat="server">
            <asp:DataList ID="DataList1" runat="server" DataKeyField="ID" RepeatColumns="5" FooterStyle-VerticalAlign="Bottom" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <a rel="resim" href='<%# Eval("USER_PHOTO_URL", "userphotogallery/{0}") %>' title='<%# Eval("USER_PHOTO_CONTENT") %>'>
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 1px">
                            <tr>
                                <td style="text-align: center">
                                    <asp:Image ID="Image1" runat="server" Height="150px" BorderStyle="Solid" BorderWidth="1px" BorderColor="#DFDBDB" ImageUrl='<%# Eval("USER_PHOTO_URL", "userphotogallery/{0}") %>' Width="188px" /></td>
                            </tr>
                        </table>
                    </a>
                </ItemTemplate>
            </asp:DataList>
        </asp:View>
    </asp:MultiView>
</asp:Content>
