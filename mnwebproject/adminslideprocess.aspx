<%@ Page Title="" Language="C#" MasterPageFile="~/adminmain.Master" AutoEventWireup="true" CodeBehind="adminslideprocess.aspx.cs" Inherits="mnwebproject.adminslideprocess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .style2
        {
            width: 150px;
        }
        .style4
        {
            width: 420px;
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
            width: 131px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table>
<tr>
<td class="style100">
</td>
<td class="style101">
    <asp:Label ID="Label31" runat="server" Text="Slider İşlemleri Sayfası" style="color:White; font-size:large;"></asp:Label>
</td>
<td class="style2"> <asp:Label ID="lblwelcomemsg" runat="server" Text="" style="color:White"></asp:Label></td>
<td><asp:Button ID="AdminLogout" runat="server" Text="Çıkış" CssClass="button" onclick="AdminLogout_Click" 
         /></td>
</tr>
</table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
    <tr>
    <td></td>
     <td>
         <asp:Label ID="Label11" runat="server" Text="İşlem Seçiniz" CssClass="label"></asp:Label></td>
      <td>
          <asp:Label ID="Label12" runat="server" Text=":" CssClass="label"></asp:Label></td>
       <td> <asp:DropDownList ID="DropDownList1" runat="server" CssClass="inputs" Style="width:180px">
    <asp:ListItem>Bir İşlem Seçiniz</asp:ListItem>
    <asp:ListItem>Ekle</asp:ListItem>
    <asp:ListItem>Güncelle</asp:ListItem>
    <asp:ListItem>Sil</asp:ListItem>
    <asp:ListItem>Listele</asp:ListItem>
    </asp:DropDownList></td>
        <td><asp:Button ID="BtnOpenSlide" runat="server" Text="Panel Aç" CssClass="button" OnClick="BtnOpenSlide_Click" /></td>
         <td> <asp:Label ID="lblslideislemlerimsg" runat="server" Text="" ForeColor="Red" CssClass="label"></asp:Label></td>
    </tr>
    </table>
   
   <br />
   <br /> 
   
   
    <asp:MultiView ID="MultiView1" runat="server" >
        <asp:View ID="View1" runat="server">
           &nbsp;&nbsp;&nbsp;  <asp:Label ID="Label25" runat="server" Text="*Not=Resim'in Uygun boyutlarda olmasına dikkat ediniz. 380px*850px " CssClass="label" ForeColor="Red" Font-Size="10pt" ></asp:Label>
            <p />
        <table>
       
        <tr>
        <td></td>
        <td class="style102">
            <asp:Label ID="Label15" runat="server" Text="Resim Seç" CssClass="label"></asp:Label></td>
        <td>
            <asp:Label ID="Label16" runat="server" Text=":" CssClass="label"></asp:Label>
        </td>
        <td><asp:FileUpload ID="slideeklefile" runat="server" CssClass="inputs" />
           
            </td>
        </tr>
         <tr>
        <td></td>
        <td class="style102">
            <asp:Label ID="Label13" runat="server" Text="Resim Adı" CssClass="label"></asp:Label></td>
        <td>
            <asp:Label ID="Label14" runat="server" Text=":" CssClass="label"></asp:Label></td>
        <td><asp:TextBox ID="TextResimAdi" runat="server" CssClass="inputs"></asp:TextBox></td>
        </tr>
        <tr>
        <td></td>
        <td class="style102">
            <asp:Label ID="Label17" runat="server" Text="Açıklama" CssClass="label"></asp:Label></td>
        <td>
            <asp:Label ID="Label18" runat="server" Text=":" CssClass="label"></asp:Label></td>
        <td><asp:TextBox ID="TextResimAciklama" runat="server" CssClass="inputs"></asp:TextBox></td>
        </tr>
         <tr>
                <td>
                    </td>
                <td class="style102">
                    <asp:Label ID="Label19" runat="server" Text="Site Url" CssClass="label"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label20" runat="server" Text=":" CssClass="label"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextResimSiteUrl" runat="server" CssClass="inputs"></asp:TextBox>
                </td>
            </tr>
         <tr>
        <td></td>
        <td class="style102">
            <asp:Label ID="Label26" runat="server" Text="Picture Name" CssClass="label"></asp:Label></td>
        <td>
            <asp:Label ID="Label27" runat="server" Text=":" CssClass="label"></asp:Label></td>
        <td><asp:TextBox ID="TextPictureName" runat="server" CssClass="inputs"></asp:TextBox></td>
        </tr>
         <tr>
        <td></td>
        <td class="style102">
            <asp:Label ID="Label28" runat="server" Text="Explanation" CssClass="label"></asp:Label></td>
        <td>
            <asp:Label ID="Label29" runat="server" Text=":" CssClass="label"></asp:Label></td>
        <td><asp:TextBox ID="TextExplanation" runat="server" CssClass="inputs"></asp:TextBox></td>
        </tr>
            <tr>
                <td>
                    </td>
                <td class="style102">
                    <asp:Label ID="Label37" runat="server" Text="Site Url" CssClass="label"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label38" runat="server" Text=":" CssClass="label"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextPictureSiteUrl" runat="server" CssClass="inputs"></asp:TextBox>
                </td>
            </tr>

        <tr>
        <td></td>
        <td class="style102"></td>
        <td></td>
        <td> <asp:Button ID="Slideaddbtn" runat="server" Text="Ekle" CssClass="button" OnClick="Slideaddbtn_Click"  />
            <asp:Button ID="Slideraddbtncancel" runat="server" Text="İptal" 
                CssClass="button" OnClick="Slideraddbtncancel_Click"   />
            </td>
        </tr>
        <tr>
        <td></td>
        <td class="style102"></td>
        <td></td>
        <td><asp:Label ID="lbleklemsg" runat="server" Text="" CssClass="label" ForeColor="Red" Visible="false"></asp:Label></td>
        </tr>
        </table>
            
            
            
           
            
        </asp:View>
        <asp:View ID="View2" runat="server">
        <table>
        <tr>
        <td></td>
        <td class="style4"> 
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="ID"  Width="400px" 
                CellPadding="4" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                BackColor="White" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                <asp:TemplateField HeaderText="ID" Visible="false">
                                   <ItemTemplate>
                                   <asp:Label ID="lblId" Width="120px" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>'
                                                runat="server" Visible="false"></asp:Label>
                                   </ItemTemplate>
                                   </asp:TemplateField>
              <asp:TemplateField HeaderText="Resim Adı">
                                   <ItemTemplate>
                                   <asp:Label ID="lblResim" Width="120px" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.SLIDE_TITLE_TR") %>'
                                                runat="server" Visible="true"></asp:Label>
                                   </ItemTemplate>
                                   </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Açıklama">
                                        <ItemTemplate>
                                          
                                                
                                                <asp:Label ID="lblAciklama" Width="200" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.SLIDE_CONTENT_TR") %>'
                                                runat="server" Visible="true"></asp:Label>
                                                <asp:Label ID="lblUrl" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.SLIDE_URL") %>'
                                                runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="lblSiteUrl" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.SLIDE_SITEURL_TR") %>'
                                                runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="lblPicture" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.SLIDE_TITLE_EN") %>'
                                                runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="lblExplanation" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.SLIDE_CONTENT_EN") %>'
                                                runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="lblPictureSiteUrl" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.SLIDE_SITEURL_EN") %>'
                                                runat="server" Visible="false"></asp:Label>
                                             
                                                 </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ButtonType="Button" SelectText="Aç" 
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
            <asp:Label ID="lblmsgguncelle" runat="server" Text="" CssClass="label" ForeColor="Red"></asp:Label>
            </td>
        <td>
            <asp:Panel ID="Pnlguncelle" runat="server" Visible="false">
            <table>
            <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Label ID="Label32" runat="server" Text="Resim Url" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label33" runat="server" Text=":" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblresimurl" runat="server" Text="" Visible="false"></asp:Label>
                        
                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="inputs" />
                    </td>
                </tr>
            <tr>
            <td></td>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Resim Adı" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label2" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td><asp:Label ID="lblresimid" runat="server" Text="" Visible="false"></asp:Label><asp:TextBox ID="txtresimid" runat="server" CssClass="inputs" Visible="false"></asp:TextBox>
            <asp:Label ID="lblresimadi" runat="server" Text="" Visible="false"></asp:Label><asp:TextBox ID="txtresimadi" runat="server" CssClass="inputs"></asp:TextBox></td>
            </tr>  
            <tr>
            <td></td>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Açıklama" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label4" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
            <asp:Label ID="lblresimaciklama" runat="server" Text="" Visible="false"></asp:Label><asp:TextBox ID="txtresimaciklama" runat="server" CssClass="inputs"></asp:TextBox></td>
            </tr>
            <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Label ID="Label21" runat="server" Text="Resim Site Url" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label22" runat="server" Text=":" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblresimsiteurl" runat="server" Visible="false"></asp:Label>
                        <asp:TextBox ID="txtresimsiteurl" runat="server" CssClass="inputs"></asp:TextBox>
                    </td>
                </tr>
            <tr>
            <td></td>
            <td>
                <asp:Label ID="Label30" runat="server" Text="Picture Name" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label34" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
            <asp:Label ID="lblpicturename" runat="server" Text="" Visible="false"></asp:Label><asp:TextBox ID="txtpicturename" runat="server" CssClass="inputs"></asp:TextBox></td>
            </tr>
            <tr>
            <td></td>
            <td>
                <asp:Label ID="Label35" runat="server" Text="Explanation" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label36" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
            <asp:Label ID="lblexplanation" runat="server" Text="" Visible="false"></asp:Label><asp:TextBox ID="txtexplanation" runat="server" CssClass="inputs"></asp:TextBox></td>
            </tr>
                 <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Label ID="Label39" runat="server" Text="Picture Site Url" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label40" runat="server" Text=":" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblpicturesiteurl" runat="server" Visible="false"></asp:Label>
                        <asp:TextBox ID="txtpicturesiteurl" runat="server" CssClass="inputs"></asp:TextBox>
                    </td>
                </tr>
            <tr>
            <td></td>
            <td></td>
            <td></td>
            <td><asp:Button ID="Btnupdate" runat="server" Text="Güncelle" CssClass="button" OnClick="Btnupdate_Click"  />
                <asp:Button ID="Slideupdatecancelbtn" runat="server" Text="İptal" 
                    CssClass="button" OnClick="Slideupdatecancelbtn_Click"   />
                </td>
            </tr>
           
            </table>
             
            
            

            </asp:Panel>
           

        
        </td>
        </tr>

        </table>
           
            
        </asp:View>



        <asp:View ID="View3" runat="server">
        <table>
        <tr>
        <td></td>
        <td>
         <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="ID"  Width="320px" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" 
                CellPadding="4"  BackColor="White" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" 
                >
                <Columns>
                <asp:TemplateField HeaderText="ID" Visible="false">
                                   <ItemTemplate>
                                   <asp:Label ID="lblSilId" Width="120px" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>'
                                                runat="server" Visible="false"></asp:Label>
                                   </ItemTemplate>
                                   </asp:TemplateField>
              <asp:TemplateField HeaderText="Resim Adı">
                                   <ItemTemplate>
                                   <asp:Label ID="lblSilResim" Width="160px" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.SLIDE_TITLE_TR") %>'
                                                runat="server" Visible="true"></asp:Label>
                                   </ItemTemplate>
                                   </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Açıklama">
                                        <ItemTemplate>
                                          
                                                
                                                <asp:Label ID="lblSilAciklama" Width="160px" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.SLIDE_CONTENT_TR") %>'
                                                runat="server" Visible="true"></asp:Label>
                                                <asp:Label ID="lblSilUrl" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.SLIDE_URL") %>'
                                                runat="server" Visible="false"></asp:Label>
                                               <asp:Label ID="lblSilSiteUrl" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.SLIDE_SITEURL_TR") %>'
                                                runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="lblDeletePictureName" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.SLIDE_TITLE_EN") %>'
                                                runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="lblDeleteExplanation" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.SLIDE_CONTENT_EN") %>'
                                                runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="lblDeleteSiteUrl" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.SLIDE_SITEURL_EN") %>'
                                                runat="server" Visible="false"></asp:Label>
                                             
                                                 </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:CommandField ButtonType="Button" SelectText="Aç" 
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
            <asp:Label ID="lblmsgsil" runat="server" Text="" CssClass="label" ForeColor="Red" Visible="false" ></asp:Label>
        </td>
        <td>
            <asp:Panel ID="PnlResimSil" runat="server" Visible="false">
            <table>
            <tr>
            <td></td>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Resim Url" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label10" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="lblresimsilurl" runat="server" Text="" CssClass="label"></asp:Label></td>
            </tr>
            <tr>
            <td></td>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Resim Adı" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label6" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="lblresimsiladi" runat="server" Text="Resim Adı" CssClass="label">
                    <asp:Label ID="lblresimsilid" runat="server" Text="" CssClass="label"></asp:Label></asp:Label><asp:TextBox ID="txtresimsilid"
                    runat="server" Visible="false"></asp:TextBox></td>
            </tr>
            <tr>
            <td></td>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Açıklama" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label8" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="lblresimsilaciklama" runat="server" Text="" CssClass="label"></asp:Label></td>
            </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Label ID="Label23" runat="server" Text="Resim Site Url" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label24" runat="server" Text=":" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblresimsilsiteurl" runat="server" CssClass="label"></asp:Label>
                    </td>
                </tr>
                <tr>
            <td></td>
            <td>
                <asp:Label ID="Label41" runat="server" Text="Picture Name" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label42" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="lblpicturedeletename" runat="server" Text="" CssClass="label"></asp:Label></td>
            </tr>
            <tr>
            <td></td>
            <td>
                <asp:Label ID="Label43" runat="server" Text="Explanation" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label44" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="lblpicturedeleteexplanation" runat="server" Text="" CssClass="label"></asp:Label></td>
            </tr>
            <tr>
            <td></td>
            <td>
                <asp:Label ID="Label45" runat="server" Text="Picture Site Url" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="Label46" runat="server" Text=":" CssClass="label"></asp:Label></td>
            <td>
                <asp:Label ID="lblpicturedeletesiteurl" runat="server" Text="" CssClass="label"></asp:Label></td>
            </tr>
            <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>
                <asp:Button ID="Btndeleteimage" runat="server" Text="Sil" CssClass="button" OnClick="Btndeleteimage_Click" />
                <asp:Button ID="Btndeleteimagecancel" runat="server" Text="İptal" CssClass="button" OnClick="Btndeleteimagecancel_Click" />
                </td>
            </tr>
            </table>

            </asp:Panel>

        </td>
        </tr>
        </table>

        </asp:View>

        <asp:View ID="View4" runat="server">
        <table>
        <tr>
        <td></td>
        <td>
         <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="ID"  Width="900px" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" 
                CellPadding="4" BackColor="White"  
                >
                <Columns>
                <asp:TemplateField HeaderText="ID" Visible="false">
                                   <ItemTemplate>
                                   <asp:Label ID="lblListeleId" Width="10px" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.ID") %>'
                                                runat="server" Visible="false"></asp:Label>
                                   </ItemTemplate>
                                   </asp:TemplateField>
              <asp:TemplateField HeaderText="Resim Adı">
                                   <ItemTemplate>
                                   <asp:Label ID="lblListeleResim" Width="150px" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.SLIDE_TITLE_TR") %>'
                                                runat="server" Visible="true"></asp:Label>
                                   </ItemTemplate>
                                   </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Açıklama">
                                        <ItemTemplate>
                                          
                                                
                                                <asp:Label ID="lblListeleAciklama" Width="400" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.SLIDE_CONTENT_TR") %>'
                                                runat="server" Visible="true"></asp:Label>
                                                <asp:Label ID="lblListeleUrl" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.SLIDE_URL") %>'
                                                runat="server" Visible="false"></asp:Label>
                                               <asp:Label ID="lblListeleSiteUrl" CssClass="label" Text='<%# DataBinder.Eval(Container,"DataItem.SLIDE_SITEURL_TR") %>'
                                                runat="server" Visible="false"></asp:Label>
                                                
                                             
                                                 </ItemTemplate>
                                    </asp:TemplateField>
                                    
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
        </td>
        </tr>
        </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
