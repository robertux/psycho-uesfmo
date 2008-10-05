<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RAVEN.aspx.cs" Inherits="Aspir_RAVEN" Title="Psycho v1.2" %>
<%@ Register Src="Controles/PreguntaRAVEN.ascx" TagName="Pregunta" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Psycho v.0.4</title>
    <script type="text/javascript" language="javascript">
var message = "" ; 
  
function clickIE (){ 
  if ( document . all ){ 
  ( message ); 
  return false ; 
} 
}
function clickNS ( e ){ 
  if ( document . layers || ( document . getElementById && ! document . all )){ 
  if ( e . which == 2 || e . which == 3 ){ 
  ( message ); 
  return false ; 
} 
} 
} 
  
if ( document . layers ){ 
  document . captureEvents ( Event . MOUSEDOWN ); 
  document . onmousedown = clickNS ; 
  } else { 
  document . onmouseup = clickNS ; 
  document . oncontextmenu = clickIE ; 
} 
  document . oncontextmenu = new Function( "return false" ) 

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table bgcolor="white" border="0" cellpadding="0" cellspacing="0" width="750px">
            <tr>
                <td align="center" bgcolor="#a7be85" colspan="3" style="height: 100px" valign="top">
                    <img src="../Recursos/MainBanner.png" />
                </td>
            </tr>
            <tr>
                <td bgcolor="#a7be85" style="width: 8px; height: 225px">
                </td>
                <td align="center" bgcolor="#e1efe2" style="width: 731px; height: 225px" valign="top">
                            <br />
                            <table border="0" cellpadding="0" cellspacing="0" width="600">    
                                <tr>
                                    <td><img src="Recursos/TestConocimientos.png" /></td>
                                </tr>
                                <tr>        
                                    <td background="../Recursos/ContenidoTabla.png" align="center">
                                        <br>
                                        <uc1:Pregunta ID="Pregunta1" runat="server" />                                        
                                        <br>
                                    </td>
                                </tr>    
                            </table>              
                            <br>
                        </td>
                    <td bgcolor="#a7be85" style="height: 225px" width="8">
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#a7be85" colspan="3" style="height: 42px">
                    <font face="verdana">Sistema en Línea de Pruebas Psicológicas para Aspirantes a Profesorado<br />
                    </font>
                </td>
            </tr>
        </table>
    
    </form>
</body>
</html>


