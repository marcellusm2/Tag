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
public class ManutencaoProduto : System.Web.Services.WebService
{

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

    [WebMethod]
    public string inserirProduto(Produto produto)
    {
        SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename='|DataDirectory|DBTag.mdf';Integrated Security=True;User Instance=True");
        try
        {
            // Abre a conexão
            conn.Open();

            SqlCommand insert = new SqlCommand("insert into TbProduto (nome_produto, valor_produto) values (@nome_produto, @valor_produto)", conn);

            // Cria o parâmetro associado ao Nome
            SqlParameter pProduto = new SqlParameter("nome_produto", produto.produto.ToString());
            SqlParameter pValor = new SqlParameter("valor_produto", produto.valor.ToString());

            // Associa os parâmetros à consulta        
            insert.Parameters.Add(pProduto);
            insert.Parameters.Add(pValor);

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

    
}


