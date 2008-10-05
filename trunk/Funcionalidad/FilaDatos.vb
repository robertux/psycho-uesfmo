
Public Class FilaDatos

    Private _criterio As String
    Private _porcentajeAptos As UInteger
    Private _porcentajeNoAptos As UInteger
    Private _cantidadAptos As UInteger
    Private _cantidadNoAptos As UInteger
    Private _total As UInteger

    Public Property Criterio() As String
        Get
            Return _criterio
        End Get
        Set(ByVal value As String)
            _criterio = value
        End Set
    End Property

    Public Property PorcentajeAptos() As UInteger
        Get
            Return _porcentajeAptos
        End Get
        Set(ByVal value As UInteger)
            _porcentajeAptos = value
        End Set
    End Property

    Public Property PorcentajeNoAptos() As UInteger
        Get
            Return _porcentajeNoAptos
        End Get
        Set(ByVal value As UInteger)
            _porcentajeNoAptos = value
        End Set
    End Property

    Public Property CantidadAptos() As UInteger
        Get
            Return _cantidadAptos
        End Get
        Set(ByVal value As UInteger)
            _cantidadAptos = value
        End Set
    End Property

    Public Property CantidadNoAptos() As UInteger
        Get
            Return _cantidadNoAptos
        End Get
        Set(ByVal value As UInteger)
            _cantidadNoAptos = value
        End Set
    End Property

    Public Property Total() As UInteger
        Get
            Return _total
        End Get
        Set(ByVal value As UInteger)
            _total = value
        End Set
    End Property

    Public Sub New(ByVal criterio As String, ByVal porcentajeaptos As Integer, ByVal porcentajenoaptos As Integer, ByVal cantidadaptos As Integer, ByVal cantidadnoaptos As Integer, ByVal total As Integer)
        Me._criterio = criterio
        Me._porcentajeAptos = porcentajeaptos
        Me._porcentajeNoAptos = porcentajenoaptos
        Me._cantidadAptos = cantidadaptos
        Me._cantidadNoAptos = cantidadnoaptos
        Me._total = total
    End Sub
End Class
