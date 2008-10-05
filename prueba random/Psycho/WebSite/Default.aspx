<%@ Page Language="C#" MasterPageFile="~/Principal.master" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>


        <asp:Content ContentPlaceHolderID="Contenido1" ID="Login" runat="server">
            <br />
            <br />
            <table border="0" cellpadding="0" cellspacing="0" style="width: 410px; height: 257px;">
            <tr>
            <td background="Recursos/ImgLogin.png" style="height: 249px; width: 410px;">
                <br />
                <br />
                <br />
                <br />
            <asp:Login ID="Login1" runat="server" DisplayRememberMe="False" LoginButtonText="Entrar"
                LoginButtonType="Image" PasswordLabelText="Contraseña:" TitleText="" UserNameLabelText="Usuario:" FailureText="Nombre de usuario y / contraseña inválidos" LoginButtonImageUrl="~/Recursos/BtnAceptar.png" PasswordRequiredErrorMessage="La contraseña es requerida." UserNameRequiredErrorMessage="El nombre de usuario es requerido." Font-Names="Arial" Font-Overline="False" Font-Size="Large" ForeColor="#3B6788" Height="62px">
            </asp:Login>
            </td>
            </tr>
            </table>
            <br />
            <br />
        </asp:Content>   
