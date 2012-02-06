<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Busca_Produto.aspx.cs" Inherits="_Default" Title="Busca Produto" %>

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
    .tbDados 
    {
    	border-collapse:collapse;
    	border: 1px solid black;
    	font-family:arial,verdana,helvetica,sans-serif;
        width: 700px;
    }
    .tbDados td
    {
    	padding:1;
    	border: 1px solid black;
    }
    .tbDados th  
    {
    	height:20px;
    	border: 1px solid #808080;
    	background-image: url(img/admin-gvw-bg.gif);
    	background-position: center;
    	color:#ffffff;
        font-family:arial;
        text-align: center;
    }
    .container-conteudo 
        {
        	float: left;
        	text-align: left;
        	padding: 10px 10px 10px 10px;
        	background-color: #DFDFDF;
        }
    .container-painel
    {
    	float: left;
	    padding: 10px 10px 10px 10px;
	    background-color: #DFDFDF;
	    text-align: center;
    }
    h3
        {
        	color: #C9C9C9;
        	font-family: Verdana, Geneva, Arial, sans-serif;
            width: 167px;
            height: 25px;
        }
        h2
        {
        	font-family: Verdana, Geneva, Arial, sans-serif;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-corpo">
        <div class="pagina-title">
            <h3>Busca Produto</h3>
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
                    <asp:MenuItem NavigateUrl="~/Produtos.aspx" Text="Marcas" Value="Marcas">
                        <asp:MenuItem NavigateUrl="~/Cadastro_Produto.aspx" Text="Cadastro Marca" 
                            Value="Cadastro Marca"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Busca_Produto.aspx" Text="Busca Marca" Value="Busca Marca" 
                            Enabled="False">
                        </asp:MenuItem>
                    </asp:MenuItem>
                </Items>
            </asp:Menu>
        </div>
        <div class="container-conteudo">
        <asp:Button ID="btListar" runat="server" Text="Listar" onclick="btListar_Click" />
        <asp:Button ID="btPesquisar" runat="server" Text="Pesquisar" 
                onclick="btPesquisar_Click" />
            <br />
            <br />
            <asp:Panel ID="PanelPesquisa" runat="server" Visible="False">
            <asp:Label ID="lbPesquisaMarca" runat="server" Text="Marca: "></asp:Label>
            <asp:TextBox ID="tbPesquisaMarca" runat="server" Width="500px"></asp:TextBox>
            <asp:Button ID="btBusca" runat="server" Text="Buscar" onclick="btBusca_Click"/>
            </asp:Panel>
            <br />
        <asp:Repeater ID="Repeater1" runat="server" 
            onitemcommand="Repeater1_ItemCommand">
            <HeaderTemplate><table class="tbDados"><tr><th>Nº</th><th>Marca</th><th colspan="2">Ação</th></tr></HeaderTemplate>
            <FooterTemplate></table></FooterTemplate>
            <ItemTemplate>
                <tr>
                    <td align="center"><%# Eval("id") %></td>
                    <td align="center"><%# Eval("nome_marca") %></td>
                    <td align="center">
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Editar" CommandArgument='<%# Eval("id") %>'>Editar</asp:LinkButton>
                    </td>
                    <td align="center">
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Excluir" CommandArgument='<%# Eval("id") %>'>Excluir</asp:LinkButton>
                   </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
            <asp:Label ID="LabelMsg" runat="server"></asp:Label>
        <br />
        <asp:Panel ID="Panel1" runat="server" Visible="False">
        <div class="container-painel">            
            <asp:HiddenField ID="HiddenFieldID" runat="server" />
            <h2>Atualizar</h2>
            <br />
            <asp:Label ID="LabelNomeMarca" runat="server" Text="Marca:" 
                AssociatedControlID="TextBoxNomeMarca"></asp:Label>
            &nbsp;&nbsp;
            <asp:TextBox ID="TextBoxNomeMarca" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBoxNomeMarca" ErrorMessage="Marca é obrigatória">*Marca é obrigatória</asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="ButtonConfirmar" runat="server" onclick="ButtonConfirmar_Click" 
                Text="Confirmar" />
                </div>
        </asp:Panel>
        <br />
        <br />
        </div>
    </div>
</asp:Content>

