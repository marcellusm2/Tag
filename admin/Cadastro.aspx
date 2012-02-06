<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cadastro.aspx.cs" Inherits="_Default" Title="Cadastro" %>

<script runat="server">

    protected void bInserir_Click(object sender, EventArgs e)
    {

    }
</script>

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
        .side-menu
        {
        	float: left;
        	margin-right: 100px;
        }
        .container-cadastro 
        {
        	float: left;
        	text-align: right;
        	padding: 10px 10px 10px 10px;
        	background-color: #DFDFDF;
        }
        h3
        {
        	color: #C9C9C9;
        	font-family: Verdana, Geneva, Arial, sans-serif;
            width: 144px;
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-corpo">
        <div class="pagina-title">
            <h3>Cadastro</h3>
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
                    <asp:MenuItem Text="Home" Value="Home" 
                        NavigateUrl="~/Home.aspx"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Usuarios.aspx" Text="Usuários" Value="Usuários">
                        <asp:MenuItem Enabled="False" NavigateUrl="~/Cadastro.aspx" Text="Cadastro" 
                            Value="Cadastro"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Busca.aspx" Text="Busca" Value="Busca">
                        </asp:MenuItem>
                    </asp:MenuItem>
                </Items>
            </asp:Menu>
        </div>
        <div class="container-cadastro">
            <asp:Label ID="lbUsuario" runat="server" Text="Usuario:"></asp:Label>
            &nbsp;<asp:TextBox ID="tbUsuario" runat="server" Width="130px"></asp:TextBox>
            
            <br />
            
            &nbsp;
            
            <asp:Label ID="lbSenha" runat="server" Text="Senha:"></asp:Label>
            &nbsp;<asp:TextBox ID="tbSenha" runat="server" Width="130px" 
                TextMode="Password"></asp:TextBox>
                
            <br />
                
            &nbsp;
                
            <asp:Label ID="lbNome" runat="server" Text="Nome:"></asp:Label>
            &nbsp;<asp:TextBox ID="tbNome" runat="server" Width="130px"></asp:TextBox>
            <br />
            <asp:Label ID="lbEmail" runat="server" Text="E-mail: "></asp:Label>
            <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="bInserir" runat="server" onclick="bInserir_Click" 
                Text="Cadastrar" />        
            <br />
            <asp:Label ID="LabelMsg" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>

