<%@ Page Language="C#" MasterPageFile="Aspir.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Aspir_Default" Title="Psycho v1.2" %>

<%@ Register Src="Controles/DatosAspir.ascx" TagName="DatosAspir" TagPrefix="uc2" %>

<%@ Register Src="Controles/ProgramacionPruebaR.ascx" TagName="ProgramacionPruebaR"
    TagPrefix="uc1" %>
    <%@ Register Src="Controles/ProgramacionPruebaC.ascx" TagName="ProgramacionPruebaC"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido1" Runat="Server">
    &nbsp; 
    <br />
    <table border="0" cellpadding="0" cellspacing="0" width="600">    
        <tr>
            <td colspan="3"><img src="Recursos/DatosPersonales.png" alt="" /></td>
        </tr>
        <tr>        
            <td background="../Recursos/ContenidoTabla.png" align="center">
                <br/>
                <uc2:DatosAspir ID="DatosAspir1" runat="server" />
                <br/>
            </td>
        </tr>    
    </table>       
    <br />
    
    <table border="0" cellpadding="0" cellspacing="0"  width="600">
    <tr>
        <td><img src="Recursos/ResultadosPrueba.png" alt="" /></td>
    </tr>
    <tr>
        <td background="../Recursos/ContenidoTabla.png" align="left" style="height: 207px">
        <br/><div align="center">
            <table border="0" cellpadding="3" cellspacing="3">
                <tr>
                    <td align="left" valign="top" style="width: 214px; height: 101px;">
                        <font face="arial" color="black" size="3"><b>Prueba de conocimientos</b></font></td>
                    <td align="left" valign="top" style="width: 328px; height: 101px;"><uc1:ProgramacionPruebaR ID="ProgramacionPruebaR" runat="server" />
                        <asp:Image ID="ImgEvaluadoR" runat="server" ImageUrl="~/Aspir/Recursos/BtnEvaluado.png"
                            Visible="False" /></td>
                </tr>
                <tr>
                    <td align="left" valign="top" style="width: 214px"><font face="arial" color="black" size="3"><b>Prueba de personalidad</b></font></td>
                    <td align="left" valign="top" style="width: 328px">
                        <uc1:ProgramacionPruebaC ID="ProgramacionPruebaC" runat="server" />
                        <asp:Image ID="ImgEvaluadoC" runat="server" ImageUrl="~/Aspir/Recursos/BtnEvaluado.png"
                            Visible="False" />
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top" style="width: 214px">
                        <font face="arial" color="black" size="3"><b>Total</b></font></td>
                    <td align="left" style="width: 328px">
                        <asp:Image ID="ImgResultado" ImageUrl="Recursos/BtnVacio.png" runat="server" />
                    </td>
                </tr>
            </table>
            </div>
    </td></tr>
    </table>
    <br/>
</asp:Content>

