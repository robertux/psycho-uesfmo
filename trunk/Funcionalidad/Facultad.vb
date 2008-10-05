'Actualizado
Imports System

<Serializable()> _
Public Class Facultad
    Private _codfacultad As String
    Private _nombre As String

    Public Property CodFacultad() As String
        Get
            Return Me._codfacultad
        End Get
        Set(ByVal value As String)
            Me._codfacultad = value
        End Set
    End Property

    Public Property NombreFacultad() As String
        Get
            Return Me._nombre
        End Get
        Set(ByVal value As String)
            Me._nombre = value
        End Set
    End Property

    Public Sub New(ByVal codigo As String, ByVal nombre As String)
        Me.CodFacultad = codigo
        Me.NombreFacultad = nombre
    End Sub
End Class
