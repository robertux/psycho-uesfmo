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

public partial class Admin_Controles_DiagnosticoAspir : System.Web.UI.UserControl
{
    private AccesoDatos.AccesoDatos datos;
    private FuncionalidadClassLib.Aspirante asp;

    protected void Page_Load(object sender, EventArgs e)
    {
        datos = ((AccesoDatos.AccesoDatos)Session["datos"]);
        if (this.Request.Params.Get("aspircode") != null)
        {
            asp = FuncionalidadClassLib.manejadorAspirante.GetAspirante(this.Request.Params.Get("aspircode"), this.datos.ds);
            this.tblRaven.Visible = true;
            this.tblCeps.Visible = true;
            asp = FuncionalidadClassLib.ManejadorPruebas.GetPruebas(asp, datos.ds.Tables["pruebaceps"], datos.ds.Tables["pruebaraven"], datos.ds.Tables["respuestas"]);
            asp = FuncionalidadClassLib.ManejadorPruebas.GetResultados(asp, datos.ds.Tables["resultadosceps"], datos.ds.Tables["resultadosraven"]);
            if (asp.ResRaven == null)
            {
                if (asp.PruebaR == null)
                    this.tblRaven.Visible = false;
                else
                {
                    asp.ResRaven = FuncionalidadClassLib.Evaluador.evaluarPruebaraven(asp);
                    this.lblConsistencia.Text = asp.ResRaven.Consistencia;
                    this.lblPercentil.Text = asp.ResRaven.Percentil.ToString();
                    this.lblDiagnosticoRaven.Text = asp.ResRaven.Diagnostico;
                    this.lblPuntaje.Text = asp.ResRaven.Puntaje.ToString();
                }
            }
            else
            {
                this.lblConsistencia.Text = asp.ResRaven.Consistencia;
                this.lblPercentil.Text = asp.ResRaven.Percentil.ToString();
                this.lblDiagnosticoRaven.Text = asp.ResRaven.Diagnostico;
                this.lblPuntaje.Text = asp.ResRaven.Puntaje.ToString();
            }

            if (asp.ResCeps == null)
            {
                if (asp.PruebaC == null)
                    this.tblCeps.Visible = false;
                else
                {
                    asp.ResCeps = FuncionalidadClassLib.Evaluador.evaluarPruebaceps(asp);
                    this.lblControl.Text = asp.ResCeps.PControl.ToString();
                    this.lblDecision.Text = asp.ResCeps.PDecision.ToString();
                    this.lblExtroversion.Text = asp.ResCeps.PExtrover.ToString();
                    this.lblParanoidismo.Text = asp.ResCeps.PParan.ToString();
                    this.lblSinceridad.Text = asp.ResCeps.PSin.ToString();
                    this.lblDiagnosticoCeps.Text = asp.ResCeps.Diagnostico;
                }
            }
            else
            {
                this.lblControl.Text = asp.ResCeps.PControl.ToString();
                this.lblDecision.Text = asp.ResCeps.PDecision.ToString();
                this.lblExtroversion.Text = asp.ResCeps.PExtrover.ToString();
                this.lblParanoidismo.Text = asp.ResCeps.PParan.ToString();
                this.lblSinceridad.Text = asp.ResCeps.PSin.ToString();
                this.lblDiagnosticoCeps.Text = asp.ResCeps.Diagnostico;
            }
            if (asp.Estado != "evaluado")
                this.tblResultado.Visible = false;
            else
            {
                this.tblResultado.Visible = true;
                if (asp.Resultado == "")
                {
                    this.ImgResultado.Visible = false;
                    this.cmbResultadoOpcion.Visible = true;
                    this.btnAsignar.Visible = true;
                }
                else
                {
                    this.ImgResultado.Visible = true;
                    if (asp.Resultado == "apto")
                        this.ImgResultado.ImageUrl = "~/Admin/Recursos/BtnApto.png";
                    if (asp.Resultado == "noapto")
                        this.ImgResultado.ImageUrl = "~/Admin/Recursos/BtnNoApto.png";
                    this.cmbResultadoOpcion.Visible = false;
                    this.btnAsignar.Visible = false;
                }
            }
        } 
    }
    protected void btnAsignar_Click(object sender, ImageClickEventArgs e)
    {
        if (this.asp == null)
        {
            if(this.datos == null)
                datos = ((AccesoDatos.AccesoDatos)Session["datos"]);
            asp = FuncionalidadClassLib.ManejadorPruebas.GetPruebas(asp, datos.ds.Tables["pruebaceps"], datos.ds.Tables["pruebaraven"], datos.ds.Tables["respuestas"]);
        }
        asp.Resultado = this.cmbResultadoOpcion.Items[this.cmbResultadoOpcion.SelectedIndex].Value;
        FuncionalidadClassLib.manejadorAspirante.modificarAspirante(asp, datos.ds.Tables["aspirantes"]);
        datos.Conectar();
        datos.ActualizarBD();
        datos.Desconectar();
        this.refrescar();

          }


    public void refrescar()
         {
        if (asp.Estado != "evaluado")
                this.tblResultado.Visible = false;
            else
            {
                this.tblResultado.Visible = true;
                if (asp.Resultado == "")
                {
                    this.ImgResultado.Visible = false;
                    this.cmbResultadoOpcion.Visible = true;
                    this.btnAsignar.Visible = true;
                }
                else
                {
                    this.ImgResultado.Visible = true;
                    if (asp.Resultado == "apto")
                        this.ImgResultado.ImageUrl = "~/Admin/Recursos/BtnApto.png";
                    if (asp.Resultado == "noapto")
                        this.ImgResultado.ImageUrl = "~/Admin/Recursos/BtnNoApto.png";
                    this.cmbResultadoOpcion.Visible = false;
                    this.btnAsignar.Visible = false;
                }
            }
        }

}
