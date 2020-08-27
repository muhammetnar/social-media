<%@ Page Title="" Language="C#" MasterPageFile="~/user_en.Master" AutoEventWireup="true" CodeBehind="userarticle_en.aspx.cs" Inherits="mnwebproject.userarticle_en" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <style type="text/css">
        .style1 {
            width: 911px;
        }

        .style2 {
            width: 420px;
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
                                            <asp:Label ID="Label4" runat="server" Text="My Articles" CssClass="label" ForeColor="Black" Font-Bold="true"></asp:Label></td>
                                        <td class="style2"></td>
                                        <td>
                                            <asp:Button ID="BtnOpenWriteArticle" runat="server" Text="Write Article"
                                                CssClass="icerikbutton" OnClick="BtnOpenWriteArticle_Click" />
                                            <asp:Button ID="BtnOpenEditArticle" runat="server" Text="Edit Article"
                                                CssClass="icerikbutton" OnClick="BtnOpenEditArticle_Click" />
                                            <asp:Button ID="BtnOpenDeleteArticle" runat="server" Text="Delete Article"
                                                CssClass="icerikbutton" OnClick="BtnOpenDeleteArticle_Click" /></td>
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
                                                        <asp:Label ID="Label19" runat="server" Text="Author :" Font-Size="Medium" CssClass="label"></asp:Label>
                                                    </td>
                                                    <td style="width: 680px;">
                                                        <asp:Label ID="Label1" runat="server" ForeColor="Blue" Font-Size="Medium" CssClass="label" Text='<%# Eval("USER_NAME") %>'></asp:Label>
                                                        <asp:Label ID="Label2" runat="server" ForeColor="Blue" Font-Size="Medium" CssClass="label" Text='<%# Eval("USER_SURNAME") %>'></asp:Label>
                                                    </td>
                                                    <td style="width: 160px;">
                                                        <asp:Label ID="Label16" runat="server" ForeColor="Blue" Font-Size="Medium" CssClass="label" DataFormatString="{0:dd/MM/yyyy}" Text='<%# Eval("ARTICLE_DATE","{0:dd/MM/yyyy}") %>'></asp:Label><br />
                                                    </td>
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
        <asp:View ID="View2" runat="server">
            <table>
                <tr>
                    <td class="style3">
                        <asp:Label ID="Label3" runat="server" Text="Article Title" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="Txtarticletitle" runat="server" CssClass="inputs" Width="350px" Wrap="False" Font-Names="courier"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="Article" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text=":" CssClass="label"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="Txtarticlecontent" runat="server" CssClass="inputs" TextMode="MultiLine" Height="220px" Width="770px" Wrap="False" Font-Names="courier"></asp:TextBox></td>
                    <asp:TextBox ID="Txtdate" runat="server" ReadOnly="true" Visible="false"></asp:TextBox>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <asp:Button ID="BtnAddArticle" runat="server" Text="Save"
                            CssClass="icerikbutton" OnClick="BtnAddArticle_Click" />
                        <asp:Button ID="BtnAddBackArticle" runat="server" Text="Cancel"
                            CssClass="icerikbutton" OnClick="BtnAddBackArticle_Click" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <asp:Label ID="lblmsg" runat="server" Text="" ForeColor="Red" CssClass="label"></asp:Label></td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <asp:Panel ID="Pnlopenupdate" runat="server">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="BtnBackUpdate" runat="server" Text="Back"
                                CssClass="icerikbutton" OnClick="BtnBackUpdate_Click" /><br />
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                CellPadding="3" DataKeyNames="ID" BackColor="White"
                                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                <Columns>
                                    <asp:TemplateField HeaderText="Article Title">
                                        <ItemTemplate>
                                            <asp:Label ID="lblupdatearticleid" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>'
                                                runat="server" Width="100px" Visible="false"></asp:Label>

                                            <asp:Label ID="lblupdatearticletitle" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ARTICLE_TITLE") %>'
                                                runat="server" Width="300px" Visible="true"></asp:Label>
                                            <asp:Label ID="lblupdatearticlecontent" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ARTICLE_CONTENT") %>'
                                                runat="server" Width="280px" Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:CommandField ButtonType="Button" SelectText="Details"
                                        ShowSelectButton="True">

                                        <ControlStyle CssClass="arabutton" Font-Size="11pt" />
                                    </asp:CommandField>
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#90C8FF" ForeColor="White" CssClass="label" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                            <asp:Label ID="lblmsgupdate" runat="server" Text="" CssClass="label" Visible="false" ForeColor="Red"></asp:Label>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="Pnlupdate" runat="server" Visible="false">
                <table>
                    <tr>
                        <td class="style3">
                            <asp:Label ID="Label10" runat="server" Text="Article Title" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label12" runat="server" Text=":" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:Label ID="Labelupdatearticleid" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:Label ID="Labelupdatearticletitle" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:TextBox ID="Textupdatearticletitle" runat="server" CssClass="inputs" Width="350px" Wrap="False" Font-Names="courier"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label13" runat="server" Text="Article" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label14" runat="server" Text=":" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:Label ID="Labelupdatearticlecontent" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:TextBox ID="Textupdatearticlecontent" runat="server" CssClass="inputs" TextMode="MultiLine" Height="220px" Width="770px" Wrap="false" Font-Names="courier"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <asp:Button ID="BtnUpdatearticle" runat="server" Text="Done"
                                CssClass="icerikbutton" OnClick="BtnUpdatearticle_Click" />
                            <asp:Button ID="BtnCancelUpdateArticle" runat="server" Text="Cancel"
                                CssClass="icerikbutton" OnClick="BtnCancelUpdateArticle_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:View>
        <asp:View ID="View4" runat="server">
            <asp:Panel ID="Pnlopendelete" runat="server">
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="BtnBackDelete" runat="server" Text="Back" CssClass="icerikbutton" OnClick="BtnBackDelete_Click" /><br />
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="ID" BackColor="White"
                                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                                <Columns>
                                    <asp:TemplateField HeaderText="Article Title">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldeletearticleid" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>'
                                                runat="server" Width="100px" Visible="false"></asp:Label>
                                            <asp:Label ID="lbldeletearticletitle" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ARTICLE_TITLE") %>'
                                                runat="server" Width="300px" Visible="true"></asp:Label>
                                            <asp:Label ID="lbldeletearticlecontent" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ARTICLE_CONTENT") %>'
                                                runat="server" Width="280px" Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:CommandField ButtonType="Button" SelectText="Details"
                                        ShowSelectButton="True">
                                        <ControlStyle CssClass="arabutton" Font-Size="11pt" />
                                    </asp:CommandField>
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#90C8FF" ForeColor="White" CssClass="label" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                            <asp:Label ID="lblmsgdelete" runat="server" Text="" CssClass="label" Visible="false" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="Pnldelete" runat="server" Visible="false">
                <table>
                    <tr>
                        <td class="style3">
                            <asp:Label ID="Label15" runat="server" Text="Article Title" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label17" runat="server" Text=":" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:Label ID="Labeldeletearticleid" runat="server" Visible="False"></asp:Label>
                            <asp:TextBox ID="Textdeletearticletitle" runat="server" CssClass="inputs" Width="350px" Wrap="False" ReadOnly="True" Font-Names="courier"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label18" runat="server" Text="Article" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:Label ID="Label20" runat="server" Text=":" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="Textdeletearticlecontent" runat="server" CssClass="inputs"
                                TextMode="MultiLine" Height="220px" Width="770px" Wrap="False" ReadOnly="True" Font-Names="courier"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <asp:Button ID="BtnDeleteArticle" runat="server" Text="Delete"
                                CssClass="icerikbutton" OnClick="BtnDeleteArticle_Click" />
                            <asp:Button ID="BtnCancelDeleteArticle" runat="server" Text="Cancel"
                                CssClass="icerikbutton" OnClick="BtnCancelDeleteArticle_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:View>
    </asp:MultiView>
</asp:Content>
