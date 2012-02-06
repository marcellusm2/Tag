using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Collections.Generic;

public partial class Listar : System.Web.UI.Page
{
    public string nomeedit;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            ListBoxPessoas.Items.Clear();
            SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename='|DataDirectory|DBTag.mdf';Integrated Security=True;User Instance=True");
            // Abre a conexão
            conn.Open();
            // Cria o comando associado à conexão
            SqlCommand select = new SqlCommand("SELECT * from TbUsuario", conn);
            // Lê, linha a linha a tabela
            SqlDataReader dr = select.ExecuteReader();
            while (dr.Read())
            {
                ListBoxPessoas.Items.Add(dr["nome"].ToString());
                //ListBoxPessoas.Items.Add(dr["nome"].ToString());
            }
            // Fecha a conexão
            conn.Close();
        }
    }
    protected void bInserir_Click(object sender, EventArgs e)
    {
        ManutencaoUsuario webManutencao = new ManutencaoUsuario();
        Usuario user = new Usuario();

        user.nome = tbNome.Text;
        user.usuario = tbUsuario.Text;
        user.senha = tbSenha.Text;

        lbMensagens.Text = webManutencao.inserirUsuario(user);

        ListBoxPessoas.Items.Clear();                
        List<string> a = webManutencao.atulizarUsuario();
        for (int i = 0; i < a.Count; i++)
        {
            ListBoxPessoas.Items.Add(a.ElementAt(i));
        }
    }
    protected void bAtualizar_Click(object sender, EventArgs e)
    {
        ListBoxPessoas.Items.Clear();
        SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename='|DataDirectory|DBTag.mdf';Integrated Security=True;User Instance=True");
        // Abre a conexão
        conn.Open();
        // Cria o comando associado à conexão
        ManutencaoUsuario webManutencao = new ManutencaoUsuario();
        Usuario user = new Usuario();

        List<string> a = webManutencao.atulizarUsuario();
        for (int i = 0; i < a.Count; i++)
        {
            ListBoxPessoas.Items.Add(a.ElementAt(i));
        }
        conn.Close();    

    }

    protected void btRemover_Click(object sender, EventArgs e)
    {
        ManutencaoUsuario webManutencao = new ManutencaoUsuario();
        Usuario user = new Usuario();

        String nome = ListBoxPessoas.SelectedValue.ToString();

        lbMensagens.Text = webManutencao.removerUsuario(nome);

        ListBoxPessoas.Items.Clear();
        List<string> a = webManutencao.atulizarUsuario();
        for (int i = 0; i < a.Count; i++)
        {
            ListBoxPessoas.Items.Add(a.ElementAt(i));
        }

    }
    protected void lbPesquisar_Click(object sender, EventArgs e)
    {
        ListBoxPessoas.Items.Clear();
        ManutencaoUsuario webManutencao = new ManutencaoUsuario();
        Usuario user = new Usuario();
        string pesquisa = tbNome.Text;

        ListBoxPessoas.Items.Clear();
        List<string> a = webManutencao.pesquisarUsuario(pesquisa);
        for (int i = 0; i < a.Count; i++)
        {
            ListBoxPessoas.Items.Add(a.ElementAt(i));
        }
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
       
    }
    protected void ListBoxPessoas_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void btEditar_Click(object sender, EventArgs e)
    {
        ManutencaoUsuario webManutencao = new ManutencaoUsuario();
        Usuario user = new Usuario();

        String nome = ListBoxPessoas.SelectedValue.ToString();

        SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename='|DataDirectory|DBTag.mdf';Integrated Security=True;User Instance=True");
        conn.Open();

        SqlCommand select = new SqlCommand("SELECT top 1 id, nome, usuario, senha FROM TbUsuario WHERE (nome = @a)", conn);

        
        try
        {
            SqlParameter pa = new SqlParameter("a", nome);

            select.Parameters.Add(pa);
            SqlDataReader dr = select.ExecuteReader();

            while (dr.Read())
            {
                nomeedit = (dr["nome"].ToString());
                tbNome.Text = (dr["nome"].ToString());
                tbUsuario.Text = (dr["usuario"].ToString());
                tbSenha.Text = (dr["senha"].ToString());

                btAtualizar.Visible = true;
               
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.ToString(), ex);
        }
    }
    protected void btAtualizar_Click(object sender, EventArgs e)
    {

        SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename='|DataDirectory|DBTag.mdf';Integrated Security=True;User Instance=True");
        try
        {
            ManutencaoUsuario webManutencao = new ManutencaoUsuario();
                      
            // Abre a conexão
            conn.Open();

            SqlCommand insert = new SqlCommand("select top 1 id TbUsuario where nome = @Nome and usuario = @Usuario", conn);

            // Cria o parâmetro associado ao Nome
            SqlParameter pNome = new SqlParameter("nome", nomeedit);
           
            // Associa os parâmetros à consulta        
            insert.Parameters.Add(pNome);
            
            int aux;
            SqlDataReader dr = insert.ExecuteReader();
            while (dr.Read())
            {
                aux = (Convert.ToInt32(dr["id"]));
                lbMensagens.Text = webManutencao.carregaUsuario(aux);
            }            
        }
        catch (Exception ex)
        {
            throw new Exception(ex.ToString(), ex);

        }
        finally
        {
            conn.Close();
        }

        ListBoxPessoas.Items.Clear();
        SqlCommand select = new SqlCommand("SELECT * from TbUsuario", conn);
        SqlDataReader dr2 = select.ExecuteReader();
        while (dr2.Read())
        {
            ListBoxPessoas.Items.Add(dr2["nome"].ToString());
        }
        conn.Close();
        
    }
}
