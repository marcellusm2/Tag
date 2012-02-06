<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Entrar</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
    <style type="text/css">
        div.login-block
        {
	        position: absolute;
	        text-align: left;
	        margin: -200px 10px 10px -170px;
	        padding: 0px 0px 0px 0px;
	        top: 50%;
	        left: 50%;
	        width: 344px;
	        height: 350px;
	        background-image: url("img/logo-bg.png");
	        background-repeat: no-repeat;
	        background-position: top;
	        background-color: #77787b;
	        color: #ffffff;
        }
        div.login 
        {
        	margin-left: 40px;
        	margin-top: 140px;
        }
        .btLogin
        {
        	background: url(img/red_button_bg.gif) no-repeat 25% 50% #333;
	        border: 1px solid #A60000;
	        margin-bottom: 3px;
	        color: #FFF;
	        height: 22px;
	        padding: 0 10px 0 10px;
	        font-size: 11px;
	        font-weight: bold;
        }
        .style1
        {
            height: 33px;
        }
        .style2
        {
            height: 28px;
        }
        .style3
        {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-block">
            <div class="login">
                <asp:Panel ID="PanelBlock" runat="server" Visible="False" Font-Bold="True" 
                    Font-Size="Medium" ForeColor="#CC0000" Height="16px" HorizontalAlign="Center" 
                    Width="242px">
                    <asp:Label ID="lbMsg" runat="server"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="PanelLogin" runat="server">                
                    <table border="0" cellpadding="1" cellspacing="0" 
                        style="border-collapse:collapse;">
                        <tr>
                            <td>
                                <table border="0" cellpadding="0" style="width:242px;">
                                    <tr>
                                        <td align="right" class="style1">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Login:</asp:Label>
                                        </td>
                                        <td class="style1">                                                
                                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                                ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style1">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                        </td>
                                        <td class="style1">
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                ControlToValidate="Password" ErrorMessage="Password is required." 
                                                ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center" class="style2">
                                            <asp:Label ID="lbBlock" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red;" class="style3">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2">
                                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Entrar" 
                                                ValidationGroup="Login1" CssClass="btLogin" onclick="LoginButton_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>                
            </div>
        </div>
    </form>
</body>
</html>
