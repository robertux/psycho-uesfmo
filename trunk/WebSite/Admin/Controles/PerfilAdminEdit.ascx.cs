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

public partial class Admin_Controles_PerfilAdminEdit : System.Web.UI.UserControl
{
    FuncionalidadClassLib.Administrador admin;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.admin = FuncionalidadClassLib.ManejadorAdmin.consultarAdmin((string)Session["codigo"], ((AccesoDatos.AccesoDatos)Session["datos"]).ds.Tables["administradores"]);
        if (!this.IsPostBack)
        {
            this.txtNombres.Text = this.admin.Nombre;
        }
    }
    protected void btnAceptar_Click(object sender, ImageClickEventArgs e)
    {
                
        if (admin != null)
        {
            if (this.admin.Contrasenia == CrypterClassLib.DESCrypter.Encriptar(txtContraseniaAnt.Text,"*Diseno*"))
            {
                if (txtContraseniaNueva.Text == txtContraseniaConfirm.Text)
                {
                    this.admin.Nombre = this.txtNombres.Text;
                    this.admin.Contrasenia = this.txtContraseniaConfirm.Text;
                    FuncionalidadClassLib.ManejadorAdmin.modificar(this.admin,((AccesoDatos.AccesoDatos)Session["datos"]).ds.Tables["administradores"]);
                    ((AccesoDatos.AccesoDatos)Session["datos"]).Conectar();
                    ((AccesoDatos.AccesoDatos)Session["datos"]).ActualizarBD();
                    ((AccesoDatos.AccesoDatos)Session["datos"]).Desconectar();
                    Session["UserName"] = this.admin.Nombre;
                    Response.Redirect("default.aspx");
                }
            }

        }
    }
}