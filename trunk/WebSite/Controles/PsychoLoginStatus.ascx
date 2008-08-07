<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PsychoLoginStatus.ascx.cs" Inherits="Controles_PsychoLoginStatus" %>
<asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Italic="False" Font-Names="Tahoma"
    Text="Usuario:"></asp:Label>&nbsp;
<asp:Label ID="lblUser" runat="server" Font-Bold="False" Font-Italic="False" Font-Names="Tahoma"
    Text="Desconocido"></asp:Label><br />
<asp:LinkButton ID="lnkCerrarSesion" runat="server" Font-Italic="True" Font-Names="Arial"
    Font-Size="Small" ForeColor="OliveDrab" OnClick="lnkCerrarSesion_Click">Cerrar Sesión</asp:LinkButton>
