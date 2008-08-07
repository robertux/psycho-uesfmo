Public Class ManejadorMisc

    #region "CentrosComputo"
    
    Public Shared Function GetCentrosComputo(ByVal tabla As DataTable) As List(Of CentroComputo)
        Dim cc As New List(Of CentroComputo)
        For Each fila As DataRow In tabla.Rows
            cc.Add(New CentroComputo(fila("codigo"), fila("nombre")))
        Next
        Return cc
    End Function

    Public Shared Function GetCentroComputo(ByVal codigo As String, ByVal tabla As DataTable) As CentroComputo
        For Each fila As DataRow In tabla.Rows
            If fila("codigo") = codigo Then
                Dim cc As New CentroComputo(codigo, fila("nombre"))
                Return cc
                Exit For
            End If
        Next
        Return Nothing
    End Function

#End Region

#region "CentroEstudios"

    Public Shared Function GetCentroEstudios(ByVal tabla As DataTable) As List(Of centroestudio)
        Dim ce As New List(Of centroestudio)
        For Each fila As DataRow In tabla.Rows
            ce.Add(New centroestudio(fila("codigo"), fila("nombre")))
        Next
        Return ce
    End Function
    
 #End Region
 
 #region "Departamentos/Ciudades"

    Public Shared Function GetDepartamentos(ByVal tabla As DataTable) As List(Of Departamento)
        Dim deptos As New List(Of Departamento)
        For Each fila As DataRow In tabla.Rows
            deptos.Add(New Departamento(fila("codigo"), fila("nombre")))
        Next
        Return deptos
    End Function

    Public Shared Function GetCiudades(ByVal codDepto As String, ByVal tabla As DataTable) As List(Of Ciudad)
        Dim ciudades As New List(Of Ciudad)
        For Each fila As DataRow In tabla.Rows
            If fila("coddepto") = codDepto Then
                ciudades.Add(New Ciudad(fila("codigo"), fila("nombre"), fila("coddepto")))
            End If
        Next
        Return ciudades
    End Function
    
        Public Shared Function GetCiudad(ByVal codigo As String, ByVal tabla As DataTable) As Ciudad
        For Each fila As DataRow In tabla.Rows
            If (fila("codigo") = codigo) Then
                Return New Ciudad(fila("codigo"), fila("nombre"), fila("coddepto"))
            End If
        Next
        Return Nothing
    End Function

    Public Shared Function GetDepto(ByVal codigo As String, ByVal tabla As DataTable) As Departamento
        For Each fila As DataRow In tabla.Rows
            If (fila("codigo") = codigo) Then
                Return New Departamento(fila("codigo"), fila("nombre"))
            End If
        Next
        Return Nothing
    End Function
    
    #End Region
    
    #region "Carreras/Facultades"

    Public Shared Function GetCarreras(ByVal codfacultad As String, ByVal tabla As DataTable) As List(Of Carrera)
        Dim carreras As New List(Of Carrera)
        For Each fila As DataRow In tabla.Rows
            If fila("codfacultad") = codfacultad Then
                carreras.Add(New Carrera(fila("codigo"), fila("nombre"), fila("codfacultad")))
            End If
        Next
        Return carreras
    End Function

    Public Shared Function GetFacultades(ByVal tabla As DataTable) As List(Of Facultad)
        Dim facultades As New List(Of Facultad)
        For Each fila As DataRow In tabla.Rows
            facultades.Add(New Facultad(fila("codigo"), fila("nombre")))
        Next
        Return facultades
    End Function
    
        Public Shared Function GetCarrera(ByVal codigo As String, ByVal tabla As DataTable) As Carrera
        For Each fila As DataRow In tabla.Rows
            If (fila("codigo") = codigo) Then
                Return New Carrera(fila("codigo"), fila("nombre"), fila("codfacultad"))
            End If
        Next
        Return Nothing
    End Function

    Public Shared Function GetFacultad(ByVal codigo As String, ByVal tabla As DataTable) As Facultad
        For Each fila As DataRow In tabla.Rows
            If (fila("codigo") = codigo) Then
                Return New Facultad(fila("codigo"), fila("nombre"))
            End If
        Next
        Return Nothing
    End Function
    
    #end region

    Public Shared Function GetLugarEstudios(ByVal codigo As String, ByVal tabla As DataTable) As centroestudio
        For Each fila As DataRow In tabla.Rows
            If (fila("codigo") = codigo) Then
                Return New centroestudio(fila("codigo"), fila("nombre"))
            End If
        Next
        Return Nothing
    End Function

    Public Shared Function InvertString(ByVal s As String) As String
        Dim newS As String = ""
        For i As Integer = s.Length - 1 To 0 Step -1
            newS += s(i).ToString
        Next
        Return newS
    End Function

End Class
