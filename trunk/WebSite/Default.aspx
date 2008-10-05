<%@ Page Language="C#" MasterPageFile="~/Principal.master" AutoEventWireup="true" Title="Psycho v1.2"  CodeFile="Default.aspx.cs" Inherits="_Default" %>


        <asp:Content ContentPlaceHolderID="Contenido1" ID="Login" runat="server">
            <br />
            <br />
            <table border="0" cellpadding="0" cellspacing="0" <%--style="width: 410px; height: 257px;"--%> style="height: 257px">
            <tr>
            <td background="Recursos/ImgLogin.png" style="height: 243px; width: 410px;">
                <br /><br /><br />
            <asp:Login ID="Login1" runat="server" DisplayRememberMe="False" LoginButtonText="Entrar" DestinationPageUrl="~/Aspir/Default.aspx"
                LoginButtonType="Image" PasswordLabelText="Contraseña:" TitleText="" UserNameLabelText="Usuario:" FailureText="Nombre de usuario y / o contraseña inválidos" LoginButtonImageUrl="~/Recursos/BtnAceptar.png" PasswordRequiredErrorMessage="La contraseña es requerida." UserNameRequiredErrorMessage="El nombre de usuario es requerido." Font-Names="Arial" Font-Overline="False" Font-Size="Large" ForeColor="#3B6788" Height="62px">
                <LayoutTemplate>
                    <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse">
                        <tr>
                            <td style="width: 276px">
                                <table border="0" cellpadding="0">
                                    <tr>
                                        <td align="right" style="height: 24px">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Usuario:</asp:Label></td>
                                        <td style="height: 24px" align="left">
                                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                ErrorMessage="El nombre de usuario es requerido." ToolTip="El nombre de usuario es requerido."
                                                ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Contraseña:</asp:Label></td>
                                        <td align="left">
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                ErrorMessage="La contraseña es requerida." ToolTip="La contraseña es requerida."
                                                ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color: red">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2">
                                            <br />
                                            <asp:ImageButton ID="LoginImageButton" runat="server" AlternateText="Entrar" CommandName="Login"
                                                ImageUrl="~/Recursos/BtnAceptar.png" ValidationGroup="Login1"/>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:Login>
            </td>
            </tr>
            </table>
            <br />
            <br />
        </asp:Content>   
