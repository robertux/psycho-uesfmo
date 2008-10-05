<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PerfilAdmin.ascx.cs" Inherits="Controles_PerfilAdmin" %>

<table border="0" cellpadding="0" cellspacing="4" width="650px"> 
    <tr>
        <td align="left" style="width: 211px; height: 18px;"><font face="verdana" color="black" size="2"><b>Código</b></font></td><td align="left" style="width: 349px; height: 18px;">
            <asp:Label ID="lblCodigo" runat="server" Font-Names="Verdana" Font-Size="Small" Text="0000001"></asp:Label></td>
    </tr>
    <tr>
        <td align="left" style="width: 211px; height: 18px;"><font face="verdana" color="black" size="2"><b>Nombre</b></font></td><td align="left" style="width: 349px; height: 18px;">
            <asp:Label ID="lblNombre" runat="server" Font-Names="Verdana" Font-Size="Small"
                Text="Gustavo Ernesto Linares Herrera"></asp:Label></td>
    </tr>
    <tr>
        <td align="left" style="width: 211px; height: 16px;"><font face="verdana" color="black" size="2"><b>Privilegio</b></font></td><td align="left" style="width: 349px; height: 16px;"><font face="verdana" size="2">
            <asp:Label ID="lblPrivilegio" runat="server" Font-Names="Verdana" Font-Size="Small"
                Text="Administrador general"></asp:Label></font></td>
    </tr>
</table>
