<%@ page language="C#" masterpagefile="~/Loja/MasterPage.master" autoeventwireup="true" inherits="Loja_Default, App_Web_fyhbzwsv" title="Entrar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
		<style type="text/css">
		    #h1-login
		    {
		    	width:100%; 
		    	overflow:hidden; 
		    	margin:0 0 16px;	    
		    	font-size:23px; 
		    	font-weight:normal;
		    }
		    .panel-cadastro
		    {
		    	float: left;
		    	margin-bottom: 30px;
		    }
		    .panel-login
		    {
		    	float: right;
		    }
            h4  
            {
            	margin:0 10px 12px;
            	background:#f1f1f1; 
            	padding:2px 10px; 
            	font-size:13px; 
            	line-height:1.25; 
            }
            td
            {
            	padding-left: 20px;
            }
            .labelMsg
            {
                float: right;
                margin-right: 20px;
            }
            .buttons
            {
            	vertical-align: bottom;
            	float: right;
            	height: 20px;
            	margin-right: 10px;
            	background: url(../img/red_button_bg.gif) no-repeat 25% 50% #333;
	            border: 1px solid #A60000;
	            color: #FFF;
	            padding: 0 5px 0 5px;
	            font-size: 11px;
	            font-weight: bold;
            }
            .buttons:hover
            {
        	    background: url(../img/red_button_bg.gif) no-repeat 25% 50% #333;
	            border: 1px solid #A60000;
	            color: #E0E0E0;
	            padding: 0 5px 0 5px;
	            font-size: 11px;
	            font-weight: bold;
            }
            hr
            {
            	margin-bottom: 5px;
            }            
            #linha-login
            {
            	margin-top: 6px;
            }
		</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        InsertMethod="NovoCliente" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="ListarUsuarios" 
        TypeName="DSTagTableAdapters.TbUsuarioTableAdapter">
        <InsertParameters>
            <asp:Parameter Name="usuario" Type="String" />
            <asp:Parameter Name="senha" Type="String" />
            <asp:Parameter Name="nome" Type="String" />
            <asp:Parameter Name="email" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="ListarUsuarios" 
        TypeName="DSTagTableAdapters.TbUsuarioTableAdapter"></asp:ObjectDataSource>
   
    <asp:Panel ID="PanelGeral" runat="server">   
       <h1 id="h1-login">&nbsp; Entrar ou Criar uma Conta</h1>
       
       <asp:Panel ID="PanelCadastro" CssClass="panel-cadastro" runat="server" Width="450px">        
            
            <h4>Ainda não sou usuário</h4>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ao criar uma conta em nossa loja, você poderá navegar por suas compras<br /> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mais rápido, visualizar e acompanhar as suas encomendas.
            <br />
            <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" 
        DataSourceID="ObjectDataSource1" DefaultMode="Insert" Width="450px">
        <EditItemTemplate>
            id:
            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
            <br />
            usuario:
            <asp:TextBox ID="usuarioTextBox" runat="server" Text='<%# Bind("usuario") %>' />
            <br />
            senha:
            <asp:TextBox ID="senhaTextBox" runat="server" Text='<%# Bind("senha") %>' />
            <br />
            nome:
            <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
            <br />
            email:
            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
            <br />
            id_perfil:
            <asp:TextBox ID="id_perfilTextBox" runat="server" 
                Text='<%# Bind("id_perfil") %>' />
            <br />
            nome_perfil:
            <asp:TextBox ID="nome_perfilTextBox" runat="server" 
                Text='<%# Bind("nome_perfil") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <b>Usuário </b>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ErrorMessage="*" ControlToValidate="usuarioTextBox" ValidationGroup="cadastro">*</asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="usuarioTextBox" runat="server" Text='<%# Bind("usuario") %>' Width="300px" />
            <br />
            <b>Senha</b>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ErrorMessage="*" ControlToValidate="senhaTextBox" ValidationGroup="cadastro">*</asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="senhaTextBox" TextMode="Password" runat="server" Text='<%# Bind("senha") %>' Width="300px" />
            <br />
            <b>Confirmar Senha
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="senhaTextBox" ControlToValidate="TextBox1" ErrorMessage="Senha incorreta" Text="Senha incorreta" Font-Bold="False">* (Senha incorreta)</asp:CompareValidator>
            <br />
            </b>
            <asp:TextBox ID="TextBox1" TextMode="Password" runat="server"  Width="300px" ></asp:TextBox>
            <br />
            <b>Nome
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ErrorMessage="*" ControlToValidate="nomeTextBox" ValidationGroup="cadastro">*</asp:RequiredFieldValidator>
            <br />
            </b>
            <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>'  Width="300px" />
            <br />
            <b>E-mail
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ErrorMessage="*" ControlToValidate="emailTextBox" ValidationGroup="cadastro">*</asp:RequiredFieldValidator>
            <br />
            </b>
            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>'  Width="300px" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Font-Italic="False" ForeColor="Red" 
                Text="*Campo obrigatório" CssClass="labelMsg" Font-Size="8pt"></asp:Label>
            <br />
            <br />
            <hr />
            <asp:Button ID="InsertButton" CssClass="buttons" CausesValidation="true" ValidationGroup="cadastro" CommandName="Insert" runat="server" Text="Criar Conta" />
            
        </InsertItemTemplate>
        <ItemTemplate>
            id:
            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
            <br />
            usuario:
            <asp:Label ID="usuarioLabel" runat="server" Text='<%# Bind("usuario") %>' />
            <br />
            senha:
            <asp:Label ID="senhaLabel" runat="server" Text='<%# Bind("senha") %>' />
            <br />
            nome:
            <asp:Label ID="nomeLabel" runat="server" Text='<%# Bind("nome") %>' />
            <br />
            email:
            <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
            <br />
            id_perfil:
            <asp:Label ID="id_perfilLabel" runat="server" Text='<%# Bind("id_perfil") %>' />
            <br />
            nome_perfil:
            <asp:Label ID="nome_perfilLabel" runat="server" 
                Text='<%# Bind("nome_perfil") %>' />
            <br />
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    </asp:Panel>
        <asp:Panel ID="PanelLogin" CssClass="panel-login" runat="server" Width="450px" 
            Height="400px">
        <h4>Já sou usuário</h4>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;            
            <span style="color: rgb(68, 68, 68); font-family: arial, helvetica, sans-serif; font-size: 12px; line-height: 18px; text-align: left; ">
                Se você possui uma conta, efetue o login.
            </span><br />
            <br />
            <br />
        
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LbUsuario" runat="server" Text="Usuário" Font-Bold="True"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ErrorMessage="*" ControlToValidate="TbUsuario" ValidationGroup="login"></asp:RequiredFieldValidator>
        <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TbUsuario" runat="server" Width="300px" ValidationGroup="login"></asp:TextBox>
        <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LbSenha" runat="server" Text="Senha" Font-Bold="True"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ErrorMessage="*" ControlToValidate="TbSenha" ValidationGroup="login"></asp:RequiredFieldValidator>
        <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TbSenha" runat="server" TextMode="Password" Width="300px" 
                ValidationGroup="login"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="LbMsg" CssClass="labelMsg" runat="server" Text="*Campo obrigatório" 
                ForeColor="Red" Font-Bold="False" Font-Size="8pt"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <hr id="linha-login" />
            <asp:Button ID="BtLogin" CssClass="buttons" runat="server" Text="Login" 
                onclick="BtLogin_Click" ValidationGroup="login" />
            </asp:Panel>
        </asp:Panel>
</asp:Content>