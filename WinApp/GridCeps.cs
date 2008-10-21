/*
 * Created by SharpDevelop.
 * user: Robertux
 * Date: 20/10/2008
 * Time: 09:02 p.m.
 * 
 * 
 */

using System;
using System.Windows.Forms;
using System.Collections.Generic;
using FuncionalidadClassLib;
using System.Drawing;

namespace WinApp
{
	/// <summary>
	/// Description of GridCeps.
	/// </summary>
	public class GridCeps: GridBase
	{
		#region Campos
		
		private PruebaCeps _prueba;
		private PreguntasCeps _pregs;
		
		#endregion
		
		#region Propiedades
		
		public PruebaCeps Prueba
		{
			get { return this._prueba; }
			set { this._prueba = value; }
		}
		
		public PreguntasCeps Pregs
		{
			get { return this._pregs; }
			set { this._pregs = value; }
		}
		
		public int this[int index]
		{
			get { return (int)this._prueba.Respuestas[index].RespuestaAsp; }
			set { this._prueba.Respuestas[index].RespuestaAsp = (uint)value; }
		}
		
		#endregion
		
		#region Metodos
		
		public GridCeps(): base()
		{
			this._prueba = new PruebaCeps("");
			for(int i=0; i<156; i++)
				this._prueba.Respuestas.Add(new Respuesta("", (uint)i+1, (uint)0));			
		}
		
		public override void FormatearGrid()
		{
			base.FormatearGrid();
			this.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.DisplayedCells;
			this.DefaultCellStyle.Font = new Font("Arial", 10, FontStyle.Regular);
			this.AlternatingRowsDefaultCellStyle.Font = this.DefaultCellStyle.Font;
		}
		
		public override void CargarGrid()
		{			
			this.FormatearGrid();
			this._pregs = new PreguntasCeps();
			this._prueba = new PruebaCeps("");
			for(int i=0; i<156; i++)
				this._prueba.Respuestas.Add(new Respuesta("", (uint)i+1, (uint)0));			
			
			this.Columns.Clear();
			this.Columns.Add("colNumero", "Numero");
			this.Columns.Add("colPregunta", "Pregunta");
			this.Columns.Add("colRespuesta", "Respuesta");
			
			this.Rows.Clear();
			if(this._pregs != null)
			{
				if(this.Columns.Count > 0)
				{
					foreach(Pregunta preg in this._pregs.Preguntas)
					{
						this.Rows.Add(new object[]{preg.Numero, preg.Valor, ""});
					}
				}
			}
		}
		
		#endregion				
		
	}
}
