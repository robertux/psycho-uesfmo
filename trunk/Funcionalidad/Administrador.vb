'Actualizado
Public Class Administrador

    Private _codigo As String
    Private _nombre As String
    Private _contrasenia As String
    Private _privilegio As String


    Public Property Contrasenia() As String
        Get
            Return _contrasenia
        End Get
        Set(ByVal value As String)
            _contrasenia = value
        End Set
    End Property

    Public Property Codigo() As String
        Get
            Return _codigo

        End Get
        Set(ByVal value As String)
            If (value.Length > 7) Then
                _codigo = value.Substring(0, 7)
            Else
                _codigo = value
            End If
        End Set
    End Property

    Public Property Nombre() As String
        Get
            Return _nombre
        End Get
        Set(ByVal value As String)
            _nombre = value
        End Set
    End Property

    Public Property Privilegio() As String
        Get
            Return _privilegio
        End Get
        Set(ByVal value As String)
            _privilegio = value
        End Set
    End Property

    Sub New(ByVal codigo As String, ByVal nombre As String, ByVal contrasenia As String, ByVal privilegio As String)

        Me.Codigo = codigo
        Me.Nombre = nombre
        Me.Contrasenia = Contrasenia
        Me.Privilegio = privilegio
    End Sub
End Class
