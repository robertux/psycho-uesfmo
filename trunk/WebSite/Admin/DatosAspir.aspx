<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="DatosAspir.aspx.cs" Inherits="Admin_DatosAspir" Title="Psycho v1.2" %>
<%@ Register Src="Controles/DatosAspir.ascx" TagName="DatosAspir" TagPrefix="uc1" %>
<%@ Register Src="Controles/DiagnosticoAspir.ascx" TagName="DiagnosticoAspir" tagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido1" Runat="Server">
<br />
<table border="0" cellpadding="0" cellspacing="0" width="600">
    <tr>
        <td background="Recursos/DatosAspir.png" style="height: 30px">
            
        </td>
    </tr>
    <tr>
        <td background="../Recursos/ContenidoTabla.png" style="height: 330px">
            <br>
            <uc1:DatosAspir ID="AgregarAspir1" runat="server" />
            <br>            
        </td>
    </tr>
    <tr>
        <td>
            <br />
            <br />
        </td>
    </tr>
    <tr>
        <td background="Recursos/DiagnosticoAspirante.png" style="height: 30px">
            
        </td>
    </tr>
    <tr>
        <td background="../Recursos/ContenidoTabla.png">
        <br />
            <uc1:DiagnosticoAspir ID="DiagnosticoAspir1" runat="server" />        
        <br />
        </td>
    </tr>
</table>
<br />
<div align =right><asp:ImageButton ID="btnRegresar" runat="server" ImageUrl="../Recursos/BtnRegresar.png"
        PostBackUrl="~/Admin/ConsultarAspir.aspx" />&nbsp; &nbsp;</div><br />
</asp:Content>

