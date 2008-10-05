using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    public void Page_Load()
    {
        if (Session["UserType"] != null)
        {
            if (Session["UserType"] == "Admin")
                Response.Redirect("Admin/Default.aspx");
            if (Session["UserType"] == "Aspir")
                Response.Redirect("Aspir/Default.aspx");
        }
        Session.Timeout = 180;
        this.Login1.Authenticate += new AuthenticateEventHandler(Login1Auth);                
    }

    void Login1Auth(object sender, AuthenticateEventArgs e)
    {
        AccesoDatos.AccesoDatos datos;
        datos = new AccesoDatos.AccesoDatos(this.Server.MapPath("~/Bin/AccesoDatos.config"));
        datos.RellenarDS();
        FuncionalidadClassLib.Administrador ad = FuncionalidadClassLib.ManejadorAdmin.Exisadmin(Login1.UserName, Login1.Password, datos.ds.Tables["Administradores"]);
        //if (FuncionalidadClassLib.ManejadorAdmin.Exisadmin(Login1.UserName,Login1.Password,datos.ds.Tables["Administradores"])!=null)
        //{
        //    Session.Add("UserType", "Aspir");
        //    Session.Add("UserName", Login1.UserName);
        //    Session.Add("UserPriv", "None");
        //    Session.Add("datos", datos);
        //    this.Login1.DestinationPageUrl = "~/Aspir/Default.aspx";
        //    e.Authenticated = true;
        //}

        if ((ad) != null)
        {
            Session.Add("codigo", ad.Codigo);

            Session.Add("UserType", "Admin");
            Session.Add("UserName", Login1.UserName);
            Session.Add("UserPriv", ad.Privilegio);
            Session.Add("datos", datos);
            this.Login1.DestinationPageUrl = "~/Admin/Default.aspx";
            //this.Login1.DestinationPageUrl = "Bridge.htm?target=Admin/Default.aspx";            
            e.Authenticated = true;
        }
        else
        {
            FuncionalidadClassLib.Aspirante ap = FuncionalidadClassLib.manejadorAspirante.GetAspirante(Login1.UserName, datos.ds);
            if (ap != null && Login1.UserName == ap.Codigo && Login1.Password == ap.Codigo)
            {
                Session.Add("codigo", ap.Codigo);
                Session.Add("UserType", "Aspir");
                Session.Add("UserName", ap.Nombres);
                Session.Add("datos", datos);
                this.Login1.DestinationPageUrl = "~/Aspir/Default.aspx";
                e.Authenticated = true;
            }
        }
    }
}
