'
' Created by SharpDevelop.
' User: _
' Date: 01/01/2001
' Time: 22:17
' 
' To change this template use Tools | Options | Coding | Edit Standard Headers.
'

Imports System.Data

Public Class ManejadorPruebas
	
	
	Public Shared Sub AgregarPruebas(ByVal a As Aspirante, ByVal tblPCeps As DataTable, ByVal tblPRaven As DataTable, ByVal tblRespuestas as DataTable)		
		'TESTEAR: Verificar que realmente funciona AgregarPruebas
		if Not(a.PruebaC is Nothing) then
			Dim filaCeps As DataRow = tblPCeps.NewRow()
			filaCeps("codprueba") = a.PruebaC.CodPrueba
			filaCeps("codaspirante") = a.Codigo
			filaCeps("fecharealizacion") = a.PruebaC.FechaRealizacion
			tblPCeps.Rows.Add(filaCeps)
			For Each respCeps As Respuesta In a.PruebaC.Respuestas
				Dim filaResp As DataRow = tblRespuestas.NewRow()
				filaResp("codigo") = (int32.Parse(GetMaxCodeRespuestas(tblRespuestas)) + 1).ToString().PadLeft(7,"0")
				filaResp("npregunta") = respCeps.NumPregunta
				filaResp("respuesta_asp") = respCeps.RespuestaAsp
				filaResp("codprueba") = a.PruebaC.CodPrueba
				tblRespuestas.Rows.Add(filaResp)
			Next
		end if
		if Not(a.PruebaR is Nothing) then
			Dim filaRaven As DataRow = tblPRaven.NewRow()
			filaRaven("codprueba") = a.PruebaR.CodPrueba
			filaRaven("codaspirante") = a.Codigo
			filaRaven("fecharealizacion") = a.PruebaR.FechaRealizacion
			tblPRaven.Rows.Add(filaRaven)
			For Each respRaven As Respuesta In a.PruebaR.Respuestas
				Dim filaResp As DataRow = tblRespuestas.NewRow()
				filaResp("codigo") = (int32.Parse(GetMaxCodeRespuestas(tblRespuestas)) + 1).ToString().PadLeft(7,"0")
				filaResp("npregunta") = respRaven.NumPregunta
				filaResp("respuesta_asp") = respRaven.RespuestaAsp
				filaResp("codprueba") = a.PruebaR.CodPrueba
				tblRespuestas.Rows.Add(filaResp)
			Next
		end if
	End Sub
	
	Public Shared Sub AgregarResultados(ByVal a As Aspirante, ByVal tblRCeps As DataTable, ByVal tblRRaven As DataTable)
		'TESTEAR: Verificar que realmente funciona AgregarResultados
		if Not(a.ResCeps is Nothing) then
			Dim filaCeps As DataRow = tblRCeps.NewRow()
			filaCeps("codresult") = a.ResCeps.codresult
			filaCeps("codaspirante") = a.Codigo
			filaCeps("pcontrol") = a.ResCeps.PControl
			filaCeps("pdecision") = a.ResCeps.PDecision
			filaCeps("pextrover") = a.ResCeps.PExtrover
			filaCeps("pparanoi") = a.ResCeps.PParan
			filaCeps("faltasin") = a.ResCeps.PSin
			filaCeps("psincer") = a.ResCeps.PSin
			filaCeps("diagnostico") = a.ResCeps.Diagnostico
			tblRCeps.Rows.Add(filaCeps)
		End If
		If Not(a.ResRaven Is Nothing) Then			
			Dim filaRaven As DataRow = tblrraven.NewRow()
			filaRaven("codresult") = a.ResRaven.codresult
			filaRaven("codaspirante") = a.Codigo
			filaRaven("consistencia") = a.ResRaven.Consistencia
			filaRaven("percentil") = a.ResRaven.Percentil
            filaRaven("diagnostico") = a.ResRaven.Diagnostico
            filaRaven("puntaje") = a.ResRaven.Puntaje
            tblRRaven.Rows.Add(filaRaven)
		end if
	End Sub
	
