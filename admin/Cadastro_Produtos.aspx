
<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cadastro_Produtos.aspx.cs" Inherits="_Default" Title="Cadastro Produtos" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" Runat="Server">
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
        	text-align: left;
        	padding: 10px 10px 10px 10px;
        	background-color: #DFDFDF;
        }
        h3
        {
        	color: #C9C9C9;
        	font-family: Verdana, Geneva, Arial, sans-serif;
            width: 227px;
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-corpo">
        <div class="pagina-title">
            <h3>Cadastro Produto</h3>
        </div>
        <div class="side-menu">
            <asp:Menu ID="Menu2" runat="server" BackColor="#F7F6F3" 
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
                        <asp:MenuItem Enabled="False" NavigateUrl="~/Cadastro_Produto.aspx" Text="Cadastro Marcas" 
                            Value="Cadastro Marcas"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Busca_Produto.aspx" Text="Busca Marcas" 
                            Value="Busca Marcas">
                        </asp:MenuItem>
                    </asp:MenuItem>
                </Items>
            </asp:Menu>
        </div>
        <div class="container-cadastro">
            <asp:Label ID="lbProduto" runat="server" Text="Produto:"></asp:Label>
            &nbsp;<asp:TextBox ID="TextBoxProduto" runat="server" Width="130px" ></asp:TextBox>
            
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBoxProduto" ErrorMessage="Produto é obrigatório">*Produto é obrigatório</asp:RequiredFieldValidator>
                
            <br />
            <asp:Label ID="lbValor" runat="server" Text="Valor:"></asp:Label>
            &nbsp;<asp:TextBox ID="TextBoxValor" runat="server" Width="130px"></asp:TextBox>
            
            <asp:RangeValidator ID="RangeValidator1" runat="server" 
                ControlToValidate="TextBoxValor" ErrorMessage="*Valor é obrigatório" 
                Type="Integer" MaximumValue="10000" MinimumValue="10">*Valor é obrigatório</asp:RangeValidator>
                <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" onclick="bInserir_Click" 
            Text="Cadastrar" /> 
            <br />
            <asp:Label ID="LabelMsg" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>

