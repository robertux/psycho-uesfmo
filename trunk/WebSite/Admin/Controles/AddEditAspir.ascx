<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddEditAspir.ascx.cs" Inherits="Admin_Controles_AddEditAspir" %>
<table border="0" cellpadding="0" cellspacing="4"> 
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Codigo</b></font></td><td align="left" style="width: 349px"><font face="verdana" size="2">
            <asp:TextBox ID="tx_tCodigo" runat="server" Width="110px" Enabled="false"></asp:TextBox></font></td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Nombres</b></font></td><td align="left" style="width: 349px;"><font face="verdana" size="2">
            <asp:TextBox ID="txtNombres" runat="server" Width="348px" OnTextChanged="txtNombres_TextChanged" MaxLength="50"></asp:TextBox>&nbsp;<br /><asp:Label
                ID="lblNombresReq" runat="server" Font-Names="Verdana" ForeColor="Red" Text="Debe escribir los nombres" Font-Bold="False" Visible="False"></asp:Label>
        </font></td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Apellidos</b></font></td><td align="left" style="width: 349px;"><font face="verdana" size="2">
            <asp:TextBox ID="txtApellidos" runat="server" Width="348px" OnTextChanged="txtApellidos_TextChanged" AutoPostBack="True" MaxLength="50"></asp:TextBox>
            <br /><asp:Label ID="lblApellidosReq" runat="server" Font-Names="Verdana" ForeColor="Red"
                Text="Debe escribir los apellidos" Font-Bold="False" Visible="False"></asp:Label></font></td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Dirección</b></font></td><td align="left" style="width: 349px;"><font face="verdana" size="2">
            <asp:TextBox ID="txtDireccion" runat="server" TextMode="MultiLine" Width="347px" Rows="4" MaxLength="200"></asp:TextBox>
            <br /><asp:Label ID="lblDireccionReq" runat="server" Font-Names="Verdana" ForeColor="Red"
                Text="Debe escribir una dirección" Font-Bold="False" Visible="False"></asp:Label>
            </font></td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Teléfono</b></font></td><td align="left" style="width: 349px;"><font face="verdana" size="2">
            <asp:TextBox ID="txtTelefono" runat="server" Width="103px" MaxLength="9"></asp:TextBox>&nbsp;<br /><asp:Label
                ID="lblTelefonoReq" runat="server" Font-Names="Verdana" ForeColor="Red" Text="Debe escribir un telefono" Font-Bold="False" Visible="False"></asp:Label></font></td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px; height: 22px;"><font face="verdana" color="black" size="2"><b>Lugar de estudios</b></font></td><td align="left" style="width: 349px; height: 22px;"><font face="verdana" size="2">
            <asp:DropDownList ID="cmbLugarEstudios" runat="server" Width="347px" AutoPostBack="True">
            </asp:DropDownList></font></td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px; height: 24px;"><font face="verdana" color="black" size="2"><b>Departamento</b></font></td><td align="left" style="width: 349px; height: 24px;"><font face="verdana" size="2">
            <asp:DropDownList ID="cmdDepartamento" runat="server" Width="348px" AutoPostBack="True" OnSelectedIndexChanged="cmdDepartamento_SelectedIndexChanged">
            </asp:DropDownList></font></td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Ciudad</b></font></td><td align="left" style="width: 349px;"><font face="verdana" size="2">
            <asp:DropDownList ID="cmbCiudad" runat="server" Width="348px" AutoPostBack="True">
            </asp:DropDownList></font></td>
    </tr>    
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Año de aprobación</b></font></td><td align="left" style="width: 349px;"><font face="verdana" size="2">
            <asp:DropDownList ID="cmbAnioAprobacion" runat="server" Width="176px">
            </asp:DropDownList></font></td>
    </tr>
    <tr>
        <td align="left" valign="Top" style="width: 211px; height: 22px;"><font face="verdana" color="black" size="2"><b>Facultad:</b></font></td><td align="left" style="width: 349px; height: 22px;"><font face="verdana" size="2">
            <asp:DropDownList ID="cmbFacultadCarrera" runat="server" Width="348px" AutoPostBack="True" OnSelectedIndexChanged="cmbFacultadCarrera_SelectedIndexChanged">
            </asp:DropDownList></font></td>
    </tr>    
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Carrera</b></font></td><td align="left" style="width: 349px;"><font face="verdana" size="2">
            <asp:DropDownList ID="cmbCarrera" runat="server" Width="348px" AutoPostBack="True">
            </asp:DropDownList></font></td>
    </tr>    
    <tr>
        <td align="left" valign="top" style="width: 211px; height: 45px;"><font face="verdana" color="black" size="2"><b>Sexo</b></font></td><td align="left" style="width: 349px; height: 45px;"><font face="verdana" size="2">
            <asp:RadioButtonList ID="rblSexo" runat="server" Font-Size="X-Small" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True" Value="M">Masculino</asp:ListItem>
                <asp:ListItem Value="F">Femenino</asp:ListItem>
            </asp:RadioButtonList></font></td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Fecha de nacimiento</b></font></td>
        <td align="left" style="width: 349px;">
        <table border="0" cellpadding="3" cellspacing="3">
        <tr>
            <td align="left">
                <asp:LinkButton ID="lnkAnioAnt" runat="server" Font-Names="Verdana" Font-Size="Small" ForeColor="OliveDrab" OnClick="lnkAnioAnt_Click">LinkButton</asp:LinkButton>
            </td>
            <td align="right">
                <asp:LinkButton ID="lnkAnioSig" runat="server" Font-Names="Verdana" Font-Size="Small" ForeColor="OliveDrab" OnClick="lnkAnioSig_Click">LinkButton</asp:LinkButton>
            </td>
        </tr>
        <tr> 
            <td colspan="2">
        <font face="verdana" size="2">
            <asp:Calendar ID="calFechaNac" runat="server" BackColor="#E1EFE2" EnableTheming="True" OnVisibleMonthChanged="calFechaNac_VisibleMonthChanged">
                <TodayDayStyle BackColor="#BAD9B7" />
                <DayStyle BorderColor="#BAD9B7" BorderStyle="Solid" BorderWidth="1px" />
                <DayHeaderStyle BackColor="#BAD9B7" />
                <TitleStyle BackColor="#A7BE85" />
            </asp:Calendar>
            </font>
            </td>       
        </tr>
            </table>
            &nbsp;
            </td>
    </tr>    
    <tr>
        <td></td>
        <td align="center" valign="top" style="width: 349px"><br>
            <asp:ImageButton ID="btnAceptar" ImageUrl="../Recursos/BtnAceptar2.png" runat="server" OnClick="btnAceptar_Click" /></td>
    </tr>
</table>