<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProgramacionPruebaR.ascx.cs" Inherits="Controles_ProgramacionPruebaR" %>


<table border="0" cellspacing="4">
<tr bgcolor="#99ccff"><td><b><font face="Verdana" size="2">Fecha</font></b></td><td align="left"><font face="Verdana" size="2"><asp:Label ID="lblfecha" runat="server"></asp:Label></font></td></tr>
<tr bgcolor="#99ccff"><td><b><font face="Verdana" size="2">Hora</font></b></td><td align="left"><font face="Verdana" size="2"><asp:Label ID="lblhora" runat="server"></asp:Label></font></td></tr>
<tr bgcolor="#99ccff"><td><b><font face="Verdana" size="2">Lugar</font></b></td><td align="left"><font face="Verdana" size="2"><asp:Label ID="lbllugar" runat="server"></asp:Label></font></td></tr>                
<tr><td colspan="2" align="right" bgcolor="#99ccff">
    <asp:ImageButton ID="btnRealizar" runat="server" ImageUrl="~/Aspir/Recursos/BtnRealizar.png"
        PostBackUrl="~/Aspir/InstruccionesInicioRAVEN.aspx" /></td></tr>
</table>