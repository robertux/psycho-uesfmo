<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Perfil.aspx.cs" Inherits="Admin_Perfil" Title="Psycho v1.2" %>

<%@ Register Src="Controles/PerfilAdminEdit.ascx" TagName="PerfilAdminEdit" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido1" Runat="Server">
<br>
<br>
<table border="0" cellpadding="0" cellspacing="0" width="600">
    <tr>
        <td><img src="Recursos/PerfilAdm.png" /></td>
    </tr>
    <tr>
        <td background="../Recursos/ContenidoTabla.png">
        <br>
            <uc1:PerfilAdminEdit ID="PerfilAdminEdit1" runat="server" />
        <br>
        </td>
    </tr>
</table>
<br />
<br />
<div align =right><asp:ImageButton ID="btnRegresar" runat="server" ImageUrl="../Recursos/BtnRegresar.png"
        PostBackUrl="~/Admin/Default.aspx" />&nbsp; &nbsp;</div><br />
</asp:Content>

