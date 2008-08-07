'Actualizado
Imports System

<Serializable()> _
Public Class Departamento
    Private _coddepto As String
    Private _nombre As String
    Private _ciudades As List(Of Ciudad)

    Public Property CodDepartamento() As String
        Get
            Return Me._coddepto
        End Get
        Set(ByVal value As String)
            Me._coddepto = value
        End Set
    End Property

    Public Property NombreDepartamento() As String
        Get
            Return Me._nombre
        End Get
        Set(ByVal value As String)
            Me._nombre = value
        End Set
    End Property

    Public Property Ciudades() As List(Of Ciudad)
        Get
            Return Me._ciudades
        End Get
        Set(ByVal value As List(Of Ciudad))
            Me._ciudades = value
        End Set
    End Property

    Public Sub New(ByVal codDepto As String, ByVal nombre As String)
        Me.CodDepartamento = codDepto
        Me.NombreDepartamento = nombre
    End Sub
End Class
