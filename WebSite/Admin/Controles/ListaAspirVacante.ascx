<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ListaAspirVacante.ascx.cs" Inherits="Admin_Controles_ListaAspirVacante" %>
<%@ Register Namespace="MsdnMag.CuttingEdge.Controls" TagPrefix="aspvac" Assembly="HotGridView" %>

<aspvac:GridView ID="grdAspirVacante" runat="server" BackColor="#E1EFE2"
    Font-Names="Verdana" Font-Size="Small" AutoGenerateColumns="False" ForeColor="Black" Width="560px" AutoGenerateCheckBoxColumn="True" EnableTheming="True" >
    <HeaderStyle BackColor="#A7BE85" />
    <AlternatingRowStyle BackColor="#D3E8D2" />
    <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" />
    <SelectedRowStyle BackColor="#A5D3DD" Font-Bold="True" ForeColor="Black" />
    <Columns>
        <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
    </Columns>
</aspvac:GridView>
&nbsp;

