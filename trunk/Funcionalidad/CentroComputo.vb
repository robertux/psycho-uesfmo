'Actualizado
Imports System

Public Class CentroComputo
    Private _codcentro As String
    Private _nombre As String

    Public Property CodCentroComputo() As String
        Get
            Return Me._codcentro
        End Get
        Set(ByVal value As String)
            Me._codcentro = value
        End Set
    End Property

    Public Property NombreCentro() As String
        Get
            Return Me._nombre
        End Get
        Set(ByVal value As String)
            Me._nombre = value
        End Set
    End Property

    Public Sub New(ByVal codigo As String, ByVal nombre As String)
        Me.CodCentroComputo = codigo
        Me.NombreCentro = nombre
    End Sub

End Class
