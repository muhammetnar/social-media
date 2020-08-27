<%@ Page Title="" Language="C#"  MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="photogallery_tr.aspx.cs" Inherits="mnwebproject.photogallery_tr" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center">
    <div id="content" style="text-align: justify">
        <asp:DataList ID="DataList1" runat="server" DataKeyField="ID" RepeatColumns="6" 
            FooterStyle-VerticalAlign="Bottom" onitemcommand="DataList1_ItemCommand" 
            RepeatDirection="Horizontal">
            <ItemTemplate>

            <table border="0" cellpadding="0" cellspacing="0" style="border: 2px inset #E2E2E2; margin-right: 3px; margin-bottom: 5px;">
                <tr>
                    <td style="text-align: center">
        <asp:Image ID="Image1" runat="server" Height="138px" ImageUrl='<%# Eval("CAT_PHOTO_URL", "photocatgallery/{0}") %>'   Width="168px" /></td>
                </tr>
                <tr>
                    <td style="height: 25px; background-color: #E2E2E2; text-align: center; width:168px;">
                        <asp:Label ID="Label1" runat="server" style="font-style:normal; font-family:Verdana; color:Black; width:168px; font-Size:14px; margin:0px 1px 0px 0px;"
                            Text='<%# Eval("CATEGORY_TITLE") %>'></asp:Label>
                            </td>
                </tr>
                <tr>
                <td style="height: 25px; background-color: #E2E2E2; text-align: center; width:168px;">
               <asp:Button ID="BtnKisiProfili" runat="server" CommandName="Details" CommandArgument='<%#Eval("ID")%>' Text="Galeriye Git" CssClass="buttons" Font-Size="14px" />
                </td>
                </tr>
            </table>    
            </ItemTemplate>
        </asp:DataList></div>

    </div>
</asp:Content>
