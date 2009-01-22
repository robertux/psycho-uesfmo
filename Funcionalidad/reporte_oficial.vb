Imports Word = Microsoft.Office.Interop.Word

''' <summary>
''' Realiza los reportes oficiales
''' Falta un pequeño manejo de errores, por si Word no esta instalado.
''' </summary>

Public Class reporte_oficial

    Public Sub New(ByVal tabla As DataTable, ByVal datos As AccesoDatos.AccesoDatos, ByVal filename as String)
        Dim lista As New List(Of Aspirante)
        Dim asp As Aspirante
        Dim oWord As Word.Application
        Dim oDoc As Word.Document
        Dim tabla1 As Word.Table, tabla2 As Word.Table, tabla3 As Word.Table, tabla4 As Word.Table
        Dim parrafo1 As Word.Paragraph, parrafo2 As Word.Paragraph
        Dim parrafo3 As Word.Paragraph, parrafo4 As Word.Paragraph
        Dim parrafo5 As Word.Paragraph, parrafo6 As Word.Paragraph
        Dim parrafo7 As Word.Paragraph, parrafo8 As Word.Paragraph
        Dim parrafoaux As Word.Paragraph, parrafofirma As Word.Paragraph, parrafopsicologo As Word.Paragraph
        Dim parrafojunta As Word.Paragraph, parrafofecha As Word.Paragraph
        Dim oShape As Word.InlineShape
        Dim auxcarrera As String
        Dim oChart As Object
        Dim i As Integer

        For Each fila As DataRow In tabla.Rows
            asp = manejadorAspirante.GetAspirante(fila("codigo"), datos.ds)
            asp = ManejadorPruebas.GetResultados(asp, datos.ds.Tables("resultadosceps"), datos.ds.Tables("resultadosraven"))
            lista.Add(asp)
        Next


        oWord = CreateObject("Word.Application")
        oWord.Visible = True
        oDoc = oWord.Documents.Add


        'For i = 0 To lista.Count - 1
        For i = 0 To 1

            If lista(i).Estado = "evaluado" Then

                parrafo1 = oDoc.Content.Paragraphs.Add
                parrafo1.Range.Text = "INFORME INDIVIDUAL INGRESO 2009"
                parrafo1.Range.Font.Bold = False
                parrafo1.Range.Font.Size = 14
                'parrafo1.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter
                parrafo1.Range.InsertParagraphAfter()

                parrafo2 = oDoc.Content.Paragraphs.Add(oDoc.Bookmarks.Item("\endofdoc").Range)
                parrafo2.Range.Text = "RESULTADO DE PRUEBAS PSICOLOGICAS"
                parrafo2.Range.Font.Bold = False
                parrafo2.Range.Font.Size = 14
                'parrafo2.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter
                parrafo2.Range.InsertParagraphAfter()


                parrafo3 = oDoc.Content.Paragraphs.Add(oDoc.Bookmarks.Item("\endofdoc").Range)
                parrafo3.Range.Text = "UNIDAD DE POSTGRADOS F.M.O. - U.E.S."
                parrafo3.Range.Font.Bold = False
                parrafo3.Range.Font.Size = 12
                'parrafo3.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter
                parrafo3.Format.SpaceAfter = 8
                parrafo3.Range.InsertParagraphAfter()


                parrafo4 = oDoc.Content.Paragraphs.Add(oDoc.Bookmarks.Item("\endofdoc").Range)
                parrafo4.Range.Text = "CERTIFICADO INDIVIDUAL DE LOS RESULTADOS DE LA EVALUACIÓN"
                parrafo4.Range.Font.Bold = True
                parrafo4.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter
                parrafo4.Range.Font.Size = 12
                parrafo3.Format.SpaceAfter = 0
                parrafo4.Range.InsertParagraphAfter()

                parrafo5 = oDoc.Content.Paragraphs.Add(oDoc.Bookmarks.Item("\endofdoc").Range)
                parrafo5.Range.Text = "PSICOLÓGICA REALIZADA A ASPIRANTES A PROFESORADOS"
                parrafo5.Range.Font.Bold = True
                parrafo5.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter
                parrafo5.Range.Font.Size = 12
                parrafo5.Format.SpaceAfter = 14
                parrafo5.Range.InsertParagraphAfter()

                'Insert a 3 x 5 table, fill it with data, and make the first row
                'bold and italic.
                tabla1 = oDoc.Tables.Add(oDoc.Bookmarks.Item("\endofdoc").Range, 2, 2)
                tabla1.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft
                tabla1.Range.ParagraphFormat.SpaceAfter = 1
                tabla1.Borders.Enable = 1

                tabla1.Rows.Item(1).Cells(1).Width = 160
                tabla1.Rows.Item(1).Cells(2).Width = 340
                tabla1.Rows.Item(2).Cells(1).Width = 100
                tabla1.Rows.Item(2).Cells(2).Width = 400


                tabla1.Cell(1, 1).Range.Text = "NOMBRE DEL ASPIRANTE: "
                tabla1.Cell(1, 2).Range.Text = lista(i).Apellidos + ", " + lista(i).Nombres
                tabla1.Cell(2, 1).Range.Text = "PROFESORADO: "

                auxcarrera = lista(i).Carrera.NombreCarrera.Remove(0, 15)

                tabla1.Cell(2, 2).Range.Text = auxcarrera
                tabla1.Rows.Item(1).Range.Font.Bold = False
                tabla1.Rows.Item(2).Range.Font.Bold = False

                parrafoaux = oDoc.Content.Paragraphs.Add(oDoc.Bookmarks.Item("\endofdoc").Range)
                parrafoaux.Range.Text = ""
                parrafoaux.Range.Font.Bold = False
                parrafoaux.Range.ParagraphFormat.SpaceAfter = 2
                parrafoaux.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft
                parrafoaux.Range.Font.Size = 12
                parrafoaux.Range.InsertParagraphAfter()


                parrafo6 = oDoc.Content.Paragraphs.Add(oDoc.Bookmarks.Item("\endofdoc").Range)
                parrafo6.Range.Text = "OBTUVO EL SIGUIENTE RESULTADO:"
                parrafo6.Range.Font.Bold = False
                parrafo6.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft
                parrafo6.Range.Font.Size = 12
                parrafo6.Range.ParagraphFormat.SpaceAfter = 0
                parrafo6.Range.InsertParagraphAfter()

                parrafoaux = oDoc.Content.Paragraphs.Add(oDoc.Bookmarks.Item("\endofdoc").Range)
                parrafoaux.Range.Text = ""
                parrafoaux.Range.Font.Bold = False
                parrafoaux.Range.ParagraphFormat.SpaceAfter = 0
                parrafoaux.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft
                parrafoaux.Range.Font.Size = 12
                parrafoaux.Range.InsertParagraphAfter()

                parrafo7 = oDoc.Content.Paragraphs.Add(oDoc.Bookmarks.Item("\endofdoc").Range)
                parrafo7.Range.Text = "A. Rasgos de Personalidad"
                parrafo7.Range.Font.Bold = False
                parrafo7.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft
                parrafo7.Range.Font.Size = 12
                parrafo7.Range.ParagraphFormat.SpaceAfter = 0
                parrafo7.Range.InsertParagraphAfter()

                parrafoaux = oDoc.Content.Paragraphs.Add(oDoc.Bookmarks.Item("\endofdoc").Range)
                parrafoaux.Range.Text = ""
                parrafoaux.Range.Font.Bold = False
                parrafoaux.Range.ParagraphFormat.SpaceAfter = 0
                parrafoaux.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft
                parrafoaux.Range.Font.Size = 12
                parrafoaux.Range.InsertParagraphAfter()

                parrafo8 = oDoc.Content.Paragraphs.Add(oDoc.Bookmarks.Item("\endofdoc").Range)
                parrafo8.Range.Text = "RESULTADOS CUANTITATIVOS"
                parrafo8.Range.Font.Bold = False
                parrafo8.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft
                parrafo8.Range.Font.Size = 12
                parrafo8.Range.ParagraphFormat.SpaceAfter = 2
                parrafo8.Range.InsertParagraphAfter()


                tabla2 = oDoc.Tables.Add(oDoc.Bookmarks.Item("\endofdoc").Range, 6, 3)
                tabla2.Range.ParagraphFormat.SpaceAfter = 1
                tabla2.Columns.Width = 100
                tabla2.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft
                tabla2.Range.Font.Size = 11
                tabla2.Rows.Item(1).Range.Font.Bold = True
                tabla2.Borders.Enable = 1

                tabla2.Cell(1, 1).Range.Text = "FACTORES"
                tabla2.Cell(1, 2).Range.Text = "PERCENTILES"
                tabla2.Cell(1, 3).Range.Text = "VALORACION"
                tabla2.Cell(2, 1).Range.Text = "Control Emocional"
                tabla2.Cell(2, 2).Range.Text = lista(i).ResCeps.PControl.ToString
                tabla2.Cell(3, 1).Range.Text = "Extraversión"
                tabla2.Cell(3, 2).Range.Text = lista(i).ResCeps.PExtrover.ToString
                tabla2.Cell(4, 1).Range.Text = "Paranoidismo"
                tabla2.Cell(4, 2).Range.Text = lista(i).ResCeps.PParan.ToString
                tabla2.Cell(5, 1).Range.Text = "Sinceridad"
                tabla2.Cell(5, 2).Range.Text = lista(i).ResCeps.PSin.ToString
                tabla2.Cell(6, 1).Range.Text = "Decisión"
                tabla2.Cell(6, 2).Range.Text = lista(i).ResCeps.PDecision.ToString

                parrafoaux = oDoc.Content.Paragraphs.Add(oDoc.Bookmarks.Item("\endofdoc").Range)
                parrafoaux.Range.Text = ""
                parrafoaux.Range.Font.Bold = False
                parrafoaux.Range.ParagraphFormat.SpaceAfter = 4
                parrafoaux.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft
                parrafoaux.Range.Font.Size = 12
                parrafoaux.Range.InsertParagraphAfter()

                parrafoaux = oDoc.Content.Paragraphs.Add(oDoc.Bookmarks.Item("\endofdoc").Range)
                parrafoaux.Range.Text = "PERFIL"
                parrafoaux.Range.Font.Bold = False
                parrafoaux.Range.ParagraphFormat.SpaceAfter = 0
                parrafoaux.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft
                parrafoaux.Range.Font.Size = 12
                parrafoaux.Range.InsertParagraphAfter()

                oShape = oDoc.Bookmarks.Item("\endofdoc").Range.InlineShapes.AddOLEObject(ClassType:="MSGraph.Chart.8")

                oChart = oShape.OLEFormat.Object
                oChart.charttype = 4 'xlLine = 4
                oChart.Application.DataSheet.Cells.Clear()
                oChart.HasLegend = False

                oChart.Application.DataSheet.Range("A0").Value = "C"
                oChart.Application.DataSheet.Range("B0").Value = "E"
                oChart.Application.DataSheet.Range("C0").Value = "P"
                oChart.Application.DataSheet.Range("D0").Value = "S"

                oChart.Application.DataSheet.Range("A1").Value = lista(i).ResCeps.PControl
                oChart.Application.DataSheet.Range("B1").Value = lista(i).ResCeps.PExtrover
                oChart.Application.DataSheet.Range("C1").Value = lista(i).ResCeps.PParan
                oChart.Application.DataSheet.Range("D1").Value = lista(i).ResCeps.PSin

                oChart.Application.Quit()
                oShape.Width = 300
                oShape.Height = 125


                tabla3 = oDoc.Tables.Add(oDoc.Bookmarks.Item("\endofdoc").Range, 3, 2)
                tabla3.Range.ParagraphFormat.SpaceAfter = 1

                tabla3.Rows.Item(1).Cells(1).Width = 340
                tabla3.Rows.Item(1).Cells(2).Width = 160
                tabla3.Rows.Item(2).Cells(1).Width = 340
                tabla3.Rows.Item(2).Cells(2).Width = 160
                tabla3.Rows.Item(3).Cells(1).Width = 340
                tabla3.Rows.Item(3).Cells(2).Width = 160

                tabla3.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft
                tabla3.Range.Font.Size = 12
                tabla3.Rows.Item(1).Range.Font.Bold = True

                tabla3.Cell(1, 1).Range.Text = "B. INTELIGENCIA GENERAL:"
                tabla3.Cell(1, 2).Range.Text = "C. RESUMEN:"
                tabla3.Cell(2, 1).Range.Text = "Percentil: " + lista(i).ResRaven.Percentil.ToString
                tabla3.Cell(2, 2).Range.Text = "Personalidad: "
                tabla3.Cell(3, 1).Range.Text = "Valoración: "
                tabla3.Cell(3, 2).Range.Text = "Inteligencia: "

                parrafoaux = oDoc.Content.Paragraphs.Add(oDoc.Bookmarks.Item("\endofdoc").Range)
                parrafoaux.Range.Text = ""
                parrafoaux.Range.Font.Bold = False
                parrafoaux.Range.ParagraphFormat.SpaceAfter = 4
                parrafoaux.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft
                parrafoaux.Range.Font.Size = 12
                parrafoaux.Range.InsertParagraphAfter()

                tabla4 = oDoc.Tables.Add(oDoc.Bookmarks.Item("\endofdoc").Range, 1, 1)
                tabla4.Range.ParagraphFormat.SpaceAfter = 1
                tabla4.Columns.Width = 300
                tabla4.Borders.Enable = 1
                tabla4.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphJustify
                tabla4.Range.Font.Size = 12
                tabla4.Cell(1, 1).Range.Text = "RESULTADO: "

                parrafoaux = oDoc.Content.Paragraphs.Add(oDoc.Bookmarks.Item("\endofdoc").Range)
                parrafoaux.Range.Text = ""
                parrafoaux.Range.Font.Bold = False
                parrafoaux.Range.ParagraphFormat.SpaceAfter = 10
                parrafoaux.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft
                parrafoaux.Range.Font.Size = 12
                parrafoaux.Range.InsertParagraphAfter()

                parrafofirma = oDoc.Content.Paragraphs.Add(oDoc.Bookmarks.Item("\endofdoc").Range)
                parrafofirma.Range.Text = "F.________________________________"
                parrafofirma.Range.Font.Bold = False
                parrafofirma.Range.ParagraphFormat.SpaceAfter = 0
                parrafofirma.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter
                parrafofirma.Range.Font.Size = 12
                parrafofirma.Range.InsertParagraphAfter()

                parrafopsicologo = oDoc.Content.Paragraphs.Add(oDoc.Bookmarks.Item("\endofdoc").Range)
                parrafopsicologo.Range.Text = "Eduardo José Armando Martinez Vides"
                parrafopsicologo.Range.Font.Bold = False
                parrafopsicologo.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter
                parrafopsicologo.Range.Font.Size = 12
                parrafopsicologo.Range.InsertParagraphAfter()

                parrafojunta = oDoc.Content.Paragraphs.Add(oDoc.Bookmarks.Item("\endofdoc").Range)
                parrafojunta.Range.Text = "Psicologo Evaluador. JVPP No. 744"
                parrafojunta.Range.Font.Bold = False
                parrafofirma.Range.ParagraphFormat.SpaceAfter = 20
                parrafojunta.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter
                parrafojunta.Range.Font.Size = 12
                parrafojunta.Range.InsertParagraphAfter()

                parrafofecha = oDoc.Content.Paragraphs.Add(oDoc.Bookmarks.Item("\endofdoc").Range)
                parrafofecha.Range.Text = "CIUDAD UNIVERSITARIA,  OCTUBRE DE 2005."
                parrafofecha.Range.Font.Bold = False
                parrafofecha.Range.ParagraphFormat.SpaceAfter = 5
                parrafofecha.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter
                parrafofecha.Range.Font.Size = 12
                parrafofecha.Range.InsertParagraphAfter()
            End If
        Next
        oDoc.SaveAs(filename)
        oDoc.Close(True)
        oWord.Quit()
        
    End Sub


End Class
