<%@ Page Language="C#" MasterPageFile="Aspir.master" AutoEventWireup="true" CodeFile="InstruccionesInicioCEPS.aspx.cs" Inherits="Aspir_Ini_Ceps" Title="Psycho v1.2" %>

<%@ Register Src="Controles/PreguntaCEPS.ascx" TagName="Pregunta" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido1" Runat="Server">
    &nbsp; 
    <br />
    <table border="0" cellpadding="0" cellspacing="0" width="600">    
        <tr>
            <td><img src="Recursos/TestPersonalidad.png" alt="" /></td>
        </tr>
        <tr>        
            <td background="../Recursos/ContenidoTabla.png" align="center" style="height: 204px">
                <br />
                <br />
                <table border="0" cellpadding="0" cellspacing="0" width="550px">
                    <tr>
                        <td>
                            <asp:Label ID="lblInstruccionesTitulo" runat="server" Text="Instrucciones Generales:" Font-Bold="True" Font-Names="Verdana" Font-Size="Larger"></asp:Label>
                        <br />
                        </td>                         
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblInstruccionesCuerpo" runat="server" Text="Las instrucciones que se dan antes de la prueba" Font-Names="Verdana"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                        <br />
                        <br />                            
                            <font face="verdana" size="small">Código del grupo:</font>
                            <asp:textbox id="txtCodGrupo" runat="server"></asp:textbox>
                            &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
                            <asp:ImageButton ID="btnContinuar1" ImageUrl="~/Aspir/Recursos/BtnContinuar.png" OnClick="btnContinuarServerClick" runat="server" />
                        </td>
                    </tr>
                </table>
                <asp:Label ID="lblRequired" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="Small"
                    ForeColor="Red" Text="Debe ingresar el código del grupo" Visible="False"></asp:Label>
                <asp:Label ID="lblInvalid" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="Small"
                    ForeColor="Red" Text="Código no válido" Visible="False"></asp:Label><br />
            </td>
        </tr>    
    </table>              
    <br />
</asp:Content>