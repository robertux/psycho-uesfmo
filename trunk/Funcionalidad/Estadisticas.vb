
Public Class Estadisticas

    Private _tipoDeCriterio As String
    Private _filas As FilaDatos

    Public Property TipoDeCriterio() As String
        Get
            Return _tipoDeCriterio
        End Get
        Set(ByVal value As String)

        End Set
    End Property

    Public Property Filas() As FilaDatos
        Get
            Return _filas
        End Get
        Set(ByVal value As FilaDatos)

        End Set
    End Property

    Public Sub generar()

    End Sub
End Class
