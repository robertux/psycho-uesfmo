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

public partial class Controles_DatosAspir : System.Web.UI.UserControl
{
    private AccesoDatos.AccesoDatos datos;
    FuncionalidadClassLib.Aspirante asp;

    protected void Page_Load(object sender, EventArgs e)
    {
        datos = ((AccesoDatos.AccesoDatos)Session["datos"]);
        asp = FuncionalidadClassLib.manejadorAspirante.GetAspirante((string)Session["codigo"], datos.ds);
        this.lblApellidos.Text = asp.Apellidos;
        this.lblNombres.Text = asp.Nombres;
        this.lblCodigo.Text = asp.Codigo;
        this.lblInstitucion.Text = asp.LugarEstudios.Nombre;
        this.lblCarrera.Text = asp.Carrera.NombreCarrera;
    }
}
