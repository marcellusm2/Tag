<%@ Page Language="C#" MasterPageFile="~/Loja/MasterPage.master" AutoEventWireup="true" CodeFile="vitrine.aspx.cs" Inherits="vitrine" Title="Tag Computadores" %>

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
        	margin-right: 31px;
            width: 186px;
        }
        .tableProduto th
        {
        	height:20px;
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
        #tbMarcas 
        {
    	    border-collapse:collapse;
    	    border: 1px solid black;
    	    font-family:arial,verdana,helvetica,sans-serif;
            width: 190px;
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
    <script type="text/javascript">
        $(document).ready(function() {
            $('.btHide').click(function() {
                $('.side-marcas').toggle();
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <!-- Begin Corpo -->
    <div class="container-corpo">
        <div class="side-marcas">
            <asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate><table id="tbMarcas"><tr><th>Marcas</th></tr></HeaderTemplate>
                <FooterTemplate></table></FooterTemplate>
                <ItemTemplate>
                    <tr>
                        <td align="center"><%# Eval("nome_marca") %></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>    
        </div>
        <div class="produtos">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" 
                GridLines="Vertical" AllowPaging="True" Width="700px" CssClass="tableProduto">
                <RowStyle BackColor="#F7F7DE" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="Comprar" />
                    <asp:BoundField DataField="nome_produto" HeaderText="Produto" 
                        SortExpression="nome_produto" />
                    <asp:BoundField DataField="valor_produto" HeaderText="Valor" 
                        SortExpression="valor_produto" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#A40000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
                
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
            SelectCommand="SELECT [nome_produto], [valor_produto] FROM [TbProduto]">
            </asp:SqlDataSource>
            
        </div>
        <input type="button" value="Show/Hide" class="btHide" />
    </div>
    <!-- End Corpo -->

</asp:Content>

