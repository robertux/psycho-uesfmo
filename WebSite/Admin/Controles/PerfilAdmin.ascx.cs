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

public partial class Controles_PerfilAdmin : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FuncionalidadClassLib.Administrador admin;
        admin=FuncionalidadClassLib.ManejadorAdmin.consultarAdmin((string)Session["codigo"],((AccesoDatos.AccesoDatos)Session["datos"]).ds.Tables["administradores"]);
        if (admin != null)
        {
            lblCodigo.Text = admin.Codigo;
            lblNombre.Text = admin.Nombre;
            lblPrivilegio.Text = admin.Privilegio;
        }

    }
}
