<%@ page language="C#" masterpagefile="~/Loja/MasterPage.master" autoeventwireup="true" inherits="LojaItem, App_Web_vwxdilnh" title="Tag Computadores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!-- required -->
	<script type="text/javascript" src="../js/fancyzoom/jquery.js"></script>
	<!-- optional -->
    <script src="../js/fancyzoom/jquery.fancyzoom.min.js" type="text/javascript"></script>
    
	<script type="text/javascript">
	    $(function() {
	        $.fn.fancyzoom.defaultsOptions.imgDir = '../js/fancyzoom/resources/';
			$('img.fancyzoom').fancyzoom();
		});
	</script>
    <style type="text/css">
        .btAdd
        {
        	background: url(../img/red_button_bg.gif) no-repeat 25% 50% #333;
	        border: 1px solid #A60000;
	        color: #FFF;
	        height: 22px;
	        padding: 0 5px 0 5px;
	        font-size: 11px;
	        font-weight: bold;
        }
        .btAdd:hover
        {
        	background: url(../img/red_button_bg.gif) no-repeat 25% 50% #333;
	        border: 1px solid #A60000;
	        color: #E0E0E0;
	        height: 22px;
	        padding: 0 5px 0 5px;
	        font-size: 11px;
	        font-weight: bold;
        }
        .valor
        {
        	color: #CE0001;
        	font-weight: bold;
        	font-size: large;
        }
        #tdImg 
        {
        	padding-right: 50px;
        }
        #btVoltar
        {
        	text-decoration: none;
        }
        #btVoltar:hover
        {
        	color: #CE0001;
        }
        #btVoltar img
        {
        	margin-top: -2px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="dsItem">
        <ItemTemplate>
            <table>
            <tr>
                <th colspan="2">
                    <asp:Label ID="lblCategoryId" runat="server" Text='<%# Eval("id_categoria") %>' Visible="false" ></asp:Label>
                    <asp:Label ID="Category" runat="server" Text='<%# Eval("categoria") %>' Font-Bold="True"></asp:Label><br /><br />
                </th>
            </tr>
            <tr>
            <td  rowspan="5" id="tdImg">
                <asp:Image ID="Image" runat="server" CssClass="fancyzoom" ImageUrl='<%# Eval("imagem_produto", "images\\{0}") %>'
                PostBackUrl='<%# Eval("id","LojaItem.aspx?id={0}") %>' AlternateText='<%# Eval("nome_produto") %>' Width="200px" /><br />
            </td>
            </tr>
            <tr>
            <td>            
                <asp:Label ID="Title" runat="server" Text='<%# Eval("nome_produto") %>' Font-Bold="True"></asp:Label><br />
            </td>
            </tr>
            <tr>
            <td>
                <asp:Label ID="PriceVisible" runat="server" Text='<%# Eval("valor_produto", "{0:C}") %>' CssClass="valor"></asp:Label><br />
                <asp:Label ID="Price" runat="server" Text='<%# Eval("valor_produto") %>' Visible="False"></asp:Label><br />
                Descrição: <br />
            </td>
            </tr>
            <tr>
            <td>
            <asp:Label ID="Description" runat="server" Text='<%# Eval("des_produto") %>'></asp:Label>
            <br />            
            <asp:Label ID="lblImage" runat="server" Text='<%# Eval("imagem_produto", "images\\{0}") %>'
                Visible="False"></asp:Label>
                </td>
                </tr>
                <tr>
                <td>
                <br /><br />
                <asp:Button ID="btnAddToCart" runat="server" Text="Adicionar ao Carrinho" CssClass="btAdd" OnClick="btnAddToCart_Click" /><br />
                </td>
                </tr>
                </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:ObjectDataSource ID="dsItem" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="RetornaUmProduto"
        TypeName="DSTagTableAdapters.TbProdutoTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="idProduto" QueryStringField="idProduto" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
   <a href="javascript: history.go(-1)" id="btVoltar" ><img src="../img/btBack.png" width="20px" />Voltar</a>
</asp:Content>

