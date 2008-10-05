<%@ Page Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="AgregarAspir.aspx.cs" Inherits="Admin_AgregarAspir" Title="Psycho v1.2" %>

<%@ Register Src="Controles/AddEditAspir.ascx" TagName="AddEditAspir" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido1" Runat="Server">
<br />
<table border="0" cellpadding="0" cellspacing="0" width="600">
    <tr>
        <td background="Recursos/AgregarAspir.png" style="height: 30px">
            
        </td>
    </tr>
    <tr>
        <td background="../Recursos/ContenidoTabla.png">
            <br>
            <uc1:AddEditAspir ID="AgregarAspir1" runat="server" />            
            <br>
        </td>
    </tr>
</table>
<br />
<div align =right><asp:ImageButton ID="btnRegresar" runat="server" ImageUrl="../Recursos/BtnRegresar.png"
        PostBackUrl="~/Admin/ConsultarAspir.aspx" />&nbsp; &nbsp;</div><br />
</asp:Content>

