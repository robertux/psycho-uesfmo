using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Admin_Controles_AddEditGrupo : System.Web.UI.UserControl
{
    private AccesoDatos.AccesoDatos datos;
    private FuncionalidadClassLib.Grupo grp;

    protected void Page_Load(object sender, EventArgs e)
    {        
        this.datos = ((AccesoDatos.AccesoDatos)Session["datos"]);
        if (!this.IsPostBack)
        {
            this.calFechRealizacion.VisibleDate = DateTime.Now;
            this.RellenarComboCComp();
            this.RellenarComboMinutos();
            if ((string)Session["addedit"] == "add")
            {                
                this.calFechRealizacion.SelectedDate = DateTime.Now;                  
            }
            else
            {                
                FuncionalidadClassLib.Grupo grpSelected = FuncionalidadClassLib.ManejadorGrupo.consultargrupo(this.Request.Params.Get("codgrp"), datos.ds.Tables["grupos"], datos.ds.Tables["centroscomputo"]);
                this.txtCodigo.Text = grpSelected.CodigoGrupo;
                this.txtExaminador.Text = grpSelected.Examinador;
                for (int i = 0; i < this.cmbHoras.Items.Count; i++)
                  if (this.cmbHoras.Items[i].Value == grpSelected.horaRealizacion.ToString())
                    this.cmbHoras.SelectedIndex = i;
                for (int i = 0; i < this.cmbMinutos.Items.Count; i++)
                  if (this.cmbMinutos.Items[i].Value == grpSelected.minutoRealizacion.ToString())
                      this.cmbMinutos.SelectedIndex = i;                
                this.calFechRealizacion.SelectedDate = grpSelected.FechaRealizacion;
                this.calFechRealizacion.VisibleDate = grpSelected.FechaRealizacion;
                for (int i = 0; i < this.cmbCentroComputo.Items.Count; i++)
                    if (this.cmbCentroComputo.Items[i].Value == grpSelected.CentroComputo.CodCentroComputo)
                        this.cmbCentroComputo.SelectedIndex = i;
                grpSelected.ListaApirantes = FuncionalidadClassLib.manejadorAspirante.ConsultarAspirGrupo(grpSelected.CodigoGrupo, datos.ds);
                if (grpSelected.ListaApirantes != null)
                {
                    FuncionalidadClassLib.Grupo grpTemp = FuncionalidadClassLib.ManejadorGrupo.consultargrupo("GrpTemp", datos.ds.Tables["grupos"], datos.ds.Tables["centroscomputo"]);
                    grpTemp.ListaApirantes = grpSelected.ListaApirantes;
                    FuncionalidadClassLib.ManejadorGrupo.modificarGrupo(grpTemp,datos.ds);
                    foreach (FuncionalidadClassLib.Aspirante asp in grpTemp.ListaApirantes)
                    {
                        asp.CodigoGrupo = grpTemp.CodigoGrupo;
                        FuncionalidadClassLib.manejadorAspirante.modificarAspirante(asp, datos.ds.Tables["aspirantes"]);
                    }
                    datos.Conectar();
                    datos.ActualizarBD();
                    datos.Desconectar();
                }
            }
            this.ListaAspirGrupo1.GrpCode = "GrpTemp";
            this.ListaAspirGrupo1.Reload();
        }
        grp = FuncionalidadClassLib.ManejadorGrupo.consultargrupo("GrpTemp", datos.ds.Tables["grupos"], datos.ds.Tables["centroscomputo"]);
        if ((bool)Session["adding"])
        {
            this.txtCodigo.Text = FuncionalidadClassLib.ManejadorGrupo.generarCodigo(grp, datos.ds.Tables["grupos"]);
            this.txtExaminador.Text = grp.Examinador;
            for (int i = 0; i < this.cmbHoras.Items.Count; i++)
                if (this.cmbHoras.Items[i].Value == grp.horaRealizacion.ToString())
                    this.cmbHoras.SelectedIndex = i;
            for (int i = 0; i < this.cmbMinutos.Items.Count; i++)
                if (this.cmbMinutos.Items[i].Value == grp.minutoRealizacion.ToString())
                    this.cmbMinutos.SelectedIndex = i;      
            this.calFechRealizacion.SelectedDate = grp.FechaRealizacion;
            for (int i = 0; i < this.cmbCentroComputo.Items.Count; i++)
                if (this.cmbCentroComputo.Items[i].Value == grp.CentroComputo.CodCentroComputo)
                    this.cmbCentroComputo.SelectedIndex = i;
            Session["adding"] = false;
        }        
        this.lnkAnioAnt.Text = (this.calFechRealizacion.VisibleDate.Year - 1).ToString();
        this.lnkAnioSig.Text = (this.calFechRealizacion.VisibleDate.Year + 1).ToString();
        this.lblExaminadorReq.Visible = false;
    }

    public void RellenarComboCComp()
    {
        this.cmbCentroComputo.Items.Clear();
        //List<FuncionalidadClassLib.CentroComputo> cc = FuncionalidadClassLib.ManejadorMisc.GetCentrosComputo(datos.ds.Tables["centroscomputo"]);
        //foreach (FuncionalidadClassLib.CentroComputo c in cc)
        foreach(DataRow fila in datos.ds.Tables["centroscomputo"].Rows)
            this.cmbCentroComputo.Items.Add(new ListItem((string)fila["nombre"], (string)fila["codigo"]));
    }

    protected void RellenarComboMinutos()
    {
        this.cmbMinutos.Items.Clear();
        for (int i = 0; i <= 60; i++)
            this.cmbMinutos.Items.Add(new ListItem(i.ToString().PadLeft(1, '0'), i.ToString()));
    }

    protected void btnEliminarAspirGrupo_Click(object sender, ImageClickEventArgs e)
    {
        if (this.ListaAspirGrupo1.Selected != "-1")
        {
            //foreach (string aspCode in this.ListaAspirGrupo1.MultiSelected)
            //{
                FuncionalidadClassLib.Aspirante asp = FuncionalidadClassLib.manejadorAspirante.GetAspirante(/*aspCode*/ this.ListaAspirGrupo1.Selected, datos.ds);
                asp.CodigoGrupo = "GrpNone";
                FuncionalidadClassLib.manejadorAspirante.modificarAspirante(asp, datos.ds.Tables["aspirantes"]);
                datos.Conectar();
                datos.ActualizarBD();
                datos.Desconectar();
            //}
            this.ListaAspirGrupo1.RellenarGrid();
        }
    }
    protected void txtHora_TextChanged(object sender, EventArgs e)
    {
        this.ActualizarGrupo();
    }

    private void ActualizarGrupo()
    {
        grp = FuncionalidadClassLib.ManejadorGrupo.consultargrupo("GrpTemp", datos.ds.Tables["grupos"], datos.ds.Tables["centroscomputo"]);        
        if (this.txtExaminador.Text != "")
            grp.Examinador = txtExaminador.Text;
        grp.horaRealizacion = Int32.Parse(this.cmbHoras.Items[this.cmbHoras.SelectedIndex].Value);
        grp.minutoRealizacion = Int32.Parse(this.cmbMinutos.Items[this.cmbMinutos.SelectedIndex].Value);
        grp.CentroComputo = FuncionalidadClassLib.ManejadorMisc.GetCentroComputo(this.cmbCentroComputo.SelectedItem.Value,datos.ds.Tables["centroscomputo"]);
        grp.FechaRealizacion = this.calFechRealizacion.SelectedDate;
        FuncionalidadClassLib.ManejadorGrupo.modificarGrupo(grp, datos.ds);
        datos.Conectar();
        datos.ActualizarBD();
        datos.Desconectar();
    }
    protected void txtMinuto_TextChanged(object sender, EventArgs e)
    {
        this.ActualizarGrupo();
    }
    protected void txtExaminador_TextChanged(object sender, EventArgs e)
    {
        this.ActualizarGrupo();
    }
    
    public void MostrarGrupo()
    {
    }
    protected void calFechRealizacion_SelectionChanged(object sender, EventArgs e)
    {
        this.ActualizarGrupo();
    }
    protected void btnAceptar_Click(object sender, ImageClickEventArgs e)
    {
        if (this.txtExaminador.Text == "")
        {
            this.lblExaminadorReq.Visible = true;
            this.lblExaminadorReq.Focus();
        }
        else
        {
            this.ActualizarGrupo();
            grp.ListaApirantes = FuncionalidadClassLib.manejadorAspirante.ConsultarAspirGrupo(grp.CodigoGrupo, datos.ds);
            if ((string)Session["addedit"] == "add")
            {
                this.grp.CodigoGrupo = FuncionalidadClassLib.ManejadorGrupo.generarCodigo(grp, datos.ds.Tables["grupos"]);
                FuncionalidadClassLib.ManejadorGrupo.agregarGrupo(grp, datos.ds);
                datos.Conectar();
                datos.ActualizarBD();
                datos.Desconectar();
                if (grp.ListaApirantes != null)
                {
                    foreach (FuncionalidadClassLib.Aspirante asp in grp.ListaApirantes)
                    {
                        asp.CodigoGrupo = grp.CodigoGrupo;
                        FuncionalidadClassLib.manejadorAspirante.modificarAspirante(asp, datos.ds.Tables["aspirantes"]);
                    }
                }
            }
            else
            {
                grp.CodigoGrupo = this.Request.Params.Get("codgrp");
                FuncionalidadClassLib.ManejadorGrupo.modificarGrupo(grp, datos.ds);
                datos.Conectar();
                datos.ActualizarBD();
                datos.Desconectar();
                if (grp.ListaApirantes != null)
                    foreach (FuncionalidadClassLib.Aspirante asp in grp.ListaApirantes)
                    {
                        asp.CodigoGrupo = grp.CodigoGrupo;
                        FuncionalidadClassLib.manejadorAspirante.modificarAspirante(asp, datos.ds.Tables["aspirantes"]);
                    }
            }
            datos.Conectar();
            datos.ActualizarBD();
            datos.Desconectar();
            Response.Redirect("ConsultarGrupos.aspx");
        }
    }
    protected void cmbCentroComputo_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.ActualizarGrupo();
    }
    protected void btnAgregarAspirGrupo_Click(object sender, ImageClickEventArgs e)
    {
        this.ActualizarGrupo();
        Session["adding"] = true;
        Response.Redirect("AgregarAspirGrupo.aspx?codgrp="+this.Request.Params.Get("codgrp"));
    }
    protected void lnkAnioAnt_Click(object sender, EventArgs e)
    {
        DateTime tempDate = this.calFechRealizacion.VisibleDate;
        this.calFechRealizacion.VisibleDate = new DateTime(this.calFechRealizacion.VisibleDate.Year - 1, this.calFechRealizacion.VisibleDate.Month, this.calFechRealizacion.VisibleDate.Day);
        this.calFechRealizacion_VisibleMonthChanged(this, new MonthChangedEventArgs(this.calFechRealizacion.VisibleDate, tempDate));
    }
    protected void lnkAnioSig_Click(object sender, EventArgs e)
    {
        DateTime tempDate = this.calFechRealizacion.VisibleDate;
        this.calFechRealizacion.VisibleDate = new DateTime(this.calFechRealizacion.VisibleDate.Year + 1, this.calFechRealizacion.VisibleDate.Month, this.calFechRealizacion.VisibleDate.Day);
        this.calFechRealizacion_VisibleMonthChanged(this, new MonthChangedEventArgs(this.calFechRealizacion.VisibleDate, tempDate));
    }
    protected void calFechRealizacion_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
    {
        this.lnkAnioAnt.Text = (e.NewDate.Year - 1).ToString();
        this.lnkAnioSig.Text = (e.NewDate.Year + 1).ToString();
    }
}
