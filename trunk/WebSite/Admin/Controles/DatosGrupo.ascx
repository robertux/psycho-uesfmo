<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DatosGrupo.ascx.cs" Inherits="Admin_Controles_DatosGrupo" %>
<%@ Register Src="~/Admin/Controles/ListaAspir.ascx" TagName="ListaAspir" TagPrefix="uc1" %>
<table border="0" cellpadding="0" cellspacing="4"> 
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Codigo</b></font></td><td align="left" style="width: 349px"><font face="verdana" size="2">
            <asp:Label ID="lblCodigo" runat="server" Text="Label"></asp:Label></font></td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Fecha de Realización</b></font></td><td align="left" style="width: 349px;"><font face="verdana" size="2">
            <asp:Label ID="lblFechaRealizacion" runat="server" Text="Label"></asp:Label></font></td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Hora de Realización</b></font></td><td align="left" style="width: 349px;"><font face="verdana" size="2">
            <asp:Label ID="lblHoraRealizacion" runat="server" Text="Label"></asp:Label></font></td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px; height: 17px;"><font face="verdana" color="black" size="2"><b>Centro de Cómputo</b></font></td><td align="left" style="width: 349px; height: 17px;"><font face="verdana" size="2">
            <asp:Label ID="lblCentroComputo" runat="server" Text="Label"></asp:Label></font></td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Examinador</b></font></td><td align="left" style="width: 349px;"><font face="verdana" size="2">
            <asp:Label ID="lblExaminador" runat="server" Text="Label"></asp:Label></font></td>
    </tr> 
    <tr>
        <td colspan="2" align="left">
            <font face="verdana" color="black" size="2"><b>Aspirantes:</b></font>
            <br />
            <br />
            <uc1:ListaAspir id="ListaAspirGrupo1" runat="server" ShowFilters="false"/>            
        </td>
    </tr>   
</table>
<br />

