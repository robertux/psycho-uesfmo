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

public partial class Admin_Controles_ListaAspirVacante : System.Web.UI.UserControl
{
    private AccesoDatos.AccesoDatos datos;


    public string Selected
    {
        get
        {
            try
            {
                return this.grdAspirVacante.Rows[this.grdAspirVacante.GetSelectedIndices()[0]].Cells[1].Text;
            }
            catch (Exception ex)
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
                foreach (int i in this.grdAspirVacante.GetSelectedIndices())
                    lista.Add(this.grdAspirVacante.Rows[i].Cells[1].Text);
                return lista;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.datos = ((AccesoDatos.AccesoDatos)Session["datos"]);
        this.RellenarGrid();
    }

    public void RellenarGrid()
    {
        this.grdAspirVacante.Columns.Clear();
        DataView dv = this.datos.ds.Tables["aspirantes"].DefaultView;
        dv.RowFilter = "codgrupo = 'GrpNone'";
        this.grdAspirVacante.DataSource = dv;
        BoundField bfCodigo = new BoundField();
        BoundField bfNombres = new BoundField();
        BoundField bfApellidos = new BoundField();
        BoundField bfEstado = new BoundField();
        BoundField bfCarrera = new BoundField();
        //CommandField cfSel = new CommandField();
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
        //cfSel.ButtonType = ButtonType.Link;
        //cfSel.SelectText = "Seleccionar";
        //cfSel.ShowSelectButton = true;
        //this.grdAspirVacante.Columns.Add(cfSel);
        this.grdAspirVacante.Columns.Add(bfCodigo);
        this.grdAspirVacante.Columns.Add(bfApellidos);
        this.grdAspirVacante.Columns.Add(bfNombres);
        this.grdAspirVacante.Columns.Add(bfCarrera);
        this.grdAspirVacante.Columns.Add(bfEstado);
        this.grdAspirVacante.DataBind();
    }
}
