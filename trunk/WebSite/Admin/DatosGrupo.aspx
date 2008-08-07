<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="DatosGrupo.aspx.cs" Inherits="Admin_DatosGrupo" Title="Psycho v1.2" %>
<%@ Register Src="~/Admin/Controles/DatosGrupo.ascx" TagName="DatosGrupo" TagPrefix="uc1" %>

<%@ Register Src="~/Admin/Controles/ListaAspir.ascx" TagName="ListaAspirantes" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido1" Runat="Server">
<br/>
    <table border="0" cellpadding="0" cellspacing="0" width="600">
        <tr>
            <td><img src="Recursos/DatosGrupo.png" /></td>
        </tr>
        <tr>
            <td background="../Recursos/ContenidoTabla.png" align="center">                
                <br />
                <uc1:DatosGrupo ID="DatosGrupo1" runat="server" />               
            </td>
        </tr>       
    </table>    
    <br />
    <br />
    <div align ="right"><asp:ImageButton ID="btnRegresar" runat="server" ImageUrl="../Recursos/BtnRegresar.png"
        PostBackUrl="~/Admin/ConsultarGrupos.aspx" />&nbsp; &nbsp;</div>
        <br />
</asp:Content>

