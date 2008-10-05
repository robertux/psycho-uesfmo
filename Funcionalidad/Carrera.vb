'Actualizado
<Serializable()> _
Public Class Carrera

    Private _codcarrera As String
    Private _nombre As String
    Private _codfacultad As String

    Public Property CodCarrera() As String
        Get
            Return Me._codcarrera
        End Get
        Set(ByVal value As String)
            Me._codcarrera = value
        End Set
    End Property

    Public Property NombreCarrera() As String
        Get
            Return Me._nombre
        End Get
        Set(ByVal value As String)
            Me._nombre = value
        End Set
    End Property

    Public Property CodFacultad() As String
        Get
            Return Me._codfacultad
        End Get
        Set(ByVal value As String)
            Me._codfacultad = value
        End Set
    End Property

    Public Sub New(ByVal tcodCarrera As String, ByVal nombre As String, ByVal tcodFacultad As String)
        Me.CodCarrera = tcodCarrera
        Me.NombreCarrera = nombre
        Me.CodFacultad = CodFacultad
    End Sub
End Class
