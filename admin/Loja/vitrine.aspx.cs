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

public partial class vitrine : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename='|DataDirectory|DBTag.mdf';Integrated Security=True;User Instance=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
        SqlCommand select = new SqlCommand("select * from TbMarca", conn);
        Repeater1.DataSource = select.ExecuteReader();
        Repeater1.DataBind();
    }
}
