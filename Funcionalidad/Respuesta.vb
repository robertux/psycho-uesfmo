''' <summary>
''' Representa a una respuesta contestada por un aspirante en una prueba
''' </summary>
''' <remarks></remarks>
<Serializable()> _
Public Class Respuesta

    Private _codigo As string
    Private _numPregunta As UInteger
    Private _respuestaAsp As UInteger

    ''' <summary>
    ''' Devuelve o establece el numero de pregunta al que corresponde la respuesta
    ''' </summary>
    ''' <value>Un valor entero sin signo</value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property NumPregunta() As UInteger
        Get
            Return Me._numPregunta
        End Get
        Set(ByVal value As UInteger)
            Me._numPregunta = value
        End Set
    End Property

    ''' <summary>
    ''' Devuelve o establece la respuesta que el aspirante contesto
    ''' </summary>
    ''' <value>Un valor entero sin signo</value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property RespuestaAsp() As UInteger
        Get
            Return Me._respuestaAsp
        End Get
        Set(ByVal value As UInteger)
            Me._respuestaAsp = value
        End Set
    End Property
    
    Public Property Codigo As String
    	Get
    		return me._codigo
    	End Get
    	Set
    		me._codigo = value
    	End Set
    End Property
    
    Public Sub New(ByVal cod As string, ByVal nPreg As UInteger, ByVal RAsp As UInteger)
    	me._codigo = cod
    	Me.NumPregunta = nPreg
    	me.RespuestaAsp = RAsp
    End Sub
    
End Class
