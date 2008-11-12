Imports Word = Microsoft.Office.Interop.Word

''' <summary>
''' Objeto para crear reportes
''' Falta un pequeño manejo de errores, por si Word no esta instalado.
''' </summary>

Public Class reportes

    Public Sub New(ByVal tabla As DataTable, ByVal datos As AccesoDatos.AccesoDatos)
        Dim lista As New List(Of Aspirante)
        Dim asp As Aspirante
        Dim oWord As Word.Application
        Dim Doc As Word.Document
        Dim tabla1 As Word.Table
        Dim parra1 As Word.Paragraph
        Dim praven As Word.Paragraph, pconsistencia As Word.Paragraph
        Dim ppercentilraven As Word.Paragraph, ppuntajeraven As Word.Paragraph
        Dim pceps As Word.Paragraph, pcontrol As Word.Paragraph
        Dim pdesicion As Word.Paragraph, pextro As Word.Paragraph
        Dim pparanoi As Word.Paragraph, psinceridad As Word.Paragraph
        Dim pdiagnosticoraven As Word.Paragraph, pdiagnosticoceps As Word.Paragraph
        Dim pdiagnosticoraven1 As Word.Paragraph, pdiagnosticoceps1 As Word.Paragraph
        Dim presultado As Word.Paragraph
        Dim pfirma As Word.Paragraph, pdocente As Word.Paragraph, pjunta As Word.Paragraph
        Dim i As Integer, j As Integer

        For Each fila As DataRow In tabla.Rows
            asp = manejadorAspirante.GetAspirante(fila("codigo"), datos.ds)
            asp = ManejadorPruebas.GetResultados(asp, datos.ds.Tables("resultadosceps"), datos.ds.Tables("resultadosraven"))
            lista.Add(asp)
        Next



        oWord = CreateObject("Word.Application")
        oWord.Visible = True
        Doc = oWord.Documents.Add


        For i = 0 To lista.Count - 1

            If lista(i).Estado = "evaluado" Then

                tabla1 = Doc.Tables.Add(Doc.Bookmarks.Item("\endofdoc").Range, 7, 2)

                tabla1.Range.ParagraphFormat.SpaceAfter = 2
                tabla1.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft
                For j = 0 To 6
                    tabla1.Rows.Item(j + 1).Cells(1).Width = 160
                    tabla1.Rows.Item(j + 1).Cells(2).Width = 340
                Next
                tabla1.Cell(1, 1).Range.Font.Bold = True
                tabla1.Cell(2, 1).Range.Font.Bold = True
                tabla1.Cell(3, 1).Range.Font.Bold = True
                tabla1.Cell(4, 1).Range.Font.Bold = True
                tabla1.Cell(5, 1).Range.Font.Bold = True
                tabla1.Cell(6, 1).Range.Font.Bold = True
                tabla1.Cell(7, 1).Range.Font.Bold = True
                tabla1.Cell(1, 2).Range.Font.Bold = False
                tabla1.Cell(2, 2).Range.Font.Bold = False
                tabla1.Cell(3, 2).Range.Font.Bold = False
                tabla1.Cell(4, 2).Range.Font.Bold = False
                tabla1.Cell(5, 2).Range.Font.Bold = False
                tabla1.Cell(6, 2).Range.Font.Bold = False
                tabla1.Cell(7, 2).Range.Font.Bold = False
                tabla1.Borders.Enable = False

                tabla1.Cell(1, 1).Range.Text = "Codigo"
                tabla1.Cell(1, 2).Range.Text = lista(i).Codigo.ToString
                tabla1.Cell(2, 1).Range.Text = "Nombres"
                tabla1.Cell(2, 2).Range.Text = lista(i).Apellidos.ToString + ", " + lista(i).Nombres.ToString
                tabla1.Cell(3, 1).Range.Text = "Lugar de Estudios"
                tabla1.Cell(3, 2).Range.Text = lista(i).LugarEstudios.Nombre
                tabla1.Cell(4, 1).Range.Text = "Carrera"
                tabla1.Cell(4, 2).Range.Text = lista(i).Carrera.NombreCarrera
                tabla1.Cell(5, 1).Range.Text = "Sexo"
                If lista(i).Sexo = "M" Then
                    tabla1.Cell(5, 2).Range.Text = "Masculino"
                Else
                    tabla1.Cell(5, 2).Range.Text = "Femenino"
                End If
                tabla1.Cell(6, 1).Range.Text = "Fecha de Nacimiento"
                tabla1.Cell(6, 2).Range.Text = lista(i).FechaNacimiento.ToString
                tabla1.Cell(7, 1).Range.Text = "Facultad de la Carrera "
                tabla1.Cell(7, 2).Range.Text = lista(i).Facultad.NombreFacultad

                parra1 = Doc.Content.Paragraphs.Add(Doc.Bookmarks.Item("\endofdoc").Range)
                parra1.Range.Text = ""
                parra1.Range.Font.Size = 12
                parra1.Format.SpaceAfter = 10
                parra1.Range.InsertParagraphAfter()

                praven = Doc.Content.Paragraphs.Add(Doc.Bookmarks.Item("\endofdoc").Range)
                praven.Range.Text = "Resultados de la Prueba de Inteligencia"
                praven.Range.Font.Bold = True
                praven.Range.Font.Size = 12
                praven.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter
                praven.Format.SpaceAfter = 10
                praven.Range.InsertParagraphAfter()

                pconsistencia = Doc.Content.Paragraphs.Add(Doc.Bookmarks.Item("\endofdoc").Range)
                pconsistencia.Range.Text = "Consistencia                          " + lista(i).ResRaven.Consistencia.ToString
                praven.Range.Font.Bold = False
                pconsistencia.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft
                pconsistencia.Range.Font.Size = 12
                praven.Format.SpaceAfter = 2
                pconsistencia.Range.InsertParagraphAfter()

                ppercentilraven = Doc.Content.Paragraphs.Add(Doc.Bookmarks.Item("\endofdoc").Range)
                ppercentilraven.Range.Text = "Percentil                                 " + lista(i).ResRaven.Percentil.ToString
                ppercentilraven.Range.Font.Size = 12
                ppercentilraven.Range.InsertParagraphAfter()

                ppuntajeraven = Doc.Content.Paragraphs.Add(Doc.Bookmarks.Item("\endofdoc").Range)
                ppuntajeraven.Range.Text = "Puntaje                                   " + lista(i).ResRaven.Puntaje.ToString
                ppuntajeraven.Range.Font.Size = 12
                ppuntajeraven.Range.InsertParagraphAfter()

                pdiagnosticoraven = Doc.Content.Paragraphs.Add(Doc.Bookmarks.Item("\endofdoc").Range)
                pdiagnosticoraven.Range.Text = "Diagnostico"
                pdiagnosticoraven.Range.Font.Size = 12
                pdiagnosticoraven.Range.Font.Bold = True
                pdiagnosticoraven.Range.InsertParagraphAfter()

                pdiagnosticoraven1 = Doc.Content.Paragraphs.Add(Doc.Bookmarks.Item("\endofdoc").Range)
                pdiagnosticoraven1.Range.Text = lista(i).ResRaven.Diagnostico.ToString
                pdiagnosticoraven1.Range.Font.Size = 12
                pdiagnosticoraven1.Range.Font.Bold = False
                pdiagnosticoraven1.Format.SpaceAfter = 25
                pdiagnosticoraven1.Range.InsertParagraphAfter()

                pceps = Doc.Content.Paragraphs.Add(Doc.Bookmarks.Item("\endofdoc").Range)
                pceps.Range.Text = "Resultados de la Prueba de Personalidad"
                pceps.Range.Font.Bold = True
                pceps.Range.Font.Size = 12
                pceps.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter
                pceps.Format.SpaceAfter = 12
                pceps.Range.InsertParagraphAfter()

                pcontrol = Doc.Content.Paragraphs.Add(Doc.Bookmarks.Item("\endofdoc").Range)
                pcontrol.Range.Text = "Control Emocional                 " + lista(i).ResCeps.PControl.ToString
                pcontrol.Range.Font.Bold = False
                pcontrol.Range.Font.Size = 12
                pcontrol.Format.SpaceAfter = 2
                pcontrol.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft
                pcontrol.Range.InsertParagraphAfter()

                pextro = Doc.Content.Paragraphs.Add(Doc.Bookmarks.Item("\endofdoc").Range)
                pextro.Range.Text = "Extroversión                           " + lista(i).ResCeps.PExtrover.ToString
                pextro.Range.Font.Size = 12
                pextro.Range.InsertParagraphAfter()

                pparanoi = Doc.Content.Paragraphs.Add(Doc.Bookmarks.Item("\endofdoc").Range)
                pparanoi.Range.Text = "Paranoidismo                          " + lista(i).ResCeps.PParan.ToString
                pparanoi.Range.Font.Size = 12
                pparanoi.Range.InsertParagraphAfter()

                psinceridad = Doc.Content.Paragraphs.Add(Doc.Bookmarks.Item("\endofdoc").Range)
                psinceridad.Range.Text = "Sinceridad                               " + lista(i).ResCeps.PSin.ToString
                psinceridad.Range.Font.Size = 12
                psinceridad.Range.InsertParagraphAfter()

                pdesicion = Doc.Content.Paragraphs.Add(Doc.Bookmarks.Item("\endofdoc").Range)
                pdesicion.Range.Text = "Capacidad de Desición           " + lista(i).ResCeps.PDecision.ToString
                pdesicion.Range.Font.Size = 12
                pdesicion.Range.InsertParagraphAfter()

                pdiagnosticoceps = Doc.Content.Paragraphs.Add(Doc.Bookmarks.Item("\endofdoc").Range)
                pdiagnosticoceps.Range.Text = "Diagnostico"
                pdiagnosticoceps.Range.Font.Size = 12
                pdiagnosticoceps.Range.Font.Bold = True
                pdiagnosticoceps.Range.InsertParagraphAfter()

                pdiagnosticoceps1 = Doc.Content.Paragraphs.Add(Doc.Bookmarks.Item("\endofdoc").Range)
                pdiagnosticoceps1.Range.Font.Bold = False
                pdiagnosticoceps1.Range.Text = lista(i).ResCeps.Diagnostico.ToString
                pdiagnosticoceps1.Range.Font.Size = 12
                pdiagnosticoceps1.Format.SpaceAfter = 20
                pdiagnosticoceps1.Range.InsertParagraphAfter()

                presultado = Doc.Content.Paragraphs.Add(Doc.Bookmarks.Item("\endofdoc").Range)
                presultado.Range.Font.Bold = False
                presultado.Range.Text = "Aprobado_______         No Aprobado_______"
                presultado.Range.Font.Size = 12
                presultado.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter
                presultado.Format.SpaceAfter = 40
                presultado.Range.InsertParagraphAfter()
                presultado.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphRight

                pfirma = Doc.Content.Paragraphs.Add(Doc.Bookmarks.Item("\endofdoc").Range)
                pfirma.Range.Font.Bold = False
                pfirma.Range.Text = "F.__________________________________"
                pfirma.Range.Font.Size = 12
                pfirma.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter
                pfirma.Format.SpaceAfter = 0
                pfirma.Range.InsertParagraphAfter()

                pdocente = Doc.Content.Paragraphs.Add(Doc.Bookmarks.Item("\endofdoc").Range)
                pdocente.Range.Font.Bold = False
                pdocente.Range.Text = "Eduardo José Armando Martinez Vides"
                pdocente.Range.Font.Size = 12
                pdocente.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter
                pdocente.Format.SpaceAfter = 0
                pdocente.Range.InsertParagraphAfter()

                pjunta = Doc.Content.Paragraphs.Add(Doc.Bookmarks.Item("\endofdoc").Range)
                pjunta.Range.Font.Bold = False
                pjunta.Range.Text = "Psicologo Evaluador. JVPP No. 744"
                pjunta.Range.Font.Size = 12
                pjunta.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter
                pjunta.Format.SpaceAfter = 70
                pjunta.Range.InsertParagraphAfter()


            End If
        Next

    End Sub


End Class
