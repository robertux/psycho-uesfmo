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

public partial class Admin_Controles_AddEditAspir : System.Web.UI.UserControl
{
    private List<FuncionalidadClassLib.Facultad> facultades;
    private List<FuncionalidadClassLib.Departamento> departamentos;
    private List<FuncionalidadClassLib.centroestudio> centrosEst;
    private List<FuncionalidadClassLib.Ciudad> ciudades;
    private List<FuncionalidadClassLib.Carrera> carreras;
    private AccesoDatos.AccesoDatos datos;
    private FuncionalidadClassLib.Aspirante asp;

    protected void Page_Load(object sender, EventArgs e)
    {        
        datos = ((AccesoDatos.AccesoDatos)Session["datos"]);
        if (!this.IsPostBack)
        {
            this.facultades = new List<FuncionalidadClassLib.Facultad>();
            this.departamentos = new List<FuncionalidadClassLib.Departamento>();
            this.centrosEst = new List<FuncionalidadClassLib.centroestudio>();
            this.carreras = new List<FuncionalidadClassLib.Carrera>();
        }
        
        this.facultades = FuncionalidadClassLib.ManejadorMisc.GetFacultades(datos.ds.Tables["facultades"]);
        this.departamentos = FuncionalidadClassLib.ManejadorMisc.GetDepartamentos(datos.ds.Tables["departamentos"]);
        this.centrosEst = FuncionalidadClassLib.ManejadorMisc.GetCentroEstudios(datos.ds.Tables["centroestudio"]);
        if (!this.IsPostBack)
        {
            this.RellenarAnioAprobacion();
            this.RellenarFacultades();
            this.RellenarDeptos();
            this.RellenarCiudades(this.cmdDepartamento.Items[0].Value);
            this.RellenarCarreras(this.cmbFacultadCarrera.Items[0].Value);
            this.RellenarCentrosEst();
            this.calFechaNac.VisibleDate = new DateTime(DateTime.Now.Year - 20, DateTime.Now.Month, DateTime.Now.Day);
            this.lnkAnioAnt.Text = (this.calFechaNac.VisibleDate.Year - 1).ToString();
            this.lnkAnioSig.Text = (this.calFechaNac.VisibleDate.Year + 1).ToString();
        }

        if ((string)Session["addedit"] == "edit" && !this.IsPostBack)
        {
            if (this.Request.Params.Get("aspircode") != null)
            {
                asp = FuncionalidadClassLib.manejadorAspirante.GetAspirante(this.Request.Params.Get("aspircode"), this.datos.ds);
                this.RellenarAspirante();

            }
        }
        foreach (Control ctrl in this.Controls)
            if (ctrl.ID != null)
                if (ctrl.ID.Contains("Req"))
                    ctrl.Visible = false;
    }

    private void RellenarAnioAprobacion()
    {
        this.cmbAnioAprobacion.Items.Clear();
        for (int i = DateTime.Now.Year-30; i <= DateTime.Now.Year; i++)
            this.cmbAnioAprobacion.Items.Add(new ListItem(i.ToString(),i.ToString()));
    }

    private void RellenarFacultades()
    {
        this.cmbFacultadCarrera.Items.Clear();
        foreach (FuncionalidadClassLib.Facultad f in this.facultades)
            this.cmbFacultadCarrera.Items.Add(new ListItem(f.NombreFacultad, f.CodFacultad));
    }

    private void RellenarDeptos()
    {
        this.cmdDepartamento.Items.Clear();
        foreach (FuncionalidadClassLib.Departamento d in this.departamentos)
            this.cmdDepartamento.Items.Add(new ListItem(d.NombreDepartamento, d.CodDepartamento));
    }

    private void RellenarCentrosEst()
    {
        this.cmbLugarEstudios.Items.Clear();
        foreach (FuncionalidadClassLib.centroestudio ce in this.centrosEst)
            this.cmbLugarEstudios.Items.Add(new ListItem(ce.Nombre, ce.codigo));
    }

    private void RellenarCiudades(string codDepto)
    {
        this.cmbCiudad.Items.Clear();
        this.ciudades = FuncionalidadClassLib.ManejadorMisc.GetCiudades(codDepto,this.datos.ds.Tables["ciudades"]);
        foreach (FuncionalidadClassLib.Ciudad c in this.ciudades)
            this.cmbCiudad.Items.Add(new ListItem(c.NombreCiudad, c.CodCiudad));
    }

