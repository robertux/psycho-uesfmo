Public Class TableFormatter

    ''' <summary>
    ''' Formatea la tabla aspirantes para que pueda mostrar la informacion en un Grid de forma adecuada
    ''' </summary>
    ''' <param name="tblAspir">La tabla original de aspirantes</param>
    ''' <param name="tblFacultades">La tabla de facultades</param>
    ''' <param name="tblCarreras">La tabla de carreras</param>
    ''' <returns>Retorna una nueva tabla de aspirantes con las columnas apropiadas</returns>
    ''' <remarks></remarks>
    Public Shared Function FormatAspirantes(ByVal tblAspir As DataTable, ByVal tblFacultades As DataTable, ByVal tblCarreras As DataTable) As DataTable
        Dim Formatted As DataTable = tblAspir.Copy()
        'Removemos las columnas que no queremos mostrar
        'Formatted.Columns.Remove("direccion")
        'Formatted.Columns.Remove("telefono")
        'Formatted.Columns.Remove("lugarestudio")
        'Formatted.Columns.Remove("ciudad")
        'Formatted.Columns.Remove("departamento")
        'Formatted.Columns.Remove("anioaprobado")
        'Formatted.Columns.Remove("sexo")
        'Formatted.Columns.Remove("fechanacimiento")
        'Formatted.Columns.Remove("codgrupo")
        'Formatted.Columns.Remove("resultado")
        'Formatted.Columns.Remove("anioregistrado")        
        For Each rAsp As DataRow In Formatted.Rows
            'Sustituimos los codigos de las facultades por sus respectivos nombres
            For Each rFac As DataRow In tblFacultades.Rows
                If (rAsp("facultad") = rFac("codigo")) Then
                    'If (rFac("nombre").ToString.Length > 28) Then
                    '    rAsp("facultad") = "..." + ManejadorMisc.InvertString(ManejadorMisc.InvertString(rFac("nombre").ToString).Substring(0, 25))
                    'Else
                    rAsp("facultad") = rFac("nombre")
                    'End If
                    Exit For
                End If
            Next
            'Sustituimos los codigos de las carreras por sus respectivos nombres
            For Each rCar As DataRow In tblCarreras.Rows
                If (rAsp("carrera") = rCar("codigo")) Then
                    'If (rCar("nombre").ToString.Length > 23) Then
                    '    rAsp("carrera") = rCar("nombre").ToString.Substring(0, 20) + "..."
                    'Else
                    rAsp("carrera") = rCar("nombre")
                    'End If
                    Exit For
                End If
            Next
        Next
        Return Formatted
    End Function

    ''' <summary>
    ''' Formatea la tabla grupos para que pueda mostrar la informacion en un Grid de forma adecuada
    ''' </summary>
    ''' <param name="tblGrupos">La tabla original de grupos</param>
    ''' <param name="tblAspir">La tabla de aspirantes</param>
    ''' <param name="tblCCom">La tabla de centros de computo</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function FormatGrupos(ByVal tblGrupos As DataTable, ByVal tblAspir As DataTable, ByVal tblCCom As DataTable) As DataTable
        Dim Formatted As DataTable = tblGrupos.Copy()        
        Dim nAspir As Integer = 0
        For Each rGrp As DataRow In Formatted.Rows
            'Arreglamos el tamanio del grupo
            For Each rAsp As DataRow In tblAspir.Rows
                If (rAsp("codgrupo") = rGrp("codgrupo")) Then
                    nAspir += 1
                End If
            Next
            rGrp("tamanio") = nAspir
            nAspir = 0
            'Formateamos la fecha y la hora del grupo
            Dim year As Integer = CType(rGrp("fecharealizacion"), DateTime).Year
            Dim month As Integer = CType(rGrp("fecharealizacion"), DateTime).Month
            Dim day As Integer = CType(rGrp("fecharealizacion"), DateTime).Day
            rGrp("fecharealizacion") = New DateTime(year, month, day, rGrp("horarealizacion"), rGrp("minutorealizacion"), 0)
            'Sustituimos los codigos de los centros de computo por sus respectivos nombres
            For Each rCComp As DataRow In tblCCom.Rows
                If (rGrp("centrocomputo") = rCComp("codigo")) Then
                    rGrp("centrocomputo") = rCComp("nombre")
                End If
            Next
        Next
        'Removemos las columnas que no queremos mostrar
        'Formatted.Columns.Remove("horarealizacion")
        'Formatted.Columns.Remove("minutorealizacion")
        Return Formatted
    End Function

End Class
