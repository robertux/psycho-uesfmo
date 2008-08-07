using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Controles_PreguntaCEPS : System.Web.UI.UserControl
{
    private AccesoDatos.AccesoDatos datos;
    private FuncionalidadClassLib.PreguntasCeps preguntas;
    private FuncionalidadClassLib.Aspirante aspir;
    private int nPreg;

    protected void Page_Load(object sender, EventArgs e)
    {                
        if (!this.IsPostBack)
        {
            this.datos = ((AccesoDatos.AccesoDatos)Session["datos"]);
            this.aspir = FuncionalidadClassLib.manejadorAspirante.GetAspirante((string)Session["codigo"], this.datos.ds);
            aspir.PruebaC = new FuncionalidadClassLib.PruebaCeps("00000");
            aspir.ResCeps = new FuncionalidadClassLib.ResultadoCeps();
            this.preguntas = new FuncionalidadClassLib.PreguntasCeps();            
                        
            FuncionalidadClassLib.manejadorAspirante.modificarAspirante(aspir, datos.ds.Tables["aspirantes"]);
            this.nPreg = 0;
            this.ViewState.Add("nPreg", this.nPreg);
            this.ViewState.Add("aspir", this.aspir);
            this.ViewState.Add("pregs", this.preguntas);

        }
        try
        {
            this.MostrarDatos();
        }
        catch(Exception)
        {
            //pass...
        }
    }

    protected void MostrarDatos()
    {
        this.lblNombre.Text = ((FuncionalidadClassLib.Aspirante)ViewState["aspir"]).Apellidos + ", " + ((FuncionalidadClassLib.Aspirante)ViewState["aspir"]).Nombres;
        this.nPreg = (int)ViewState["nPreg"];
        this.lblNumPregunta.Text = (this.nPreg + 1).ToString() + " de " + ((FuncionalidadClassLib.PreguntasCeps)this.ViewState["pregs"]).Preguntas.Count.ToString();
        this.lblPregunta.Text = ((FuncionalidadClassLib.PreguntasCeps)this.ViewState["pregs"]).Preguntas[this.nPreg].Valor;

        if (this.nPreg == (((FuncionalidadClassLib.PreguntasCeps)this.ViewState["pregs"]).Preguntas.Count - 1))
        {
            this.btnSiguiente.Visible = false;
            this.btnFinalizar.Visible = true;
        }
    }

    protected void btnSiguiente_Click(object sender, ImageClickEventArgs e)
    {
        if (this.rblOpciones.SelectedIndex != -1)
        {
            FuncionalidadClassLib.Respuesta resp = new FuncionalidadClassLib.Respuesta("00000", (uint)this.nPreg, uint.Parse(this.rblOpciones.SelectedValue));
            ((FuncionalidadClassLib.Aspirante)this.ViewState["aspir"]).PruebaC.Respuestas.Add(resp);

            this.nPreg = (int)this.ViewState["nPreg"];
            this.nPreg++;
            this.ViewState.Add("nPreg", this.nPreg);

            this.MostrarDatos();
        }
        this.rblOpciones.SelectedIndex = -1;
    }
    protected void btnFinalizar_Click(object sender, ImageClickEventArgs e)
    {
        if (this.rblOpciones.SelectedIndex != -1)
        {
            this.datos = ((AccesoDatos.AccesoDatos)Session["datos"]);
            FuncionalidadClassLib.Respuesta resp = new FuncionalidadClassLib.Respuesta("00000", (uint)this.nPreg, uint.Parse(this.rblOpciones.SelectedValue));
            ((FuncionalidadClassLib.Aspirante)this.ViewState["aspir"]).PruebaC.Respuestas.Add(resp);
            this.aspir = ((FuncionalidadClassLib.Aspirante)this.ViewState["aspir"]);
            this.aspir = FuncionalidadClassLib.ManejadorPruebas.RealizarPruebaCeps(this.aspir, this.aspir.PruebaC);
            this.aspir.Estado = "evaluado";
            this.aspir.ResCeps.codresult = (Int32.Parse(FuncionalidadClassLib.ManejadorPruebas.GetMaxCodeResultados(datos.ds.Tables["resultadosceps"])) + 1).ToString().PadLeft(7,'0');
            this.aspir.PruebaC.CodPrueba = (Int32.Parse(FuncionalidadClassLib.ManejadorPruebas.GetMaxCodePruebas(datos.ds.Tables["pruebaceps"])) + 1).ToString().PadLeft(7,'0');
            FuncionalidadClassLib.ManejadorPruebas.AgregarPruebas(this.aspir, datos.ds.Tables["pruebaceps"], datos.ds.Tables["pruebaraven"], datos.ds.Tables["respuestas"]);
            FuncionalidadClassLib.ManejadorPruebas.AgregarResultados(this.aspir, datos.ds.Tables["resultadosceps"], datos.ds.Tables["resultadosraven"]);
            this.aspir.Estado = "evaluado";
            FuncionalidadClassLib.manejadorAspirante.modificarAspirante(this.aspir, datos.ds.Tables["aspirantes"]);
            datos.Conectar();
            datos.ActualizarBD();
            datos.Desconectar();
            Response.Redirect("CloseMe.aspx");
        }
    }
}
