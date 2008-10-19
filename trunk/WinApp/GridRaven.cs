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
		
		private PreguntasRaven pregs;
		
		#endregion
		
		#region Propiedades
		#endregion
		
		#region Metodos
				
		public GridRaven(): base()
		{
			this.pregs = new PreguntasRaven();
		}						
		
		public override void CargarGrid()
		{
			this.Columns.Clear();
			this.Columns.Add("colNumero", "Numero");
			this.Columns.Add("colRespuesta", "Respuesta");
			
			this.Rows.Clear();
			if(this.pregs != null)
			{
				if(this.Columns.Count > 0)
				{
					foreach(Pregunta preg in this.pregs.Preguntas)
					{
						this.Rows.Add(new object[]{preg.Numero, ""});
					}
				}
			}
		}
		
		#endregion
	}
}
