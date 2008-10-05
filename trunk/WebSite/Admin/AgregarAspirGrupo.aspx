<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AgregarAspirGrupo.aspx.cs" Inherits="Admin_AgregarAspirGrupo" Title="Psycho v1.2" %>

<%@ Register Src="Controles/ListaAspir.ascx" TagName="ListaAspir" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido1" Runat="Server">
<br/>
    <table border="0" cellpadding="0" cellspacing="0" width="600">
        <tr>
            <td style="width: 601px"><img src="Recursos/AgregarAspirAGrupo.png" /></td>
        </tr>
        <tr>
            <td background="../Recursos/ContenidoTabla.png" style="width: 601px">
                <br />
                <uc1:ListaAspir ID="ListaAspirVacante1" runat="server" GrpCode="GrpNone" ShowFilters="true" />
                <br>
                <div align="right">
                <asp:ImageButton ID="ImageButton1" ImageUrl="Recursos/BtnAceptar2.png" runat="server" OnClick="ImageButton1_Click" />
                &nbsp; &nbsp; &nbsp;<br>
                </div>
                <br />
            </td>
        </tr>       
    </table>    
    <br />
    <br />
    <div align =right><asp:ImageButton ID="btnRegresar" runat="server" ImageUrl="../Recursos/BtnRegresar.png"
        PostBackUrl="~/Admin/ModificarGrupo.aspx" OnClick="btnRegresar_Click" />&nbsp; &nbsp;</div>
        <br />
</asp:Content>

