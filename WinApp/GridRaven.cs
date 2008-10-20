/*
 * Created by SharpDevelop.
 * user: Robertux
 * Date: 19/10/2008
 * Time: 12:29 p.m.
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
	/// Description of GridRaven.
	/// </summary>
	public class GridRaven: GridBase
	{
		#region Campos
		
		private PruebaRaven _prueba;
		private PreguntasRaven _pregs;
		
		#endregion
		
		#region Propiedades
		
		public PruebaRaven Prueba
		{
			get { return this._prueba; }
			set { this._prueba = value; }
		}
		
		public PreguntasRaven Pregs
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
				
		public GridRaven(): base()
		{
			this._prueba = new PruebaRaven("");
			this._pregs = new PreguntasRaven();			
			for(int i=0; i<60; i++)
				this._prueba.Respuestas.Add(new Respuesta("", (uint)i+1, (uint)0));
		}
		
		public override void CargarGrid()
		{
			this.Columns.Clear();
			this.Columns.Add("colNumero", "Numero");
			this.Columns.Add("colRespuesta", "Respuesta");
			
			this.Rows.Clear();
			if(this._pregs != null)
			{
				if(this.Columns.Count > 0)
				{
					foreach(Pregunta preg in this._pregs.Preguntas)
					{
						this.Rows.Add(new object[]{preg.Numero, ""});
					}
				}
			}
		}
		
		#endregion
	}
}
