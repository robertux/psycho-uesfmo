<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ListaAspir.ascx.cs" Inherits="Admin_Controles_ListaAspir" %>
<%@ Register Namespace="MsdnMag.CuttingEdge.Controls" TagPrefix="aspir" Assembly="HotGridView" %>

<table id="TblFiltros" border="0" cellpadding="3" cellspacing="3" style="width: 550px" runat="server">
    <tr>
        <td align="right" style="width: 29px">
            <font face="verdana" size="2">Año:</font></td>
        <td align="left" style="width: 97px">
            <asp:DropDownList ID="cmbAnios" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cmbAnios_SelectedIndexChanged"
                Width="99px" Font-Names="verdana" Font-Size="X-Small" />
        </td>
    </tr>
    <tr>
        <td align="right" style="width: 29px">
            <font face="verdana" size="2">Facultad:</font>
        </td>
        <td align="left" style="width: 97px">
            <asp:DropDownList ID="cmbFacultad" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cmbFacultad_SelectedIndexChanged" Font-Names="verdana" Font-Size="X-Small" Width="487px" />
        </td>
    </tr>
    <tr>
        <td align="right" style="width: 29px">
            <font face="verdana" size="2">Carrera:</font>
        </td>
        <td align="left" style="width: 97px">
            <asp:DropDownList ID="cmbCarrera" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cmbCarrera_SelectedIndexChanged" Font-Names="verdana" Font-Size="X-Small" Width="487px" />
        </td>
    </tr>
    <tr>
        <td align="right" style="width: 29px">
            <font face="verdana" size="2">Estado:</font>
        </td>
        <td align="left" style="width: 97px">
            <asp:DropDownList ID="cmbEstado" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cmbEstado_SelectedIndexChanged" Font-Names="verdana" Font-Size="X-Small" Width="94px" />
        </td>
    </tr>  
    <tr id="filaResultado" runat="server">
        <td align="right">
            <font face="verdana" size="2">Resultado:</font>
        </td>
        <td align="left">
            <asp:DropDownList ID="cmbResultado" runat="server" AutoPostBack="True" Font-Names="verdana" Font-Size="X-Small">
                <asp:ListItem>(Todos)</asp:ListItem>
                <asp:ListItem Value="apto">Apto</asp:ListItem>
                <asp:ListItem Value="noapto">No Apto</asp:ListItem>
            </asp:DropDownList></td>
    </tr>  
</table>
<table border="0" cellpadding="3" cellspacing="3" style="width: 550px" >
    <tr>
        <td align="left" colspan="2">
            <aspir:GridView ID="grdAspirantes" runat="server" BackColor="#E1EFE2" Font-Names="Verdana"
                Font-Size="Small" AutoGenerateColumns="False" ForeColor="Black" Width="560px"
                AutoGenerateCheckBoxColumn="True" EnableTheming="True">
                <HeaderStyle BackColor="#A7BE85" />
                <AlternatingRowStyle BackColor="#D3E8D2" />
                <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" />
                <SelectedRowStyle BackColor="#A5D3DD" Font-Bold="True" ForeColor="Black" />
                <Columns>
                    <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
                </Columns>
            </aspir:GridView>
        </td>
    </tr>
    <tr>
        <td align="left" valign="top" style="width: 258px">
            <asp:Label ID="lblMensaje2" Font-Names="Verdana" Font-Size="Small" runat="server" Text="Label"></asp:Label>
        </td>
        <td align="right" valign="top" style="width: 368px">
            <asp:Label ID="lblMensaje" runat="server" Font-Names="Verdana" Font-Size="Small"
                Text="Label"></asp:Label>
            <asp:LinkButton ID="lnkAnterior" runat="server" Font-Italic="False" Font-Names="Verdana"
                Font-Size="Small" OnClick="lnkAnterior_Click" ForeColor="OliveDrab">Anterior</asp:LinkButton>
            <asp:LinkButton ID="lnkSiguiente" runat="server" Font-Names="Verdana" Font-Size="Small"
                OnClick="lnkSiguiente_Click" ForeColor="OliveDrab">Siguiente</asp:LinkButton>
            &nbsp;
        </td>
    </tr>
</table>
