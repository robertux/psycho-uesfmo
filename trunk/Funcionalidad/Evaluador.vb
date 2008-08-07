
''' <summary>
''' aplica todos los criteios de evaluacion de las pruebas
''' </summary>
''' <remarks></remarks>
Public Class Evaluador

    ''' <summary>
    ''' criterios de evaluacion de la prueba Ceps
    ''' </summary>
    ''' <param name="Test">variable que recibe la lista de respuestas ceps</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function evaluarPruebaceps(ByVal a As Aspirante) As ResultadoCeps
        Dim diagc As String = ""
        Dim diage As String = ""
        Dim diagp As String = ""
        Dim diags As String = ""
        Dim diagsigno As String = ""
        Dim preg As New PreguntasCeps
        Dim result As New ResultadoCeps

        Dim i As Integer = 0
        Dim j As Integer = 0
        Dim totalc As Integer = 0
        Dim totale As Integer = 0
        Dim totalp As Integer = 0
        Dim totals As Integer = 0
        Dim totalsigno As Integer = 0

        'total escala c
        For i = 0 To 32
            For j = 0 To 155
                If (preg.escalac(i) = preg.Preguntas(j).Numero) And _
                (preg.escc(i) = a.PruebaC.Respuestas(j).RespuestaAsp) Then
                    totalc += 1
                End If
            Next
        Next
        'total escala e
        For i = 0 To 44
            For j = 0 To 155
                If (preg.escalae(i) = preg.Preguntas(j).Numero) And _
                (preg.esce(i) = a.PruebaC.Respuestas(j).RespuestaAsp) Then
                    totale += 1
                End If
            Next
        Next
        For i = 0 To 6
            For j = 0 To 155
                If (preg.aux(i) = preg.Preguntas(j).Numero) And (a.PruebaC.Respuestas(j).RespuestaAsp = 2) Then
                    totale += 1
                End If
            Next
        Next
        'total escala p
        For i = 0 To 42
            For j = 0 To 155
                If (preg.escalap(i) = preg.Preguntas(j).Numero) And _
                (preg.escp(i) = a.PruebaC.Respuestas(j).RespuestaAsp) Then
                    totalp += 1
                End If
            Next
        Next
        'total escala s
        For i = 0 To 18
            For j = 0 To 155
                If (preg.escalas(i) = preg.Preguntas(j).Numero) And _
                (preg.escs(i) = a.PruebaC.Respuestas(j).RespuestaAsp) Then
                    totals += 1
                End If
            Next
        Next
        'total de signos de interrogacion
        For j = 0 To 155
            If (a.PruebaC.Respuestas(j).RespuestaAsp = 2) Then
                totalsigno += 1
            End If
        Next
        'calcular diagnostico de escala c
        If totalc >= 0 And totalc <= 8 Then
            diagc = "Grave inestabilidad. Cambios emocionales injustificados, de indole depresiva. No interviene la voluntad del sujeto."
            If totalc >= 0 And totalc <= 2 Then
                result.PControl = 1
            End If
            If totalc = 3 Or totalc = 4 Then
                result.PControl = 5
            End If
            If totalc = 5 Or totalc = 6 Then
                result.PControl = 10
            End If
            If totalc = 7 Then
                result.PControl = 15
            End If
            If totalc = 8 Then
                result.PControl = 25
            End If
        End If
        If totalc >= 9 And totalc < 12 Then
            diagc = "Tendencia a los altibajos de humor sin motivos."
            If totalc = 9 Then
                result.PControl = 30
            End If
            If totalc = 10 Then
                result.PControl = 40
            End If
            If totalc = 11 Then
                result.PControl = 45
            End If
        End If
        If totalc = 12 Then
            diagc = "Tendencia a los altibajos de humor sin motivos. estabilidad emocional."
            result.PControl = 55
        End If
        If totalc >= 13 And totalc <= 15 Then
            diagc = "Estabilidad emocional."
            If totalc = 13 Then
                result.PControl = 65
            End If
            If totalc = 14 Then
                result.PControl = 70
            End If
            If totalc = 15 Then
                result.PControl = 75
            End If
        End If
        If totalc = 16 Or totalc = 17 Then
            diagc = "Humor controlado."
            If totalc = 16 Then
                result.PControl = 80
            End If
            If totalc = 17 Then
                result.PControl = 85
            End If
        End If
        If totalc >= 18 Then
            diagc = "Puede ser indicio de sequedad, frialdad de caracter, rigidez afectiva."
            If totalc = 18 Or totalc = 19 Then
                result.PControl = 90
            End If
            If totalc = 20 Or totalc = 21 Then
                result.PControl = 95
            End If
            If totalc = 22 Or totalc = 23 Then
                result.PControl = 99
            End If
            If totalc >= 24 Then
                result.PControl = 100
            End If
        End If
        'calcular diagnostico de escala e
        If totale >= 0 And totale <= 20 And totale <> 8 Then
            diage = "Pesimista. Poco sociable. Retraimiento. Predominio de la reflexion sobre la accion. Perseveracion en la atencion."
            If totale >= 0 And totale <= 4 Then
                result.PExtrover = 1
            End If
            If totale > 4 And totale <= 12 Then
                result.PExtrover = 5
            End If
            If totale > 12 And totale <= 16 Then
                result.PExtrover = 10
            End If
            If totale = 17 Or totale = 18 Then
                result.PExtrover = 15
            End If
            If totale = 19 Then
                result.PExtrover = 20
            End If
            If totale = 20 Then
                result.PExtrover = 25
            End If
        End If
        If totale >= 21 And totale <= 24 Then
            diage = "Tendencia a la inhibicion social."
            If totale = 21 Then
                result.PExtrover = 30
            End If
            If totale = 22 Then
                result.PExtrover = 40
            End If
            If totale = 23 Then
                result.PExtrover = 45
            End If
            If totale = 24 Then
                result.PExtrover = 50
            End If
        End If
        If totale >= 25 And totale <= 29 Then
            diage = "Optimista. Sociable, equilibrado."
            If totale = 25 Then
                result.PExtrover = 55
            End If
            If totale = 26 Then
                result.PExtrover = 65
            End If
            If totale = 27 Or totale = 28 Then
                result.PExtrover = 70
            End If
            If totale = 29 Then
                result.PExtrover = 75
            End If
        End If
        If totale = 30 Or totale = 31 Then
            diage = "Locuacidad, habilidad para dirigir reuniones. Animacion de caracter."
            If totale = 30 Then
                result.PExtrover = 80
            End If
            If totale = 31 Then
                result.PExtrover = 85
            End If
        End If
        If totale >= 32 Then
            diage = "Despreocupacion. Distraccion. Ligereza. Excesiva comunicatividad."
            If totale = 32 Or totale = 33 Then
                result.PExtrover = 90
            End If
            If totale = 34 Or totale = 35 Then
                result.PExtrover = 95
            End If
            If totale = 36 Or totale = 37 Then
                result.PExtrover = 99
            End If
            If totale >= 38 Then
                result.PExtrover = 100
            End If
        End If
        'calcular diagnostico de escala p
        If totalp >= 0 And totalp <= 16 And totalp <> 6 Then
            diagp = "Personalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable"
            If totalp >= 0 And totalp <= 5 Then
                result.PParan = 1
            End If
            If totalp > 6 And totalp <= 11 Then
                result.PParan = 5
            End If
            If totalp = 12 Or totalp = 13 Then
                result.PParan = 10
            End If
            If totalp = 14 Then
                result.PParan = 15
            End If
            If totalp = 15 Then
                result.PParan = 20
            End If
            If totalp = 16 Then
                result.PParan = 25
            End If
        End If
        If totalp >= 17 And totalp < 20 Then
            diagp = "Personalidad sumisa y débil. Temor a la responsabilidad y a la lucha. Sujeto manejable.            "
            If totalp = 17 Then
                result.PParan = 35
            End If
            If totalp = 18 Then
                result.PParan = 40
            End If
            If totalp = 19 Then
                result.PParan = 45
            End If

        End If
        If totalp = 20 Then
            diagp = "Tendencia hacia los apartados 1 y 2; pero más hacia el 1. Combatividad suficiente. Energía para el mando."
            result.PParan = 55
        End If
        If totalp >= 21 And totalp <= 24 Then
            diagp = "Combatividad suficiente. Energía para el mando."
            If totalp = 21 Then
                result.PParan = 60
            End If
            If totalp = 22 Then
                result.PParan = 65
            End If
            If totalp = 23 Then
                result.PParan = 70
            End If
            If totalp = 24 Then
                result.PParan = 75
            End If

        End If
        If totalp = 25 Or totalp = 26 Then
            diagp = "Tendencia hacia la agresividad. Tenacidad y suficiencia."
            If totalp = 25 Then
                result.PParan = 80
            End If
            If totalp = 26 Then
                result.PParan = 85
            End If
        End If
        If totalp >= 27 And totalp <= 35 Then
            diagp = "Alto nivel de aspiraciones. Yo supervalorado. Tenacidad rígida. Agresividad y suspicacia."
            If totalp = 27 Or totalp = 28 Then
                result.PParan = 90
            End If
            If totalp = 29 Or totalp = 30 Then
                result.PParan = 95
            End If
            If totalp > 30 And totalp <= 33 Then
                result.PParan = 99
            End If
            If totalp > 33 Then
                result.PParan = 100
            End If

        End If
        'calcular diagnostico de escala s
        If totals >= 0 And totals <= 10 Then
            diags = "Duda acerca de la autenticidad de las respuestas o de la asimilación de las normas sociales."
            If totals = 0 Or totals = 1 Then
                result.PSin = 1
            End If
            If totals = 2 Or totals = 3 Then
                result.PSin = 5
            End If
            If totals = 4 Or totals = 5 Then
                result.PSin = 10
            End If
            If totals = 6 Then
                result.PSin = 15
            End If
            If totals = 7 Then
                result.PSin = 20
            End If
            If totals = 8 Then
                result.PSin = 30
            End If
            If totals = 9 Then
                result.PSin = 40
            End If
            If totals = 10 Then
                result.PSin = 50
            End If

        End If
        If totals >= 11 And totals <= 19 Then
            diags = "Autenticidad en las respuestas o asimilación de las normas sociales."
            If totals = 11 Then
                result.PSin = 60
            End If
            If totals = 12 Then
                result.PSin = 70
            End If
            If totals = 13 Then
                result.PSin = 80
            End If
            If totals = 14 Then
                result.PSin = 85
            End If
            If totals = 15 Then
                result.PSin = 90
            End If
            If totals = 16 Then
                result.PSin = 95
            End If
            If totals = 17 Then
                result.PSin = 99
            End If
            If totals = 18 Or totals = 19 Then
                result.PSin = 100
            End If
        End If
        'calcular diagnostico de escala decisión (cuales son los rangos que se toman para sacar el diagnostico)
        If totalsigno >= 0 And totalsigno <= 8 Then
            diagsigno = "Seguridad. Decisión. Personalidad rígida."
            If totalsigno = 0 Then
                result.PDecision = 10
            End If
            If totalsigno = 1 Or result.PDecision = 2 Then
                result.PDecision = 15
            End If
            If totalsigno = 3 Then
                result.PDecision = 30
            End If
            If totalsigno = 4 Then
                result.PDecision = 35
            End If
            If totalsigno = 5 Then
                result.PDecision = 40
            End If
            If totalsigno = 6 Then
                result.PDecision = 45
            End If
            If totalsigno = 8 Then
                result.PDecision = 50
            End If

        End If
        If totalsigno >= 9 Then
            diagsigno = "Indecisión en la elección. Inseguridad, puede ser indeciso por auto defensa o por neurotismo."
            If totalsigno = 9 Then
                result.PDecision = 60
            End If
            If totalsigno = 10 Then
                result.PDecision = 65
            End If
            If totalsigno = 11 Or totalsigno = 12 Then
                result.PDecision = 70
            End If
            If totalsigno = 13 Or totalsigno = 14 Then
                result.PDecision = 75
            End If
            If totalsigno > 14 Or totalsigno <= 19 Then
                result.PDecision = 80
            End If
            If totalsigno > 19 Or totalsigno <= 24 Then
                result.PDecision = 85
            End If
            If totalsigno > 24 Or totalsigno <= 30 Then
                result.PDecision = 90
            End If
            If totalsigno > 30 Or totalsigno <= 40 Then
                result.PDecision = 95
            End If
            If totalsigno > 40 Or totalsigno <= 55 Then
                result.PDecision = 99
            End If
            If totalsigno > 55 Then
                result.PDecision = 100
            End If
        End If

        result.Diagnostico = diagc + vbCrLf + diage + vbCrLf + diagp + vbCrLf + diags + vbCrLf + diagsigno


        Return result

    End Function

    ''' <summary>
    ''' criterios de evaluacion de la prueba Raven
    ''' </summary>
    ''' <param name="Test">variable que recibe la lista de respuestas Raven</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function evaluarPruebaraven(ByVal asp As Aspirante) As ResultadoRaven
        Dim result As New ResultadoRaven
        Dim puntajenc As New tablapuntajenormal
        Dim pregs As New PreguntasRaven
        Dim puntajebruto, serieA, serieB, serieC, serieD, serieE, i, columna As Integer
        Dim edad, discrepanciaA, discrepanciaB, discrepanciaC, discrepanciaD, discrepanciaE As Integer
        serieA = 0
        serieB = 0
        serieC = 0
        serieD = 0
        serieE = 0
        puntajebruto = 0
        result.Percentil = 0
		columna = -1
        edad = asp.calcularedad()
        For i = 0 To 59
            If asp.PruebaR.Respuestas(i).RespuestaAsp = pregs.Preguntas(i).RespuestaCorrecta Then
                If i <= 11 Then
                    serieA = serieA + 1
                End If
                If (i >= 12 And i <= 23) Then
                    serieB = serieB + 1
                End If
                If (i >= 24 And i <= 35) Then
                    serieC = serieC + 1
                End If
                If (i >= 36 And i <= 47) Then
                    serieD = serieD + 1
                End If
                If (i >= 48 And i <= 59) Then
                    serieE = serieE + 1
                End If
            End If
        Next

        puntajebruto = serieA + serieB + serieC + serieD + serieE

        For i = 0 To 43
            If puntajebruto = puntajenc.total(i) Then
                columna = i            
            End If
        Next
        If columna = -1 Then
            result.Consistencia = "false"
            result.Percentil = 0
        Else
            discrepanciaA = puntajenc.serieA(columna) - serieA
            discrepanciaB = puntajenc.serieB(columna) - serieB
            discrepanciaC = puntajenc.serieC(columna) - serieC
            discrepanciaD = puntajenc.serieD(columna) - serieD
            discrepanciaE = puntajenc.serieE(columna) - serieE
            If (discrepanciaA < -2 And discrepanciaA > 2) Or (discrepanciaB < -2 And discrepanciaB > 2) Or (discrepanciaC < -2 And discrepanciaC > 2) Or (discrepanciaD < -2 And discrepanciaD > 2) Or (discrepanciaE < -2 And discrepanciaE > 2) Then
                result.Consistencia = "false"
            Else
                result.Consistencia = "true"

                If edad = 15 Then
                    If puntajebruto >= 55 And puntajebruto <= 60 Then
                        result.Percentil = 95
                    End If
                    If puntajebruto = 54 Then
                        result.Percentil = 90
                    End If
                    If puntajebruto = 52 Or puntajebruto = 53 Then
                        result.Percentil = 75
                    End If
                    If puntajebruto >= 44 And puntajebruto <= 51 Then
                        result.Percentil = 50
                    End If
                    If puntajebruto >= 40 And puntajebruto <= 43 Then
                        result.Percentil = 25
                    End If
                    If puntajebruto >= 36 And puntajebruto <= 39 Then
                        result.Percentil = 10
                    End If
                    If puntajebruto <= 35 Then
                        result.Percentil = 5
                    End If
                End If

                If edad = 16 Then
                    If puntajebruto >= 55 And puntajebruto <= 60 Then
                        result.Percentil = 95
                    End If
                    If puntajebruto = 54 Then
                        result.Percentil = 90
                    End If
                    If puntajebruto = 52 Or puntajebruto = 53 Then
                        result.Percentil = 75
                    End If
                    If puntajebruto >= 46 And puntajebruto <= 51 Then
                        result.Percentil = 50
                    End If
                    If puntajebruto >= 40 And puntajebruto <= 45 Then
                        result.Percentil = 25
                    End If
                    If puntajebruto >= 36 And puntajebruto <= 39 Then
                        result.Percentil = 10
                    End If
                    If puntajebruto <= 35 Then
                        result.Percentil = 5
                    End If
                End If

                If edad = 17 Then
                    If puntajebruto >= 56 And puntajebruto <= 60 Then
                        result.Percentil = 95
                    End If
                    If puntajebruto = 55 Then
                        result.Percentil = 90
                    End If
                    If puntajebruto >= 53 And puntajebruto <= 54 Then
                        result.Percentil = 75
                    End If
                    If puntajebruto >= 46 And puntajebruto <= 52 Then
                        result.Percentil = 50
                    End If
                    If puntajebruto >= 41 And puntajebruto <= 45 Then
                        result.Percentil = 25
                    End If
                    If puntajebruto >= 36 And puntajebruto <= 40 Then
                        result.Percentil = 10
                    End If
                    If puntajebruto <= 35 Then
                        result.Percentil = 5
                    End If
                End If

                If edad = 18 Then
                    If puntajebruto >= 56 And puntajebruto <= 60 Then
                        result.Percentil = 95
                    End If
                    If puntajebruto = 55 Then
                        result.Percentil = 90
                    End If
                    If puntajebruto >= 52 And puntajebruto <= 54 Then
                        result.Percentil = 75
                    End If
                    If puntajebruto >= 46 And puntajebruto <= 51 Then
                        result.Percentil = 50
                    End If
                    If puntajebruto >= 39 And puntajebruto <= 45 Then
                        result.Percentil = 25
                    End If
                    If puntajebruto >= 33 And puntajebruto <= 38 Then
                        result.Percentil = 10
                    End If
                    If puntajebruto <= 32 Then
                        result.Percentil = 5
                    End If
                End If

                If edad = 19 Then
                    If puntajebruto >= 55 And puntajebruto <= 60 Then
                        result.Percentil = 95
                    End If
                    If puntajebruto = 54 Then
                        result.Percentil = 90
                    End If
                    If puntajebruto = 52 Or puntajebruto = 53 Then
                        result.Percentil = 75
                    End If
                    If puntajebruto >= 45 And puntajebruto <= 51 Then
                        result.Percentil = 50
                    End If
                    If puntajebruto >= 40 And puntajebruto <= 44 Then
                        result.Percentil = 25
                    End If
                    If puntajebruto >= 32 And puntajebruto <= 39 Then
                        result.Percentil = 10
                    End If
                    If puntajebruto <= 31 Then
                        result.Percentil = 5
                    End If
                End If

                If edad = 20 Then
                    If puntajebruto >= 55 And puntajebruto <= 60 Then
                        result.Percentil = 95
                    End If
                    If puntajebruto = 54 Then
                        result.Percentil = 90
                    End If
                    If puntajebruto >= 49 And puntajebruto <= 53 Then
                        result.Percentil = 75
                    End If
                    If puntajebruto >= 38 And puntajebruto <= 48 Then
                        result.Percentil = 50
                    End If
                    If puntajebruto >= 29 And puntajebruto <= 37 Then
                        result.Percentil = 25
                    End If
                    If puntajebruto >= 24 And puntajebruto <= 28 Then
                        result.Percentil = 10
                    End If
                    If puntajebruto <= 23 Then
                        result.Percentil = 5
                    End If
                End If

                If edad = 21 Or edad = 22 Then
                    If puntajebruto >= 54 And puntajebruto <= 60 Then
                        result.Percentil = 95
                    End If
                    If puntajebruto = 53 Then
                        result.Percentil = 90
                    End If
                    If puntajebruto = 51 Or puntajebruto = 52 Then
                        result.Percentil = 75
                    End If
                    If puntajebruto >= 43 And puntajebruto <= 50 Then
                        result.Percentil = 50
                    End If
                    If puntajebruto >= 37 And puntajebruto <= 42 Then
                        result.Percentil = 25
                    End If
                    If puntajebruto >= 29 And puntajebruto <= 36 Then
                        result.Percentil = 10
                    End If
                    If puntajebruto <= 28 Then
                        result.Percentil = 5
                    End If
                End If

                If edad >= 23 And edad <= 27 Then
                    If puntajebruto >= 55 And puntajebruto <= 60 Then
                        result.Percentil = 95
                    End If
                    If puntajebruto = 54 Then
                        result.Percentil = 90
                    End If
                    If puntajebruto >= 49 And puntajebruto <= 53 Then
                        result.Percentil = 75
                    End If
                    If puntajebruto >= 38 And puntajebruto <= 48 Then
                        result.Percentil = 50
                    End If
                    If puntajebruto >= 29 And puntajebruto <= 37 Then
                        result.Percentil = 25
                    End If
                    If puntajebruto >= 24 And puntajebruto <= 28 Then
                        result.Percentil = 10
                    End If
                    If puntajebruto <= 23 Then
                        result.Percentil = 5
                    End If
                End If


                If edad >= 28 And edad <= 32 Then
                    If puntajebruto >= 54 And puntajebruto <= 60 Then
                        result.Percentil = 95
                    End If
                    If puntajebruto = 53 Then
                        result.Percentil = 90
                    End If
                    If puntajebruto >= 47 And puntajebruto <= 52 Then
                        result.Percentil = 75
                    End If
                    If puntajebruto >= 35 And puntajebruto <= 46 Then
                        result.Percentil = 50
                    End If
                    If puntajebruto <= 34 Then
                        result.Percentil = 5
                    End If
                End If


                If edad >= 33 And edad <= 37 Then
                    If puntajebruto >= 53 And puntajebruto <= 60 Then
                        result.Percentil = 95
                    End If
                    If puntajebruto = 51 Or puntajebruto = 52 Then
                        result.Percentil = 90
                    End If
                    If puntajebruto >= 45 And puntajebruto <= 50 Then
                        result.Percentil = 75
                    End If
                    If puntajebruto >= 31 And puntajebruto <= 44 Then
                        result.Percentil = 50
                    End If
                    If puntajebruto <= 30 Then
                        result.Percentil = 5
                    End If
                End If


                If edad >= 38 And edad <= 42 Then
                    If puntajebruto >= 53 And puntajebruto <= 60 Then
                        result.Percentil = 95
                    End If
                    If puntajebruto = 52 Then
                        result.Percentil = 90
                    End If
                    If puntajebruto >= 43 And puntajebruto <= 51 Then
                        result.Percentil = 75
                    End If
                    If puntajebruto >= 28 And puntajebruto <= 42 Then
                        result.Percentil = 50
                    End If
                    If puntajebruto <= 27 Then
                        result.Percentil = 5
                    End If
                End If

                If edad >= 43 And edad <= 47 Then
                    If puntajebruto >= 50 And puntajebruto <= 60 Then
                        result.Percentil = 95
                    End If
                    If puntajebruto >= 47 And puntajebruto <= 49 Then
                        result.Percentil = 90
                    End If
                    If puntajebruto >= 41 And puntajebruto <= 46 Then
                        result.Percentil = 75
                    End If
                    If puntajebruto >= 25 And puntajebruto <= 40 Then
                        result.Percentil = 50
                    End If
                    If puntajebruto <= 24 Then
                        result.Percentil = 5
                    End If
                End If


                If edad >= 48 And edad <= 52 Then
                    If puntajebruto >= 48 And puntajebruto <= 60 Then
                        result.Percentil = 95
                    End If
                    If puntajebruto >= 45 And puntajebruto <= 47 Then
                        result.Percentil = 90
                    End If
                    If puntajebruto >= 39 And puntajebruto <= 44 Then
                        result.Percentil = 75
                    End If
                    If puntajebruto >= 22 And puntajebruto <= 38 Then
                        result.Percentil = 50
                    End If
                    If puntajebruto <= 21 Then
                        result.Percentil = 5
                    End If
                End If


                If edad >= 53 And edad <= 57 Then
                    If puntajebruto >= 46 And puntajebruto <= 60 Then
                        result.Percentil = 95
                    End If
                    If puntajebruto >= 43 And puntajebruto <= 45 Then
                        result.Percentil = 90
                    End If
                    If puntajebruto >= 37 And puntajebruto <= 42 Then
                        result.Percentil = 75
                    End If
                    If puntajebruto >= 19 And puntajebruto <= 36 Then
                        result.Percentil = 50
                    End If
                    If puntajebruto <= 18 Then
                        result.Percentil = 5
                    End If
                End If


                If edad >= 58 And edad <= 62 Then
                    If puntajebruto >= 44 And puntajebruto <= 60 Then
                        result.Percentil = 95
                    End If
                    If puntajebruto >= 41 And puntajebruto = 43 Then
                        result.Percentil = 90
                    End If
                    If puntajebruto >= 35 And puntajebruto <= 40 Then
                        result.Percentil = 75
                    End If
                    If puntajebruto >= 16 And puntajebruto <= 34 Then
                        result.Percentil = 50
                    End If
                    If puntajebruto <= 15 Then
                        result.Percentil = 5
                    End If
                End If


                If edad >= 63 Then
                    If puntajebruto >= 42 And puntajebruto <= 60 Then
                        result.Percentil = 95
                    End If
                    If puntajebruto >= 39 And puntajebruto = 41 Then
                        result.Percentil = 90
                    End If
                    If puntajebruto >= 33 And puntajebruto <= 38 Then
                        result.Percentil = 75
                    End If
                    If puntajebruto >= 13 And puntajebruto <= 32 Then
                        result.Percentil = 50
                    End If
                    If puntajebruto <= 12 Then
                        result.Percentil = 5
                    End If
                End If
            End If
        End If
        Select Case result.Percentil

            Case 95
                result.Diagnostico = "INTELECTUALMENTE SUPERIOR"
            Case 90
                result.Diagnostico = "DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO"
            Case 75
                result.Diagnostico = "DEFINIDAMENTE SUPERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO"
            Case 50
                result.Diagnostico = "INTELECTUALMENTE TERMINO MEDIO"
            Case 25
                result.Diagnostico = "DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO"
            Case 10
                result.Diagnostico = "DEFINIDAMENTE INFERIOR EN CAPACIDAD INTELECTUAL AL TERMINO MEDIO"
            Case 5
                result.Diagnostico = "DEFICIENTE MENTAL"
            Case 0
                result.Diagnostico = "NO SE PUEDE DAR UN DIAGNOSTICO"
        End Select


        Return result

    End Function
End Class
