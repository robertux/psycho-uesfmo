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

public partial class Admin_Controles_DatosGrupo : System.Web.UI.UserControl
{
    private AccesoDatos.AccesoDatos datos;

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    public void MostrarDatos(string grpCode)
    {
        this.datos = ((AccesoDatos.AccesoDatos)Session["datos"]);
        FuncionalidadClassLib.Grupo grp = FuncionalidadClassLib.ManejadorGrupo.consultargrupo(grpCode, datos.ds.Tables["grupos"], datos.ds.Tables["centroscomputo"]);
        this.lblCodigo.Text = grp.CodigoGrupo;
        this.lblFechaRealizacion.Text = grp.FechaRealizacion.ToShortDateString();
        this.lblHoraRealizacion.Text = grp.horaRealizacion.ToString() + " horas, " + grp.minutoRealizacion.ToString() + " minutos";
        this.lblExaminador.Text = grp.Examinador;
        this.lblCentroComputo.Text = grp.CentroComputo.NombreCentro;
        this.ListaAspirGrupo1.GrpCode = grpCode;
        this.ListaAspirGrupo1.Reload();
    }
}
