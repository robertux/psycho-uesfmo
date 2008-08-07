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
using Microsoft.VisualBasic;

public partial class Controles_PreguntaRAVEN : System.Web.UI.UserControl
{

    private AccesoDatos.AccesoDatos datos;
    private FuncionalidadClassLib.PreguntasRaven preguntas;
    private FuncionalidadClassLib.Aspirante aspir;
    private int nPreg;
    private DateTime horaCarga;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.datos = ((AccesoDatos.AccesoDatos)Session["datos"]);
            this.aspir = FuncionalidadClassLib.manejadorAspirante.GetAspirante((string)Session["codigo"], this.datos.ds);
            aspir.PruebaR = new FuncionalidadClassLib.PruebaRaven(Int32.Parse(FuncionalidadClassLib.ManejadorPruebas.GetMaxCodePruebas(datos.ds.Tables["pruebaraven"])).ToString().PadLeft(7,'0'));
            aspir.ResRaven = new FuncionalidadClassLib.ResultadoRaven();
            this.preguntas = new FuncionalidadClassLib.PreguntasRaven();
            this.aspir.Estado = "evaluando";
            FuncionalidadClassLib.manejadorAspirante.modificarAspirante(aspir, datos.ds.Tables["aspirantes"]);
            this.nPreg = 0;
            this.ViewState.Add("nPreg", this.nPreg);
            this.ViewState.Add("aspir", this.aspir);
            this.ViewState.Add("pregs", this.preguntas);
            this.horaCarga = DateTime.Now;
        }
        if (Session["tiempo"] != null)
            this.horaCarga = (DateTime)Session["tiempo"];
        DateTime horaClick = DateTime.Now;
        TimeSpan timetrans=horaClick.Subtract(this.horaCarga);
        this.lblTiempoTrans.Text = timetrans.Minutes.ToString()+ " Minutos " + timetrans.Seconds.ToString()+" Segundos";
      
        DateTime timeinic=DateTime.Parse("1:00:00");
        DateTime timetrans2 = DateTime.Parse(timetrans.Hours.ToString()+":"+timetrans.Minutes.ToString()+":"+timetrans.Seconds.ToString());
        TimeSpan timeres = timeinic.Subtract(timetrans2);
        this.lblTiempoRes.Text =timeres.Hours.ToString()+" Hora "+ timeres.Minutes.ToString() + " Minutos " + timeres.Seconds.ToString() + " Segundos";
        Session.Add("tiempo", this.horaCarga);

        try
        {
            this.MostrarDatos();
        }
        catch (Exception)
        {
            //pass...
        }
    }

    protected void MostrarDatos()
    {
        this.lblNombre.Text = ((FuncionalidadClassLib.Aspirante)ViewState["aspir"]).Apellidos + ", " + ((FuncionalidadClassLib.Aspirante)ViewState["aspir"]).Nombres;
        this.nPreg = (int)ViewState["nPreg"];
        if (this.nPreg == 24 && this.rblOpciones.Items.Count == 6)
        {
            this.rblOpciones.Items.Add(new ListItem("7","7"));
            this.rblOpciones.Items.Add(new ListItem("8","8"));
            this.rblOpciones.RepeatColumns = 4;
        }
        this.lblNumPregunta.Text = (this.nPreg + 1).ToString() + " de " + ((FuncionalidadClassLib.PreguntasRaven)this.ViewState["pregs"]).Preguntas.Count.ToString();
        this.imgPregunta.ImageUrl = "../Recursos/RAVEN/" + ((FuncionalidadClassLib.PreguntasRaven)this.ViewState["pregs"]).Preguntas[this.nPreg].Valor;

        if (this.nPreg == (((FuncionalidadClassLib.PreguntasRaven)this.ViewState["pregs"]).Preguntas.Count - 1))
        {
            this.btnSiguiente.Visible = false;
            this.btnFinalizar.Visible = true;
        }
    }

    protected void btnSiguiente_Click(object sender, ImageClickEventArgs e)
    {
        if (this.rblOpciones.SelectedIndex != -1)
        {
            this.datos = ((AccesoDatos.AccesoDatos)Session["datos"]);
            FuncionalidadClassLib.Respuesta resp = new FuncionalidadClassLib.Respuesta("00000", (uint)this.nPreg, uint.Parse(this.rblOpciones.SelectedValue));
            ((FuncionalidadClassLib.Aspirante)this.ViewState["aspir"]).PruebaR.Respuestas.Add(resp);

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
            ((FuncionalidadClassLib.Aspirante)this.ViewState["aspir"]).PruebaR.Respuestas.Add(resp);
            this.aspir = ((FuncionalidadClassLib.Aspirante)this.ViewState["aspir"]);            
            this.aspir = FuncionalidadClassLib.ManejadorPruebas.RealizarPruebaRaven(this.aspir, this.aspir.PruebaR);
            this.aspir.PruebaR.CodPrueba = (Int32.Parse(FuncionalidadClassLib.ManejadorPruebas.GetMaxCodePruebas(datos.ds.Tables["pruebaraven"])) + 1).ToString().PadLeft(7,'0');
            this.aspir.ResRaven.codresult = (Int32.Parse(FuncionalidadClassLib.ManejadorPruebas.GetMaxCodeResultados(datos.ds.Tables["resultadosraven"])) + 1).ToString().PadLeft(7,'0');
            FuncionalidadClassLib.ManejadorPruebas.AgregarPruebas(this.aspir, datos.ds.Tables["pruebaceps"], datos.ds.Tables["pruebaraven"], datos.ds.Tables["respuestas"]);
            FuncionalidadClassLib.ManejadorPruebas.AgregarResultados(this.aspir, datos.ds.Tables["resultadosceps"], datos.ds.Tables["resultadosraven"]);
            FuncionalidadClassLib.manejadorAspirante.modificarAspirante(this.aspir, datos.ds.Tables["aspirantes"]);
            datos.Conectar();
            datos.ActualizarBD();
            datos.Desconectar();
            Response.Redirect("CloseMe.aspx");
        }
    }
}
