<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DiagnosticoAspir.ascx.cs" Inherits="Admin_Controles_DiagnosticoAspir" %>
<table border="0" cellpadding="0" cellspacing="4" id="tblRaven" runat="server"> 
    <tr>
        <td colspan="2" align="center" style="height: 19px">
            <font face="verdana"><b>Resultados de la Prueba de Conocimientos</b><br /></font>            
        </td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Consistencia</b></font></td><td align="left" style="width: 349px"><font face="verdana" size="2">
            <asp:Label ID="lblConsistencia" runat="server" Text="Label"></asp:Label></font></td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px; height: 15px;"><font face="verdana" color="black" size="2"><b>Percentil</b></font></td><td align="left" style="width: 349px; height: 15px;"><font face="verdana" size="2">
            <asp:Label ID="lblPercentil" runat="server" Text="Label"></asp:Label></font></td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px; height: 17px;"><font face="verdana" color="black" size="2"><b>Diagnóstico</b></font></td><td align="left" style="width: 349px; height: 17px;"><font face="verdana" size="2">
            <asp:Label ID="lblDiagnosticoRaven" runat="server" Text="Label"></asp:Label></font></td>
    </tr>
        <tr>
        <td align="left" valign="top" style="width: 211px; height: 15px;"><font face="verdana" color="black" size="2"><b>Puntaje</b></font></td><td align="left" style="width: 349px; height: 15px;"><font face="verdana" size="2">
            <asp:Label ID="lblPuntaje" runat="server" Text="Label"></asp:Label></font></td>
    </tr>
</table>
<br /><br />
<table border="0" cellpadding="0" cellspacing="4" id="tblCeps" runat="server"> 
    <tr>
        <td colspan="2" align="center">
            <font face="verdana"><b>Resultados de la Prueba de Personalidad</b></font><br /></td>            
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Control emocional</b></font></td><td align="left" style="width: 349px"><font face="verdana" size="2">
            <asp:Label ID="lblControl" runat="server" Text="Label"></asp:Label></font></td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Capacidad de decisión</b></font></td><td align="left" style="width: 349px;"><font face="verdana" size="2">
            <asp:Label ID="lblDecision" runat="server" Text="Label"></asp:Label></font></td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Extroversión</b></font></td><td align="left" style="width: 349px;"><font face="verdana" size="2">
            <asp:Label ID="lblExtroversion" runat="server" Text="Label"></asp:Label></font></td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Paranoidismo</b></font></td><td align="left" style="width: 349px;"><font face="verdana" size="2">
            <asp:Label ID="lblParanoidismo" runat="server" Text="Label"></asp:Label></font></td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Sinceridad</b></font></td><td align="left" style="width: 349px;"><font face="verdana" size="2">
            <asp:Label ID="lblSinceridad" runat="server" Text="Label"></asp:Label></font></td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Diagnóstico</b></font></td><td align="left" style="width: 349px;"><font face="verdana" size="2">
            <asp:Label ID="lblDiagnosticoCeps" runat="server" Text="Label"></asp:Label></font></td>
    </tr>
</table>
<br />
<table border="0" cellpadding="3" cellspacing="3" id="tblResultado" runat="server">
    <tr>
        <td>
            <asp:Label ID="lblResultado" runat="server" Font-Bold="True" Font-Names="Verdana" Text="Resultado final:"></asp:Label>&nbsp;
            &nbsp;<asp:DropDownList ID="cmbResultadoOpcion" runat="server" Width="165px">
                <asp:ListItem Value="apto">Apto</asp:ListItem>
                <asp:ListItem Value="noapto">No Apto</asp:ListItem>
            </asp:DropDownList>
            <asp:Image ID="ImgResultado" runat="server" ImageUrl="~/Admin/Recursos/BtnApto.png" />
            &nbsp;
            <asp:ImageButton ID="btnAsignar" runat="server" ImageUrl="~/Admin/Recursos/BtnAsignar.png" OnClick="btnAsignar_Click" />
        </td>
    </tr>
</table>
<br />
<br />
<br />
