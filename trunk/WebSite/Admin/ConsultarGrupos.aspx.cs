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

public partial class Admin_ConsultarGrupos : System.Web.UI.Page
{
    private AccesoDatos.AccesoDatos datos;

    protected void Page_Load(object sender, EventArgs e)
    {
        datos = ((AccesoDatos.AccesoDatos)Session["datos"]);
        Session.Add("Adding", false);
        this.MaintainScrollPositionOnPostBack = true;
        if (!this.IsPostBack)
        {
            List<FuncionalidadClassLib.Aspirante> asps = FuncionalidadClassLib.manejadorAspirante.ConsultarAspirGrupo("GrpTemp", datos.ds);
            foreach (FuncionalidadClassLib.Aspirante asp in asps)
            {
                asp.CodigoGrupo = "GrpNone";
                FuncionalidadClassLib.manejadorAspirante.modificarAspirante(asp, datos.ds.Tables["aspirantes"]);
            }
            datos.Conectar();
            datos.ActualizarBD();
            datos.Desconectar();
        }
    }
    protected void btnAgregarGrupo_Click(object sender, ImageClickEventArgs e)
    {
        Session.Add("addedit", "add");
        Response.Redirect("AgregarGrupo.aspx");
    }
    protected void btnModificarGrupo_Click(object sender, ImageClickEventArgs e)
    {
        if (ListaGrupos1.Selected != "-1")
        {
            Session.Add("addedit", "edit");
            Response.Redirect("ModificarGrupo.aspx?codgrp=" + this.ListaGrupos1.Selected);
        }
    }
    protected void btnEliminarGrupo_Click(object sender, ImageClickEventArgs e)
    {
        if (this.ListaGrupos1.Selected != "-1")
        {
            //foreach (string grpcode in this.ListaGrupos1.MultiSelected)
            //{
                FuncionalidadClassLib.Grupo grp = FuncionalidadClassLib.ManejadorGrupo.consultargrupo(ListaGrupos1.Selected, datos.ds.Tables["grupos"], datos.ds.Tables["centroscomputo"]);
                grp.ListaApirantes = FuncionalidadClassLib.manejadorAspirante.ConsultarAspirGrupo(grp.CodigoGrupo, datos.ds);
                foreach (FuncionalidadClassLib.Aspirante asp in grp.ListaApirantes)
                {
                    asp.CodigoGrupo = "GrpNone";
                    FuncionalidadClassLib.manejadorAspirante.modificarAspirante(asp, datos.ds.Tables["aspirantes"]);
                }
                this.datos.Conectar();
                this.datos.ActualizarBD();
                this.datos.Desconectar();
                FuncionalidadClassLib.ManejadorGrupo.EliminarGrupo(grp, datos.ds.Tables["grupos"]);
                MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand("DELETE FROM GRUPOS WHERE CODGRUPO=?CODIGO", new MySql.Data.MySqlClient.MySqlConnection(datos.CadenaConexion));
                cmd.Parameters.Add("?CODIGO", this.ListaGrupos1.Selected);
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                this.datos.Conectar();
                this.datos.ActualizarBD();
                this.datos.Desconectar();                
            //}
            this.ListaGrupos1.RellenarGrid();
        }
    }
    protected void btnDatosGrupo_Click(object sender, ImageClickEventArgs e)
    {
        if(this.ListaGrupos1.Selected != "-1")
            Response.Redirect("DatosGrupo.aspx?codgrp=" + this.ListaGrupos1.Selected);
    }
}
