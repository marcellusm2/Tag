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

public partial class _Default : System.Web.UI.Page
{
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
    protected void bInserir_Click(object sender, EventArgs e)
    {
        ManutencaoUsuario webManutencao = new ManutencaoUsuario();
        Usuario user = new Usuario();

        user.nome = tbNome.Text;
        user.usuario = tbUsuario.Text;
        user.senha = tbSenha.Text;
        user.email = tbEmail.Text;

        LabelMsg.Text = webManutencao.inserirUsuario(user);
    }
}