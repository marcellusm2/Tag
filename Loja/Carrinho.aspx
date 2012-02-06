<%@ page language="C#" masterpagefile="~/Loja/MasterPage.master" autoeventwireup="true" inherits="ShoppingCarrinho, App_Web_vwxdilnh" title="Tag Computadores" %>

<%@ Register assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" namespace="System.Web.UI.WebControls" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .grid td, th
        {
        	text-align: center;
        	vertical-align: middle;
        }
        .grid input
        {
        	text-align: center;
        	vertical-align: middle;
        }
        .linkComprar
        {
        	color: #CB0000;
        }
        .linkComprar:hover
        {
        	color: #A60000;
        }
        .btnUpdate
        {
        	background: url(../img/red_button_bg.gif) no-repeat 25% 50% #333;
	        border: 1px solid #A60000;
	        color: #FFF;
	        height: 22px;
	        padding: 0 5px 0 5px;
	        font-size: 11px;
	        font-weight: bold;
        }
        .btnUpdate:hover
        {
        	background: url(../img/red_button_bg.gif) no-repeat 25% 50% #333;
	        border: 1px solid #A60000;
	        color: #E0E0E0;
	        height: 22px;
	        padding: 0 5px 0 5px;
	        font-size: 11px;
	        font-weight: bold;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="CartGrid" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ProductID" OnRowDeleting="CartGrid_RowDeleting"  
        BackColor="White" BorderColor="#DEDFDE" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
        GridLines="Vertical" CssClass="grid">
        <RowStyle BackColor="#F7F7DE" HorizontalAlign="Center" VerticalAlign="Middle" />
    <Columns>
    
    
        <asp:TemplateField HeaderText="Imagem">
            <ItemTemplate>
                <asp:Image ID="Image" runat="server" ImageUrl='<%# Eval("ProductImageUrl") %>' Width="100px" />
            </ItemTemplate>
        </asp:TemplateField>
        
        
        <asp:BoundField DataField="ProductName" HeaderText="Produto" ReadOnly="True" >
        
        
        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        
        
        <asp:TemplateField HeaderText="Quantidade">
            <EditItemTemplate>
                &nbsp;
            </EditItemTemplate>
            <ItemTemplate>
                &nbsp;<asp:TextBox ID="txtQuantity" runat="server" Text='<%# Bind("Quantity") %>' Width="53px"></asp:TextBox><asp:CompareValidator ID="compQuantity" runat="server" ControlToValidate="txtQuantity"
                    Operator="DataTypeCheck" Type="Integer">Número inválido</asp:CompareValidator><br />
                <asp:RequiredFieldValidator ID="reqQtd" runat="server" ControlToValidate="txtQuantity">A quantidade é obrigatório.</asp:RequiredFieldValidator>
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:TemplateField>
        
        
        <asp:BoundField DataField="Price" DataFormatString="{0:c}" 
            HeaderText="Valor" ReadOnly="True" HtmlEncode="False" >
        
        
        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        
        
        <asp:BoundField DataField="Total" DataFormatString="{0:c}" HeaderText="Total"
            ReadOnly="True" HtmlEncode="False" >
        
         <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        
         <asp:CommandField ShowDeleteButton="True" HeaderText="Excluir" ButtonType="Image" 
            DeleteImageUrl="~/img/icon_cancel.gif"  >
        
        
        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:CommandField>
        
        
    </Columns>
        <FooterStyle BackColor="#CCCC99" HorizontalAlign="Center" 
            VerticalAlign="Middle" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Center" 
            VerticalAlign="Middle" />
    <EmptyDataTemplate>
        Não há nada no seu carrinho. Você pode comprar os itens da loja.<br />
        <a href="vitrine.aspx" class="linkComprar"><b>COMPRAR PRODUTOS</b></a>
    </EmptyDataTemplate>
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" 
            HorizontalAlign="Center" VerticalAlign="Middle" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" 
            HorizontalAlign="Center" VerticalAlign="Middle" />
        <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" 
            VerticalAlign="Middle" />
</asp:GridView>
    
    <asp:Label ID="TotalLabel" runat="server"></asp:Label>
    <br /><br />
    <asp:Button ID="btnUpdateTotals" CssClass="btnUpdate" runat="server" OnClick="btnUpdateTotals_Click" Text="Atualizar Total" /><br />    

</asp:Content>

