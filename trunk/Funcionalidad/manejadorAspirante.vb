''' <summary>
''' Representa un conjunto de metodos que se encargan de las operaciones relacionadas con los aspirantes
''' </summary>
''' <remarks></remarks>
Public Class manejadorAspirante
    
    Public Shared Sub agregarAspirante(ByVal A As Aspirante, ByVal tabla As DataTable)
        Dim fila As DataRow = tabla.NewRow()
        fila("codigo") = A.Codigo.ToUpper()
        fila("nombres") = A.Nombres
        fila("apellidos") = A.Apellidos
        fila("codgrupo") = A.CodigoGrupo
        fila("direccion") = A.Direccion
        fila("telefono") = A.Telefono
        fila("lugarestudio") = A.LugarEstudios.codigo
        fila("ciudad") = A.Ciudad.CodCiudad
        fila("departamento") = A.Depto.CodDepartamento
        fila("anioaprobado") = A.AnioAprobado
        fila("estado") = A.Estado
        fila("sexo") = A.Sexo
        fila("carrera") = A.Carrera.CodCarrera
        fila("facultad") = A.Facultad.CodFacultad
        fila("fechanacimiento") = A.FechaNacimiento
        fila("anioregistrado") = A.AnioRegistrado
        fila("resultado") = A.Resultado
        tabla.Rows.Add(fila)
    End Sub

    Public Shared Sub eliminarAspirante(ByVal A As Aspirante, ByVal tabla As DataTable)
        For Each fila As DataRow In tabla.Rows
            If (fila("codigo") = A.Codigo) Then
                tabla.Rows.Remove(fila)
                Exit For
            End If
        Next
    End Sub

    Public Shared Sub eliminarAspirante(ByVal codigo As String, ByVal tabla As DataTable)
        For Each fila As DataRow In tabla.Rows
            If (fila("codigo") = codigo) Then
                tabla.Rows.Remove(fila)
                Exit For
            End If
        Next
    End Sub


    Public Shared Sub modificarAspirante(ByVal A As Aspirante, ByVal tabla As DataTable)
        For Each fila As DataRow In tabla.Rows


            If (fila("codigo") = A.Codigo) Then
                fila("nombres") = A.Nombres
                fila("apellidos") = A.Apellidos
                fila("codgrupo") = A.CodigoGrupo
                fila("direccion") = A.Direccion
                fila("telefono") = A.Telefono
                fila("lugarestudio") = A.LugarEstudios.codigo
                fila("ciudad") = A.Ciudad.CodCiudad
                fila("departamento") = A.Depto.CodDepartamento
                fila("anioaprobado") = A.AnioAprobado
                fila("estado") = A.Estado
                fila("sexo") = A.Sexo
                fila("carrera") = A.Carrera.CodCarrera
                fila("facultad") = A.Facultad.CodFacultad
                fila("fechanacimiento") = A.FechaNacimiento
                fila("codgrupo") = A.CodigoGrupo
                fila("resultado") = A.Resultado
            End If
        Next
    End Sub

    Public Shared Function GenerarCodigo(ByVal apl As String, ByVal nom As String, ByVal tabla As DataTable) As String
        Dim cuantos As Integer = 0
        Dim codigo As String
        For i As Integer = 0 To tabla.Rows.Count - 1
            If (tabla.Rows(i)("apellidos").ToString().ToUpper().PadLeft(2, "0").Substring(0, 1) = apl.ToUpper().PadLeft(2, "0").Substring(0, 1) And tabla.Rows(i)("nombres").ToString().ToUpper().PadLeft(2, "0").Substring(0, 1) = nom.ToUpper().PadLeft(2, "0").Substring(0, 1)) Then
                cuantos += 1
            End If
        Next
        codigo = apl.PadLeft(2, "0").Substring(0, 1) + nom.PadLeft(2, "0").Substring(0, 1) + (cuantos + 1).ToString().PadLeft(5, "0")
        Return codigo
    End Function

    Public Shared Function ConsultarAspirantes(ByVal anio As UInteger, ByVal ds As DataSet) As List(Of Aspirante)
        Dim asp As New List(Of Aspirante)
        For Each fila As DataRow In ds.Tables("aspirantes").Rows
            If (fila("anioregistrado") = anio) Then
            	 Dim result As String
            	 If(TypeOf(fila("resultado")) Is system.DBNull) Then
            	 	result = ""
            	 Else
            	 	result = fila("resultado")
            	 end if
                asp.Add(New Aspirante(fila("codigo"), fila("nombres"), fila("apellidos") _
                , fila("codgrupo"), fila("direccion"), fila("telefono") _
                , ManejadorMisc.GetLugarEstudios(fila("lugarestudio"), ds.Tables("centroestudio")) _
                , ManejadorMisc.GetCiudad(fila("ciudad"), ds.Tables("ciudades")) _
                , ManejadorMisc.GetDepto(fila("departamento"), ds.Tables("departamentos")) _
                , fila("anioaprobado"), fila("estado") _
                , ManejadorMisc.GetCarrera(fila("carrera"), ds.Tables("carreras")) _
                , fila("sexo"), fila("fechanacimiento") _
                , ManejadorMisc.GetFacultad(fila("facultad"), ds.Tables("facultades")) _
                , fila("anioregistrado"), result))
            End If
        Next
        Return asp
    End Function

    Public Shared Function GetAspirante(ByVal codigo As String, ByVal ds As DataSet) As Aspirante
        For Each fila As DataRow In ds.Tables("aspirantes").Rows
            If (fila("codigo").ToString().ToUpper() = codigo.ToUpper()) Then
                Dim codgrup = fila("codgrupo")
                Dim result = fila("resultado")
                If (TypeOf (codgrup) Is System.DBNull) Then codgrup = ""
                If(TypeOf(result) Is System.DBNull) Then
                	result = ""
                Else
                	result = fila("resultado")
                End If 
                Return New Aspirante(fila("codigo"), fila("nombres"), fila("apellidos") _
            , codgrup _
            , fila("direccion"), fila("telefono") _
            , ManejadorMisc.GetLugarEstudios(fila("lugarestudio"), ds.Tables("centroestudio")) _
            , ManejadorMisc.GetCiudad(fila("ciudad"), ds.Tables("ciudades")) _
            , ManejadorMisc.GetDepto(fila("departamento"), ds.Tables("departamentos")) _
            , fila("anioaprobado"), fila("estado") _
            , ManejadorMisc.GetCarrera(fila("carrera"), ds.Tables("carreras")) _
            , fila("sexo"), fila("fechanacimiento") _
            , ManejadorMisc.GetFacultad(fila("facultad"), ds.Tables("facultades")) _
            , fila("anioregistrado"), result)
            End If
        Next
        Return Nothing
    End Function

    Public Shared Function ConsultarAspirGrupo(ByVal codgrupo As String, ByVal ds As DataSet) As List(Of Aspirante)
        Dim aspirs As New List(Of Aspirante)
        For Each fila As DataRow In ds.Tables("aspirantes").Rows
            If (fila("codgrupo") = codgrupo) Then
            	Dim result As String
            	If(TypeOf(fila("resultado")) Is system.DBNull) Then 
            		result = ""
            	Else
            		result = fila("codgrupo")
            	End If            	
                aspirs.Add(New Aspirante(fila("codigo"), fila("nombres"), fila("apellidos") _
                , fila("codgrupo"), fila("direccion"), fila("telefono") _
                , ManejadorMisc.GetLugarEstudios(fila("lugarestudio"), ds.Tables("centroestudio")) _
                , ManejadorMisc.GetCiudad(fila("ciudad"), ds.Tables("ciudades")) _
                , ManejadorMisc.GetDepto(fila("departamento"), ds.Tables("departamentos")) _
                , fila("anioaprobado"), fila("estado") _
                , ManejadorMisc.GetCarrera(fila("carrera"), ds.Tables("carreras")) _
                , fila("sexo"), fila("fechanacimiento") _
                , ManejadorMisc.GetFacultad(fila("facultad"), ds.Tables("facultades")) _
                , fila("anioregistrado"), result))
            End If
        Next
        Return aspirs
    End Function

End Class
