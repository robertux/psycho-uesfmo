Imports MySql.Data.MySqlClient

Public Class ManejadorAdmin
    Private _administradores As List(Of Administrador)

    Public Property Administradores() As List(Of Administrador)
        Get
            Return _administradores
        End Get
        Set(ByVal value As List(Of Administrador))
            Me._administradores = value
        End Set
    End Property

    Public Shared Sub agregar(ByVal A As Administrador, ByVal tabla As DataTable)
        Try
            Dim fila As DataRow = tabla.NewRow()
            fila("codigo") = A.Codigo
            fila("nombres") = A.Nombre
            fila("contrasenia") = CrypterClassLib.PsychoCrypter.Encriptar(A.Contrasenia)
            fila("privilegio") = A.Privilegio
            tabla.Rows.Add(fila)
        Catch ex As Exception
            'pass...
        End Try
    End Sub

    Public Shared Sub modificar(ByVal A As Administrador, ByVal tabla As DataTable)
        For Each fila As DataRow In tabla.Rows
            If (fila("codigo") = A.Codigo) Then
                Try
                    fila("nombres") = A.Nombre
                    fila("contrasenia") = CrypterClassLib.PsychoCrypter.Encriptar(A.Contrasenia)
                    fila("privilegio") = A.Privilegio
                    Exit For
                Catch ex As Exception
                    'pass...                    
                    Exit For
                End Try
            End If
        Next
    End Sub

 

    Public Shared Sub eliminar(ByVal A As Administrador, ByVal tabla As DataTable)
        For Each fila As DataRow In tabla.Rows
            If (fila("codigo") = A.Codigo) Then
                tabla.Rows.Remove(fila)
            End If
        Next
    End Sub

    Public Shared Function consultarAdmin(ByVal codigo As String, ByVal tabla As DataTable) As Administrador
        For Each fila As DataRow In tabla.Rows
            If (fila("codigo") = codigo) Then
                Dim adm As New Administrador(fila("codigo"), fila("nombres"), fila("contrasenia"), fila("privilegio"))
                Return adm
            End If
        Next
        Return New Administrador("", "", "", "")
    End Function

    'Public Shared Function consultarEstadisticas(ByVal criterio As String, ByRef tabla As DataTable) As Estadisticas
    '    For Each fila As DataRow In tabla.Rows
    '        If (fila("criterio") = criterio) Then

    '        End If
    '    Next
    'End Function


    'Public Shared Function obtenerDiagnostico(ByVal A As Aspirante, ByRef tabla As DataTable) As Resultados
    '    For Each fila As DataRow In tabla.Rows

    '    Next
    'End Function

    Public Shared Function GenerarCodigoAdmin(ByVal tabla As DataTable) As String
        Dim i As Integer
        i = Int(tabla.Rows(tabla.Rows.Count - 1)("codigo"))
        i = i + 1
        Return i.ToString().PadLeft(7, "0")
    End Function


    Public Shared Function Exisadmin(ByVal nombre As String, ByVal contrasenia As String, ByVal tabla As DataTable) As Administrador
        For Each fila As DataRow In tabla.Rows
            Try
                If (fila("nombres") = nombre And fila("contrasenia") = CrypterClassLib.PsychoCrypter.Encriptar(contrasenia)) Then
                    Return New Administrador(fila("codigo"), fila("nombres"), fila("contrasenia"), fila("privilegio"))
                End If
            Catch ex As Exception
                'pass...
                Return Nothing
            End Try
        Next
        Return Nothing
    End Function

End Class
