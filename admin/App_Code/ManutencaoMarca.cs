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
public class ManutencaoMarca : System.Web.Services.WebService
{

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }
    [WebMethod]
    public List<string> consultarMarca(string id)
    {
        List<string> marcas = new List<string>();
        SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename='|DataDirectory|DBTag.mdf';Integrated Security=True;User Instance=True");
        // Abre a conexão
        conn.Open();
        try
        {
            SqlCommand select = new SqlCommand("SELECT * from TbMarca where id=@id", conn);
            SqlParameter pID = new SqlParameter("id", id);
            select.Parameters.Add(pID);
            // Lê, linha a linha a tabela
            SqlDataReader dr = select.ExecuteReader();
            while (dr.Read())
            {
                marcas.Add(dr["id"].ToString());
                marcas.Add(dr["nome_marca"].ToString());
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.ToString(), ex);
        }

        return marcas;
    }

    [WebMethod]
    public string inserirMarca(Marca marca)
    {
        SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename='|DataDirectory|DBTag.mdf';Integrated Security=True;User Instance=True");
        try
        {
            // Abre a conexão
            conn.Open();

            SqlCommand insert = new SqlCommand("insert into TbMarca (nome_marca) values (@marca)", conn);

            // Cria o parâmetro associado ao Nome
            SqlParameter pMarca = new SqlParameter("marca", marca.marca.ToString());

            // Associa os parâmetros à consulta        
            insert.Parameters.Add(pMarca);

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
    public string removerMarca(string id)
    {
        SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename='|DataDirectory|DBTag.mdf';Integrated Security=True;User Instance=True");

        conn.Open();

        try
        {
            SqlCommand delete = new SqlCommand("delete from TbMarca where id = @id", conn);

            SqlParameter pId = new SqlParameter("id", id);

            delete.Parameters.Add(pId);

            int numRegs = delete.ExecuteNonQuery();

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
    public String atualizarMarca(string marca, string id)
    {
        SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename='|DataDirectory|DBTag.mdf';Integrated Security=True;User Instance=True");
        try
        {
            // Abre a conexão
            conn.Open();

            SqlCommand update = new SqlCommand("update TbMarca set nome_marca=@marca where id=@id", conn);

            // Cria o parâmetro associado ao Nome
            SqlParameter pMarca = new SqlParameter("marca", marca);
            SqlParameter pID = new SqlParameter("id", id);
            
            // Associa os parâmetros à consulta        
            update.Parameters.Add(pMarca);
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


