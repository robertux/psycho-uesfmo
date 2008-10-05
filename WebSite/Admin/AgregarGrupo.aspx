<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AgregarGrupo.aspx.cs" Inherits="Admin_AgregarGrupo" Title="Psycho v1.2" %>

<%@ Register Src="Controles/AddEditGrupo.ascx" TagName="AddEditGrupo" TagPrefix="uc2" %>

<%@ Register Src="Controles/AddEditAspir.ascx" TagName="AddEditAspir" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido1" Runat="Server">
<br />
<table border="0" cellpadding="0" cellspacing="0" width="600">
    <tr>
        <td background="Recursos/AgregarGrupo.png" style="height: 30px">
            
        </td>
    </tr>
    <tr>
        <td background="../Recursos/ContenidoTabla.png">
            <br>
            <uc2:AddEditGrupo ID="AddEditGrupo1" runat="server" />
            &nbsp;<br>
        </td>
    </tr>
</table>
<br />
<div align =right><asp:ImageButton ID="btnRegresar" runat="server" ImageUrl="../Recursos/BtnRegresar.png"
        PostBackUrl="~/Admin/ConsultarGrupos.aspx" />&nbsp; &nbsp;</div><br />
</asp:Content>