'	Public Shared Function consultarResultCeps(ByVal A As Aspirante, ByVal tabla As DataTable) As ResultadoCeps
'        For Each fila As DataRow In tabla.Rows
'            If fila("codigo") = A.Codigo Then
'                Dim resultc As New ResultadoCeps(fila("codresult"), fila("pcontrol"), fila("pextrover"), fila("pparanoi"), fila("psincer"), fila("pdecision"), fila("diagnostico"))
'                Return resultc
'            End If
'        Next
'        Return New ResultadoCeps("", "", "", "", "", "", "")
'    End Function
'
'    Public Shared Function consultarResultRaven(ByVal A As Aspirante, ByVal tabla As DataTable) As ResultadoRaven
'        For Each fila As DataRow In tabla.Rows
'            If fila("codigo") = A.Codigo Then
'                Dim resultr As New ResultadoRaven(fila("codresult"), fila("consistencia"), fila("percentil"), fila("diagnostico"))
'                Return resultr
'            End If
'        Next        
'        Return New ResultadoRaven("", "", "", "")
'    End Function

    Public Shared Function RealizarPruebaCeps(ByVal a As Aspirante, ByVal p As PruebaCeps) As Aspirante
    	a.PruebaC = p
    	a.ResCeps = Evaluador.evaluarPruebaceps(a)
    	Return a
    End Function
    
    Public Shared Function RealizarPruebaRaven(ByVal a As Aspirante, ByVal p As PruebaRaven) As Aspirante
    	a.PruebaR = p    	    	
    	a.ResRaven = Evaluador.evaluarPruebaraven(a) 
    	Return a
    End Function
	
	Public Shared Function GetPruebas(ByVal a As Aspirante, ByVal tblPCeps As DataTable, ByVal tblPRaven As DataTable, ByVal tblResp As DataTable) As Aspirante
		'TESTEAR: Verificar que realmente funciona GetPruebas en la GUI
		For Each rPrbC As DataRow In tblPCeps.Rows
			If (rPrbC("codaspirante") = a.Codigo) Then
				a.PruebaC = New PruebaCeps(rPrbC("codprueba"))
				For Each rResp As DataRow In tblResp.Rows
					If(rResp("codprueba") = rPrbC("codprueba")) Then
						a.PruebaC.Respuestas.Add(New Respuesta(rResp("codigo").ToString(), UInteger.Parse(rResp("npregunta")),UInteger.Parse(rResp("respuesta_asp"))))						
					End If					
                Next
                Exit For
			End If			

		Next
		For Each rPrbR As DataRow In tblPRaven.Rows
			If (rPrbR("codaspirante") = a.Codigo) Then
				a.PruebaR = New PruebaRaven(rPrbR("codprueba"))
				For Each rResp As DataRow In tblResp.Rows
					If(rResp("codprueba") = rPrbR("codprueba")) Then
						a.PruebaR.Respuestas.Add(new Respuesta(rResp("codigo").ToString(), UInteger.Parse(rResp("npregunta")),UInteger.Parse(rResp("respuesta_asp"))))
					End If
                Next
                Exit For
			End If

		Next		
		Return a
	End Function
	
	Public Shared Function GetResultados(ByVal a As Aspirante, ByVal tblResC As DataTable, ByVal tblResR As DataTable) As aspirante
		'TESTEAR: Verificar que realmente funciona GetResultados en la GUI
		'ARREGLAR: existe un campo faltasin en la tabla de Resultados Ceps que no corresponde con ningun miembro de la clase		
		'ARREGLAR: el tipo de datos del codigo de resultado de la clase ResultadoRaven es UInteger pero el campo de la tabla es de tipo String
		For Each rResC As DataRow In tblResC.Rows
			If(rResC("codaspirante") = a.Codigo) Then
				a.ResCeps = New ResultadoCeps(rResC("codresult"),rResC("pcontrol"),rResC("pextrover"),rResC("pparanoi"), rResC("psincer"), rResC("pdecision"), rResC("diagnostico"))
                Exit For
            End If

        Next
		For Each rResR As DataRow In tblResR.Rows
			If(rResR("codaspirante") = a.Codigo) Then
                a.ResRaven = New ResultadoRaven(rResR("codresult"), rResR("consistencia"), rResR("percentil"), rResR("diagnostico"), rResR("puntaje"))
                Exit For
            End If

        Next
		Return a
	End Function
			
	Public Shared Function GetMaxCodePruebas(ByVal tblPruebas As DataTable) As String
		dim maxCode as String = "00000"
		For Each fila As DataRow In tblPruebas.Rows
			If(String.Compare(fila("codprueba"),maxCode) > 0)
				maxCode = fila("codprueba")
			End If
		next
		return maxCode
	End Function		
	
	Public Shared Function GetMaxCodeResultados(ByVal tblResultados As DataTable) As String
		Dim maxCode As String = "00000"
		For Each fila As DataRow In tblResultados.Rows
			If (String.Compare(fila("codresult"),maxCode) > 0) Then
                maxCode = fila("codresult")
			End If
		next
		return maxCode		
	End Function
	
	Public Shared Function GetMaxCodeRespuestas(ByVal tblRespuestas As DataTable) As String
		Dim maxCode As String = "00000"
		For Each fila As DataRow In tblRespuestas.Rows
			If (String.Compare(fila("codigo"),maxCode) > 0) Then
				maxCode = fila("codigo")
			end if
		Next
		return maxCode
	End Function
			
End Class
