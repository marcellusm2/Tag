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

public partial class _Default : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename='|DataDirectory|DBTag.mdf';Integrated Security=True;User Instance=True");
    ManutencaoUsuario webManutencao = new ManutencaoUsuario();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["logado"]) != 1)
        {
            Response.Redirect("Login.aspx");
        }
        if (Application["mensagem"] == null)
        {
            Application["mensagem"] = new ArrayList();
        }
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Editar")
        {
            Usuario user = new Usuario();

            String id = e.CommandArgument.ToString();
            List<string> usuarios = new List<string>();
            usuarios = webManutencao.consultarUsuario(id);
            if (usuarios[0] != null)
            {
                HiddenFieldID.Value = usuarios[0].ToString();
                TextBoxNome.Text = usuarios[1].ToString();
                TextBoxEmail.Text = usuarios[2].ToString();
                TextBoxUsuario.Text = usuarios[3].ToString();
                TextBoxSenha.Text = usuarios[4].ToString();

                Panel1.Visible = true;
            }

        }
        if (e.CommandName == "Excluir")
        {
            Usuario user = new Usuario();

            String id = e.CommandArgument.ToString();

            if (id == "1")
            {
                LabelMsg.Text = "Não é possível deletar o Administrador.";
            }
            else
            {
                string msg = webManutencao.removerUsuario(id);
                LabelMsg.Text = msg;
            }
        }
    }

    protected void ButtonConfirmar_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {
            conn.Open();
            
            string nome = TextBoxNome.Text;
            string email = TextBoxEmail.Text;
            string usuario = TextBoxUsuario.Text;
            string senha = TextBoxSenha.Text;
            string id = HiddenFieldID.Value;

            string msg = webManutencao.atualizarUsuario(nome, email, usuario, senha, id);
            LabelMsg.Text = msg;

            Panel1.Visible = false;
            SqlCommand select = new SqlCommand("select * from TbUsuario", conn);
            Repeater1.DataSource = select.ExecuteReader();
            Repeater1.DataBind();
        }
    }
    protected void btListar_Click(object sender, EventArgs e)
    {
        conn.Open();
        SqlCommand select = new SqlCommand("select * from TbUsuario", conn);
        Repeater1.DataSource = select.ExecuteReader();
        Repeater1.DataBind();
    }
    protected void btPesquisar_Click(object sender, EventArgs e)
    {
        PanelPesquisa.Visible = true;
    }
    protected void btBusca_Click(object sender, EventArgs e)
    {
        conn.Open();
        SqlCommand select = new SqlCommand("SELECT id, nome, usuario, senha, email FROM TbUsuario WHERE (nome like @nome)", conn);
        SqlParameter pNome = new SqlParameter("nome", tbPesquisaNome.Text);
        select.Parameters.Add(pNome);
        Repeater1.DataSource = select.ExecuteReader();
        Repeater1.DataBind();
    }
    
}
