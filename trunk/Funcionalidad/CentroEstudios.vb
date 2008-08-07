'Actualizado
<Serializable()> _
Public Class centroestudio

    Private _codigo As String
    Private _nombre As String

    Public Property codigo() As String
        Get
            Return Me._codigo
        End Get
        Set(ByVal value As String)
            Me._codigo = value
        End Set
    End Property

    Public Property Nombre() As String
        Get
            Return Me._nombre
        End Get
        Set(ByVal value As String)
            Me._nombre = value
        End Set
    End Property

    Public Sub New(ByVal tcodigo As String, ByVal tnombre As String)
        Me._codigo = tcodigo
        Me._nombre = tnombre
    End Sub
End Class
