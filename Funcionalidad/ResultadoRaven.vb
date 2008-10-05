''' <summary>
''' Representa los resultados de la prueba de inteligencia de un aspirante
''' </summary>
''' <remarks></remarks>
<Serializable()> _
Public Class ResultadoRaven : Inherits Resultados
    Private _codresult As String
    Private _consistencia As String
    Private _percentil As UInteger
    Private _diagnostico As String
    Private _puntaje As Integer
    Public Sub New()

    End Sub
    Public Sub New(ByVal cod As String, ByVal c As String, ByVal p As Integer, ByVal d As String, ByVal punt As Integer)
        codresult = cod
        Consistencia = c
        Percentil = p
        Diagnostico = d
        Puntaje = punt
    End Sub
    Public Property codresult() As String
        Get
            Return Me._codresult
        End Get
        Set(ByVal value As String)
            Me._codresult = value
        End Set
    End Property
    ''' <summary>
    ''' Devuelve o establece la consistencia de las respuestas del aspirante. Puede ser adecuada o inadecuada
    ''' </summary>
    ''' <value>Los posibles valores en string</value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property Consistencia() As String
        Get
            Return Me._consistencia
        End Get
        Set(ByVal value As String)
            Me._consistencia = value
        End Set
    End Property

    ''' <summary>
    ''' Devuelve o establece el percentil en el cual se clasifican las respuetas del aspirante
    ''' </summary>
    ''' <value>Un valor entero sin signo</value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property Percentil() As UInteger
        Get
            Return Me._percentil
        End Get
        Set(ByVal value As UInteger)
            Me._percentil = value
        End Set
    End Property

    ''' <summary>
    ''' Devuelve o establece un conjunto de caracteres que describen el rango del percentil. Puede ser S para superior, STM para superior al Termino medio, TM para termino medio, ITM para inferior al termino medio y D para deficiente
    ''' </summary>
    ''' <value>Un string con los caracteres del diagnostico</value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property Diagnostico() As String
        Get
            Return Me._diagnostico
        End Get
        Set(ByVal value As String)
            Me._diagnostico = value
        End Set
    End Property


    Public Property Puntaje() As Integer
        Get
            Return Me._puntaje
        End Get
        Set(ByVal value As Integer)
            Me._puntaje = value
        End Set
    End Property
End Class
