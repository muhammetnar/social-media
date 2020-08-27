<%@ Page Title="" Language="C#" MasterPageFile="~/user_en.Master" AutoEventWireup="true" CodeBehind="usermessages_en.aspx.cs" Inherits="mnwebproject.usermessages_en" %>

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
                        <th style="width: 75px;">
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
                <div style="float: left; width: 938px; height: 37px; line-height: 37px; padding-left: 15px; border: 1px solid #ccc; color: #555; background-color: #c7e0e7;">
                    <asp:Button ID="BtnWriteMessage" runat="server" Text="Write Message" CssClass="icerikbutton" OnClick="BtnWriteMessage_Click" />
                </div>
            </td>
        </tr>
    </table>

    <table border="0">
        <tr>
            <td>
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                            CellPadding="3" DataKeyNames="ID" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:TemplateField HeaderText="Photo">
                                    <ItemTemplate>
                                        <asp:Label ID="lblmessageid" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>'
                                            runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="lblfromid" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.FROM_USER_ID") %>'
                                            runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="lblmessageimageurl" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.PROFILE_PHOTO_URL") %>'
                                            runat="server" Visible="false"></asp:Label>
                                        <asp:Image ID="Image1" runat="server" Height="75px" ImageUrl='<%# Eval("PROFILE_PHOTO_URL", "profilephoto/{0}") %>' Width="85px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="User" ItemStyle-Width="250px" ItemStyle-Height="30px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblmessageusername" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.USER_NAME") %>'
                                            runat="server" Visible="true"></asp:Label>&nbsp;
                            <asp:Label ID="lblmessageusersurname" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.USER_SURNAME") %>'
                                runat="server" Visible="true"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:CommandField ButtonType="Button" SelectText="See Message"
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
                        <asp:TextBox ID="Textmessageid" runat="server" Visible="false"></asp:TextBox>
                        <asp:TextBox ID="Textfromid" runat="server" Visible="false"></asp:TextBox>
                        <asp:TextBox ID="TextTodayDate" runat="server" Visible="false"></asp:TextBox>
                        <asp:TextBox ID="Textusername" runat="server" Visible="false"></asp:TextBox>
                        <asp:Label ID="lbluserid2" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="lblmessageid" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Panel runat="server" ID="PnlSeeMessage" Visible="false">
                            <div class="duyurular" style="float: left; width: 955px; height: auto">
                                <div class="ust" style="float: left; width: 938px; height: 44px; line-height: 44px; padding-left: 15px; border: 1px solid #ccc; color: #555; background-color: #c7e0e7;">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Button ID="BtnBack" runat="server" Text="Back" CssClass="icerikbutton" OnClick="BtnBack_Click" />
                                                <asp:Button ID="BtnAnswer" runat="server" Text="Answer" CssClass="icerikbutton" OnClick="BtnAnswer_Click" />
                                                <asp:Button ID="BtnDelete" runat="server" Text="Delete Messages" CssClass="icerikbutton" OnClick="BtnDelete_Click" />
                                                <asp:Button ID="BtnDeleteConversation" runat="server" Text="Delete Chat" CssClass="icerikbutton" OnClick="BtnDeleteConversation_Click" />
                                                <asp:Button ID="BtnAnswerBack" runat="server" Text="Back" CssClass="icerikbutton" Visible="false" OnClick="BtnAnswerBack_Click" />
                                                <asp:Label ID="Label4" runat="server" Text="" CssClass="label" ForeColor="Black" Font-Bold="true"></asp:Label></td>
                                            <td class="style36"></td>
                                            <td></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="alt" style="float: left; width: 920px; height: auto; padding: 16.5px; border: 1px solid #ccc; background-color: #fff;">
                                    <asp:ListView ID="lstDuyuru" runat="server">

                                        <ItemTemplate>
                                            <div class="duyuru-wrap" style="float: left; width: 920px; height: auto;">
                                                <asp:Label ID="labelmessageusername" runat="server" ForeColor="Blue" Font-Size="Medium" CssClass="label" Text='<%# Eval("USER_NAME") %>'></asp:Label>
                                                <asp:Label ID="labelmessageusersurname" runat="server" ForeColor="Blue" Font-Size="Medium" CssClass="label" Text='<%# Eval("USER_SURNAME") %>'></asp:Label><br />
                                                <br />

                                                <asp:TextBox ID="labelmessagecontent" runat="server" Text='<%# Eval("MESSAGE_CONTENT") %>' TextMode="MultiLine" Width="915px" Height="100px" Wrap="False" ReadOnly="True" Font-Names="courier"></asp:TextBox><br />
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label3" runat="server" Text="Date :" Font-Size="Medium" CssClass="label"></asp:Label>
                                                        </td>

                                                        <td style="width: 160px;">
                                                            <asp:Label ID="Label5" runat="server" ForeColor="Blue" Font-Size="Medium" CssClass="label" DataFormatString="{0:dd/MM/yyyy}" Text='<%# Eval("MESSAGE_DATE","{0:dd/MM/yyyy}") %>'></asp:Label></td>
                                                    </tr>
                                                </table>
                                                <hr />
                                            </div>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:Label ID="labelto" runat="server" Text="To :" Font-Size="Medium" CssClass="label" Visible="false"></asp:Label>
                                    <asp:Label ID="labeltoname" runat="server" Text="" Font-Size="Medium" CssClass="label" Visible="false"></asp:Label>
                                    <asp:Label ID="labeltosurname" runat="server" Text="" Font-Size="Medium" CssClass="label" Visible="false"></asp:Label>
                                    <asp:TextBox ID="TextMessage" runat="server" TextMode="MultiLine" Width="915px" Height="150px" Wrap="False" Font-Names="courier" Visible="false"></asp:TextBox>
                                    <asp:Button ID="BtnSend" runat="server" Text="Send" CssClass="icerikbutton" Visible="false" OnClick="BtnSend_Click" />
                                    <asp:Label ID="lblanswermsg" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>
                                </div>
                            </div>
                        </asp:Panel>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <asp:Button ID="BtnWriteMsgBack" runat="server" Text="Back" CssClass="icerikbutton" OnClick="BtnWriteMsgBack_Click" />
                        <table>
                            <tr>
                                <td class="style3">
                                    <asp:Label ID="lbluserid" runat="server" Text="" Visible="false"></asp:Label>
                                    <asp:Label ID="Label1" runat="server" Text="To" CssClass="label"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text=":" CssClass="label"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextSelectUser" runat="server" CssClass="inputs" AutoCompleteType="Disabled" OnTextChanged="TextSelectUser_Textchanged" AutoPostBack="true"></asp:TextBox>
                                    <asp:Label ID="durum" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label8" runat="server" Text="Message" CssClass="label"></asp:Label></td>
                                <td>
                                    <asp:Label ID="Label9" runat="server" Text=":" CssClass="label"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextMessageBox" runat="server" CssClass="inputs" TextMode="MultiLine" Height="150px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>
                                    <asp:Button ID="BtnWriteMsg" runat="server" Text="Send" CssClass="icerikbutton" OnClick="BtnWriteMsg_Click" /></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>
                                    <asp:Label ID="lblwritemsg" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>

            </td>
        </tr>
    </table>
</asp:Content>
