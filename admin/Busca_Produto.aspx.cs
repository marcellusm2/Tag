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
    ManutencaoMarca webManutencao = new ManutencaoMarca();

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
            Marca mrc = new Marca();

            String id = e.CommandArgument.ToString();
            List<string> marcas = new List<string>();
            marcas = webManutencao.consultarMarca(id);  
            if (marcas[0] != null)
            {
                HiddenFieldID.Value = marcas[0].ToString();
                TextBoxNomeMarca.Text = marcas[1].ToString();

                Panel1.Visible = true;
            }

        }
        if (e.CommandName == "Excluir")
        {
            string id = e.CommandArgument.ToString();

            string msg = webManutencao.removerMarca(id);
            LabelMsg.Text = msg;
        }
    }

    protected void ButtonConfirmar_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {
            conn.Open();
            
            string marca = TextBoxNomeMarca.Text;
            string id = HiddenFieldID.Value;

            string msg = webManutencao.atualizarMarca(marca, id);
            LabelMsg.Text = msg;

            Panel1.Visible = false;
            SqlCommand select = new SqlCommand("select * from TbMarca", conn);
            Repeater1.DataSource = select.ExecuteReader();
            Repeater1.DataBind();
        }
    }
    protected void btListar_Click(object sender, EventArgs e)
    {
        conn.Open();
        SqlCommand select = new SqlCommand("select * from TbMarca", conn);
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
        SqlCommand select = new SqlCommand("SELECT id, nome_marca FROM TbMarca WHERE (nome_marca like @marca)", conn);
        SqlParameter pMarca = new SqlParameter("marca", tbPesquisaMarca.Text);
        select.Parameters.Add(pMarca);
        Repeater1.DataSource = select.ExecuteReader();
        Repeater1.DataBind();
    }
    
}
