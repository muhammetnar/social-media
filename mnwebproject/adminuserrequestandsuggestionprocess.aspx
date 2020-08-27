<%@ Page Title="" Language="C#" MasterPageFile="~/adminuser.Master" AutoEventWireup="true" CodeBehind="adminuserrequestandsuggestionprocess.aspx.cs" Inherits="mnwebproject.adminuserrequestandsuggestionprocess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <style type="text/css">
        .style1
        {
            width: 895px;
        }
        .style2
        {
            width: 150px;
        }
              .style100
        {
            width: 180px;
            }
            .style101
        {
            width: 715px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
      <table>
        <tr>
            <td class="style100"></td>
            <td class="style101">
                <asp:Label ID="Label31" runat="server" Text="İstek Ve Öneri Sayfası" Style="color: White; font-size: large;"></asp:Label>
            </td>
            <td class="style2">
                <asp:Label ID="lblwelcomemsg" runat="server" Text="" Style="color: White"></asp:Label></td>
            <td>
                <asp:Button ID="AdminLogout" runat="server" Text="Çıkış" CssClass="button" OnClick="AdminLogout_Click" /></td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
        CellPadding="3"
        DataKeyNames="ID"
        BackColor="White"
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField HeaderText="Id" Visible="false">
                <ItemTemplate>
                    <asp:Label ID="lblId" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>'
                        runat="server" Width="100px" Visible="false"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kullanıcı" ItemStyle-Height="30px">
                <ItemTemplate>
                    <asp:Label ID="lblusername" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.USER_USERNAME") %>'
                        runat="server" Width="250px" Visible="true"></asp:Label>
                    <asp:Label ID="lblname" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.USER_NAME") %>'
                        runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="lblsurname" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.USER_SURNAME") %>'
                        runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="lblemail" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.USER_EMAIL") %>'
                        runat="server" Visible="false"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Konu" ItemStyle-Height="30px">
                <ItemTemplate>
                    <asp:Label ID="lbltopic" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.TOPIC") %>'
                        runat="server" Width="530px" Visible="true"></asp:Label>
                    <asp:Label ID="lblmessage" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.MESSAGE") %>'
                        runat="server" Visible="false"></asp:Label>

                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" SelectText="Ayrıntılar" ItemStyle-Height="30px"
                ShowSelectButton="True">

                <ControlStyle CssClass="button" />
            </asp:CommandField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#566F96" ForeColor="White" CssClass="label" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <br /><br />
    <asp:Panel runat="server" ID="PnlMesaage" Visible="false">
        <table>
            <tr>
                <td class="style2">
                    <asp:Label ID="lblmessageid" runat="server" Text="" Visible="false"></asp:Label>
                    <asp:Label ID="Label1" runat="server" Text="Kullanıcı Adı" CssClass="label"></asp:Label></td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text=":" CssClass="label"></asp:Label></td>
                <td>
                    <asp:TextBox ID="Textusername" runat="server" CssClass="inputs" ReadOnly="true"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="İsim" CssClass="label"></asp:Label></td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text=":" CssClass="label"></asp:Label></td>
                <td>
                    <asp:TextBox ID="Textname" runat="server" CssClass="inputs" ReadOnly="true"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Soyisim" CssClass="label"></asp:Label></td>
                <td>
                    <asp:Label ID="Label6" runat="server" Text=":" CssClass="label"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TextSurname" runat="server" CssClass="inputs" ReadOnly="true"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Email" CssClass="label"></asp:Label></td>
                <td>
                    <asp:Label ID="Label8" runat="server" Text=":" CssClass="label"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TextEmail" runat="server" CssClass="inputs" ReadOnly="true"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="Konu" CssClass="label"></asp:Label></td>
                <td>
                    <asp:Label ID="Label10" runat="server" Text=":" CssClass="label"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TextTopic" runat="server" CssClass="inputs" ReadOnly="true"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label11" runat="server" Text="Mesaj" CssClass="label"></asp:Label></td>
                <td>
                    <asp:Label ID="Label12" runat="server" Text=":" CssClass="label"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TextMessage" runat="server" CssClass="inputs" TextMode="MultiLine" Height="150px" ReadOnly="true"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>
                    <asp:Button ID="BtnDelete" runat="server" Text="Sil" OnClick="BtnDelete_Click" CssClass="button"/>
                    <asp:Button ID="BtnBack" runat="server" Text="Geri Dön" CssClass="button" OnClick="BtnBack_Click" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
