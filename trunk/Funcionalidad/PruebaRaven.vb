
''' <summary>
''' Prueba de inteligencia realizada a los aspirantes, contiene la lista de respuestas contestadas por el aspirante
''' </summary>
''' <remarks></remarks>
<Serializable()> _
Public Class PruebaRaven : Inherits Prueba

    Private _respuestas As List(Of Respuesta)
    ''' <summary>
    ''' Devuelve o establece la lista de respuestas de la prueba
    ''' </summary>
    ''' <value>Lista de respuestas</value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property Respuestas() As List(Of Respuesta)
        Get
            Return Me._respuestas
        End Get
        Set(ByVal value As List(Of Respuesta))
            Me._respuestas = value
        End Set
    End Property

    Public Sub New(ByVal codPrueb As String)
    	me.CodPrueba = codPrueb
        Me._respuestas = New List(Of Respuesta)
    End Sub
End Class
