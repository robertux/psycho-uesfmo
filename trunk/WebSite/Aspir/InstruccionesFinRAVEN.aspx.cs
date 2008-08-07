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

public partial class Aspir_Fin_Raven : System.Web.UI.Page
{
    public Aspir_Fin_Raven()
    {
        this.Load += new EventHandler(PageLoad);
    }
    protected void PageLoad(object sender, EventArgs e)
    {
        if ((string)Session["UserType"] != "Aspir")            
            Response.Redirect("../NoAccess.aspx");
    }

}
