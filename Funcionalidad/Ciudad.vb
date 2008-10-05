'Actualizado
Imports System

<Serializable()> _
Public Class Ciudad
    Private _codciudad As String
    Private _nombre As String
    Private _coddepto As String

    Public Property CodCiudad() As String
        Get
            Return Me._codciudad
        End Get
        Set(ByVal value As String)
            Me._codciudad = value
        End Set
    End Property

    Public Property NombreCiudad() As String
        Get
            Return Me._nombre
        End Get
        Set(ByVal value As String)
            Me._nombre = value
        End Set
    End Property

    Public Property CodDepartamento() As String
        Get
            Return Me._coddepto
        End Get
        Set(ByVal value As String)
            Me._coddepto = value
        End Set
    End Property

    Public Sub New(ByVal codigo As String, ByVal nombre As String, ByVal codDepto As String)
        Me.CodCiudad = codigo
        Me.NombreCiudad = nombre
        Me.CodDepartamento = codDepto
    End Sub

End Class
