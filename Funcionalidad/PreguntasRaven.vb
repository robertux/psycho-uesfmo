''' <summary>
''' Representa el conjunto de preguntas correspondientes a la prueba RAVEN
''' </summary>
''' <remarks></remarks>
<Serializable()> _
Public Class PreguntasRaven

    Private _preguntas As List(Of Pregunta)

    ''' <summary>
    ''' Devuelve o establece el conjunto de preguntas RAVEN
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property Preguntas() As List(Of Pregunta)
        Get
            Return Me._preguntas
        End Get
        Set(ByVal value As List(Of Pregunta))
            Me._preguntas = value
        End Set
    End Property

    Public Sub New()
        Dim i As Integer

        Me._preguntas = New List(Of Pregunta)
        For i = 0 To 59
            Dim pre As New Pregunta
            pre.Numero = i + 1
            pre.Valor = Str(i + 1) + ".jpg"
            Me._preguntas.Add(pre)
        Next

        Preguntas(0).RespuestaCorrecta = 4
        Preguntas(1).RespuestaCorrecta = 5
        Preguntas(2).RespuestaCorrecta = 1
        Preguntas(3).RespuestaCorrecta = 2
        Preguntas(4).RespuestaCorrecta = 6
        Preguntas(5).RespuestaCorrecta = 3
        Preguntas(6).RespuestaCorrecta = 6
        Preguntas(7).RespuestaCorrecta = 2
        Preguntas(8).RespuestaCorrecta = 1
        Preguntas(9).RespuestaCorrecta = 3
        Preguntas(10).RespuestaCorrecta = 5
        Preguntas(11).RespuestaCorrecta = 4
        Preguntas(12).RespuestaCorrecta = 2
        Preguntas(13).RespuestaCorrecta = 6
        Preguntas(14).RespuestaCorrecta = 1
        Preguntas(15).RespuestaCorrecta = 2
        Preguntas(16).RespuestaCorrecta = 1
        Preguntas(17).RespuestaCorrecta = 3
        Preguntas(18).RespuestaCorrecta = 5
        Preguntas(19).RespuestaCorrecta = 6
        Preguntas(20).RespuestaCorrecta = 4
        Preguntas(21).RespuestaCorrecta = 3
        Preguntas(22).RespuestaCorrecta = 4
        Preguntas(23).RespuestaCorrecta = 5
        Preguntas(24).RespuestaCorrecta = 8
        Preguntas(25).RespuestaCorrecta = 2
        Preguntas(26).RespuestaCorrecta = 3
        Preguntas(27).RespuestaCorrecta = 8
        Preguntas(28).RespuestaCorrecta = 7
        Preguntas(29).RespuestaCorrecta = 4
        Preguntas(30).RespuestaCorrecta = 5
        Preguntas(31).RespuestaCorrecta = 1
        Preguntas(32).RespuestaCorrecta = 7
        Preguntas(33).RespuestaCorrecta = 6
        Preguntas(34).RespuestaCorrecta = 1
        Preguntas(35).RespuestaCorrecta = 2
        Preguntas(36).RespuestaCorrecta = 3
        Preguntas(37).RespuestaCorrecta = 4
        Preguntas(38).RespuestaCorrecta = 3
        Preguntas(39).RespuestaCorrecta = 7
        Preguntas(40).RespuestaCorrecta = 8
        Preguntas(41).RespuestaCorrecta = 6
        Preguntas(42).RespuestaCorrecta = 5
        Preguntas(43).RespuestaCorrecta = 4
        Preguntas(44).RespuestaCorrecta = 1
        Preguntas(45).RespuestaCorrecta = 2
        Preguntas(46).RespuestaCorrecta = 5
        Preguntas(47).RespuestaCorrecta = 6
        Preguntas(48).RespuestaCorrecta = 7
        Preguntas(49).RespuestaCorrecta = 6
        Preguntas(50).RespuestaCorrecta = 8
        Preguntas(51).RespuestaCorrecta = 2
        Preguntas(52).RespuestaCorrecta = 1
        Preguntas(53).RespuestaCorrecta = 5
        Preguntas(54).RespuestaCorrecta = 2
        Preguntas(55).RespuestaCorrecta = 4
        Preguntas(56).RespuestaCorrecta = 1
        Preguntas(57).RespuestaCorrecta = 6
        Preguntas(58).RespuestaCorrecta = 3
        Preguntas(59).RespuestaCorrecta = 5
    End Sub

End Class
