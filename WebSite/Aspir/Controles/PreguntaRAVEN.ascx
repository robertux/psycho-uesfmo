<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PreguntaRAVEN.ascx.cs" Inherits="Controles_PreguntaRAVEN" %>
<table border="0" cellpadding="0" cellspacing="4"> 
    <tr>
        <td align="left" style="width: 211px"><font face="verdana" color="black" size="2"><b>Nombre del aspirante</b></font></td><td align="left" style="width: 349px">
            <font face="verdana" size="2"><asp:Label ID="lblNombre" runat="server" Text="Corleto Meléndez, Ana del Carmen"></asp:Label></font></td>
    </tr>
    <tr>
        <td align="left" style="width: 211px; height: 16px;"><font face="verdana" color="black" size="2"><b>Tiempo transcurrido</b></font></td><td align="left" style="width: 349px; height: 16px;"><font face="verdana" size="2">
            <asp:Label ID="lblTiempoTrans" runat="server" Text="15 minutos"></asp:Label></font></td>
    </tr>
    <tr>
        <td align="left" style="width: 211px; height: 19px;"><font face="verdana" color="black" size="2"><b>Tiempo restante</b></font></td><td align="left" style="width: 349px; height: 19px;">
            <font face="verdana" size="2"><asp:Label ID="lblTiempoRes" runat="server" Text="45 minutos"></asp:Label></font></td>
    </tr>
    <tr>
        <td align="left" style="width: 211px"><font face="verdana" color="black" size="2"><b>Número de pregunta</b></font></td><td align="left" style="width: 349px;"><font face="verdana" size="2">
            <asp:Label ID="lblNumPregunta" runat="server" Text="10"></asp:Label></font></td>
    </tr>
    <tr>
        <td align="left" style="width: 211px"><font face="verdana" color="black" size="2"><b>Imagen y Posibles Respuesas</b></font></td><td align="left" style="width: 349px;"><font face="verdana" size="2">
            </td>
    </tr>
    <tr>
        <td colspan="2" align="center">            
            <asp:Image ID="imgPregunta" ImageUrl="~/Aspir/Recursos/RAVEN/60.jpg" runat="server" />
        </td>
    </tr>
    <tr>
        <td align="left"><br /><br /><font face="verdana" color="black" size="2"><b>Seleccione la respuesta que considere correcta</b></font></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <asp:RadioButtonList ID="rblOpciones" runat="server" RepeatColumns="3" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large" Width="331px" RepeatDirection="Horizontal">
                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                <asp:ListItem Text="6" Value="6"></asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <br />
        </td>
    </tr>
    <tr>
        <td style="width: 211px"></td>
        <td>
            <asp:ImageButton ID="btnSiguiente" ImageUrl="../Recursos/BtnSiguiente.png" runat="server" OnClick="btnSiguiente_Click" />
            <asp:ImageButton ID="btnFinalizar" ImageUrl="../Recursos/BtnFinalizar.png" Visible="false" runat="server" OnClick="btnFinalizar_Click" />
        </td>
    </tr>
</table>
