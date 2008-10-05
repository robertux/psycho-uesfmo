''' <summary>
''' Representa los resultados de la prueba de personalidad de un aspirante
''' </summary>
''' <remarks></remarks>
<Serializable()> _
Public Class ResultadoCeps : Inherits Resultados

    Private _codResult As string
    Private _pControl As UInteger
    Private _pExtrover As UInteger
    Private _pParan As UInteger
    Private _pSin As UInteger
    Private _pDecision As UInteger
    Private _diagnostico As String
    Public Sub New()

    End Sub

    Public Sub New(ByVal cod As string, ByVal pc As Integer, ByVal pe As Integer, ByVal pp As Integer, ByVal ps As Integer, ByVal pd As Integer, ByVal d As String)
        codresult = cod
        PControl = pc
        PExtrover = pe
        PParan = pp
        PSin = ps
        PDecision = pd
        Diagnostico = d


    End Sub
    ''' <summary>
    ''' Devuelve o establece el percentil correspondiente al control emocional
    ''' </summary>
    ''' <value></value>
    ''' <returns>Valor entero sin signo</returns>
    ''' <remarks></remarks>
    Public Property PControl() As UInteger
        Get
            Return Me._pControl
        End Get
        Set(ByVal value As UInteger)
            Me._pControl = value
        End Set
    End Property
    Public Property codresult() As string
        Get
            Return Me._codResult
        End Get
        Set(ByVal value As string)
            Me._codResult = value
        End Set
    End Property

    ''' <summary>
    ''' Devuelve o establece el percentil correspondiente a la extroversion
    ''' </summary>
    ''' <value>Valor entero sin signo</value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property PExtrover() As UInteger
        Get
            Return Me._pExtrover
        End Get
        Set(ByVal value As UInteger)
            Me._pExtrover = value
        End Set
    End Property

    ''' <summary>
    ''' Devuelve o establece el percentil correspondiente al paranoidismo
    ''' </summary>
    ''' <value>Valor entero sin signo</value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property PParan() As UInteger
        Get
            Return Me._pParan
        End Get
        Set(ByVal value As UInteger)
            Me._pParan = value
        End Set
    End Property

    ''' <summary>
    ''' Devuelve o establece el percentil correspondiente a la sinceridad
    ''' </summary>
    ''' <value>Un valor entero sin signo</value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property PSin() As UInteger
        Get
            Return Me._pSin
        End Get
        Set(ByVal value As UInteger)
            Me._pSin = value
        End Set
    End Property

    ''' <summary>
    ''' Devuelve o establece el percentil correspondiente a la capacidad de decision
    ''' </summary>
    ''' <value>Un valor entero sin signo</value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property PDecision() As UInteger
        Get
            Return Me._pDecision
        End Get
        Set(ByVal value As UInteger)
            Me._pDecision = value
        End Set
    End Property

    ''' <summary>
    ''' Devuelve o establece el diagnostico del aspirante el cual puede tener un valor de adecuada o inadecuada
    ''' </summary>
    ''' <value>Un string donde va la descripcion</value>
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

End Class
