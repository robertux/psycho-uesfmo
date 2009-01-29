/*
 * Created by SharpDevelop.
 * user: Robertux
 * Date: 24/01/2009
 * Time: 07:05 p.m.
 * 
 * 
 */

using System;
using System.IO;
using System.Data;
using AccesoDatos;
using FuncionalidadClassLib;
using System.Diagnostics;
using System.Drawing;

using Word = Microsoft.Office.Interop.Word;


namespace WinApp
{
	/// <summary>
	/// Description of ReportGenerator.
	/// </summary>
	public class PsychoReportGenerator
	{
		private string rutaArchivo;
		private AccesoDatos.AccesoDatos ad;
		private Word._Application oWord;
		private Word._Document oDoc;
		private object oMissing = System.Reflection.Missing.Value;
		private object oEndOfDoc = "\\endofdoc";

		
		public PsychoReportGenerator(string rutaArch, AccesoDatos.AccesoDatos pAd)
		{			
			this.rutaArchivo = rutaArch;
			this.ad = pAd;
			this.oWord = new Word.Application();
			oWord.Visible = true;
			this.oDoc = oWord.Documents.Add(ref oMissing, ref oMissing, ref oMissing, ref oMissing);

		}
				
		public void AgregarAspirante(Aspirante aspir)
		{
			Word.Paragraph oPara1;
			oPara1 = oDoc.Content.Paragraphs.Add(ref oMissing);
			oPara1.Range.Text = "INFORME INDIVIDUAL INGRESO 2009";
			oPara1.Space1();
			oPara1.SpaceAfter = 0;
			oPara1.SpaceBefore = 0;
			oPara1.Range.Font.Size = 16;
			oPara1.Range.Font.Name = "Arial";	
			oPara1.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;
			oPara1.Range.InsertParagraphAfter();
			
			Word.Paragraph oPara2;
			oPara2 = oDoc.Content.Paragraphs.Add(ref oMissing);
			oPara2.Range.Text = "RESULTADO DE PRUEBAS PSICOLOGICAS";
			oPara2.Range.Font.Size = 14;			
			oPara2.Space1();
			oPara2.SpaceAfter = 0;
			oPara2.SpaceBefore = 0;
			oPara2.Range.InsertParagraphAfter();
			
			Word.Paragraph oPara3;			
			oPara3 = oDoc.Content.Paragraphs.Add(ref oMissing);
			oPara3.Range.Font.Size = 12;			
			oPara3.Range.Text = "UNIDAD DE PROFESORADOS F.M.O. - U.E.S.\n";			
			oPara3.Range.InsertParagraphAfter();						
			
			Word.Table oTable;
			Word.Range wrdRng = oDoc.Bookmarks.get_Item(ref oEndOfDoc).Range;
			oTable = oDoc.Tables.Add(wrdRng, 7, 2, ref oMissing, ref oMissing);			
			oTable.Columns[1].Width = oWord.CentimetersToPoints(5.64f);
			oTable.Columns[2].Width = oWord.CentimetersToPoints(11.99f);
			oTable.Cell(1, 1).Range.Text = "Código:";			
			oTable.Cell(2, 1).Range.Text = "Nombres:";
			oTable.Cell(3, 1).Range.Text = "Lugar de Estudios:";
			oTable.Cell(4, 1).Range.Text = "Carrera:";
			oTable.Cell(5, 1).Range.Text = "Sexo:";
			oTable.Cell(6, 1).Range.Text = "Fecha de Nacimiento:";
			oTable.Cell(7, 1).Range.Text = "Centro de Estudios que Imparte la Carrera:";
			for(int i=1; i<=7; i++){
				oTable.Cell(i, 1).Range.Font.Name = "Times New Roman";
				oTable.Cell(i, 1).Range.Font.Size = 12;
				oTable.Cell(i, 1).Range.Font.Bold = 1;
			}
			
			oTable.Cell(1, 2).Range.Text = aspir.Codigo;			
			oTable.Cell(2, 2).Range.Text = aspir.Apellidos + ", " + aspir.Nombres;
			oTable.Cell(3, 2).Range.Text = aspir.LugarEstudios.Nombre;
			oTable.Cell(4, 2).Range.Text = aspir.Carrera.NombreCarrera;
			oTable.Cell(5, 2).Range.Text = aspir.Sexo == 'M'? "Masculino": "Femenino";
			oTable.Cell(6, 2).Range.Text = aspir.FechaNacimiento.ToShortDateString();
			oTable.Cell(7, 2).Range.Text = "\n" + aspir.Facultad.NombreFacultad;									
			for(int i=1; i<=7; i++){
				oTable.Cell(i, 2).Range.Font.Name = "Arial";
				oTable.Cell(i, 2).Range.Font.Size = 12;
				oTable.Cell(i, 2).Range.Font.Bold = 0;
			}
			
			Word.Paragraph oPara4;			
			oPara4 = oDoc.Content.Paragraphs.Add(ref oMissing);
			oPara4.Range.Font.Size = 12;			
			oPara4.Range.Font.Name = "Times New Roman";
			oPara4.Range.Font.Bold = 1;						
			oPara4.Range.Text = "\n\nResultados de la Prueba de Inteligencia (Tests de Raven)";			
			oPara4.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter;
			oPara4.SpaceAfter = 8;
			oPara4.Range.InsertParagraphAfter();						

			Word.Table oTable2;
			Word.Range wrdRng2 = oDoc.Bookmarks.get_Item(ref oEndOfDoc).Range;
			oTable2 = oDoc.Tables.Add(wrdRng2, 3, 2, ref oMissing, ref oMissing);						
			oTable2.Columns[1].Width = oWord.CentimetersToPoints(5.64f);
			oTable2.Columns[2].Width = oWord.CentimetersToPoints(11.99f);
			oTable2.Cell(1, 1).Range.Text = "Consistencia:";			
			oTable2.Cell(2, 1).Range.Text = "Percentil:";
			oTable2.Cell(3, 1).Range.Text = "Puntaje:";			
			
			oTable2.Cell(1, 2).Range.Text = aspir.ResRaven.Consistencia;
			oTable2.Cell(2, 2).Range.Text = aspir.ResRaven.Percentil.ToString();
			oTable2.Cell(3, 2).Range.Text = aspir.ResRaven.Puntaje.ToString();
			oTable2.Range.Font.Name = "Times New Roman";
			oTable2.Range.Font.Size = 12;
			oTable2.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;
			oTable2.Range.ParagraphFormat.SpaceBefore = 0;
			oTable2.Range.ParagraphFormat.SpaceAfter = 0;
			
			Word.Paragraph oPara5;			
			oPara5 = oDoc.Content.Paragraphs.Add(ref oMissing);
			oPara5.Range.Font.Size = 12;			
			oPara5.Range.Font.Name = "Times New Roman";
			oPara5.Range.Font.Bold = 0;						
			oPara5.Range.Text = "Diagnóstico";			
			oPara5.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;
			oPara5.Range.InsertParagraphAfter();		
			
			Word.Paragraph oPara6;			
			oPara6 = oDoc.Content.Paragraphs.Add(ref oMissing);
			oPara6.Range.Font.Size = 12;			
			oPara6.Range.Font.Name = "Times New Roman";
			oPara6.Range.Font.Bold = 1;						
			oPara6.Range.Text = aspir.ResRaven.Diagnostico;
			oPara6.Range.InsertParagraphAfter();		
			
			Word.Paragraph oPara7;			
			oPara7 = oDoc.Content.Paragraphs.Add(ref oMissing);
			oPara7.Range.Font.Size = 12;			
			oPara7.Range.Font.Name = "Times New Roman";
			oPara7.Range.Font.Bold = 1;						
			oPara7.Range.Text = "\nResultados de la Prueba de Personalidad (C.E.P.S.)";			
			oPara7.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter;
			oPara7.Range.InsertParagraphAfter();						
			
			Word.Table oTable3;
			Word.Range wrdRng3 = oDoc.Bookmarks.get_Item(ref oEndOfDoc).Range;
			oTable3 = oDoc.Tables.Add(wrdRng3, 5, 2, ref oMissing, ref oMissing);			
			oTable3.Columns[1].Width = oWord.CentimetersToPoints(5.64f);
			oTable3.Columns[2].Width = oWord.CentimetersToPoints(11.99f);
			oTable3.Cell(1, 1).Range.Text = "Control Emocional:";			
			oTable3.Cell(2, 1).Range.Text = "Extroversión:";
			oTable3.Cell(3, 1).Range.Text = "Paranoidismo:";			
			oTable3.Cell(4, 1).Range.Text = "Sinceridad:";			
			oTable3.Cell(5, 1).Range.Text = "Capacidad de Decisión:";			
			
			oTable3.Cell(1, 2).Range.Text = aspir.ResCeps.PControl.ToString();
			oTable3.Cell(2, 2).Range.Text = aspir.ResCeps.PExtrover.ToString();
			oTable3.Cell(3, 2).Range.Text = aspir.ResCeps.PParan.ToString();
			oTable3.Cell(4, 2).Range.Text = aspir.ResCeps.PSin.ToString();
			oTable3.Cell(5, 2).Range.Text = aspir.ResCeps.PDecision.ToString();
			oTable3.Range.Font.Name = "Times New Roman";
			oTable3.Range.Font.Size = 12;
			oTable3.Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;
			oTable3.Range.ParagraphFormat.SpaceBefore = 0;
			oTable3.Range.ParagraphFormat.SpaceAfter = 0;
			
			Word.Paragraph oPara8;			
			oPara8 = oDoc.Content.Paragraphs.Add(ref oMissing);
			oPara8.Range.Font.Size = 12;			
			oPara8.Range.Font.Name = "Arial";
			oPara8.Range.Font.Bold = 1;						
			oPara8.Range.Text = "Diagnóstico:";
			oPara8.SpaceAfter = 0;
			oPara8.SpaceBefore = 0;
			oPara8.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;
			oPara8.Range.InsertParagraphAfter();		
			
			Word.Paragraph oPara9;			
			oPara9 = oDoc.Content.Paragraphs.Add(ref oMissing);
			oPara9.Range.Font.Size = 12;			
			oPara9.Range.Font.Name = "Arial";
			oPara9.Range.Font.Bold = 0;						
			oPara9.Range.Text = aspir.ResCeps.Diagnostico.Replace("\n", " ") + "\n";
			oPara9.Range.InsertParagraphAfter();
			
			Word.Paragraph oPara10;			
			oPara10 = oDoc.Content.Paragraphs.Add(ref oMissing);
			oPara10.Range.Font.Size = 12;			
			oPara10.Range.Font.Name = "Times New Roman";
			oPara10.Range.Font.Bold = 1;						
			oPara10.Range.Text = "Aprobado: ______   No Aprobado: ______  ";
			oPara10.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter;						
			oPara10.Range.InsertParagraphAfter();	
			
			Word.Paragraph oPara11;			
			oPara11 = oDoc.Content.Paragraphs.Add(ref oMissing);
			oPara11.Range.Font.Size = 12;			
			oPara11.Range.Font.Name = "Arial";
			oPara11.Range.Font.Bold = 0;						
			oPara11.Range.Text = "\n\nF.__________________________________ \n Eduardo José Armando Martínez Vides \n Psicólogo Evaluador. JVPP No. 744";
			oPara11.Range.InsertParagraphAfter();				
			
			Word.Range wrdRng4 = oDoc.Bookmarks.get_Item(ref oEndOfDoc).Range;			
			object oCollapseEnd = Word.WdCollapseDirection.wdCollapseEnd;
			object oPageBreak = Word.WdBreakType.wdPageBreak;
			wrdRng4.Collapse(ref oCollapseEnd);
			wrdRng4.InsertBreak(ref oPageBreak);
			wrdRng4.Collapse(ref oCollapseEnd);
		}				
		
		public void Cerrar()
		{			
			Object rutaArchivoObj = (object)this.rutaArchivo;
			this.oDoc.SaveAs(ref rutaArchivoObj,
			                 ref oMissing, ref oMissing, ref oMissing,
			                 ref oMissing, ref oMissing, ref oMissing, ref oMissing, ref oMissing,
			                 ref oMissing, ref oMissing, ref oMissing, ref oMissing, ref oMissing, 
			                 ref oMissing, ref oMissing);
			this.oDoc.Close(ref oMissing, ref oMissing, ref oMissing);
			this.oWord.Quit(ref oMissing, ref oMissing, ref oMissing);
		}		

	}
}
