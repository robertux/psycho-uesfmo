using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Admin_ConsultarAspir : System.Web.UI.Page
{
    private AccesoDatos.AccesoDatos datos;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.datos = ((AccesoDatos.AccesoDatos)Session["datos"]);
        this.MaintainScrollPositionOnPostBack = true;
    }
    protected void btnAgregarAspir_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("addedit", "add");
        Response.Redirect("AgregarAspir.aspx");
    }
    protected void btnModificarAspir_Click(object sender, ImageClickEventArgs e)
    {
        if (this.ListaAspir1.Selected != "-1")
        {
            Session.Add("addedit", "edit");
            Response.Redirect("ModificarAspir.aspx?aspircode="+this.ListaAspir1.Selected);
        }
    }
    protected void btnEliminarAspir_Click(object sender, ImageClickEventArgs e)
    {
        //if (this.ListaAspir1.MultiSelected != null)
        //{
        //    foreach (string codaspir in this.ListaAspir1.MultiSelected)
        //    {
        if(this.ListaAspir1.Selected != "-1")
        {
                FuncionalidadClassLib.manejadorAspirante.eliminarAspirante(
                this.ListaAspir1.Selected, this.datos.ds.Tables["aspirantes"]);
                MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("DELETE FROM ASPIRANTES WHERE CODIGO=?CODIGO", new MySql.Data.MySqlClient.MySqlConnection(datos.CadenaConexion));
                cmd.Parameters.Add("?CODIGO", this.ListaAspir1.Selected);
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                this.datos.Conectar();
                this.datos.ActualizarBD();
                this.datos.Desconectar();                
            this.ListaAspir1.RellenarGrid();
        }
    }
    protected void btnDatosAspir_Click(object sender, ImageClickEventArgs e)
    {
        if (this.ListaAspir1.Selected != "-1")
              Response.Redirect("DatosAspir.aspx?aspircode=" + this.ListaAspir1.Selected);
      
    }
}
