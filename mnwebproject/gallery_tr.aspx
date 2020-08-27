<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gallery_tr.aspx.cs" Inherits="mnwebproject.gallery_tr" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="fancybox/photogalleryjs.js"></script>
    <script type="text/javascript" src="fancybox/jquery.fancybox-1.3.4.pack.js"></script>
    <link rel="stylesheet" type="text/css" href="fancybox/jquery.fancybox-1.3.4.css" media="screen" />
    <link href="style/style.css" rel="stylesheet" type="text/css" />

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
</head>
<body style="background-color:#E7E4E4;">
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblid" runat="server" Text=""  Visible="false"></asp:Label><br />
            <asp:LinkButton ID="LinkButton1" runat="server" Font-Names="Verdana" Font-Size="Large" PostBackUrl="~/photogallery_tr.aspx">Fotogaleri Sayfasına Geri Dön</asp:LinkButton>
            
            <div style="text-align: center">

                <div id="content" style="text-align: justify">

                    <asp:DataList ID="DataList1" runat="server" DataKeyField="ID" RepeatColumns="4" FooterStyle-VerticalAlign="Bottom" RepeatDirection="Horizontal">
                        <ItemTemplate>

                            <a rel="resim" href='<%# Eval("PHOTO_URL", "photogallery/{0}") %>' title='<%# Eval("PHOTO_CONTENT") %>'>
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 1px">
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image1" runat="server" Height="128px" ImageUrl='<%# Eval("PHOTO_URL", "photogallery/{0}") %>' Width="173px" /></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 25px; background-color: #a8d9e7; text-align: center; width: 173px;">
                                            <asp:Label ID="Label1" runat="server" Style="font-style: normal; font-family: Verdana; color: Black; width: 173px; font-size: medium; margin: 0px 5px 0px 0px;"
                                                Text='<%# Eval("PHOTO_TITLE") %>'></asp:Label></td>
                                    </tr>
                                </table>
                            </a>

                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
            <br />
        </div>
    </form>
</body>
</html>
