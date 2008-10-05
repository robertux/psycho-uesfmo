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

public partial class Admin_Default : System.Web.UI.Page
{
    public Admin_Default()
    {        
        this.Load += new EventHandler(PageLoad);
    }

    protected void PageLoad(object sender, EventArgs e)
    {
        if ((string)Session["UserType"] != "Admin")
            Response.Redirect("../NoAccess.aspx");
        if ((string)Session["UserPriv"] != "MDT")
            this.btnConsultarAdmin.Visible = false;
    }
}
