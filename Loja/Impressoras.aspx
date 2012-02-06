<%@ page language="C#" debug="true" masterpagefile="~/Loja/MasterPage.master" autoeventwireup="true" inherits="vitrine, App_Web_p-lxgyr2" title="Tag Computadores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        
        .container-corpo 
        {
        	margin-right: 10px;
        	margin-left: 10px;
            margin-bottom: 20px !important;
        }
        .side-marcas
        {
        	float: left;
            width: 170px;
        }
        .tableProduto 
        {
            width: 150px;
        }
        .tableProduto th
        {        	
        	height: 20px;
            background-image: url(../img/admin-gvw-bg.gif);
            background-position: center;
            color:#ffffff;
            font-family:arial;
            text-align: center;
        }
        .tableProduto td, th
        {
        	text-align: center;
        }
        .produtos
        {
        	float: right;
        }
        #tbCategoria 
        {
    	    border-collapse:collapse;
    	    border: 1px solid black;
    	    font-family:arial,verdana,helvetica,sans-serif;
            width: 150px;
        }
        #tbCategoria td
        {
    	    padding:1;
    	    padding-left: 5px;
    	    border: 1px solid #DEDFDE;
    	    background-color: #F5F3F2;
        }
        #tbCategoria th  
        {
        	
    	    height:20px;
    	    border: 1px solid #DEDFDE;
    	    background-image: url(../img/admin-gvw-bg.gif);
    	    background-position: center;
    	    color:#ffffff;
            font-family:arial;
            text-align: center;
        }
        #tbMarcas 
        {
    	    border-collapse:collapse;
    	    border: 1px solid black;
    	    font-family:arial,verdana,helvetica,sans-serif;
            width: 150px;
        }
        #tbMarcas td
        {
    	    padding:1;
    	    padding-left: 5px;
    	    border: 1px solid #DEDFDE;
    	    background-color: #F5F3F2;
        }
        #tbMarcas th  
        {
        	
    	    height:20px;
    	    border: 1px solid #DEDFDE;
    	    background-image: url(../img/admin-gvw-bg.gif);
    	    background-position: center;
    	    color:#ffffff;
            font-family:arial;
            text-align: center;
        }
    </style>
    <script type="text/javascript" src="js/jquery.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <!-- Begin Corpo -->
    <div class="container-corpo">
        <div class="side-marcas">
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
            <table id="tbCategoria">
                    <tr>
                        <th>Categorias</th> 
                    </tr>                   
                     
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource2">
            <ItemTemplate>
                      <tr>             
                        <td><a href='<%# Eval("categoria") %>.aspx?idCategoria=<%# Eval("id") %>'> <%# Eval("categoria") %> </a></td>
                    </tr>
                
            </ItemTemplate>            
            </asp:Repeater>
            
                </table>
            <br />
            <table id="tbMarcas">
                <tr>
                    <th>Marcas</th>
                </tr>
            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="ObjectDataSource3">
            <ItemTemplate>
                
                    <tr>
                        <td><%# Eval("nome") %></td>
                    </tr>
                
            </ItemTemplate>
            </asp:Repeater>
            </table>
        </div>
        <div class="produtos">
            
        
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="ListarPorCategoria"
        TypeName="DSTagTableAdapters.TbProdutoTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="idCategoria" QueryStringField="idCategoria" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
        
        <asp:DataList ID="DataList1" runat="server" DataKeyField="id" 
            DataSourceID="ObjectDataSource1" RepeatColumns="4" 
                RepeatDirection="Horizontal">
            <ItemTemplate>
                <table class="tableProduto" cellpadding="3" cellspacing="2" >
                <tr>
                    <td>
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl= '<%# Eval("imagem_produto", "images\\thumb\\{0}") %>' PostBackUrl='<%# Eval("id","LojaItem.aspx?idProduto={0}") %>' /></td>
                </tr>
                <tr>
                    <td>
            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("nome_produto") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td>
            <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("valor_produto", "{0:C}") %>'></asp:Label></td>
                </tr>
            </table>
            </ItemTemplate>
        </asp:DataList>
        <br />
        </div>
    </div>
    <!-- End Corpo -->

</asp:Content>

