Public Class tablapuntajenormal
    Public total(44), serieA(44), serieB(44), serieC(44), serieD(44), serieE(44) As Integer

    Public Sub New()
        Dim i As Integer
        For i = 0 To 44
            total(i) = i + 15

            'LLENAR LA SERIE A
            If i <= 6 Then
                serieA(i) = 8
            End If
            If i >= 7 And i <= 9 Then
                serieA(i) = 9
            End If
            If i >= 10 And i <= 17 Then
                serieA(i) = 10
            End If
            If i >= 18 And i <= 27 Then
                serieA(i) = 11
            End If
            If i >= 28 And i <= 44 Then
                serieA(i) = 12
            End If

            'LLENAR LA SERIE B

            If i <= 1 Then
                serieB(i) = 4
            End If
            If i >= 2 And i <= 3 Then
                serieB(i) = 5
            End If
            If i >= 4 And i <= 7 Then
                serieB(i) = 6
            End If
            If i >= 8 And i <= 16 Then
                serieB(i) = 7
            End If
            If i >= 17 And i <= 21 Then
                serieB(i) = 8
            End If
            If i >= 22 And i <= 24 Then
                serieB(i) = 9
            End If
            If i >= 25 And i <= 32 Then
                serieB(i) = 10
            End If
            If i >= 33 And i <= 38 Then
                serieB(i) = 11
            End If
            If i >= 39 And i <= 44 Then
                serieB(i) = 12
            End If

            'LLENAR LA SERIE C
            If i <= 0 Then
                serieC(i) = 2
            End If
            If i >= 1 And i <= 5 Then
                serieC(i) = 3
            End If
            If i >= 6 And i <= 10 Then
                serieC(i) = 4
            End If
            If i >= 11 And i <= 12 Then
                serieC(i) = 5
            End If
            If i >= 13 And i <= 15 Then
                serieC(i) = 6
            End If
            If i >= 16 And i <= 20 Then
                serieC(i) = 7
            End If
            If i >= 21 And i <= 25 Then
                serieC(i) = 8
            End If
            If i >= 26 And i <= 30 Then
                serieC(i) = 9
            End If
            If i >= 31 And i <= 35 Then
                serieC(i) = 10
            End If
            If i >= 36 And i <= 40 Then
                serieC(i) = 11
            End If
            If i >= 41 And i <= 44 Then
                serieC(i) = 12
            End If

            'LLENAR LA SERIE D
            If i <= 2 Then
                serieD(i) = 1
            End If
            If i >= 3 And i <= 8 Then
                serieD(i) = 2
            End If
            If i >= 9 And i <= 11 Then
                serieD(i) = 3
            End If
            If i >= 12 And i <= 13 Then
                serieD(i) = 4
            End If
            If i >= 14 And i <= 18 Then
                serieD(i) = 5
            End If
            If i >= 19 And i <= 19 Then
                serieD(i) = 6
            End If
            If i >= 20 And i <= 22 Then
                serieD(i) = 7
            End If
            If i >= 23 And i <= 26 Then
                serieD(i) = 8
            End If
            If i >= 27 And i <= 33 Then
                serieD(i) = 9
            End If
            If i >= 34 And i <= 37 Then
                serieD(i) = 10
            End If
            If i >= 38 And i <= 42 Then
                serieD(i) = 11
            End If
            If i >= 43 And i <= 44 Then
                serieD(i) = 12
            End If

            'LLENAR LA SERIE E
            If i <= 4 Then
                serieE(i) = 0
            End If
            If i >= 5 And i <= 14 Then
                serieE(i) = 1
            End If
            If i >= 15 And i <= 23 Then
                serieE(i) = 2
            End If
            If i >= 24 And i <= 28 Then
                serieE(i) = 3
            End If
            If i >= 29 And i <= 29 Then
                serieE(i) = 4
            End If
            If i >= 30 And i <= 31 Then
                serieE(i) = 5
            End If
            If i >= 32 And i <= 34 Then
                serieE(i) = 6
            End If
            If i >= 35 And i <= 36 Then
                serieE(i) = 7
            End If
            If i >= 37 And i <= 39 Then
                serieE(i) = 8
            End If
            If i >= 40 And i <= 41 Then
                serieE(i) = 9
            End If
            If i >= 42 And i <= 43 Then
                serieE(i) = 10
            End If
            If i >= 44 And i <= 44 Then
                serieE(i) = 11
            End If
        Next


    End Sub
End Class
