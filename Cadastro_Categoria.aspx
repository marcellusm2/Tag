<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="_Default, App_Web_87cwg-dg" title="Cadastro Categoria" %>

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
            width: 279px;
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-corpo">
        <div class="pagina-title">
            <h3>Cadastro de Categoria</h3>
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
                        Value="Produtos">
                    </asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Cadastro_Marca.aspx" Text="Marcas" Value="Marcas">
                    </asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Cadastro_Categoria.aspx" Text="Categorias" 
                        Value="Categorias" Enabled="False" Selectable="False"></asp:MenuItem>
                </Items>
            </asp:Menu>
        </div>
        <div class="container-cadastro">
            
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                DeleteMethod="Delete" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                TypeName="DSTagTableAdapters.TbCategoriaTableAdapter" 
                InsertMethod="Insert" UpdateMethod="Update">
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
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" 
                DataSourceID="ObjectDataSource1" DefaultMode="Insert" Width="486px">
                <EditItemTemplate>
                    id:
                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
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
                    Categoria:
                    <asp:TextBox ID="categoriaTextBox" runat="server" 
                        Text='<%# Bind("categoria") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="categoriaTextBox" ErrorMessage="*Campo obrigatório">*</asp:RequiredFieldValidator>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Cadastrar" />
                    &nbsp;
                </InsertItemTemplate>
                <ItemTemplate>
                    id:
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    <br />
                    categoria:
                    <asp:Label ID="categoriaLabel" runat="server" Text='<%# Bind("categoria") %>' />
                    <br />
                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete" />
                </ItemTemplate>
            </asp:FormView>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                DataKeyNames="id" DataSourceID="ObjectDataSource1" ForeColor="Black" 
                GridLines="Vertical" Width="480px">
                <RowStyle BackColor="#F7F7DE" />
                <Columns>
                    <asp:BoundField DataField="categoria" HeaderText="Categoria" 
                        SortExpression="categoria" />
                    <asp:CommandField ButtonType="Image" CancelImageUrl="~/img/icon_cancel.gif" 
                        EditImageUrl="~/img/icon_edit.png" HeaderText="Editar" ShowEditButton="True" 
                        UpdateImageUrl="~/img/icon_update.png" />
                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/img/icon_delete.png" 
                        HeaderText="Excluir" ShowDeleteButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            
        </div>
    </div>
</asp:Content>

