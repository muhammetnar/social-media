<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="about_tr.aspx.cs" Inherits="mnwebproject.about_tr" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
    <style type="text/css">
        .style13
        {
            width: 96px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td >
               </td>
        </tr>
        <tr>
            <td >
                </td>
            <td >
                <asp:Image ID="Image1" runat="server" Height="180px" 
                    ImageUrl="~/images/ben.jpg" Width="170px" />
            </td>
            <td>
            <table>
            <tr>
            <td colspan="3">
            <asp:Label ID="Label1" runat="server" Text="Kişisel Bilgiler" ForeColor="Red" CssClass="label" Font-Size="Medium"></asp:Label>
            </td>
            </tr>
            <tr>
            <td class="style13" ><asp:Label ID="Label2" runat="server" Text="Ad Soyad" CssClass="label" Font-Size="Small"></asp:Label></td>
            <td>
                <asp:Label ID="Label6" runat="server" Text=":" CssClass="label" Font-Size="Small"></asp:Label></td>
            <td><asp:Label ID="Label3" runat="server" Text="Muhammet Nar" CssClass="label" Font-Size="Small"></asp:Label></td>
            </tr>
            <tr>
            <td class="style13" ><asp:Label ID="Label4" runat="server" Text="Doğum Tarihi" CssClass="label" Font-Size="Small"></asp:Label></td>
            <td>
                <asp:Label ID="Label7" runat="server" Text=":" CssClass="label" Font-Size="Small"></asp:Label></td>
            <td><asp:Label ID="Label5" runat="server" Text="25.07.1996" CssClass="label" Font-Size="Small"></asp:Label></td>
            </tr>
            <tr>
            <td class="style13" ><asp:Label ID="Label8" runat="server" Text="Eğitim" CssClass="label" Font-Size="Small"></asp:Label></td>
            <td>
                <asp:Label ID="Label9" runat="server" Text=":" CssClass="label" Font-Size="Small"></asp:Label></td>
            <td>
                <asp:Label ID="Label10" runat="server" Text="Doğu Akdeniz Üniversitesi Bilgisayar Teknnolojisi ve Bilişim Sistemleri Bölümü" CssClass="label" Font-Size="Small"></asp:Label></td>
            </tr>
            <tr>
            <td class="style13" ><asp:Label ID="Label11" runat="server" Text="Bilgisayar Bilgisi" CssClass="label" Font-Size="Small"></asp:Label></td>
            <td>
                <asp:Label ID="Label12" runat="server" Text=":" CssClass="label" Font-Size="Small"></asp:Label></td>
            <td><asp:Label ID="Label13" runat="server" Text="C# programlama dili (iyi seviyede)" CssClass="label" Font-Size="Small"></asp:Label><br />
                <asp:Label ID="Label14" runat="server" Text="Ms Sql (orta seviyede)" CssClass="label" Font-Size="Small"></asp:Label><br />
                <asp:Label ID="Label15" runat="server" Text="ASP Net (iyi seviyede)" CssClass="label" Font-Size="Small"></asp:Label><br />
                <asp:Label ID="Label16" runat="server" Text="Php programlama dili (başlangıç seviyede)" CssClass="label" Font-Size="Small"></asp:Label><br />
                <asp:Label ID="Label17" runat="server" Text="Ofis Proğramları (iyi seviyede)" CssClass="label" Font-Size="Small"></asp:Label></td>
            </tr>
            </table>


            
            </td>
           
            </table>
            <table>
            <tr>
            <td></td>
            <td>
            <asp:FormView ID="FormView1" runat="server" AllowPaging="True" 
        DataKeyNames="ID"> 
       
        <ItemTemplate>
           
           <asp:Label ID="HAKKIMDA_BASLIK" runat="server" 
                Text='<%# Bind("ABOUT_TITLE_TR") %>' ForeColor="Red" CssClass="label" Font-Size="Medium" />
          <br />
             <br />
            <asp:Label ID="HAKKIMIZDA_ICERIK" runat="server" 
                Text='<%# Bind("ABOUT_CONTENT_TR") %>' CssClass="label" Font-Size="Small" />
            <br />
          
        </ItemTemplate>
    </asp:FormView>
            
            </td>
            </tr>
            </table>
    
            
    <br />
</asp:Content>
