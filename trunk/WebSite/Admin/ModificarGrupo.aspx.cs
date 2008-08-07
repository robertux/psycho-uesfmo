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

public partial class Admin_ModificarGrupo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Add("tipo", "modificar");
        this.MaintainScrollPositionOnPostBack = true;
    }
    protected void btnRegresar_Click(object sender, ImageClickEventArgs e)
    {
        List<FuncionalidadClassLib.Aspirante> asps = FuncionalidadClassLib.manejadorAspirante.ConsultarAspirGrupo("GrpTemp", ((AccesoDatos.AccesoDatos)Session["datos"]).ds);
        foreach (FuncionalidadClassLib.Aspirante asp in asps)
        {
            asp.CodigoGrupo = this.Request.Params.Get("codgrp");
            FuncionalidadClassLib.manejadorAspirante.modificarAspirante(asp, ((AccesoDatos.AccesoDatos)Session["datos"]).ds.Tables["aspirantes"]);
        }
        Response.Redirect("~/Admin/ConsultarGrupos.aspx");
    }
}
