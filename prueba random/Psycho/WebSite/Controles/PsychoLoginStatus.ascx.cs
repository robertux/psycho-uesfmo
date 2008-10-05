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

public partial class Controles_PsychoLoginStatus : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.lblUser.Text = (string)Session["UserName"] != null ? (string)Session["UserName"] : this.lblUser.Text;
    }
    protected void lnkCerrarSesion_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();        
        Response.Redirect("../Default.aspx");
    }
}
