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

public partial class Admin_Controles_DatosAspir : System.Web.UI.UserControl
{
    private AccesoDatos.AccesoDatos datos;
    private FuncionalidadClassLib.Aspirante asp;

    protected void Page_Load(object sender, EventArgs e)
    {
        datos = ((AccesoDatos.AccesoDatos)Session["datos"]);
        if (this.Request.Params.Get("aspircode") != null)
        {
            asp = FuncionalidadClassLib.manejadorAspirante.GetAspirante(this.Request.Params.Get("aspircode"), this.datos.ds);
            datosaspirante();
        } 
    }

        public void datosaspirante()
        {
             if (this.asp != null)
        {
            this.lblCodigo.Text = asp.Codigo;
            this.lblNombres.Text = asp.Nombres;
            this.lblApellidos.Text = asp.Apellidos;
            this.lblDireccion.Text = asp.Direccion;
            this.lblTelefono.Text = asp.Telefono;
            this.lblAnioAprobacion.Text = asp.AnioAprobado;
            this.lblLugarEstudios.Text = asp.LugarEstudios.Nombre;
            this.lblCiudad.Text = asp.Ciudad.NombreCiudad;
            this.lblDepto.Text = asp.Depto.NombreDepartamento;
            this.lblCarrera.Text = asp.Carrera.NombreCarrera;
            this.lblFechaNac.Text = asp.FechaNacimiento.Date.ToLongDateString();
            this.lblSexo.Text = (asp.Sexo == 'M' ? "Masculino" : "Femenino");
            this.lblFacultadCarrera.Text = asp.Facultad.NombreFacultad;

                  
        }
    }
}

