''' <summary>
''' Prueba generica realizada a los aspirantes. No se puede instanciar de ella solo heredar
''' </summary>
''' <remarks></remarks>
<Serializable()> _
Public MustInherit Class Prueba

    Private _codAspirante As String
    Private _fechaRealizacion As Date
    Private _codPrueba As string

    ''' <summary>
    ''' Devuelve o establece el codigo del aspirante al cual esta asociado la prueba
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
    ''' Devuelve o establece la fecha en que se realizara o se realizo la prueba
    ''' </summary>
    ''' <value>Una fecha menor a la fecha actual</value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property FechaRealizacion() As Date
        Get
            Return Me._fechaRealizacion
        End Get
        Set(ByVal value As Date)
            Me._fechaRealizacion = value
        End Set
    End Property
    
        Public Property CodPrueba As String
    	Get
    		Return me._codPrueba
    	End Get
    	Set(ByVal value As string)
    		me._codPrueba = value
    	End Set
    End Property
End Class