    private void RellenarCarreras(string codFacultad)
    {
        this.cmbCarrera.Items.Clear();
        this.carreras = FuncionalidadClassLib.ManejadorMisc.GetCarreras(codFacultad, this.datos.ds.Tables["carreras"]);
        foreach (FuncionalidadClassLib.Carrera c in this.carreras)
            this.cmbCarrera.Items.Add(new ListItem(c.NombreCarrera, c.CodCarrera));
    }

    protected void cmdDepartamento_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.RellenarCiudades(this.cmdDepartamento.Items[this.cmdDepartamento.SelectedIndex].Value);
    }
    protected void cmbFacultadCarrera_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.RellenarCarreras(this.cmbFacultadCarrera.Items[this.cmbFacultadCarrera.SelectedIndex].Value);
    }
    protected void btnAceptar_Click(object sender, ImageClickEventArgs e)
    {
        string IdCtrlInvalido = "";
        foreach(Control ctrl in this.Controls)
            if (ctrl.ID != null)
                if (ctrl.ID.Contains("txt"))
                    if (((TextBox)ctrl).Text == "")
                        IdCtrlInvalido = ctrl.ID;
        if (IdCtrlInvalido != "")
        {
            this.FindControl(IdCtrlInvalido).Focus();
            this.FindControl("lbl" + IdCtrlInvalido.Substring(3) + "Req").Visible = true;
        }
        else
        {
            string codigo = this.tx_tCodigo.Text;
            if ((string)Session["addedit"] == "add")
                codigo = FuncionalidadClassLib.manejadorAspirante.GenerarCodigo(this.txtApellidos.Text, this.txtNombres.Text, this.datos.ds.Tables["aspirantes"]);

            FuncionalidadClassLib.Aspirante asp =
                new FuncionalidadClassLib.Aspirante(codigo, txtNombres.Text, txtApellidos.Text
                , "GrpNone"
                , txtDireccion.Text
                , txtTelefono.Text
                , FuncionalidadClassLib.ManejadorMisc.GetLugarEstudios(cmbLugarEstudios.SelectedItem.Value, datos.ds.Tables["centroestudio"])
                , FuncionalidadClassLib.ManejadorMisc.GetCiudad(this.cmbCiudad.SelectedItem.Value, datos.ds.Tables["ciudades"])
                , FuncionalidadClassLib.ManejadorMisc.GetDepto(this.cmdDepartamento.SelectedItem.Value, datos.ds.Tables["departamentos"])
                , this.cmbAnioAprobacion.Text
                , "pendiente"
                , FuncionalidadClassLib.ManejadorMisc.GetCarrera(this.cmbCarrera.SelectedItem.Value, datos.ds.Tables["carreras"])
                , (this.rblSexo.SelectedIndex == 0 ? 'M' : 'F')
                , this.calFechaNac.SelectedDate
                , FuncionalidadClassLib.ManejadorMisc.GetFacultad(this.cmbFacultadCarrera.SelectedItem.Value, datos.ds.Tables["facultades"])
                , (uint)DateTime.Now.Year,"");
            if ((string)Session["addedit"] == "add")
                FuncionalidadClassLib.manejadorAspirante.agregarAspirante(asp, datos.ds.Tables["aspirantes"]);
            else
                FuncionalidadClassLib.manejadorAspirante.modificarAspirante(asp, datos.ds.Tables["aspirantes"]);
            ((AccesoDatos.AccesoDatos)Session["datos"]).Conectar();
            ((AccesoDatos.AccesoDatos)Session["datos"]).ActualizarBD();
            ((AccesoDatos.AccesoDatos)Session["datos"]).Desconectar();
            Response.Redirect("ConsultarAspir.aspx");
        }
    }

    private void MostrarCodigo()
    {
        if ((string)Session["addedit"] == "add")
        {
            string codigo = FuncionalidadClassLib.manejadorAspirante.GenerarCodigo(this.txtApellidos.Text, this.txtNombres.Text, datos.ds.Tables["aspirantes"]);
            this.tx_tCodigo.Text = codigo;
        }
    }

    protected void txtNombres_TextChanged(object sender, EventArgs e)
    {
        this.MostrarCodigo();
    }
    protected void txtApellidos_TextChanged(object sender, EventArgs e)
    {
        this.MostrarCodigo();
    }

    public void RellenarAspirante()
    {
        if (this.asp != null)
        {
            this.tx_tCodigo.Text = asp.Codigo;
            this.txtNombres.Text = asp.Nombres;
            this.txtApellidos.Text = asp.Apellidos;
            this.txtDireccion.Text = asp.Direccion;
            this.txtTelefono.Text = asp.Telefono;
            for (int i = 0; i< this.cmbAnioAprobacion.Items.Count; i++)
                if(asp.AnioAprobado == this.cmbAnioAprobacion.Items[i].Value)
                { this.cmbAnioAprobacion.SelectedIndex = i; }
            this.calFechaNac.SelectedDate = asp.FechaNacimiento;
            this.calFechaNac.VisibleDate = this.calFechaNac.SelectedDate;
            this.rblSexo.SelectedIndex=(asp.Sexo == 'M'? 0: 1);
            for (int i = 0; i < this.cmbLugarEstudios.Items.Count; i++)
                if (this.asp.LugarEstudios.codigo == this.cmbLugarEstudios.Items[i].Value)
                { this.cmbLugarEstudios.SelectedIndex = i; break; }

            for (int i = 0; i < this.cmdDepartamento.Items.Count; i++)
                if (this.asp.Depto.CodDepartamento == this.cmdDepartamento.Items[i].Value)
                { this.cmdDepartamento.SelectedIndex = i; this.RellenarCiudades(this.cmdDepartamento.Items[this.cmdDepartamento.SelectedIndex].Value); break; }

            for (int i = 0; i < this.cmbCiudad.Items.Count; i++)
                if (this.asp.Ciudad.CodCiudad == this.cmbCiudad.Items[i].Value)
                { this.cmbCiudad.SelectedIndex = i; break; }

            for (int i = 0; i < this.cmbFacultadCarrera.Items.Count; i++)
                if (this.asp.Facultad.CodFacultad == this.cmbFacultadCarrera.Items[i].Value)
                { this.cmbFacultadCarrera.SelectedIndex = i; this.RellenarCarreras(this.cmbFacultadCarrera.Items[this.cmbFacultadCarrera.SelectedIndex].Value); break; }

            
            for (int i = 0; i < this.cmbCarrera.Items.Count; i++)
                if (this.asp.Carrera.CodCarrera == this.cmbCarrera.Items[i].Value)
                { this.cmbCarrera.SelectedIndex = i; break; }
           
        }
    }
    protected void calFechaNac_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
    {
        if (e.NewDate.Year > DateTime.Now.Year - 15 || e.NewDate.Year < DateTime.Now.Year - 45)
            this.calFechaNac.VisibleDate = e.PreviousDate;
        this.lnkAnioAnt.Text = (this.calFechaNac.VisibleDate.Year - 1).ToString();
        this.lnkAnioSig.Text = (this.calFechaNac.VisibleDate.Year + 1).ToString();
    }
    protected void lnkAnioAnt_Click(object sender, EventArgs e)
    {
        DateTime oldDate = this.calFechaNac.VisibleDate;
        this.calFechaNac.VisibleDate = new DateTime(this.calFechaNac.VisibleDate.Year - 1, this.calFechaNac.VisibleDate.Month, this.calFechaNac.VisibleDate.Day);
        this.calFechaNac_VisibleMonthChanged(this, new MonthChangedEventArgs(this.calFechaNac.VisibleDate, oldDate));
    }
    protected void lnkAnioSig_Click(object sender, EventArgs e)
    {
        DateTime oldDate = this.calFechaNac.VisibleDate;
        this.calFechaNac.VisibleDate = new DateTime(this.calFechaNac.VisibleDate.Year + 1, this.calFechaNac.VisibleDate.Month, this.calFechaNac.VisibleDate.Day);
        this.calFechaNac_VisibleMonthChanged(this, new MonthChangedEventArgs(this.calFechaNac.VisibleDate, oldDate));
    }
}
