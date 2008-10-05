Public Class Pager

    ''' <summary>
    ''' Devuelve el total de filas que tiene una tabla
    ''' </summary>
    ''' <param name="tabla">La tabla a calcular</param>
    ''' <returns>Devuelve el total de filas de la tabla</returns>
    ''' <remarks></remarks>
    Public Shared Function GetNumRows(ByVal tabla As DataTable) As Integer
        Return tabla.Rows.Count
    End Function

    ''' <summary>
    ''' Devuelve el total de paginas en las que se puede dividir la tabla
    ''' </summary>
    ''' <param name="tabla">La tabla a calcular</param>
    ''' <param name="pgSize">El tamanio de la pagina(numero de filas)</param>
    ''' <returns>Devuelve el total de paginas</returns>
    ''' <remarks></remarks>
    Public Shared Function GetNumPages(ByVal tabla As DataTable, ByVal pgSize As Integer) As Integer
        Return Math.Ceiling(tabla.Rows.Count / pgSize)
    End Function

    ''' <summary>
    ''' Devuelve una tabla que contiene unicamente las filas correspondientes a la pagina a mostrar
    ''' </summary>
    ''' <param name="tabla">La tabla a calcular</param>
    ''' <param name="indice">El indice de pagina a mostrar</param>
    ''' <param name="pgSize">El tamanio de la pagina</param>
    ''' <returns>La tabla paginada</returns>
    ''' <remarks></remarks>
    Public Shared Function GetRowsPerPage(ByVal tabla As DataTable, ByVal indice As Integer, ByVal pgSize As Integer) As DataTable
        Dim tblPaged As DataTable = tabla.Clone()
        Dim r As DataRow
        For i As Integer = ((pgSize * indice) + 1) To (pgSize * (indice + 1))
            Try
                r = tblPaged.NewRow()
                r.ItemArray = tabla.Rows(i - 1).ItemArray
                tblPaged.Rows.Add(r)
            Catch ex As Exception
                Exit For
            End Try
        Next
        Return tblPaged
    End Function

    Public Shared Function IsLastPage(ByVal tabla As DataTable, ByVal indice As Integer, ByVal pgSize As Integer) As Boolean
        If ((indice + 1) * pgSize >= tabla.Rows.Count) Then
            Return True
        End If
        Return False
    End Function

    Public Shared Function IsFirstPage(ByVal tabla As DataTable, ByVal indice As Integer, ByVal pgSize As Integer) As Boolean
        If (indice = 0) Then
            Return True
        End If
        Return False
    End Function
End Class
