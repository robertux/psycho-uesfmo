'Actualizado
Imports System

<Serializable()> _
Public Class Aspirante

    Private _codigo As String
    Private _nombres As String
    Private _apellidos As String
    Private _codigoGrupo As String
    Private _direccion As String
    Private _telefono As String
    Private _lugarEstudios As centroestudio
    Private _ciudad As Ciudad
    Private _depto As Departamento
    Private _anioAprobado As String
    Private _estado As String
    Private _carrera As Carrera
    Private _sexo As Char
    Private _fechaNacimiento As Date
    Private _facultad As Facultad
    Private _pruebaC As PruebaCeps
    Private _pruebaR As PruebaRaven
    Private _resRaven As ResultadoRaven
    Private _resCeps As ResultadoCeps
    Private _anioRegistrado As UInteger
    private _resultado as String

    Public Sub New(ByVal codigo As String, ByVal nombres As String, ByVal apellidos As String, ByVal codigogrupo As String, ByVal direccion As String, ByVal telefono As String, ByVal lugarestudios As centroestudio, ByVal ciudad As Ciudad, ByVal depto As Departamento, ByVal anioaprobado As String, ByVal estado As String, ByVal carrera As Carrera, ByVal sexo As Char, ByVal fechanacimiento As Date, ByVal facultad As Facultad, ByVal anioreg As UInteger, ByVal result as String)
        Me._codigo = codigo
        Me._nombres = nombres
        Me._apellidos = apellidos
        Me._codigoGrupo = codigogrupo
        Me._direccion = direccion
        Me._telefono = telefono
        Me._lugarEstudios = lugarestudios
        Me._ciudad = ciudad
        Me._depto = depto
        Me._anioAprobado = anioaprobado
        Me._estado = estado
        Me._carrera = carrera
        Me._sexo = sexo
        Me._fechaNacimiento = fechanacimiento
        Me._facultad = facultad
        Me._anioRegistrado = anioreg
        me._resultado = result
    End Sub

    Public Property AnioRegistrado() As UInteger
        Get
            Return Me._anioRegistrado
        End Get
        Set(ByVal value As UInteger)
            Me._anioRegistrado = value
        End Set
    End Property

    Public Property AnioAprobado() As String
        Get
            Return Me._anioAprobado
        End Get
        Set(ByVal value As String)
            Me._anioAprobado = value
        End Set
    End Property

    Public Property Apellidos() As String
        Get
            Return Me._apellidos
        End Get
        Set(ByVal value As String)
            Me._apellidos = value
        End Set
    End Property

    Public Property Carrera() As Carrera
        Get
            Return Me._carrera
        End Get
        Set(ByVal value As Carrera)
            Me._carrera = value
        End Set
    End Property

    Public Property Ciudad() As Ciudad
        Get
            Return Me._ciudad
        End Get
        Set(ByVal value As Ciudad)
            Me._ciudad = value
        End Set
    End Property

    Public Property Codigo() As String
        Get
            Return Me._codigo
        End Get
        Set(ByVal value As String)
            Me._codigo = value
        End Set
    End Property

    Public Property CodigoGrupo() As String
        Get
            Return Me._codigoGrupo

        End Get
        Set(ByVal value As String)
            Me._codigoGrupo = value
        End Set
    End Property

    Public Property Depto() As Departamento
        Get
            Return Me._depto
        End Get
        Set(ByVal value As Departamento)
            Me._depto = value
        End Set
    End Property

    Public Property Direccion() As String
        Get
            Return Me._direccion
        End Get
        Set(ByVal value As String)
            Me._direccion = value
        End Set
    End Property

    Public Property Estado() As String
        Get
            Return Me._estado
        End Get
        Set(ByVal value As String)
            Me._estado = value
        End Set
    End Property

    Public Property Facultad() As Facultad
        Get
            Return Me._facultad
        End Get
        Set(ByVal value As Facultad)
            Me._facultad = value
        End Set
    End Property

    Public Property FechaNacimiento() As Date
        Get
            Return Me._fechaNacimiento
        End Get
        Set(ByVal value As Date)
            Me._fechaNacimiento = value
        End Set
    End Property

    Public Property LugarEstudios() As centroestudio
        Get
            Return Me._lugarEstudios
        End Get
        Set(ByVal value As centroestudio)
            Me._lugarEstudios = value
        End Set
    End Property

    Public Property Nombres() As String
        Get
            Return Me._nombres

        End Get
        Set(ByVal value As String)
            Me._nombres = value
        End Set
    End Property

    Public Property PruebaC() As PruebaCeps
        Get
            Return _pruebaC
        End Get
        Set(ByVal value As PruebaCeps)
            _pruebaC = value
        End Set
    End Property

    Public Property Sexo() As Char
        Get
            Return Me._sexo
        End Get
        Set(ByVal value As Char)
            Me._sexo = value
        End Set
    End Property

    Public Property Telefono() As String
        Get
            Return Me._telefono
        End Get
        Set(ByVal value As String)
            Me._telefono = value
        End Set
    End Property

    Public Property ResCeps() As ResultadoCeps
        Get
            Return _resCeps
        End Get
        Set(ByVal value As ResultadoCeps)
            _resCeps = value
        End Set
    End Property

    Public Property ResRaven() As ResultadoRaven
        Get
            Return _resRaven
        End Get
        Set(ByVal value As ResultadoRaven)
            _resRaven = value
        End Set
    End Property

    Public Property PruebaR() As PruebaRaven
        Get
            Return _pruebaR
        End Get
        Set(ByVal value As PruebaRaven)
            _pruebaR = value
        End Set
    End Property
    
    Public Property Resultado As String
    	Get
    		return me._resultado
    	End Get
    	Set
    		me._resultado = value
    	End Set
    End Property

    Public Function calcularedad()
        Dim edad, meses As Integer
        Dim fechaactual As Date
        fechaactual = Date.Now
        edad = fechaactual.Year - Me._fechaNacimiento.Year
        meses = fechaactual.Month - Me._fechaNacimiento.Month
        If meses <= -7 Then
            edad = edad - 1
        End If
        If (meses >= -6 And meses <= 5) Then
            edad = edad
        End If
        If meses >= 6 Then
            edad = edad + 1
        End If
        Return edad
    End Function

End Class
