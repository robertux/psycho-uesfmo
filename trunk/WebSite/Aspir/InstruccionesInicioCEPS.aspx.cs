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

public partial class Aspir_Ini_Ceps : System.Web.UI.Page
{
    public Aspir_Ini_Ceps()
    {
        this.Load += new EventHandler(PageLoad);        
    }

    protected void PageLoad(object sender, EventArgs e)
    {
        this.lblInvalid.Visible = false;
        this.lblRequired.Visible = false;
        if ((string)Session["UserType"] != "Aspir")            
            Response.Redirect("../NoAccess.aspx");        
    }

    protected void btnContinuarServerClick(object sender, ImageClickEventArgs e)
    {
        FuncionalidadClassLib.Aspirante asp = FuncionalidadClassLib.manejadorAspirante.GetAspirante((string)Session["codigo"], ((AccesoDatos.AccesoDatos)Session["datos"]).ds);
        if (this.txtCodGrupo.Text == "")
            this.lblRequired.Visible = true;
        else
        {
            if (asp.CodigoGrupo == this.txtCodGrupo.Text)                
                Response.Redirect("InstruccionesFinCEPS.aspx");
            else
                this.lblInvalid.Visible = true;
        }

    }
}
