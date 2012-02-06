<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="_Default, App_Web_xbqxofiq" title="Cadastro Usuário" %>

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
        	padding: 10px 10px 10px 10px;
        	background-color: #DFDFDF;
        }
        h3
        {
        	color: #C9C9C9;
        	font-family: Verdana, Geneva, Arial, sans-serif;
            width: 260px;
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-corpo">
        <div class="pagina-title">
            <h3>Cadastro de Usuário</h3>
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
                    <asp:MenuItem NavigateUrl="~/Cadastro_Usuario.aspx" Text="Usuários" 
                        Value="Usuários" Selectable="False" Enabled="False">
                    </asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Cadastro_Produto.aspx" Text="Produtos" 
                        Value="Produtos">
                    </asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Cadastro_Marca.aspx" Text="Marcas" Value="Marcas">
                    </asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Cadastro_Categoria.aspx" Text="Categorias" 
                        Value="Categorias"></asp:MenuItem>
                </Items>
            </asp:Menu>
        </div>
        <div class="container-cadastro">
            <asp:ObjectDataSource ID="ODSQLUsuario" runat="server" 
                DeleteMethod="DeletarUsuario" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="ListarUsuarios" 
                TypeName="DSTagTableAdapters.TbUsuarioTableAdapter" InsertMethod="NovoUsuario" 
                UpdateMethod="AlterarUsuario">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="usuario" Type="String" />
                    <asp:Parameter Name="senha" Type="String" />
                    <asp:Parameter Name="nome" Type="String" />
                    <asp:Parameter Name="id_perfil" Type="Int32" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="usuario" Type="String" />
                    <asp:Parameter Name="senha" Type="String" />
                    <asp:Parameter Name="nome" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="id_perfil" Type="Int32" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ODSQLPerfil" runat="server" 
                DeleteMethod="Delete" InsertMethod="Insert" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                TypeName="DSTagTableAdapters.TbPerfilTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nome_perfil" Type="String" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="nome_perfil" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ODSOracleUsuario" runat="server" 
                DeleteMethod="Delete" InsertMethod="Insert" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                TypeName="DSOracleTagTableAdapters.TBUSUARIOTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_ID" Type="Decimal" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="USUARIO" Type="String" />
                    <asp:Parameter Name="SENHA" Type="String" />
                    <asp:Parameter Name="NOME" Type="String" />
                    <asp:Parameter Name="EMAIL" Type="String" />
                    <asp:Parameter Name="ID_PERFIL" Type="Decimal" />
                    <asp:Parameter Name="Original_ID" Type="Decimal" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Decimal" />
                    <asp:Parameter Name="USUARIO" Type="String" />
                    <asp:Parameter Name="SENHA" Type="String" />
                    <asp:Parameter Name="NOME" Type="String" />
                    <asp:Parameter Name="EMAIL" Type="String" />
                    <asp:Parameter Name="ID_PERFIL" Type="Decimal" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ODSOraclePerfil" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetData" TypeName="DSOracleTagTableAdapters.TBPERFILTableAdapter" 
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_ID" Type="Decimal" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="NOME_PERFIL" Type="String" />
                    <asp:Parameter Name="Original_ID" Type="Decimal" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Decimal" />
                    <asp:Parameter Name="NOME_PERFIL" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" 
                DataSourceID="ODSOracleUsuario" DefaultMode="Insert" Width="448px">
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
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    Login:
                    <asp:TextBox ID="usuarioTextBox" runat="server" Text='<%# Bind("usuario") %>' />
                    <br />
                    Senha:
                    <asp:TextBox ID="senhaTextBox" runat="server" TextMode="Password" Text='<%# Bind("senha") %>' />
                    <br />
                    Confirmar Senha:
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="senhaTextBox" ControlToValidate="TextBox1" ErrorMessage="*">*</asp:CompareValidator>
                    <br />
                    Nome:
                    <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
                    <br />
                    Email:
                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    <br />
                    Perfil:
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="ODSOraclePerfil" DataTextField="NOME_PERFIL" 
                        DataValueField="ID" SelectedValue='<%# Bind("id_perfil") %>'>
                    </asp:DropDownList>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Cadastrar" />
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
                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete" />
                </ItemTemplate>
            </asp:FormView>
            <br />
            &nbsp;&nbsp;<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                DataKeyNames="id" DataSourceID="ODSQLUsuario" ForeColor="Black" 
                GridLines="Vertical">
                <RowStyle BackColor="#F7F7DE" />
                <Columns>
                    <asp:BoundField DataField="usuario" HeaderText="Login" 
                        SortExpression="usuario" />
                    <asp:BoundField DataField="senha" HeaderText="Senha" 
                        SortExpression="senha" />
                    <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                    <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                    <asp:TemplateField HeaderText="Perfil" SortExpression="id_perfil">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" 
                                DataSourceID="ODSQLPerfil" DataTextField="nome_perfil" 
                                DataValueField="id" SelectedValue='<%# Bind("id_perfil") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("nome_perfil") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Image" CancelImageUrl="~/img/icon_cancel.gif" 
                        DeleteImageUrl="~/img/icon_delete.png" EditImageUrl="~/img/icon_edit.png" 
                        ShowDeleteButton="True" ShowEditButton="True" 
                        UpdateImageUrl="~/img/icon_update.png" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" 
                    Width="50px" Wrap="True" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<br />
        </div>
    </div>
</asp:Content>

