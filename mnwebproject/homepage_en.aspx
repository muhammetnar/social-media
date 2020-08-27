<%@ Page Title="" Language="C#" MasterPageFile="~/main_en.Master" AutoEventWireup="true" CodeBehind="homepage_en.aspx.cs" Inherits="mnwebproject.homepage_en" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link href="Styles/slider.css" rel="stylesheet" />
   
    <script type='text/javascript' src='scripts/jquery.min.js'></script>

    <%--[if !IE]><!--%>

    <script type='text/javascript' src='scripts/jquery.mobile-1.0rc2.customized.min.js'></script>

    <!--<![endif]-->

    <script type='text/javascript' src='scripts/jquery.easing.1.3.js'></script>

    <script type='text/javascript' src='scripts/jquery.hoverIntent.minified.js'></script>

    <script type='text/javascript' src='scripts/diapo.js'></script>

    <script type="text/javascript">
        $(function () {
            $('.pix_diapo').diapo();
        });

    </script>

    <style type="text/css">
      

        section {
            display: block;
            overflow: hidden;
            position: relative;
        }

        .price_table {
            float: right;
            font-size: 12px;
            margin: 10px auto 0;
            padding: 20px 0;
            position: relative;
            width: 850px;
        }

            .price_table .price_column.highlighted {
                background: #ffd838;
                margin: -5px !important;
                padding: 10px;
                z-index: 2;
            }

            .price_table .price_column {
                display: block;
                margin: 5px;
                float: left;
                position: absolute;
                width: 180px;
                z-index: 1;
            }

                .price_table .price_column > div {
                    background: #eeeeee;
                }

                    .price_table .price_column > div > div {
                        padding: 10px 15px;
                        border-bottom: 1px solid #cccccc;
                        border-top: 1px solid #f6f6f6;
                    }

                    .price_table .price_column > div > p {
                        padding: 10px 15px;
                        border-bottom: 1px solid #cccccc;
                        border-top: 1px solid #f6f6f6;
                    }

                    .price_table .price_column > div > ul {
                        padding: 10px 15px;
                        border-bottom: 1px solid #cccccc;
                        border-top: 1px solid #f6f6f6;
                    }

            .price_table .price_title {
                background-color: #333333;
                border-top: 0 !important;
                color: #ffffff;
                font-size: 14px;
            }

            .price_table .highlighted .price_title {
                font-size: 16px;
            }

            .price_table .price_price {
                font-size: 36px;
                line-height: 40px;
            }

            .price_table .highlighted .price_price {
                font-size: 40px;
                line-height: 44px;
            }

            .price_table .price_explanation {
                font-size: 10px;
                line-height: 13px;
                text-transform: uppercase;
            }

            .price_table .cusButton {
                background-color: #333333;
                display: block;
                text-align: center;
            }

            .price_table li {
                padding: 5px 0;
            }

            .price_table div.pix_check {
                background: url(images/demo/list-check-green.png) no-repeat 15px center;
                padding-left: 38px !important;
            }

            .price_table div.pix_error {
                background: url(images/demo/list-error.png) no-repeat 15px center;
                padding-left: 38px !important;
            }

        .style1 {
            width: 500px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table>
        <tr>
            <td class="style1"></td>
            <td>
                <div style="overflow: hidden; margin: 20px 20px -340px 0px; width: 850px; padding: 0 60px;">
                    <div class="pix_diapo">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <div data-thumb="<%# Eval("SLIDE_URL","slider/{0}")%>">
                                    <img src="<%# Eval("SLIDE_URL","slider/{0}") %>" />
                                    <%--  <div class="caption elemHover fromRight" style="bottom: 65px; padding-bottom: 5px;
                                color: #ff0; text-transform: uppercase">
                                <a href="<%# Eval("SLIDE_SITEURL_TR")%>"><span>"<%# Eval("SLIDE_TITLE_TR")%>"</span></a>
                            </div>--%>
                                    <div class="caption elemHover fromLeft" style="padding-top: 5px;">
                                        <span>"<%# Eval("SLIDE_CONTENT_EN")%>"</span>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </td>
        </tr>
    </table>

    <marquee>
       <h3>Site İçerisindeki İçerikler İzinsiz Kopyalanamaz,Alıntı Yapılamaz Copyright 2018 Tüm Hakları Saklıdır</h3></marquee>

    <table>
        <tr>
            <td style="width: 65px;"></td>
            <td style="width: 430px;" valign="top">
                <div class="duyurular" style="float: left; margin-top: 45px; width: 400px; height: auto">
                    <div class="ust" style="float: left; width: 400px; height: 44px; line-height: 44px; padding-left: 15px; border: 1px solid #ccc; background-color: #c7e0e7;">
                        <asp:Label ID="Label4" runat="server" Text="News" CssClass="label" ForeColor="Black"></asp:Label>
                    </div>
                    <div class="alt" style="float: left; width: 382px; height: auto; padding: 16.5px; border: 1px solid #ccc; background-color: #fff;">
                        <asp:ListView ID="lstHaber" runat="server">

                            <ItemTemplate>
                                <div class="duyuru-wrap" style="float: left; width: 250px; height: auto;">
                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("NEWS_TITLE") %>' Font-Size="Small" ForeColor="Red" CssClass="label" Font-Bold="True"></asp:Label><br />
                                    <asp:Label ID="Label22" runat="server" Text='<%# Eval("NEWS_CONTENT") %>' CssClass="label" Font-Size="Small"></asp:Label><br />
                                    <asp:Label ID="Label33" runat="server" DataFormatString="{0:dd/MM/yyyy}" Text='<%# Eval("NEWS_DATE","{0:dd/MM/yyyy}") %>' CssClass="label" Font-Size="Small"></asp:Label>
                                    <hr style="width: 380px;" />
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </td>

            <td valign="top">

                <div class="duyurular" style="float: left; margin-top: 45px; width: 400px; height: auto">
                    <div class="ust" style="float: left; width: 400px; height: 44px; line-height: 44px; padding-left: 15px; border: 1px solid #ccc; background-color: #c7e0e7;">
                        <asp:Label ID="Label5" runat="server" Text="Announcements" CssClass="label" ForeColor="Black"></asp:Label>
                    </div>
                    <div class="alt" style="float: left; width: 382px; height: auto; padding: 16.5px; border: 1px solid #ccc; background-color: #fff;">
                        <asp:ListView ID="lstDuyuru" runat="server">
                            <ItemTemplate>
                                <div class="duyuru-wrap" style="float: left; width: 250px; height: auto;">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ANNOUNCE_TITLE" ) %>' Font-Size="Small" CssClass="label" ForeColor="Red" Font-Bold="True"></asp:Label><br />
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("ANNOUNCE_CONTENT") %>' Font-Size="Small" CssClass="label"></asp:Label><br />
                                    <asp:Label ID="Label3" runat="server" DataFormatString="{0:dd/MM/yyyy}" Text='<%# Eval("ANNOUNCE_DATE","{0:dd/MM/yyyy}") %>' Font-Size="Small" CssClass="label"></asp:Label>
                                    <hr style="width: 380px;" />
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
