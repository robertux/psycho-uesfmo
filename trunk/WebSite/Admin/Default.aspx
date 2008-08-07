<%@ Page Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" Title="Psycho v1.2" %>

<%@ Register Src="Controles/PerfilAdmin.ascx" TagName="PerfilAdmin" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido1" Runat="Server">
    <br>
    <table border="0" cellpadding="0" cellspacing="0" width="650px">
        <tr width="650px">
            <td><img src="Recursos/PerfilAdm.png" width="650" /></td>
        </tr>
        <tr>
            <td background="../Recursos/ContenidoTabla.png" align="center" width="600px">
                <br>
                <uc1:PerfilAdmin ID="PerfilAdmin1" runat="server" />
                <br>
                <table border="0" cellpadding="0" cellspacing="5">
                    <tr>
                        <td>
                            &nbsp;<asp:ImageButton ID="btnConsultarAspir" runat="server" ImageUrl="Recursos/ConsultarAspir.png"
                                PostBackUrl="~/Admin/ConsultarAspir.aspx" />
                        </td>
                        <td>
                            &nbsp;<asp:ImageButton ID="btnConsultarGrupos" runat="server" ImageUrl="Recursos/ConsultarGrupo.png"
                                PostBackUrl="~/Admin/ConsultarGrupos.aspx" /></td>
                        <td>
                            &nbsp;<asp:ImageButton ID="btnModificarPerfil" runat="server" ImageUrl="Recursos/ModificarPerfil.png"
                                PostBackUrl="~/Admin/Perfil.aspx" /></td>
                        <td>
                            &nbsp;<asp:ImageButton ID="btnConsultarAdmin" runat="server" ImageUrl="Recursos/ModificarPerfil.png"
                                PostBackUrl="~/Admin/ConsultarAdmin.aspx" /></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br>
</asp:Content>

