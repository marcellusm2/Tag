using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Collections.Generic;

/// <summary>
/// Summary description for ManutencaoUsuario
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class ManutencaoUsuario : System.Web.Services.WebService
{

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }
    [WebMethod]
    public List<string> pesquisarUsuario(string nome)
    {
        List<string> usuarios = new List<string>();
        SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename='|DataDirectory|DBTag.mdf';Integrated Security=True;User Instance=True");
        SqlCommand select = new SqlCommand("SELECT id, nome, usuario, senha, email FROM TbUsuario WHERE (nome = @nome)", conn);

        conn.Open();

        try
        {
            SqlParameter pNome = new SqlParameter("nome", nome);

            select.Parameters.Add(pNome);
            SqlDataReader dr = select.ExecuteReader();

            while (dr.Read())
            {
                usuarios.Add(dr["nome"].ToString());
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.ToString(), ex);
        }

        conn.Close();

        return usuarios;
    }
    [WebMethod]
    public List<string> consultarUsuario(string id)
    {
        List<string> usuarios = new List<string>();
        SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename='|DataDirectory|DBTag.mdf';Integrated Security=True;User Instance=True");
        // Abre a conexão
        conn.Open();
        try
        {
            SqlCommand select = new SqlCommand("SELECT * from TbUsuario where id=@id", conn);
            SqlParameter pID = new SqlParameter("id", id);
            select.Parameters.Add(pID);
            // Lê, linha a linha a tabela
            SqlDataReader dr = select.ExecuteReader();
            while (dr.Read())
            {
                usuarios.Add(dr["id"].ToString());
                usuarios.Add(dr["nome"].ToString());
                usuarios.Add(dr["email"].ToString());
                usuarios.Add(dr["usuario"].ToString());
                usuarios.Add(dr["senha"].ToString());
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.ToString(), ex);
        }

        return usuarios;
    }

    [WebMethod]
    public string inserirUsuario(Usuario user)
    {
        SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename='|DataDirectory|DBTag.mdf';Integrated Security=True;User Instance=True");
        try
        {
            // Abre a conexão
            conn.Open();

            SqlCommand insert = new SqlCommand("insert into TbUsuario (nome, usuario, senha, email) values (@nome, @usuario, @senha, @email)", conn);

            // Cria o parâmetro associado ao Nome
            SqlParameter pNome = new SqlParameter("nome", user.nome.ToString());
            SqlParameter pUsuario = new SqlParameter("usuario", user.usuario.ToString());
            SqlParameter pSenha = new SqlParameter("senha", user.senha.ToString());
            SqlParameter pEmail = new SqlParameter("email", user.email.ToString());

            // Associa os parâmetros à consulta        
            insert.Parameters.Add(pNome);
            insert.Parameters.Add(pUsuario);
            insert.Parameters.Add(pSenha);
            insert.Parameters.Add(pEmail);

            // Executa a consulta e obtém o número de registros
            int numRegs = insert.ExecuteNonQuery();

            // Teste de erro
            if (numRegs == 1)
                return "Inserido com sucesso!";
            else
                return "Erro na execução da consulta";
        }
        catch (Exception ex)
        {
            return ex.ToString();
            throw new Exception(ex.ToString(), ex);

        }
        finally
        {
            conn.Close();
        }
    }

    [WebMethod]
    public string removerUsuario(string id)
    {
        SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename='|DataDirectory|DBTag.mdf';Integrated Security=True;User Instance=True");

        conn.Open();

        try
        {
            SqlCommand insert = new SqlCommand("delete from TbUsuario where id = @id", conn);

            SqlParameter pId = new SqlParameter("id", id);

            insert.Parameters.Add(pId);

            int numRegs = insert.ExecuteNonQuery();

            if (numRegs == 1)
                return "Removido com sucesso!";
            else
                return "Erro na execução da consulta";
        }
        catch (Exception ex)
        {
            return ex.ToString();
            throw new Exception(ex.ToString(), ex);
        }
        finally
        {
            conn.Close();
        }
    }

    [WebMethod]
    public String atualizarUsuario(string nome, string email, string usuario, string senha, string id)
    {
        SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename='|DataDirectory|DBTag.mdf';Integrated Security=True;User Instance=True");
        try
        {
            // Abre a conexão
            conn.Open();

            SqlCommand update = new SqlCommand("update TbUsuario set nome=@nome, email=@email, usuario=@usuario, senha=@senha where id=@id", conn);

            // Cria o parâmetro associado ao Nome
            SqlParameter pNome = new SqlParameter("nome", nome);
            SqlParameter pEmail = new SqlParameter("email", email);
            SqlParameter pUsuario = new SqlParameter("usuario", usuario);
            SqlParameter pSenha = new SqlParameter("senha", senha);
            SqlParameter pID = new SqlParameter("id", id);
            
            // Associa os parâmetros à consulta        
            update.Parameters.Add(pNome);
            update.Parameters.Add(pEmail);
            update.Parameters.Add(pUsuario);
            update.Parameters.Add(pSenha);
            update.Parameters.Add(pID);            

            // Executa a consulta e obtém o número de registros
            int numRegs = update.ExecuteNonQuery();

            // Teste de erro
            if (numRegs == 1)
                return "Atualização concluída com sucesso!";
            else
                return "Erro na atualização";
        }
        catch (Exception ex)
        {
            return ex.ToString();
            throw new Exception(ex.ToString(), ex);

        }
        finally
        {
            conn.Close();
        }
    }
}


