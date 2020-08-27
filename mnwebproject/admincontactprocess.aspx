<%@ Page Title="" Language="C#" MasterPageFile="~/adminmain.Master" AutoEventWireup="true" CodeBehind="admincontactprocess.aspx.cs" Inherits="mnwebproject.admincontactprocess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
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
    .style102
    {
        width: 450px;
    }
    .style103
    {
        width: 20px;
    }
    </style>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table>
<tr>
<td class="style100">
</td>
<td class="style101">
    <asp:Label ID="Label31" runat="server" Text="İletişim İşlemleri Sayfası" style="color:White; font-size:large;"></asp:Label>
</td>
<td class="style2"> <asp:Label ID="lblwelcomemsg" runat="server" Text="" style="color:White"></asp:Label></td>
<td><asp:Button ID="AdminLogout" runat="server" Text="Çıkış" CssClass="button" onclick="AdminLogout_Click" 
         /></td>
</tr>
</table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="style103">
                &nbsp;</td>
            <td class="style102">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CellPadding="3" DataKeyNames="ID" 
                     BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
                   >
                    <Columns>
                        <asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblIletisimID" runat="server" CssClass="label" 
                                    Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>' Visible="true"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Adı">
                            <ItemTemplate>
                                <asp:Label ID="lblAdi" Width="150px" runat="server" CssClass="label" 
                                    Text='<%# DataBinder.Eval(Container,"DataItem.CONTACT_NAME") %>' Visible="true"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Soyadı">
                            <ItemTemplate>
                                <asp:Label ID="lblSoyadi" Width="150px" runat="server" CssClass="label" 
                                    Text='<%# DataBinder.Eval(Container,"DataItem.CONTACT_SURNAME") %>' Visible="true" 
                                    ></asp:Label>
                                     <asp:Label ID="lblEmail" runat="server" CssClass="label" 
                                    Text='<%# DataBinder.Eval(Container,"DataItem.CONTACT_EMAIL") %>' Visible="false" 
                                    Width="100px"></asp:Label>
                                <asp:Label ID="lblMesaj" runat="server" CssClass="label" 
                                    Text='<%# DataBinder.Eval(Container,"DataItem.CONTACT_MESSAGE") %>' Visible="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Button" SelectText="Ayrıntılar" 
                                       ShowSelectButton="True" >
                                
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
                <asp:Label ID="lblmsg" runat="server" CssClass="label" ForeColor="Red" Visible="false"></asp:Label>
            </td>
            <td>
             <asp:Panel ID="PnlSil" runat="server" Visible="false"  Width="400px">
                <table class="auto-style1">
                    <tr>
                        <td class="style8">
                            <asp:Label ID="Label1" runat="server" Text="Adı" CssClass="label" ></asp:Label></td>
                        <td class="style10">
                           <asp:Label ID="Label2" runat="server" Text=":" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:Label ID="lbladi" runat="server" CssClass="label"></asp:Label>
                            <asp:TextBox ID="textiletisimid" runat="server" Visible="false"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            <asp:Label ID="Label3" runat="server" Text="Soyadı" CssClass="label"></asp:Label></td>
                        <td class="style10">
                            <asp:Label ID="Label4" runat="server" Text=":" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblsoyadi" runat="server" CssClass="label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            <asp:Label ID="Label5" runat="server" Text="Email" CssClass="label"></asp:Label></td>
                        <td class="style10">
                            <asp:Label ID="Label6" runat="server" Text=":" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblemail" runat="server" CssClass="label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            <asp:Label ID="Label7" runat="server" Text="Mesaj" CssClass="label"></asp:Label></td>
                        <td class="style10">
                            <asp:Label ID="Label8" runat="server" Text=":" CssClass="label"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtmesaj" runat="server" CssClass="inputs" TextMode="MultiLine" Height="70px"></asp:TextBox>
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="style8">
                            &nbsp;</td>
                        <td class="style10">
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="Btndelete" runat="server" Text="Sil" CssClass="button" OnClick="Btndelete_Click" />
                            <asp:Button ID="BtnCancel" runat="server" Text="İptal" CssClass="button" OnClick="BtnCancel_Click"  />
                        </td>
                    </tr>
                </table>
                </asp:Panel>
               </td>
        </tr>
    </table>
</asp:Content>
