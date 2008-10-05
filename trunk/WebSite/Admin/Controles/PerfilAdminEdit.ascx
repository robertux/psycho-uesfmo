<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PerfilAdminEdit.ascx.cs" Inherits="Admin_Controles_PerfilAdminEdit" %>
<table border="0" cellpadding="0" cellspacing="4"> 
    <tr>
        <td align="left" style="width: 211px"><font face="verdana" color="black" size="2"><b>Nombre</b></font></td><td align="left" style="width: 349px"><font face="verdana" size="2">
            <asp:TextBox ID="txtNombres" runat="server" Width="346px" MaxLength="80"></asp:TextBox></font></td>
    </tr>
    <tr>
        <td align="left" style="width: 211px"><font face="verdana" color="black" size="2"><b>Contraseña anterior</b></font></td><td align="left" style="width: 349px;"><font face="verdana" size="2">
            <asp:TextBox ID="txtContraseniaAnt" runat="server" TextMode="Password" Width="200px" MaxLength="45"></asp:TextBox></font></td>
    </tr>
    <tr>
        <td align="left" style="width: 211px"><font face="verdana" color="black" size="2"><b>Contraseña nueva</b></font></td><td align="left" style="width: 349px;"><font face="verdana" size="2">
            <asp:TextBox ID="txtContraseniaNueva" runat="server" TextMode="Password" Width="200px" MaxLength="45"></asp:TextBox></font></td>
    </tr>
    <tr>
        <td align="left" style="width: 211px"><font face="verdana" color="black" size="2"><b>Confirmar Contraseña</b></font></td><td align="left" style="width: 349px;"><font face="verdana" size="2">
            <asp:TextBox ID="txtContraseniaConfirm" runat="server" TextMode="Password" Width="200px" MaxLength="45"></asp:TextBox></font></td>
    </tr>
    <tr>
        <td></td>
        <td align="center" style="width: 211px"><br>
            <asp:ImageButton ID="btnAceptar" ImageUrl="../Recursos/BtnAceptar2.png" runat="server" OnClick="btnAceptar_Click" /></td>
    </tr>
</table>