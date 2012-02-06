<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="_Default, App_Web_vw6i77sp" title="Cadastro Produto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!-- required -->
	<script type="text/javascript" src="js/fancyzoom/jquery.js"></script>
	<!-- optional -->
    <script src="js/fancyzoom/jquery.fancyzoom.min.js" type="text/javascript"></script>
    
	<script type="text/javascript">
	    $(function() {
	        $.fn.fancyzoom.defaultsOptions.imgDir = 'js/fancyzoom/resources/';
			$('img.fancyzoom').fancyzoom();
		});
	</script>
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
        	overflow: hidden;
        	width: 800px;
        	float: left;
        	text-align: left;
        	padding: 10px 10px 10px 10px;
        	background-color: #DFDFDF;
        }
        th
        {
        	width: 100px;
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-corpo">
        <div class="pagina-title">
            <h3>Cadastro de Produto</h3>
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
                        Value="Usuários">
                    </asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Cadastro_Produto.aspx" Text="Produtos" 
                        Value="Produtos" Enabled="False" Selectable="False">
                    </asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Cadastro_Marca.aspx" Text="Marcas" Value="Marcas">
                    </asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Cadastro_Categoria.aspx" Text="Categorias" 
                        Value="Categorias"></asp:MenuItem>
                </Items>
            </asp:Menu>
        </div>
        <div class="container-cadastro">
            &nbsp;<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="ListarProdutos" 
                TypeName="DSTagTableAdapters.TbProdutoTableAdapter" 
                InsertMethod="NovoProduto" UpdateMethod="AlterarProduto" 
                DeleteMethod="DeletarProduto">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id_categoria" Type="Int32" />
                    <asp:Parameter Name="nome_produto" Type="String" />
                    <asp:Parameter Name="des_produto" Type="String" />
                    <asp:Parameter Name="valor_produto" Type="Decimal" />
                    <asp:Parameter Name="imagem_produto" Type="String" />
                    <asp:Parameter Name="id_marca" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="id_categoria" Type="Int32" />
                    <asp:Parameter Name="nome_produto" Type="String" />
                    <asp:Parameter Name="des_produto" Type="String" />
                    <asp:Parameter Name="valor_produto" Type="Decimal" />
                    <asp:Parameter Name="imagem_produto" Type="String" />
                    <asp:Parameter Name="id_marca" Type="Int32" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
                DeleteMethod="Delete" InsertMethod="Insert" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                TypeName="DSTagTableAdapters.TbCategoriaTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="categoria" Type="String" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="categoria" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
                DeleteMethod="Delete" InsertMethod="Insert" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                TypeName="DSTagTableAdapters.TbMarcaTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nome" Type="String" />
                    <asp:Parameter Name="Original_id" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="nome" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" 
                DataSourceID="ObjectDataSource1" DefaultMode="Insert" 
                oniteminserted="frmAdd_ItemInserted" 
                oniteminserting="FormView1_ItemInserting">
                <EditItemTemplate>
                    id:
                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    id_categoria:
                    <asp:TextBox ID="id_categoriaTextBox" runat="server" 
                        Text='<%# Bind("id_categoria") %>' />
                    <br />
                    nome_produto:
                    <asp:TextBox ID="nome_produtoTextBox" runat="server" 
                        Text='<%# Bind("nome_produto") %>' />
                    <br />
                    des_produto:
                    <asp:TextBox ID="des_produtoTextBox" runat="server" 
                        Text='<%# Bind("des_produto") %>' />
                    <br />
                    valor_produto:
                    <asp:TextBox ID="valor_produtoTextBox" runat="server" 
                        Text='<%# Bind("valor_produto") %>' />
                    <br />
                    imagem_produto:
                    <asp:TextBox ID="imagem_produtoTextBox" runat="server" 
                        Text='<%# Bind("imagem_produto") %>' />
                    <br />
                    id_marca:
                    <asp:TextBox ID="id_marcaTextBox" runat="server" 
                        Text='<%# Bind("id_marca") %>' />
                    <br />
                    nome:
                    <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
                    <br />
                    categoria:
                    <asp:TextBox ID="categoriaTextBox" runat="server" 
                        Text='<%# Bind("categoria") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    Nome:
                    <asp:TextBox ID="nome_produtoTextBox" runat="server" 
                        Text='<%# Bind("nome_produto") %>' />
                    <br />
                    Descrição:
                    <asp:TextBox ID="des_produtoTextBox" runat="server" 
                        Text='<%# Bind("des_produto") %>' />
                    <br />
                    Valor:
                    <asp:TextBox ID="valor_produtoTextBox" runat="server" 
                        Text='<%# Bind("valor_produto") %>' />
                    <br />
                    Marca:&nbsp;<asp:DropDownList ID="DropDownList7" runat="server" 
                        DataSourceID="ObjectDataSource3" DataTextField="nome" DataValueField="id" 
                        SelectedValue='<%# Bind("id_marca") %>'>
                    </asp:DropDownList>
                    <br />
                    Categoria:
                    <asp:DropDownList ID="DropDownList8" runat="server" 
                        DataSourceID="ObjectDataSource2" DataTextField="categoria" DataValueField="id" 
                        SelectedValue='<%# Bind("id_categoria") %>'>
                    </asp:DropDownList>
                    <br />
                    Imagem:
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Cadastrar" />
                </InsertItemTemplate>
                <ItemTemplate>
                    id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    id_categoria:
                    <asp:Label ID="id_categoriaLabel" runat="server" 
                        Text='<%# Bind("id_categoria") %>' />
                    <br />
                    nome_produto:
                    <asp:Label ID="nome_produtoLabel" runat="server" 
                        Text='<%# Bind("nome_produto") %>' />
                    <br />
                    des_produto:
                    <asp:Label ID="des_produtoLabel" runat="server" 
                        Text='<%# Bind("des_produto") %>' />
                    <br />
                    valor_produto:
                    <asp:Label ID="valor_produtoLabel" runat="server" 
                        Text='<%# Bind("valor_produto") %>' />
                    <br />
                    imagem_produto:
                    <asp:Label ID="imagem_produtoLabel" runat="server" 
                        Text='<%# Bind("imagem_produto") %>' />
                    <br />
                    id_marca:
                    <asp:Label ID="id_marcaLabel" runat="server" Text='<%# Bind("id_marca") %>' />
                    <br />
                    nome:&nbsp;<asp:Label ID="nomeLabel" runat="server" 
                        Text='<%# Bind("nome") %>' />
                    <br />
                    categoria:
                    <asp:Label ID="categoriaLabel" runat="server" Text='<%# Bind("categoria") %>' />
                    <br />
                </ItemTemplate>
            </asp:FormView>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:GridView ID="GridView1" 
                runat="server" AutoGenerateColumns="False" DataKeyNames="id" 
                DataSourceID="ObjectDataSource1" AllowPaging="True" AllowSorting="True" 
                BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                CellPadding="4" ForeColor="Black" GridLines="Vertical">
                <RowStyle BackColor="#F7F7DE" />
                <Columns>
                    <asp:BoundField DataField="nome_produto" HeaderText="Produto" 
                        SortExpression="nome_produto" />
                    <asp:BoundField DataField="des_produto" HeaderText="Descrição" 
                        SortExpression="des_produto" />
                    <asp:BoundField DataField="valor_produto" HeaderText="Valor" 
                        SortExpression="valor_produto" />
                    <asp:TemplateField HeaderText="Marca" SortExpression="id_marca">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" 
                                DataSourceID="ObjectDataSource3" DataTextField="nome" DataValueField="id" 
                                SelectedValue='<%# Bind("id_marca") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("nome") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Categoria" SortExpression="id_categoria">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList6" runat="server" 
                                DataSourceID="ObjectDataSource2" DataTextField="categoria" DataValueField="id" 
                                SelectedValue='<%# Bind("id_categoria") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("categoria") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="imagem_produto" HeaderText="Caminho Imagem" 
                        SortExpression="imagem_produto" />
                    <asp:ImageField DataImageUrlField="imagem_produto" 
                        DataImageUrlFormatString="Loja/images/{0}" HeaderText="Imagem" 
                        ReadOnly="True" ControlStyle-CssClass="fancyzoom" ControlStyle-Width="70px">
                    </asp:ImageField>
                    <asp:CommandField ButtonType="Image" CancelImageUrl="~/img/icon_cancel.gif" 
                        EditImageUrl="~/img/icon_edit.png" HeaderText="Editar" ShowEditButton="True" 
                        UpdateImageUrl="~/img/icon_update.png" />
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/img/icon_delete.png" 
                        HeaderText="Excluir" ShowDeleteButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" 
                    Width="200px" HorizontalAlign="Center" Wrap="False" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<br />
        </div>
    </div>
</asp:Content>