<%@ Page Language="C#" MasterPageFile="~/Aspir/Aspir.master" AutoEventWireup="true" CodeFile="InstruccionesFinCeps.aspx.cs" Inherits="Aspir_InstruccionesFinCeps" Title="Untitled Page" %>
<%@ Register Src="Controles/PreguntaCEPS.ascx" TagName="Pregunta" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Contenido1" Runat="Server">


<script language="javascript" type="text/javascript">
   window.open('CEPS.aspx',null,'left=20, top=20, height=600, width= 800, status=no, resizable= no, scrollbars= yes, toolbar= no,location= no, dependent= yes, menubar= no');
</script>


    &nbsp; 
    <br />
    <table border="0" cellpadding="0" cellspacing="0" width="600">    
        <tr>
            <td><img src="Recursos/TestPersonalidad.png" alt=""/></td>
        </tr>
        <tr>        
            <td background="../Recursos/ContenidoTabla.png" align="center">
                <br />
                <br />
                <table border="0" cellpadding="0" cellspacing="0" width="550px">
                    <tr>
                        <td align="left" style="height: 28px">
                            <asp:Label ID="lblInstruccionesTitulo" runat="server" Text="Instrucciones Finales:" Font-Bold="True" Font-Names="Verdana" Font-Size="Larger"></asp:Label>
                        <br />
                        </td>                         
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblInstruccionesCuerpo" runat="server" Text="Las instrucciones que se dan despues de la prueba" Font-Names="Verdana"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                        <br />
                        <br />
                            <asp:ImageButton ID="btnContinuar" ImageUrl="~/Aspir/Recursos/BtnContinuar.png" PostBackUrl="~/Aspir/Default.aspx" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>              
    <br />
</asp:Content>

