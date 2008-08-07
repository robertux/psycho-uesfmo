<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ModificarGrupo.aspx.cs" Inherits="Admin_ModificarGrupo" Title="Psycho v1.2" %>
<%@ Register Src="~/Admin/Controles/ListaAspir.ascx" TagName="ListaAspirGrupo" TagPrefix="uc1" %>
<%@ Register Src="Controles/AddEditGrupo.ascx" TagName="AddEditGrupo" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido1" Runat="Server">
<br />
<table border="0" cellpadding="0" cellspacing="0" width="600">
    <tr>
        <td background="Recursos/ModificarGrupo.png" style="height: 30px">
            
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
<div align =right><asp:ImageButton ID="btnRegresar" runat="server" ImageUrl="../Recursos/BtnRegresar.png" OnClick="btnRegresar_Click" />&nbsp; &nbsp;</div><br />
</asp:Content>

