<%@ Page Language="C#" MasterPageFile="Aspir.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Aspir_Default" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido1" Runat="Server">
    Pagina principal del aspirante<br />
    <br />
    if(aspirante.estado == evaluado)<br />
    {<br />
    mostrar resultados<br />
    }<br />
    if(aspirante.estado == no evaluado)<br />
    {<br />
    mostrar vinculo a las pruebas<br />
    }<br />
    if(aspirante.estado == evaluando)<br />
    {<br />
    continuar evaluacion automaticamente<br />
    }
</asp:Content>

