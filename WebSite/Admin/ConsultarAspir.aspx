<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ConsultarAspir.aspx.cs" Inherits="Admin_ConsultarAspir" Title="Psycho v1.2" %>

<%@ Register Src="Controles/ListaAspir.ascx" TagName="ListaAspir" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido1" Runat="Server">
<br>
    <table border="0" cellpadding="0" cellspacing="0" width="600">
        <tr>
            <td><img src="Recursos/ConsultarAspirantes.png" /></td>
        </tr>
        <tr>
            <td background="../Recursos/ContenidoTabla.png">
                <br />
                <uc1:ListaAspir ID="ListaAspir1" runat="server" PageSize="7" ShowFilters="true" />
                <br>
                <table border="0" cellpadding="0" cellspacing="5">
                    <tr>
                        <td>
                            <asp:ImageButton ID="btnAgregarAspir" runat="server" ImageUrl="Recursos/BtnAgregarAspir.png" OnClick="btnAgregarAspir_Click" /></td>
                        <td>
                            <asp:ImageButton ID="btnModificarAspir" runat="server" ImageUrl="Recursos/BtnModificarAspir.png" OnClick="btnModificarAspir_Click" /></td>
                        <td>
                            <asp:ImageButton ID="btnEliminarAspir" runat="server" ImageUrl="Recursos/BtnEliminarAspir.png" OnClick="btnEliminarAspir_Click" /></td>
                        <td>
                            <asp:ImageButton ID="btnDatosAspir" runat="server" ImageUrl="Recursos/BtnDatosAspir.png" OnClick="btnDatosAspir_Click" /></td>                            
                    </tr>
                </table>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Reportes sin Resultado" />
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Reporte con Gráfico"
                    Width="128px" /><br>
            </td>
        </tr>       
    </table>    
    <br />
    <br />
    <div align =right><asp:ImageButton ID="btnRegresar" runat="server" ImageUrl="../Recursos/BtnRegresar.png"
        PostBackUrl="~/Admin/Default.aspx" />&nbsp; &nbsp;</div>
        <br />
</asp:Content>

