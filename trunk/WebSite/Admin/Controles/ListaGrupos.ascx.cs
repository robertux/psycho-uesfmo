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

public partial class Admin_Controles_ListaGrupos : System.Web.UI.UserControl
{
    private AccesoDatos.AccesoDatos datos;
    private bool showfilters;
    private bool selectable;
    private int pgIndice;
    private int pgSize;

    #region Propiedades

    public string Selected
    {
        get 
        {
            try
            {
                //return this.grdGrupos.Rows[this.grdGrupos.GetSelectedIndices()[0]].Cells[1].Text;
                return this.grdGrupos.SelectedRow.Cells[1].Text;
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
            //List<string> lista = new List<string>();
            //foreach (int i in this.grdGrupos.GetSelectedIndices())
            //    lista.Add(this.grdGrupos.Rows[i].Cells[1].Text);
            //return lista;
            return null;
        }
    }

    public bool ShowFilters
    {
        get { return this.showfilters; }
        set { this.showfilters = value; }
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

    protected void Reload()
    {
        datos = ((AccesoDatos.AccesoDatos)Session["datos"]);
        if (!this.IsPostBack)
        {
            this.tblFiltros.Visible = false;
            this.pgIndice = 0;
            if(pgSize == 0)
                this.pgSize = 10;
            this.ViewState.Add("pgIndice", this.pgIndice);
            this.ViewState.Add("pgSize", this.pgSize);
            if (this.ShowFilters)
            {
                this.tblFiltros.Visible = true;
                this.RellenarComboAnios();
                this.RellenarComboCComp();
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
        this.grdGrupos.Columns.Clear();
        DataTable tabla = datos.ds.Tables["grupos"].Copy();

        tabla = this.Formatear(tabla);

        tabla = this.Filtrar(tabla);
        this.MostrarMensajes(tabla);

        tabla = this.Paginar(tabla);
        
        //this.grdGrupos.AutoGenerateColumns = true;
        this.grdGrupos.DataSource = tabla;

        BoundField bfCodigo = new BoundField();
        BoundField bfExaminador = new BoundField();
        BoundField bfTamanio = new BoundField();
        BoundField bfFecha = new BoundField();
        BoundField bfCComp = new BoundField();
        CommandField cfSel = new CommandField();

        bfCodigo.DataField = "codgrupo";
        bfCodigo.HeaderText = "codigo";
        bfExaminador.DataField = "examinador";
        bfExaminador.HeaderText = "examinador";
        bfTamanio.DataField = "tamanio";
        bfTamanio.HeaderText = "No. de aspirantes";
        bfFecha.DataField = "fecharealizacion";
        bfFecha.HeaderText = "fecha";
        bfCComp.DataField = "centrocomputo";
        bfCComp.HeaderText = "centro de cómputo";

        cfSel.ButtonType = ButtonType.Link;
        cfSel.SelectText = "Seleccionar";
        cfSel.ShowSelectButton = true;
        this.grdGrupos.Columns.Add(cfSel);

        this.grdGrupos.Columns.Add(bfCodigo);
        this.grdGrupos.Columns.Add(bfExaminador);
        this.grdGrupos.Columns.Add(bfTamanio);
        this.grdGrupos.Columns.Add(bfFecha);
        this.grdGrupos.Columns.Add(bfCComp);
        this.grdGrupos.DataBind();

    }

    public DataTable Formatear(DataTable tabla)
    {
        return FuncionalidadClassLib.TableFormatter.FormatGrupos(tabla, datos.ds.Tables["aspirantes"], datos.ds.Tables["centroscomputo"]);
    }

    public DataTable Filtrar(DataTable tabla)
    {
        DataView dv = tabla.DefaultView;
        dv.RowFilter = "";
        if (this.ShowFilters)
        {
            if (this.cmbAnio.Items[this.cmbAnio.SelectedIndex].Text != "(Todos)")
                dv.RowFilter += (dv.RowFilter != "" ? " and " : "") + "fecharealizacion > '" + this.cmbAnio.Items[this.cmbAnio.SelectedIndex].Text + "-01-01' and fecharealizacion < '" + this.cmbAnio.Items[this.cmbAnio.SelectedIndex].Text + "-12-31'";
            if (this.cmbCComputo.Items[this.cmbCComputo.SelectedIndex].Text != "(Todos)")
                dv.RowFilter += (dv.RowFilter != "" ? " and " : "") + "centrocomputo = '" + this.cmbCComputo.Items[this.cmbCComputo.SelectedIndex].Text + "'";
        }
        dv.RowFilter += (dv.RowFilter != "" ? " and " : "") + "codgrupo <> 'GrpTemp' and codgrupo <> 'GrpNone'";
        return dv.ToTable();
    }

    public DataTable Paginar(DataTable tabla)
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

    public void MostrarMensajes(DataTable tabla)
    {
        this.lblMensaje2.Text = "Sólo se muestran " + this.pgSize.ToString() + " grupos por página";
        this.lblMensaje.Text = "Grupos " + ((this.pgSize * this.pgIndice) + 1).ToString() + " - " + (FuncionalidadClassLib.Pager.IsLastPage(tabla, this.pgIndice, this.pgSize) ? tabla.Rows.Count.ToString() : (this.pgSize * (this.pgIndice + 1)).ToString()) + " de " + tabla.Rows.Count.ToString();
    }

    public void RellenarComboAnios()
    {
        this.cmbAnio.Items.Clear();
        this.cmbAnio.Items.Add("(Todos)");
        for(int i = DateTime.Now.Year-30; i<=DateTime.Now.Year; i++)
            this.cmbAnio.Items.Add(new ListItem(i.ToString(), i.ToString()));
    }

    public void RellenarComboCComp()
    {
        this.cmbCComputo.Items.Clear();
        this.cmbCComputo.Items.Add("(Todos)");
        foreach (DataRow fila in datos.ds.Tables["centroscomputo"].Rows)
            this.cmbCComputo.Items.Add(new ListItem((string)fila["nombre"], (string)fila["codigo"]));
    }

    #endregion

    #region EventHandlers

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

    protected void cmbAnio_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.ViewState["pgIndice"] = 0;
        this.Reload();
    }

    protected void cmbCComputo_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.ViewState["pgIndice"] = 0;
        this.Reload();
    }

    #endregion
}
