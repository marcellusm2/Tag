<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Usuarios.aspx.cs" Inherits="_Default" Title="Usuários" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .container-corpo
        {
        	margin-top: 20px;
        	margin-left: 30px;
        }
        .pagina-title 
        {
        	border-bottom:3px solid #DFDFDF;
        	width: 97%;
        	height: 25px;
            margin-bottom:10px;
            padding-bottom:1px;
            margin-bottom: 20px;
        }
        h3
        {
        	color: #C9C9C9;
        	font-family: Verdana, Geneva, Arial, sans-serif; 
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-corpo">
        <div class="pagina-title">
            <h3>Usuários</h3>
        </div>
        <div class="side-menu">
            <asp:Menu ID="Menu1" runat="server" BackColor="#F7F6F3" 
                DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="Medium" 
                ForeColor="#666666" StaticSubMenuIndent="10px">
                <StaticSelectedStyle BackColor="#1C5E55" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
                <DynamicMenuStyle BackColor="#F7F6F3" />
                <DynamicSelectedStyle BackColor="#1C5E55" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticHoverStyle BackColor="#666666" ForeColor="White" />
                <Items>
                    <asp:MenuItem NavigateUrl="~/Home.aspx" Text="Home" Value="Home"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Usuarios.aspx" Text="Usuários" Value="Usuários" 
                        Selectable="False">
                        <asp:MenuItem NavigateUrl="~/Cadastro.aspx" Text="Cadastro" Value="Cadastro">
                        </asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Busca.aspx" Text="Busca" Value="Busca">
                        </asp:MenuItem>
                    </asp:MenuItem>
                </Items>
            </asp:Menu>
        </div>
    </div>
</asp:Content>

