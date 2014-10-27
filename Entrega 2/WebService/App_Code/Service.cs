using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
// [System.Web.Script.Services.ScriptService]

public class Service : System.Web.Services.WebService
{
    string dataSource = "SERVER=SILVIA-PC; INITIAL CATALOG= DB_PTRAINER; TRUSTED_CONNECTION=YES;";
    SqlConnection connection;
    SqlCommand command;

    public Service () {

        //Elimine la marca de comentario de la línea siguiente si utiliza los componentes diseñados 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hola a todos";
    }


    [WebMethod(Description = "Insertar Información del Gimnasio")]
    public string insertarInfoGimnasio(string nombre, string lugar, string horario)
    {
        connection = new SqlConnection(dataSource);
        connection.Open();

        command = new SqlCommand();
        command.Connection = connection;
        command.CommandType = System.Data.CommandType.StoredProcedure;
        command.CommandText = "SP_InsertarInformacionGimnasio";
        command.Parameters.AddWithValue("@Nombre", nombre);
        command.Parameters.AddWithValue("@Lugar", lugar);
        command.Parameters.AddWithValue("@Horario", horario);
        try
        {
            command.ExecuteNonQuery();
            return "Record Saved";
        }
        catch (Exception)
        {
            return "Not Saved";
        }
        finally
        {
            connection.Close();
        }


    }

    [WebMethod(Description = "Insertar Información del Usuario")]
    public string insertarUsuario(string nombre, string usuario, string password)
    {
        connection = new SqlConnection(dataSource);
        connection.Open();

        command = new SqlCommand();
        command.Connection = connection;
        command.CommandType = System.Data.CommandType.StoredProcedure;
        command.CommandText = "SP_InsertarUsuario";
        command.Parameters.AddWithValue("@Nombre", nombre);
        command.Parameters.AddWithValue("@Username", usuario);
        command.Parameters.AddWithValue("@Password", password);
        try
        {
            command.ExecuteNonQuery();
            return "Record Saved";
        }
        catch (Exception)
        {
            return "Not Saved";
        }
        finally
        {
            connection.Close();
        }


    }


    [WebMethod(Description = "Insertar Maquina")]
    public string insertarMaquina(string nombre)
    {
        connection = new SqlConnection(dataSource);
        connection.Open();
        command = new SqlCommand();
        command.Connection = connection;
        command.CommandType = System.Data.CommandType.StoredProcedure;
        command.CommandText = "SP_InsertarMaquina";
        command.Parameters.AddWithValue("@Nombre", nombre);
        try
        {
            command.ExecuteNonQuery();
            return "Record Saved";
        }
        catch (Exception)
        {
            return "Not Saved";
        }
        finally
        {
            connection.Close();
        }
    }

  
  [WebMethod(Description = "Insertar Ejercicio")]
    public string insertarEjercicio(string nombre, string maquina)
    {
        connection = new SqlConnection(dataSource);
        connection.Open();
        command = new SqlCommand();
        command.Connection = connection;
        command.CommandType = System.Data.CommandType.StoredProcedure;
        command.CommandText = "SP_InsertarEjercicio";
        command.Parameters.AddWithValue("@Nombre", nombre);
        command.Parameters.AddWithValue("@Maquina", maquina);
        try
        {
            command.ExecuteNonQuery();
            return "Record Saved";
        }
        catch (Exception)
        {
            return "Not Saved";
        }
        finally
        {
            connection.Close();
        }
    }

  [WebMethod(Description = "Insertar Rutina")]
  public string insertarRutina(string nombre, string username)
  {
      connection = new SqlConnection(dataSource);
      connection.Open();
      command = new SqlCommand();
      command.Connection = connection;
      command.CommandType = System.Data.CommandType.StoredProcedure;
      command.CommandText = "SP_CrearRutina";
      command.Parameters.AddWithValue("@Nombre", nombre);
      command.Parameters.AddWithValue("@Username", username);
      try
      {
          command.ExecuteNonQuery();
          return "Record Saved";
      }
      catch (Exception)
      {
          return "Not Saved";
      }
      finally
      {
          connection.Close();
      }
  }

  [WebMethod(Description = "Insertar Ejercicio en Rutina")]
  public string insertarEjercicioEnRutina(string indicacion, double puntuacion, int repeticiones, int series, int pausa, double avance,  string rutina, string ejercicio)
  {
      connection = new SqlConnection(dataSource);
      connection.Open();
      command = new SqlCommand();
      command.Connection = connection;
      command.CommandType = System.Data.CommandType.StoredProcedure;
      command.CommandText = "SP_InsertarEjercicioEnRutina";
      command.Parameters.AddWithValue("@Indicacion", indicacion);
      command.Parameters.AddWithValue("@Puntuacion", puntuacion);
      command.Parameters.AddWithValue("@Repeticiones", repeticiones);
      command.Parameters.AddWithValue("@Series", series);
      command.Parameters.AddWithValue("@Pausa", pausa);
      command.Parameters.AddWithValue("@Avance", avance);
      command.Parameters.AddWithValue("@Rutina", rutina);
      command.Parameters.AddWithValue("@Ejercicio", ejercicio);
      try
      {
          command.ExecuteNonQuery();
          return "Record Saved";
      }
      catch (Exception)
      {
          return "Not Saved";
      }
      finally
      {
          connection.Close();
      }
  }
}