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

public partial class Admin_Controles_ListaAspir : System.Web.UI.UserControl
{
    private List<FuncionalidadClassLib.Aspirante> aspirantes;
    private List<FuncionalidadClassLib.Facultad> facultades;
    private List<FuncionalidadClassLib.Carrera> carreras;
    private string grpCode;
    private bool showFilters;
    private int pgIndice;
    private int pgSize;
    private AccesoDatos.AccesoDatos datos;
    private bool selectable;

    #region Propiedades

    public string Selected
    {
        get 
        {
            try
            {
                //return this.grdAspirantes.Rows[this.grdAspirantes.GetSelectedIndices()[0]].Cells[1].Text;
                return this.grdAspirantes.SelectedRow.Cells[2].Text;
            }
            catch (Exception)
            {
                return "-1";
            }
        }
    }

    public List<string> MultiSelected
    {
        get
        {
            try
            {
                List<string> lista = new List<string>();
                foreach(int i in this.grdAspirantes.GetSelectedIndices())
                    lista.Add(this.grdAspirantes.Rows[i].Cells[1].Text);
                return lista;
            }
            catch (Exception)
            {
                return null;
            }
        }
    }

    public string GrpCode
    {
        get { return this.grpCode; }
        set { this.grpCode = value; }
    }

    public bool ShowFilters
    {
        get { return this.showFilters; }
        set { this.showFilters = value; }
    }

    public bool Selectable
    {
        get { return this.selectable; }
        set { this.selectable = value; }
    }

    public int PageSize
    {
        get { return this.pgSize; }
        set { this.pgSize = value; }
    }

    #endregion

    #region Metodos

    protected void Page_Load(object sender, EventArgs e)
    {
        this.Reload();
    }

    public void Reload()
    {
        this.datos = ((AccesoDatos.AccesoDatos)Session["datos"]);
        if (!this.IsPostBack)
        {
            this.aspirantes = new List<FuncionalidadClassLib.Aspirante>();
            this.TblFiltros.Visible = false;
            this.pgIndice = 0;
            if(this.pgSize == 0)
                this.pgSize = 7;
            this.ViewState.Add("pgIndice", this.pgIndice);
            this.ViewState.Add("pgSize", this.pgSize);
            if (this.ShowFilters)
            {
                this.facultades = FuncionalidadClassLib.ManejadorMisc.GetFacultades(this.datos.ds.Tables["facultades"]);
                this.RellenarComboAnios();
                this.RellenarComboFacultades();
                this.RellenarComboCarreras();
                this.RellenarComboEstados();
                this.TblFiltros.Visible = true;
            }
        }
        else
        {
            try
            {
                this.pgIndice = (int)this.ViewState["pgIndice"];
                this.pgSize = (int)this.ViewState["pgSize"];
            }
            catch (Exception)
            {
                //pass...
            }
        }
        this.RellenarGrid();
    }

    public void RellenarGrid()
    {
        this.grdAspirantes.Columns.Clear();
        DataTable tabla = datos.ds.Tables["aspirantes"].Copy();

        //Las tres especialidades del SuperGrid mi control ListaAspir:

        //1) Formateo de columnas:
        tabla = this.Formatear(tabla);

        //2) Filtrado de valores en las columnas:
        tabla = this.Filtrar(tabla);
        this.MostrarMensajes(tabla);

        //3) Paginación personalizada:
        tabla = this.Paginar(tabla);

        this.grdAspirantes.DataSource = tabla;        
        BoundField bfCodigo = new BoundField();
        BoundField bfNombres = new BoundField();
        BoundField bfApellidos = new BoundField();
        BoundField bfEstado = new BoundField();
        BoundField bfCarrera = new BoundField();
        
        CommandField cfSel = new CommandField(); 
       
        bfCodigo.DataField = "codigo";
        bfCodigo.HeaderText = "codigo";
        bfNombres.DataField = "nombres";
        bfNombres.HeaderText = "nombres";
        bfApellidos.DataField = "apellidos";
        bfApellidos.HeaderText = "apellidos";
        bfEstado.DataField = "estado";
        bfEstado.HeaderText = "estado";
        bfCarrera.DataField = "carrera";
        bfCarrera.HeaderText = "carrera";

        cfSel.ButtonType = ButtonType.Link;
        cfSel.SelectText = "Seleccionar";
        cfSel.ShowSelectButton = true;

        this.grdAspirantes.Columns.Add(cfSel);        

        this.grdAspirantes.Columns.Add(bfCodigo);
        this.grdAspirantes.Columns.Add(bfApellidos);
        this.grdAspirantes.Columns.Add(bfNombres);
        this.grdAspirantes.Columns.Add(bfCarrera);
        this.grdAspirantes.Columns.Add(bfEstado);        
        this.grdAspirantes.DataBind();
        
    }

    protected void MostrarMensajes(DataTable tabla)
    {
        this.lblMensaje2.Text = "Sólo se muestran " + this.pgSize.ToString() + " aspirantes por página";
        this.lblMensaje.Text = "Aspirantes " + ((this.pgSize * this.pgIndice) + 1).ToString() + " - " + (FuncionalidadClassLib.Pager.IsLastPage(tabla, this.pgIndice, this.pgSize) ? tabla.Rows.Count.ToString() : (this.pgSize * (this.pgIndice + 1)).ToString()) + " de " + tabla.Rows.Count.ToString();

    }

