using System;

using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for Usuario
/// </summary>
public class Usuario
{
    public string nome;
    public int id;
    public string senha;
    public string usuario;
    public string email;
	public Usuario()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}
