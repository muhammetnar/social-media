<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="mnwebproject.adminlogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Admin Girişi</title>
    <link href="~/Styles/Admin.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            height: 36px;
        }
        .style2
        {
            height: 37px;
        }
        .style3
        {
            height: 38px;
        }
        .style5
        {
            height: 47px;
        }
        .style6
        {
            height: 51px;
        }
        .style7
        {
            height: 50px;
        }
        .style8
        {
            height: 51px;
            width: 149px;
        }
        .style9
        {
            height: 50px;
            width: 149px;
        }
    </style>
</head>
<body>
    <center>
    <form id="form1" runat="server">
    <div style="width: 400px; height: 350px; margin-top: 120px; background-color:#C8C8CA; border: 2px solid #c4c4c4; border-radius: 5px; " align="left">
    
        <table class="style1">
            <tr>
                <td class="style5">
                    </td>
                <td colspan="3" class="style5">
                    
                    <asp:Label ID="Label1" runat="server" Text="Admin Girişi" CssClass="label" Font-Size="X-Large" Font-Bold="true" ForeColor="#3a4f63"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    </td>
                <td class="style8">
                    
                    <asp:Label ID="Label2" runat="server" Text="Kullanıcı Adı" CssClass="label" Font-Size="X-Large" ForeColor="#3a4f63"></asp:Label>
                </td>
                <td class="style6">
                    
                    <asp:Label ID="Label3" runat="server" Text=":" CssClass="label" Font-Size="X-Large" ForeColor="#3a4f63"></asp:Label>
                </td>
                <td class="style6">
                    
                   
                    <asp:TextBox ID="username" runat="server" CssClass="inputs" Width="180px" placeholder="ID" ForeColor="#3a4f63"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    </td>
                <td class="style9">
                    
                    <asp:Label ID="Label4" runat="server" Text="Şifre" CssClass="label" Font-Size="X-Large" ForeColor="#3a4f63"></asp:Label>
                </td>
                <td class="style7">
                    
                    <asp:Label ID="Label5" runat="server" Text=":" CssClass="label" Font-Size="X-Large" ForeColor="#3a4f63"></asp:Label>
                </td>
                <td class="style7">
                    
                    <asp:TextBox ID="password" runat="server" CssClass="inputs" Width="180px" placeholder="Password" ForeColor="#3a4f63" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    </td>
                <td class="style8">
                    </td>
                <td class="style6">
                    </td>
                <td class="style6">
                    <asp:Button ID="AdminLogin" runat="server" Text="Giriş" CssClass="button" onclick="AdminLogin_Click" 
                         />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3" colspan="3">
                    <asp:Label ID="lblmsg" runat="server" Font-Names="Arno Pro" Font-Size="X-Large" ForeColor="#3a4f63"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
    </center>
</body>
</html>
