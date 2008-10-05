''' <summary>
''' Representa los resultados de un aspirante de manera generica. No se puede instanciar de ella. Hay que heredar
''' </summary>
''' <remarks></remarks>
<Serializable()> _
Public MustInherit Class Resultados

    Private _codAspirante As String
    Private _tiempoRealizacionPrueba As UInteger

    Sub New()

    End Sub

    ''' <summary>
    ''' Devuelve o establece el codigo del aspirante al que pertenece
    ''' </summary>
    ''' <value>Un string de 7 caracteres</value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property CodAspirante() As String
        Get
            Return Me._codAspirante
        End Get
        Set(ByVal value As String)
            Me._codAspirante = value
        End Set
    End Property

    ''' <summary>
    ''' Devuelve o establece el tiempo en minutos que el aspirante se tardo en realizar la prueba
    ''' </summary>
    ''' <value>Un entero sin signo</value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property TiempoRealizacionPrueba() As UInteger
        Get
            Return Me._tiempoRealizacionPrueba
        End Get
        Set(ByVal value As UInteger)
            Me._tiempoRealizacionPrueba = value
        End Set
    End Property
End Class
