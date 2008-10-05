<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ConsultarGrupos.aspx.cs" Inherits="Admin_ConsultarGrupos" Title="Psycho v1.2" %>
<%@ Register Src="Controles/ListaGrupos.ascx" TagName="ListaGrupos" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido1" Runat="Server">
<br>
    <table border="0" cellpadding="0" cellspacing="0" width="600">
        <tr>
            <td><img src="Recursos/ConsultarGrupos.png" /></td>
        </tr>
        <tr>
            <td background="../Recursos/ContenidoTabla.png">
                <br />
                <uc1:ListaGrupos ID="ListaGrupos1" ShowFilters="true" PageSize="10" runat="server" />
                <br>
                <table border="0" cellpadding="0" cellspacing="5">
                    <tr>
                        <td>
                            <asp:ImageButton ID="btnAgregarGrupo" runat="server" ImageUrl="Recursos/BtnAgregarGrupo.png" OnClick="btnAgregarGrupo_Click"/></td>
                        <td>
                            <asp:ImageButton ID="btnModificarGrupo" runat="server" ImageUrl="Recursos/BtnModificarGrupo.png" OnClick="btnModificarGrupo_Click"/></td>
                        <td>
                            <asp:ImageButton ID="btnEliminarGrupo" runat="server" ImageUrl="Recursos/BtnEliminarGrupo.png" OnClick="btnEliminarGrupo_Click" /></td>
                        <td>
                            <asp:ImageButton ID="btnDatosGrupo" runat="server" ImageUrl="Recursos/BtnDatosGrupo.png" OnClick="btnDatosGrupo_Click" /></td>                            
                    </tr>
                </table>
                <br>
            </td>
        </tr>       
    </table>    
    <br />
    <br />
    <div align =right><asp:ImageButton ID="btnRegresar" runat="server" ImageUrl="../Recursos/BtnRegresar.png"
        PostBackUrl="~/Admin/Default.aspx" />&nbsp; &nbsp;</div>
        <br />
</asp:Content>

