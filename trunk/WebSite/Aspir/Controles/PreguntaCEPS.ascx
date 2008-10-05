<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PreguntaCEPS.ascx.cs" Inherits="Controles_PreguntaCEPS" %>

<table border="0" cellpadding="0" cellspacing="4"> 
    <tr>
        <td align="left" style="width: 211px"><font face="verdana" color="black" size="2"><b>Nombre del aspirante</b></font></td><td align="left" style="width: 349px">
            <font face="verdana" size="2"><asp:Label ID="lblNombre" runat="server" Text="Corleto Meléndez, Ana del Carmen"></asp:Label></font></td>
    </tr>    
    <tr>
        <td align="left" style="width: 211px"><font face="verdana" color="black" size="2"><b>Número de pregunta</b></font></td><td align="left" style="width: 349px;"><font face="verdana" size="2">
            <asp:Label ID="lblNumPregunta" runat="server" Text="10"></asp:Label></font></td>
    </tr>
    <tr>
        <td align="left" style="width: 211px"><font face="verdana" color="black" size="2"><b>Pregunta</b></font></td><td align="left" style="width: 349px;">
            </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <asp:Label ID="lblPregunta" runat="server" Text="¿Le es fácil hacer nuevas amistades?" Font-Bold="True" Font-Names="Verdana" Font-Size="Medium"></asp:Label></td>
    </tr>
    <tr>
        <td align="left"><br /><font face="verdana" color="black" size="2"><b>Seleccione la respuesta que considere correcta</b></font></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="2" align="center" valign="middle">
            <br />
            <asp:RadioButtonList ID="rblOpciones" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large" Width="112px" RepeatDirection="Horizontal" Height="32px">
                <asp:ListItem Text="Si" Value="1"></asp:ListItem>
                <asp:ListItem Text="No" Value="3"></asp:ListItem>
                <asp:ListItem Text="?" Value="2"></asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <br />
        </td>
    </tr>
    <tr>
        <td style="width: 211px"></td>
        <td align="right"> 
            <asp:ImageButton ID="btnSiguiente" ImageUrl="../Recursos/BtnSiguiente.png" runat="server" OnClick="btnSiguiente_Click" />
            <asp:ImageButton ID="btnFinalizar" ImageUrl="../Recursos/BtnFinalizar.png" Visible="false" runat="server" OnClick="btnFinalizar_Click"/>
        </td>
    </tr>
</table>
