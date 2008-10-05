<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ListaGrupos.ascx.cs" Inherits="Admin_Controles_ListaGrupos" %>
<%@ Register Namespace="MsdnMag.CuttingEdge.Controls" TagPrefix="x" Assembly="HotGridView" %>

<table border="0" cellpadding="3" cellspacing="3" id="tblFiltros" runat="server" style="width: 570px">
    <tr>
        <td align="left" style="width: 172px">
            <font face="verdana" size="2">Año:</font>
        </td>
        <td align="left"><font face="verdana" size="2">
            <asp:DropDownList ID="cmbAnio" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cmbAnio_SelectedIndexChanged" Width="153px">
            </asp:DropDownList></font>
        </td>
    </tr>
    <tr>
        <td align="left" style="width: 172px">
            <font face="verdana" size="2">Centro de Cómputo:</font>
        </td>
        <td align="left"><font face="verdana" size="2">
            <asp:DropDownList ID="cmbCComputo" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cmbCComputo_SelectedIndexChanged" Width="375px">
            </asp:DropDownList></font>
        </td>
    </tr>
</table>

<table border="0" cellpadding="3" cellspacing="3">
    <tr>
        <td colspan="2">
            <asp:GridView ID="grdGrupos" runat="server" BackColor="#E1EFE2" Font-Names="Verdana"
                Font-Size="Small" AutoGenerateColumns="False" ForeColor="Black" Width="560px">
                <HeaderStyle BackColor="#A7BE85" />
                <AlternatingRowStyle BackColor="#D3E8D2" />
                <SelectedRowStyle BackColor="#A5D3DD" Font-Bold="True" ForeColor="Black" />
                <Columns>
                    <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td align="left">
            <asp:Label ID="lblMensaje2" runat="server" Font-Names="Verdana" Font-Size="Small"
                Text="Label"></asp:Label></td>
        <td align="right">
            <asp:Label ID="lblMensaje" runat="server" Font-Names="Verdana" Font-Size="Small"
                Text="Label"></asp:Label>
            <asp:LinkButton ID="lnkAnterior" runat="server" Font-Names="Verdana" Font-Size="Small"
                ForeColor="OliveDrab" OnClick="lnkAnterior_Click">Anterior</asp:LinkButton>
            <asp:LinkButton ID="lnkSiguiente" runat="server" Font-Names="Verdana" Font-Size="Small"
                ForeColor="OliveDrab" OnClick="lnkSiguiente_Click">Siguiente</asp:LinkButton></td>
    </tr>
</table>
