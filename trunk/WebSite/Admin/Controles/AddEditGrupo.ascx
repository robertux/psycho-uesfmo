<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddEditGrupo.ascx.cs" Inherits="Admin_Controles_AddEditGrupo" %>
<%@ Register Src="~/Admin/Controles/ListaAspir.ascx" TagName="ListaAspir" TagPrefix="uc1" %>
<table border="0" cellpadding="0" cellspacing="4"> 
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Codigo</b></font></td><td align="left" style="width: 349px"><font face="verdana" size="2">
            <asp:TextBox ID="txtCodigo" runat="server" Width="110px" Enabled="False"></asp:TextBox></font></td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Fecha de Realización</b></font></td><td align="left" style="width: 349px;">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td align="left" style="height: 19px">
                    <asp:LinkButton ID="lnkAnioAnt" runat="server" Font-Names="Verdana" Font-Size="Small"
                        ForeColor="OliveDrab" OnClick="lnkAnioAnt_Click">LinkButton</asp:LinkButton>
                </td>
                <td align="right" style="height: 19px">
                    <asp:LinkButton ID="lnkAnioSig" runat="server" Font-Names="Verdana" Font-Size="Small"
                        ForeColor="OliveDrab" OnClick="lnkAnioSig_Click">LinkButton</asp:LinkButton></td>
            </tr>
            <tr>
                <td colspan="2">
                    <font face="verdana" size="2">
                    <asp:Calendar ID="calFechRealizacion" runat="server"
                            BackColor="#E1EFE2" OnSelectionChanged="calFechRealizacion_SelectionChanged" OnVisibleMonthChanged="calFechRealizacion_VisibleMonthChanged">
                            <TodayDayStyle BackColor="#BAD9B7" />
                            <DayStyle BorderColor="#BAD9B7" BorderStyle="Solid" BorderWidth="1px" />
                            <DayHeaderStyle BackColor="#BAD9B7" />
                            <TitleStyle BackColor="#A7BE85" />
                        </asp:Calendar>
                        </font>
                </td>
            </tr>
        </table>
        </td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Hora de Realización</b></font></td><td align="left" style="width: 349px;"><font face="verdana" size="2">
            <asp:DropDownList ID="cmbHoras" runat="server">
                <asp:ListItem Value="06">06 a.m.</asp:ListItem>
                <asp:ListItem Value="07">07 a.m.</asp:ListItem>
                <asp:ListItem Value="08">08 a.m.</asp:ListItem>
                <asp:ListItem Value="09">09 a.m.</asp:ListItem>
                <asp:ListItem Value="10">10 a.m.</asp:ListItem>
                <asp:ListItem Value="11">11 a.m.</asp:ListItem>
                <asp:ListItem Value="12">12 a.m.</asp:ListItem>
                <asp:ListItem Value="13">01 p.m.</asp:ListItem>
                <asp:ListItem Value="14">02 p.m.</asp:ListItem>
                <asp:ListItem Value="15">03 p.m.</asp:ListItem>
                <asp:ListItem Value="16">04 p.m.</asp:ListItem>
                <asp:ListItem Value="17">05 p.m.</asp:ListItem>
                <asp:ListItem Value="18">06 p.m.</asp:ListItem>
                <asp:ListItem Value="19">07 p.m.</asp:ListItem>
                <asp:ListItem Value="20">08 p.m.</asp:ListItem>
            </asp:DropDownList>
            horas &nbsp; &nbsp;<asp:DropDownList ID="cmbMinutos" runat="server">
            </asp:DropDownList>
            minutos</font></td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px; height: 22px;"><font face="verdana" color="black" size="2"><b>Centro de Cómputo</b></font></td><td align="left" style="width: 349px; height: 22px;"><font face="verdana" size="2">
            <asp:DropDownList ID="cmbCentroComputo" runat="server" Width="348px" AutoPostBack="True" OnSelectedIndexChanged="cmbCentroComputo_SelectedIndexChanged">
            </asp:DropDownList></font></td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 211px"><font face="verdana" color="black" size="2"><b>Examinador</b></font></td><td align="left" style="width: 349px;"><font face="verdana" size="2">
            <asp:TextBox ID="txtExaminador" runat="server" Width="348px" AutoPostBack="True" OnTextChanged="txtExaminador_TextChanged" MaxLength="60"></asp:TextBox>
            <br /><asp:Label ID="lblExaminadorReq" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="Small"
                ForeColor="Red" Text="Debe agregar un examinador" Visible="False"></asp:Label></font></td>
    </tr>
    <tr>
        <td colspan="2" align="left">
            <font face="verdana" color="black" size="2"><b>Aspirantes:</b></font>
            <br />
            <br />
            <uc1:ListaAspir id="ListaAspirGrupo1" runat="server" ShowFilters="false" GrpCode="GrpTemp"/>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <table border="0" cellpadding="0" cellspacing="5">
                <tr>
                    <td>
                        <asp:ImageButton ID="btnAgregarAspirGrupo" runat="server" ImageUrl="../Recursos/BtnAgregarAspirAGrupo.png" OnClick="btnAgregarAspirGrupo_Click" /></td>
                    <td>
                        <asp:ImageButton ID="btnEliminarAspirGrupo" runat="server" ImageUrl="../Recursos/BtnEliminarAspirDeGrupo.png" OnClick="btnEliminarAspirGrupo_Click"/></td>                        
                    </tr>
                </table>
        </td>
    </tr>    
    <tr>
        <td></td>
        <td align="center" valign="top" style="width: 349px"><br>
            <asp:ImageButton ID="btnAceptar" ImageUrl="../Recursos/BtnAceptar2.png" runat="server" OnClick="btnAceptar_Click" /></td>
    </tr>
</table>