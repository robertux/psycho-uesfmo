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

public partial class Admin_AgregarAspirGrupo : System.Web.UI.Page
{
    private AccesoDatos.AccesoDatos datos;

    protected void Page_Load(object sender, EventArgs e)
    {
        this.datos = ((AccesoDatos.AccesoDatos)Session["datos"]);
        this.MaintainScrollPositionOnPostBack = true;
        if ((string)Session["tipo"] == "agregar")
            this.btnRegresar.PostBackUrl = "AgregarGrupo.aspx?codgrp="+this.Request.Params.Get("codgrp");
        else
            this.btnRegresar.PostBackUrl = "ModificarGrupo.aspx?codgrp="+this.Request.Params.Get("codgrp");
    }
    protected void btnRegresar_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (this.ListaAspirVacante1.Selected != "-1")
        {
            //foreach (string aspCode in this.ListaAspirVacante1.MultiSelected)
            //{
            FuncionalidadClassLib.Aspirante asp = FuncionalidadClassLib.manejadorAspirante.GetAspirante(/*aspCode*/this.ListaAspirVacante1.Selected, datos.ds);
            asp.CodigoGrupo = "GrpTemp";
            FuncionalidadClassLib.manejadorAspirante.modificarAspirante(asp, datos.ds.Tables["aspirantes"]);
            datos.Conectar();
            datos.ActualizarBD();
            datos.Desconectar();
            //}            
            if ((string)Session["tipo"] == "agregar")
                Response.Redirect("AgregarGrupo.aspx?codgrp="+this.Request.Params.Get("codgrp"));
            else
                Response.Redirect("ModificarGrupo.aspx?codgrp="+this.Request.Params.Get("codgrp"));
        }
    }
}