    protected void RellenarComboAnios()
    {
        this.cmbAnios.Items.Clear();
        this.cmbAnios.Items.Add(new ListItem("(Todos)", "(Todos)"));
        for (int i = DateTime.Now.Year-30; i <= DateTime.Now.Year; i++)
            this.cmbAnios.Items.Add(new ListItem(i.ToString(), i.ToString()));        
    }    

    protected void RellenarComboFacultades()
    {
        this.cmbFacultad.Items.Clear();
        this.cmbFacultad.Items.Add("(Todos)");
        foreach(FuncionalidadClassLib.Facultad f in this.facultades)
            this.cmbFacultad.Items.Add(new ListItem(f.NombreFacultad,f.CodFacultad));
    }

    protected void RellenarComboCarreras()
    {
        string codfacultad = (this.cmbFacultad.SelectedIndex != -1? this.cmbFacultad.Items[this.cmbFacultad.SelectedIndex].Value: this.cmbFacultad.Items[0].Value);
        this.carreras = FuncionalidadClassLib.ManejadorMisc.GetCarreras(codfacultad, this.datos.ds.Tables["carreras"]);
        this.cmbCarrera.Items.Clear();
        this.cmbCarrera.Items.Add("(Todos)");
        foreach(FuncionalidadClassLib.Carrera c in this.carreras)
            this.cmbCarrera.Items.Add(new ListItem(c.NombreCarrera,c.CodCarrera));
    }

    protected void RellenarComboEstados()
    {
        this.cmbEstado.Items.Clear();
        this.cmbEstado.Items.Add("(Todos)");
        this.cmbEstado.Items.Add(new ListItem("pendiente","pendiente"));
        this.cmbEstado.Items.Add(new ListItem("evaluando","evaluando"));
        this.cmbEstado.Items.Add(new ListItem("evaluado","evaluado"));
    }

    protected DataTable Formatear(DataTable tabla)
    {
        return FuncionalidadClassLib.TableFormatter.FormatAspirantes(tabla, datos.ds.Tables["facultades"], datos.ds.Tables["carreras"]);        
    }

    protected DataTable Filtrar(DataTable tabla)
    {
        DataView dv = tabla.DefaultView;
        this.filaResultado.Visible = false;
        dv.RowFilter = "";
        if (!string.IsNullOrEmpty(this.GrpCode))
            dv.RowFilter += "codgrupo='" + this.GrpCode + "'";
        if (this.ShowFilters)
        {
            if (this.cmbAnios.Items[this.cmbAnios.SelectedIndex].ToString() != "(Todos)")
                dv.RowFilter += (dv.RowFilter != "" ? " and " : "") + "anioregistrado=" + this.cmbAnios.Items[this.cmbAnios.SelectedIndex].ToString();
            if (this.cmbFacultad.Items[this.cmbFacultad.SelectedIndex].ToString() != "(Todos)")
                dv.RowFilter += (dv.RowFilter != "" ? " and " : "") + "facultad='" + this.cmbFacultad.Items[this.cmbFacultad.SelectedIndex].Text + "'";
            if (this.cmbCarrera.Items[this.cmbCarrera.SelectedIndex].ToString() != "(Todos)")
                dv.RowFilter += (dv.RowFilter != "" ? " and " : "") + "carrera='" + this.cmbCarrera.Items[this.cmbCarrera.SelectedIndex].Text + "'";
            if (this.cmbEstado.Items[this.cmbEstado.SelectedIndex].ToString() != "(Todos)")
                dv.RowFilter += (dv.RowFilter != "" ? " and " : "") + "estado='" + this.cmbEstado.Items[this.cmbEstado.SelectedIndex].Value + "'";
            if (this.cmbEstado.SelectedIndex == this.cmbEstado.Items.Count - 1)
            {
                this.filaResultado.Visible = true;
                dv.RowFilter += (dv.RowFilter != "" ? " and " : "") + "resultado='" + this.cmbResultado.Items[this.cmbResultado.SelectedIndex].Value + "'";
            }
        }
        return dv.ToTable();
    }

    protected DataTable Paginar(DataTable tabla)
    {
        DataTable nuevaTabla = FuncionalidadClassLib.Pager.GetRowsPerPage(tabla, this.pgIndice, this.pgSize);
        this.lnkAnterior.Visible = true;
        this.lnkSiguiente.Visible = true;
        if (FuncionalidadClassLib.Pager.IsFirstPage(tabla, this.pgIndice, this.pgSize))
            this.lnkAnterior.Visible = false;
        if (FuncionalidadClassLib.Pager.IsLastPage(tabla, this.pgIndice, this.pgSize))
            this.lnkSiguiente.Visible = false;
        return nuevaTabla;
    }

    #endregion

    #region EventHandlers

    protected void cmbAnios_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.ViewState["piIndice"] = 0;
        this.Reload();
    }

    protected void cmbFacultad_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.ViewState["pgIndice"] = 0;
        this.RellenarComboCarreras();
        this.Reload();
    }

    protected void cmbCarrera_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.ViewState["pgIndice"] = 0;
        this.Reload();
    }

    protected void cmbEstado_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.ViewState["pgIndice"] = 0;
        this.Reload();
    }

    protected void lnkAnterior_Click(object sender, EventArgs e)
    {
        this.ViewState.Add("pgIndice", this.pgIndice - 1);
        this.Reload();
    }

    protected void lnkSiguiente_Click(object sender, EventArgs e)
    {
        this.ViewState.Add("pgIndice", this.pgIndice + 1);
        this.Reload();
    }

    #endregion
}
