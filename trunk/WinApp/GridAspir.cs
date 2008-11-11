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
		private System.Windows.Forms.DataGridViewCellStyle estiloEvaluado;
		private int _totalEvaluados;
		private int _totalPendientes;
		
		#endregion
		
		#region Propiedades
		
		public List<Aspirante> Aspirs
		{
			get { return this._aspirs; }
			set { this._aspirs = value; }
		}

        public AccesoDatos.AccesoDatos AD
        {
            set { this._ad = value; }
        }
        
        public int TotalEvaluados
        {
        	get { return this._totalEvaluados; }
        	set { this._totalEvaluados = value; }
        }
        
        public int TotalPendientes
        {
        	get { return this._totalPendientes; }
        	set { this._totalPendientes = value; }
        }
        
        public DataGridViewCellStyle EstiloEvaluado
        {
        	get { return this.estiloEvaluado; }
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
			this.estiloEvaluado = new DataGridViewCellStyle(this.DefaultCellStyle);
			this.estiloEvaluado.ForeColor = Color.Green;
			this.AlternatingRowsDefaultCellStyle.Font = new Font("Arial", 12, FontStyle.Regular);
			this.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.DisplayedCells;
			this.BorderStyle = BorderStyle.FixedSingle;
		}
		
		public void CargarGrid(int anio)
		{			
			this.FormatearGrid();
			this._totalEvaluados = 0;
			this._totalPendientes = 0;
            if (this._ad == null) this._ad = new AccesoDatos.AccesoDatos("WinApp.exe.config"); //en todo caso, esto casi siempre me da error, aun no se por que.
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
				this.Rows.Add(new object[]{aspir.Codigo, aspir.Apellidos, aspir.Nombres, aspir.Carrera.NombreCarrera.Substring(0, 50) + "...", aspir.Estado});
				this.estiloEvaluado.BackColor = this.Rows[this.Rows.Count-1].Cells[0].Style.BackColor;
				if(aspir.Estado == "evaluado")
				{
					this._totalEvaluados++;
					foreach(DataGridViewCell celda in this.Rows[this.Rows.Count-1].Cells)
						celda.Style = this.estiloEvaluado;
				}
				else if(aspir.Estado == "pendiente")
					this._totalPendientes++;
			}
		}
		
		#endregion
				
	}
}
