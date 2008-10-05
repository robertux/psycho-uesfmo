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

public partial class Aspir_Default : System.Web.UI.Page
{
    public Aspir_Default()
    {
        this.Load += new EventHandler(PageLoad);
    }
    protected void PageLoad(object sender, EventArgs e)
    {
        if ((string)Session["UserType"] != "Aspir")            
            Response.Redirect("../NoAccess.aspx");
        AccesoDatos.AccesoDatos datos = ((AccesoDatos.AccesoDatos)Session["datos"]);
        FuncionalidadClassLib.Aspirante asp = FuncionalidadClassLib.manejadorAspirante.GetAspirante((string)Session["codigo"], datos.ds);
        if (asp.Estado != "pendiente")
        {
            if (asp.Estado == "evaluando")
            {
                this.copiaProgramacionPruebaR.Visible = false;
                this.ImgEvaluadoR.Visible = true;
            }
            if (asp.Estado == "evaluado")
            {
                this.copiaProgramacionPruebaR.Visible = false;
                this.ImgEvaluadoR.Visible = true;
                this.copiaProgramacionPruebaC.Visible = false;
                this.ImgEvaluadoC.Visible = true;
                if (asp.Resultado == "apto")
                    this.ImgResultado.ImageUrl = "Recursos/BtnApto.png";
                if (asp.Resultado == "noapto")
                    this.ImgResultado.ImageUrl = "Recursos/BtnNoApto.png";
            }
        }
    }

}
