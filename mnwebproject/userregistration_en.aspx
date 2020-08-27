<%@ Page Title="" Language="C#" MasterPageFile="~/main_en.Master" AutoEventWireup="true" CodeBehind="userregistration_en.aspx.cs" Inherits="mnwebproject.userregistration_en" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style type="text/css">
        .style13
        {
            width: 206px;
        }
        .style14
        {
            width: 150px;
        }
        .style15
        {
            width: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table class="style1">
        <tr>
            <td class="style15"  >
               </td>
            <td colspan="3">
                
                <asp:Label ID="Label1" runat="server" Text="User Register Form" ForeColor="Red" CssClass="label"></asp:Label>
            </td>
            <td  >
               </td>
               
        </tr>
        <tr>
            <td class="style15" >
               </td>
            <td class="style14"  >
                
                <asp:Label ID="Label2" runat="server" Text="Username" CssClass="label" 
                  ></asp:Label>
            </td>
            <td class="style12"  >
                
                <asp:Label ID="Label3" runat="server" Text=":" CssClass="label"
                 ></asp:Label>
            </td>
            <td class="style13"  >
                
                <asp:TextBox ID="username" runat="server" AutoCompleteType="Disabled" OnTextChanged="username_Textchanged" AutoPostBack="true" CssClass="inputs" 
                  ></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="durum" runat="server" Text="" CssClass="label" Font-Size="15px" ></asp:Label></td>
        </tr>
        <tr>
            <td class="style15">
               </td>
            <td class="style14"  >
               
                <asp:Label ID="Label4" runat="server" Text="Password" CssClass="label" ></asp:Label>
            </td>
            <td class="style12" >
             
                <asp:Label ID="Label5" runat="server" Text=":" CssClass="label" ></asp:Label>
            </td>
            <td class="style13"  >
             
                <asp:TextBox ID="password" runat="server" CssClass="inputs" TextMode="Password" ></asp:TextBox>
            </td>
            <td>
              </td>
        </tr>
        <tr>
            <td class="style15"  >
                </td>
            <td class="style14">
             
                <asp:Label ID="Label6" runat="server" Text="Repeat Password" CssClass="label" ></asp:Label>
            </td>
            <td class="style12" >
                
                <asp:Label ID="Label7" runat="server" Text=":" CssClass="label"></asp:Label>
            </td>
            <td class="style13" >
                
                <asp:TextBox ID="ASPxTextBox3" runat="server" CssClass="inputs" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="ASPxTextBox3" ControlToValidate="password" 
                    ErrorMessage="Passwords do not match" ForeColor="Red" Operator="Equal"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style15"  >
               </td>
            <td class="style14" >
                
                <asp:Label ID="Label8" runat="server" Text="Name" CssClass="label" ></asp:Label>
            </td>
            <td class="style12" >
                
                <asp:Label ID="Label9" runat="server" Text=":" CssClass="label" ></asp:Label>
            </td>
            <td class="style13" >
                
                <asp:TextBox ID="name" runat="server" CssClass="inputs"></asp:TextBox>
            </td>
            <td>
              </td>
        </tr>
        <tr>
            <td class="style15"  >
               </td>
            <td class="style14"  >
                
                <asp:Label ID="Label10" runat="server" Text="Surname" CssClass="label" ></asp:Label>
            </td>
            <td class="style12" >
               
                <asp:Label ID="Label11" runat="server" Text=":" CssClass="label"></asp:Label>
            </td>
            <td class="style13" >
                
                <asp:TextBox ID="surname" runat="server" CssClass="inputs"></asp:TextBox>
            </td>
            <td>
               </td>
        </tr>
        <tr>
            <td class="style15" >
               </td>
            <td class="style14">
                <asp:Label ID="Label12" runat="server" Text="Gender" CssClass="label"></asp:Label>
            </td>
            <td class="style12" >
                
                <asp:Label ID="Label13" runat="server" Text=":" CssClass="label"></asp:Label>
            </td> 
            <td class="style13">
                <asp:DropDownList ID="gender" runat="server" Width="202px" CssClass="inputs" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
               </td>
        </tr>
        <tr>
            <td class="style15">
               </td>
            <td class="style14">
                
                <asp:Label ID="Label14" runat="server" Text="E-Mail" CssClass="label"></asp:Label>
            </td>
            <td class="style12">
                
                <asp:Label ID="Label15" runat="server" Text=":" CssClass="label" ></asp:Label>
            </td>
            <td class="style13" >
                
                <asp:TextBox ID="email" runat="server" CssClass="inputs"></asp:TextBox>
            </td>
            <td>
                </td>
        </tr>
       
        <tr>
            <td class="style15">
                </td>
            <td class="style14">
                <asp:Label ID="lblusername" runat="server" Text="Label" Visible="false"></asp:Label>
                <asp:Label ID="lbluserid" runat="server" Text="Label" Visible="false"></asp:Label></td>
            <td class="style12">
                </td>
            <td class="style13">
                <asp:Button ID="BtnAdd" runat="server" 
                    Text="Register"  CssClass="icerikbutton" OnClick="BtnAdd_Click" />
            </td>
            <td>
               </td>
        </tr>
        <tr>
            <td class="style15">
                </td>
            <td class="style14">
                
            </td>
            <td class="style12" >
               </td>
               <td class="style13" colspan="2">
               <asp:Label ID="lblmsg" runat="server" CssClass="label" ForeColor="Red"></asp:Label>
               </td>
           
        </tr>
    </table>
</asp:Content>
