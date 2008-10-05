''' <summary>
''' Clase generica que representa una pregunta realizada en una prueba. No se puede instanciar de ella solo heredar
''' </summary>
''' <remarks></remarks>
<Serializable()> _
Public Class Pregunta

    Private _numero As UInteger
    Private _valor As String
    Private _respuestaCorrecta As UInteger

    ''' <summary>
    ''' Devuelve o establece el numero de pregunta
    ''' </summary>
    ''' <value>Un entero sin signo</value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property Numero() As UInteger
        Get
            Return Me._numero
        End Get
        Set(ByVal value As UInteger)
            Me._numero = value
        End Set
    End Property

    ''' <summary>
    ''' Devuelve o establece el valor, ya sea la ruta de una imagen o un texto que represente visualmente a la pregunta
    ''' </summary>
    ''' <value>Un string</value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property Valor() As String
        Get
            Return Me._valor
        End Get
        Set(ByVal value As String)
            Me._valor = value.Trim()
        End Set
    End Property

    ''' <summary>
    ''' Devuelve o establece la respuesta correcta de la pregunta
    ''' </summary>
    ''' <value>Un entero sin signo</value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property RespuestaCorrecta() As UInteger
        Get
            Return Me._respuestaCorrecta
        End Get
        Set(ByVal value As UInteger)
            Me._respuestaCorrecta = value
        End Set
    End Property
End Class
