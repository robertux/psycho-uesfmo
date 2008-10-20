/*
 * Created by SharpDevelop.
 * user: Robertux
 * Date: 19/10/2008
 * Time: 05:28 p.m.
 * 
 * 
 */

using System;
using System.Windows.Forms;
using System.Drawing;
using System.Collections.Generic;
using FuncionalidadClassLib;
using AccesoDatos;

namespace WinApp
{
	/// <summary>
	/// Description of GridAspir.
	/// </summary>
	public class GridAspir: GridBase
	{
		#region Campos
		
		private List<Aspirante> _aspirs;
		private AccesoDatos.AccesoDatos _ad;
		
		#endregion
		
		#region Propiedades
		
		public List<Aspirante> Aspirs
		{
			get { return this._aspirs; }
			set { this._aspirs = value; }
		}
		
		#endregion
		
		#region Metodos
				
		public GridAspir(): base()
		{			
		}
		
		public override void CargarGrid()
		{
			this.CargarGrid(DateTime.Now.Year);
		}
		
		public override void FormatearGrid()
		{
			base.FormatearGrid();
			this.DefaultCellStyle.Font = new Font("Arial", 12, FontStyle.Regular);
			this.AlternatingRowsDefaultCellStyle.Font = new Font("Arial", 12, FontStyle.Regular);
			this.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.DisplayedCells;
			this.BorderStyle = BorderStyle.FixedSingle;
		}
		
		public void CargarGrid(int anio)
		{
			this.FormatearGrid();
			this._ad = new AccesoDatos.AccesoDatos("app.config");
			this._ad.Conectar();
			this._ad.RellenarDS();
			this._aspirs = manejadorAspirante.ConsultarAspirantes((uint)anio, this._ad.ds);
			this._ad.Desconectar();
			this.Columns.Clear();
			this.Columns.Add("colCodigo", "Codigo");
			this.Columns.Add("colApellidos", "Apellidos");
			this.Columns.Add("colNombres", "Nombres");
			this.Columns.Add("colCarrera", "Carrera");
			this.Columns.Add("colEstado", "Estado");
			
			this.Rows.Clear();
			foreach(Aspirante aspir in this._aspirs)
			{
				this.Rows.Add(new object[]{aspir.Codigo, aspir.Apellidos, aspir.Nombres, aspir.Carrera.NombreCarrera.Substring(0, 60) + "...", aspir.Estado});
			}
		}
		
		#endregion
				
	}
}
