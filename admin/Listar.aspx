<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Listar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lbNome" runat="server" Text="Nome:"></asp:Label>
        <asp:TextBox ID="tbNome" runat="server" Width="431px"></asp:TextBox>
        <br />
        <asp:Label ID="lbUsuario" runat="server" Text="Usuario: "></asp:Label>
        <asp:TextBox ID="tbUsuario" runat="server" ontextchanged="TextBox1_TextChanged"></asp:TextBox>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Senha: "></asp:Label>
        <asp:TextBox ID="tbSenha" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Button ID="bInserir" runat="server" onclick="bInserir_Click" 
            Text="Inserir" />
        <asp:Button ID="bAtualizar" runat="server" onclick="bAtualizar_Click" 
            Text="Listar" />
        <asp:Button ID="bRemover" runat="server" onclick="btRemover_Click" 
            style="height: 26px" Text="Remover" />
        <asp:Button ID="lbPesquisar" runat="server" Text="Pesquisar" 
            onclick="lbPesquisar_Click" />
        <asp:Button ID="btEditar" runat="server" onclick="btEditar_Click" 
            style="height: 26px" Text="Editar" />
        <asp:Button ID="btAtualizar" runat="server" onclick="btAtualizar_Click" 
            Text="Atualizar" Visible="False" />
        <br />
        <br />
        <asp:ListBox ID="ListBoxPessoas" runat="server" Width="367px" onselectedindexchanged="ListBoxPessoas_SelectedIndexChanged" 
            ></asp:ListBox>
        <br />
        <asp:Label ID="lbMensagens" runat="server"></asp:Label>
    
    </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
