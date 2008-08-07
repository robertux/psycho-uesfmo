'Actualizado
Public Class Grupo

    Private _codigoGrupo As String
    Private _listaAspirantes As List(Of Aspirante)
    Private _horaRealizacion As UInteger
    Private _minutoRealizacion As UInteger
    Private _fechaRealizacion As Date
    Private _examinador As String
    Private _tamanio As UInteger
    Private _centrocomputo As CentroComputo

    Public Property CodigoGrupo() As String
        Get
            Return _codigoGrupo
        End Get
        Set(ByVal value As String)
            _codigoGrupo = value
        End Set
    End Property

    Public Property minutoRealizacion() As Integer
        Get
            Return _minutoRealizacion
        End Get
        Set(ByVal value As Integer)
            _minutoRealizacion = value
        End Set
    End Property

    Public Property horaRealizacion() As Integer
        Get
            Return _horaRealizacion
        End Get
        Set(ByVal value As Integer)
            _horaRealizacion = value
        End Set
    End Property

    Public Property ListaApirantes() As List(Of Aspirante)
        Get
            Return _listaAspirantes
        End Get
        Set(ByVal value As List(Of Aspirante))
            _listaAspirantes = value
        End Set
    End Property

    Public Property FechaRealizacion() As Date
        Get
            Return _fechaRealizacion
        End Get
        Set(ByVal value As Date)
            _fechaRealizacion = value
        End Set
    End Property

    Public Property Examinador() As String
        Get
            Return _examinador
        End Get
        Set(ByVal value As String)
            _examinador = value
        End Set
    End Property

    Public Property tamanio() As UInteger
        Get
            Return _tamanio
        End Get
        Set(ByVal value As UInteger)
            _tamanio = value
        End Set
    End Property

    Public Property CentroComputo() As CentroComputo
        Get
            Return Me._centrocomputo
        End Get
        Set(ByVal value As CentroComputo)
            Me._centrocomputo = value
        End Set
    End Property

    Public Sub New(ByVal codigogrupo As String, ByVal hora As Integer, ByVal fecha As Date, ByVal examinador As String, ByVal tamanio As Integer, ByVal minuto As Integer, ByVal centrocomputo As CentroComputo)
        Me.CodigoGrupo = codigogrupo
        Me.Examinador = examinador
        Me.FechaRealizacion = fecha
        Me.horaRealizacion = hora
        Me.minutoRealizacion = minuto
        Me.tamanio = tamanio
        Me.CentroComputo = CentroComputo
    End Sub

End Class
