''' <summary>
''' Representa un conjunto de metodos que se encargan de las operaciones relacionadas con los grupos
''' </summary>
''' <remarks></remarks>
Public Class ManejadorGrupo

    ''' <summary>
    ''' Genera el codigo de un grupo basado en la fecha y hora de realizacion
    ''' </summary>
    ''' <param name="G">El grupo del cual se desea generar el codigo</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function generarCodigo(ByVal G As Grupo, ByVal tabla As DataTable) As String
        Dim codigo As String
        Dim i, cuantos As Integer
        codigo = ""
        cuantos = 1
        codigo = G.Examinador.ToUpper().Substring(0, 1) + G.FechaRealizacion.Year.ToString().PadLeft(4, "0").Substring(2, 2) + G.FechaRealizacion.Month.ToString().PadLeft(2, "0")
        For i = 0 To tabla.Rows.Count - 1
            If tabla.Rows(i)("codgrupo").ToString().Contains(codigo) Then
                cuantos += 1
            End If
        Next
        codigo = codigo + cuantos.ToString().PadLeft(2, "0")
        Return codigo
    End Function

    ''' <summary>
    ''' Agrega a un grupo una lista de aspirantes
    ''' </summary>
    ''' <param name="A">La lista de aspirantes a agregar</param>
    ''' <param name="G">El grupo en el cual agregarlos</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function generarLista(ByVal ds As DataSet, ByVal G As Grupo, ByVal tamanio As Integer) As Grupo
        Dim i As Integer = 0
        Dim rm As New Random
        Dim asp As List(Of Aspirante)
        asp = aspvacantes(ds)
        For i = 0 To tamanio - 1
            G.ListaApirantes(i) = asp(i)
        Next
        Return G
    End Function

    ''' <summary>
    ''' Agrega un nuevo grupo a la base de datos
    ''' </summary>
    ''' <param name="G">El grupo a agregar</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Sub agregarGrupo(ByVal G As Grupo, ByVal ds As DataSet)
        Dim fila As DataRow = ds.Tables("grupos").NewRow()
        fila("codgrupo") = G.CodigoGrupo
        fila("fecharealizacion") = G.FechaRealizacion
        fila("horarealizacion") = G.horaRealizacion
        fila("tamanio") = G.tamanio
        fila("examinador") = G.Examinador
        fila("minutorealizacion") = G.minutoRealizacion
        fila("centrocomputo") = G.CentroComputo.CodCentroComputo
        ds.Tables("grupos").Rows.Add(fila)        
    End Sub

    ''' <summary>
    ''' Modifica un grupo existente en la base de datos
    ''' </summary>
    ''' <param name="G">El grupo a modificar</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Sub modificarGrupo(ByVal G As Grupo, ByVal ds As DataSet)

        For Each fila As DataRow In ds.Tables("grupos").Rows
            If fila("codgrupo") = G.CodigoGrupo Then
                fila("fecharealizacion") = G.FechaRealizacion
                fila("horarealizacion") = G.horaRealizacion
                fila("minutorealizacion") = G.minutoRealizacion
                fila("tamanio") = G.tamanio
                fila("examinador") = G.Examinador
                fila("centrocomputo") = G.CentroComputo.CodCentroComputo
            End If
        Next
    End Sub

    Public Shared Function aspvacantes(ByVal ds As DataSet) As List(Of Aspirante)
        Dim asp As New List(Of Aspirante)
        For Each fila As DataRow In ds.Tables("aspirantes").Rows
            If TypeOf (fila("codgrupo")) Is System.DBNull Then
                asp.Add(New Aspirante(fila("codigo"), fila("nombres"), fila("apellidos") _
                , fila("codgrupo"), fila("direccion"), fila("telefono") _
                , ManejadorMisc.GetLugarEstudios(fila("lugarestudio"), ds.Tables("centroestudio")) _
                , ManejadorMisc.GetCiudad(fila("ciudad"), ds.Tables("ciudades")) _
                , ManejadorMisc.GetDepto(fila("departamento"), ds.Tables("departamentos")) _
                , fila("anioaprobado"), fila("estado") _
                , ManejadorMisc.GetCarrera(fila("carrera"), ds.Tables("carreras")) _
                , fila("sexo"), fila("fechanacimiento") _
                , ManejadorMisc.GetFacultad(fila("facultad"), ds.Tables("facultades")) _
                , fila("anioregistrado"), fila("resultado")))
            End If
        Next
        Return asp
    End Function

    Public Shared Function consultargrupo(ByVal codigo As String, ByVal tabla As DataTable, ByVal tbcomp As DataTable) As Grupo
        For Each fila As DataRow In tabla.Rows
            If fila("codgrupo") = codigo Then
                Dim gr As New Grupo(fila("codgrupo"), fila("horarealizacion"), fila("fecharealizacion"), fila("examinador") _
                , fila("tamanio"), fila("minutorealizacion"), ManejadorMisc.GetCentroComputo(fila("centrocomputo"), tbcomp))
                Return gr
                Exit For
            End If
        Next
        Return Nothing
    End Function

    Public Shared Sub EliminarGrupo(ByVal grp As Grupo, ByVal tabla As DataTable)
        For Each fila As DataRow In tabla.Rows
            If (fila("codgrupo") = grp.CodigoGrupo) Then
                tabla.Rows.Remove(fila)
                Exit For
            End If
        Next
    End Sub

End Class
