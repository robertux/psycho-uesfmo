<%@ Page Language="C#" MasterPageFile="~/Principal.master" AutoEventWireup="true" CodeFile="GenericError.aspx.cs" Title="Psycho v1.2" Inherits="GenericError" %>

<asp:Content ContentPlaceHolderID="Contenido1" ID="ContentError" runat="server">
<div align="left">
    <h1><font face="Arial">Error desconocido</font></h1>
    <br><br><br><br>
    <font face="Arial">Ha ocurrido un error desconocido en el sitio web<br><br>
    Para volver a la página anterior haga click <asp:HyperLink ID="VinculoAtras" Text="Aquí" runat="server"></asp:HyperLink>
    </font>
</div>
</asp:Content>