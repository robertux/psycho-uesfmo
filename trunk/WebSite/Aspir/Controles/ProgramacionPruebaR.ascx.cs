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

public partial class Controles_ProgramacionPruebaR : System.Web.UI.UserControl
{
    private AccesoDatos.AccesoDatos datos;
    FuncionalidadClassLib.Aspirante asp;
    FuncionalidadClassLib.Grupo gr;
    FuncionalidadClassLib.CentroComputo cc;
    protected void Page_Load(object sender, EventArgs e)
    {
        datos = ((AccesoDatos.AccesoDatos)Session["datos"]);
        asp = FuncionalidadClassLib.manejadorAspirante.GetAspirante((string)Session["codigo"], datos.ds);
        gr = FuncionalidadClassLib.ManejadorGrupo.consultargrupo(asp.CodigoGrupo, datos.ds.Tables["grupos"], datos.ds.Tables["centroscomputo"]);

        if (asp.Estado != "pendiente")
            this.btnRealizar.Visible = false;

        if (gr.CodigoGrupo == "GrpNone")
        {
            lblfecha.Text = "No Asignado";
            lblhora.Text = "No Asignado";
            lbllugar.Text = "No Asignado";
            this.btnRealizar.Visible = false;
        }
        else
        {
            lblfecha.Text = gr.FechaRealizacion.Date.ToShortDateString();
            lblhora.Text = gr.horaRealizacion.ToString() + " Horas " + gr.minutoRealizacion.ToString() + " Minutos ";
            DateTime hoy = DateTime.Today;
            if (!(hoy.Year == gr.FechaRealizacion.Year && hoy.Month == gr.FechaRealizacion.Month && hoy.Day == gr.FechaRealizacion.Day))
                this.btnRealizar.Visible = false;
            else
            {
                TimeSpan cuando = new TimeSpan(gr.horaRealizacion, gr.minutoRealizacion, 0);
                TimeSpan ahorita = DateTime.Now.TimeOfDay;                
                switch(TimeSpan.Compare(cuando, ahorita))
                {
                    case 1:             //cuando > ahorita: Aun no se ha llegado la hora de la prueba
                        int cuantosMinutosFaltan = (int)cuando.Subtract(ahorita).TotalMinutes;
                        if (cuantosMinutosFaltan > 10)                  //puede realizar la prueba desde diez minutos antes de la hora
                            this.btnRealizar.Visible = false;
                        break;
                    case -1:            //cuando < ahorita: Ya se paso de la hora de la prueba
                        int cuantosMinutosPasaron = (int)ahorita.Subtract(cuando).TotalMinutes;
                        if (cuantosMinutosPasaron > 30)                 //puede realizar la prueba hasta media hora despues de la hora de la prueba
                            this.btnRealizar.Visible = false;
                        break;
                }
            }
            cc = gr.CentroComputo;
            lbllugar.Text = cc.NombreCentro;
        }
    }
}
