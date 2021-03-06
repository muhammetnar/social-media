﻿<%@ Page Title="" Language="C#" MasterPageFile="~/user_en.Master" AutoEventWireup="true" CodeBehind="userphotogallery_en.aspx.cs" Inherits="mnwebproject.userphotogallery_en" %>
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
                    return '<span id="fancybox-title-over">Photo: ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
                }
            });
        });
    </script>
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
     <table>
        <tr>
            <td>
                <asp:Button ID="BtnBack" runat="server" Text="Back" CssClass="icerikbutton" OnClick="BtnBack_Click" Visible="false" /></td>
            <td>
                <asp:Button ID="BtnAddOpen" runat="server" Text="Add" OnClick="BtnAddOpen_Click" CssClass="icerikbutton" /></td>
            <td>
                <asp:Button ID="BtnUpdateOpen" runat="server" Text="Edit" OnClick="BtnUpdateOpen_Click" CssClass="icerikbutton" /></td>
            <td>
                <asp:Button ID="BtnDeleteOpen" runat="server" Text="Delete" OnClick="BtnDeleteOpen_Click" CssClass="icerikbutton" /></td>

        </tr>
    </table>

    <hr />
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <asp:DataList ID="DataList1" runat="server" DataKeyField="ID" RepeatColumns="5" FooterStyle-VerticalAlign="Bottom" RepeatDirection="Horizontal">
                <ItemTemplate>

                    <a rel="resim" href='<%# Eval("USER_PHOTO_URL", "userphotogallery/{0}") %>' title='<%# Eval("USER_PHOTO_CONTENT") %>'>
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 1px">
                            <tr>
                                <td style="text-align: center">
                                    <asp:Image ID="Image1" runat="server" Height="150px" BorderStyle="Solid" BorderWidth="1px" BorderColor="#DFDBDB" ImageUrl='<%# Eval("USER_PHOTO_URL", "userphotogallery/{0}") %>' Width="188px" /></td>
                            </tr>
                            <tr>
                            </tr>
                        </table>
                    </a>
                </ItemTemplate>
            </asp:DataList>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table>
                <tr>
                    <td class="style3">
                        <asp:Label ID="Label3" runat="server" Text="Select Photo" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:FileUpload ID="FileAddUpload" runat="server" CssClass="inputs" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Explanation" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="Textphotodate" runat="server" Visible="false"></asp:TextBox>
                        <asp:TextBox ID="Textphotocontent" runat="server" CssClass="inputs"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <asp:Button ID="Btnadd" runat="server" Text="Add" CssClass="icerikbutton" OnClick="Btnadd_Click" />
                        <asp:Button ID="Btnaddcancel" runat="server" Text="Cancel" CssClass="icerikbutton" OnClick="Btnaddcancel_Click" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                CellPadding="3" DataKeyNames="ID" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="Photo">
                        <ItemTemplate>
                            <asp:Label ID="lblupdateimageid" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>'
                                runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="lblupdateimageurl" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.USER_PHOTO_URL") %>'
                                runat="server" Visible="false"></asp:Label>
                            <asp:Image ID="Image1" runat="server" Height="75px" ImageUrl='<%# Eval("USER_PHOTO_URL", "userphotogallery/{0}") %>' Width="85px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Content" ItemStyle-Height="30px">
                        <ItemTemplate>
                            <asp:Label ID="lblupdateimagecontent" Width="600px" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.USER_PHOTO_CONTENT") %>'
                                runat="server" Visible="true"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date" ItemStyle-Height="30px">
                        <ItemTemplate>
                            <asp:Label ID="lblupdateimagedate" runat="server" Width="150px" Visible="true" Text='<%# DataBinder.Eval(Container,"DataItem.USER_PHOTO_DATE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" SelectText="Update"
                        ShowSelectButton="True">

                        <ControlStyle CssClass="icerikbutton" />
                    </asp:CommandField>
                </Columns>
                <EditRowStyle BackColor="#94cedf" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#c7e0e7" CssClass="label" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#c7e0e7" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:Panel ID="PnlUpdate" runat="server" Width="900px" Visible="false">
                <table>
                    <tr>
                        <td class="style3">
                            <asp:Label ID="lblupdateimgid" runat="server" Text="Label" Visible="false"></asp:Label>
                            <asp:Label ID="lblupdateimgurl" runat="server" Text="Label" Visible="false"></asp:Label>
                            <asp:Label ID="Label1" runat="server" Text="Select Photo" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text=":" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="inputs" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="Explanation" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label10" runat="server" Text=":" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="TextupdateContent" runat="server" CssClass="inputs"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <asp:Button ID="BtnUpdate" runat="server" Text="Change" CssClass="icerikbutton" OnClick="BtnUpdate_Click" />
                            <asp:Button ID="BtnUpdateCancel" runat="server" Text="Cancel" CssClass="icerikbutton" OnClick="BtnUpdateCancel_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:View>
        <asp:View ID="View4" runat="server">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
                CellPadding="3" DataKeyNames="ID" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="Photo" ItemStyle-Height="30px">
                        <ItemTemplate>
                            <asp:Label ID="lbldeleteimageid" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>'
                                runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="lbldeleteimageurl" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container,"DataItem.USER_PHOTO_URL") %>'></asp:Label>
                            <asp:Image ID="Image2" runat="server" Height="75px" ImageUrl='<%# Eval("USER_PHOTO_URL", "userphotogallery/{0}") %>' Width="85px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Content" ItemStyle-Height="30px">
                        <ItemTemplate>
                            <asp:Label ID="lbldeleteimagecontent" runat="server" Width="605px" Visible="true" Text='<%# DataBinder.Eval(Container,"DataItem.USER_PHOTO_CONTENT") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Date" ItemStyle-Height="30px">
                        <ItemTemplate>
                            <asp:Label ID="lbldeleteimagedate" runat="server" Width="150px" Visible="true" Text='<%# DataBinder.Eval(Container,"DataItem.USER_PHOTO_DATE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" SelectText="Delete" 
                        ShowSelectButton="True">

                        <ControlStyle CssClass="icerikbutton"  />
                    </asp:CommandField>
                </Columns>
                <EditRowStyle BackColor="#94cedf" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#c7e0e7" CssClass="label" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#c7e0e7" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:Label ID="lbldeleteimgid" runat="server" Text="Label" Visible="false"></asp:Label>
            <asp:Label ID="lbldeleteimgurl" runat="server" Text="Label" Visible="false"></asp:Label>
        </asp:View>
    </asp:MultiView>
</asp:Content>
