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

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            Session["cont"] = 5;
        }
        else
        {
            Session["cont"] = Convert.ToInt32(Session["cont"]) - 1;
            if (Convert.ToInt32(Session["cont"]) <= 0)
            {                
                PanelLogin.Visible = false;
                PanelBlock.Visible = true;
                lbMsg.Text = "Access Denied!";
                Session["cont"] = 5;
                Session["logado"] = 0;
            }
        }            
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        // Cria conexão do banco
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|DBTag.mdf;Integrated Security=True;User Instance=True");

        // Abre conexão com banco
        con.Open();

        // Cria o comando do banco
        SqlCommand select = new SqlCommand(@"SELECT usuario, senha FROM TbUsuario WHERE usuario = @usuario AND senha = @senha", con);

        // Criar parametros
        SqlParameter pUser = new SqlParameter("@usuario", UserName.Text);
        SqlParameter pPass = new SqlParameter("@senha", Password.Text);

        // Cria uma variável "usuario"
        // na memoria do servidor
        // que é compartilhada por diversas páginas
        Session["usuario"] = UserName.Text;
        // Associa parametros a consulta
        select.Parameters.Add(pUser);
        select.Parameters.Add(pPass);

        // Chamada ao comando
        SqlDataReader dr = select.ExecuteReader();

        if (dr.Read())
        {
            /*Application["user"] = new ArrayList();

            ((ArrayList)Application["user"]).Add(TextBoxUsuario.Text);*/

            Session["logado"] = 1;

            // Redirecionar para a pagina Ola.aspx
            Response.Redirect("Home.aspx");

            
        }
        else
        {
            Session["logado"] = 0;
            lbBlock.Text = "Você ainda tem " + Session["cont"].ToString() + " tentativas.";
        }
        // Fecha conexão com banco
        con.Close();
    }
}
