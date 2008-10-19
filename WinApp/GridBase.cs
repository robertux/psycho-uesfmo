/*
 * Created by SharpDevelop.
 * user: Robertux
 * Date: 19/10/2008
 * Time: 03:22 p.m.
 * 
 * 
 */

using System;
using System.Windows.Forms;
using System.Drawing;

namespace WinApp
{
	/// <summary>
	/// Description of GridBase.
	/// </summary>
	public class GridBase: System.Windows.Forms.DataGridView
	{
		#region Campos
				
		private DataGridViewCellStyle alternateStyle;
		private Font fnt;
		
		#endregion
		
		#region Propiedades
		#endregion
		
		#region Metodos
				
		public GridBase()
		{			
			this.FormatearGrid();;
		}				
		
		public void FormatearGrid()
		{
			this.fnt = new Font("Arial", 18, FontStyle.Regular);
			
			this.DefaultCellStyle.Font = this.fnt;
			//this.DefaultCellStyle.Padding = new Padding(8);
			this.alternateStyle = new DataGridViewCellStyle(this.DefaultCellStyle);			
			this.alternateStyle.BackColor = Color.LightGray;	
			this.BackgroundColor = System.Drawing.SystemColors.Control;
			this.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
			this.BorderStyle = BorderStyle.None;
			this.CellBorderStyle = DataGridViewCellBorderStyle.RaisedVertical;
			this.RowHeadersVisible = false;
			
			this.AllowUserToAddRows = false;
			this.AllowUserToDeleteRows = false;
			this.AllowUserToResizeColumns = false;
			this.AllowUserToResizeRows = false;
			this.AllowUserToOrderColumns = false;
			this.AllowUserToResizeColumns = false;
			this.SelectionMode = DataGridViewSelectionMode.FullRowSelect;			
			this.AlternatingRowsDefaultCellStyle = this.alternateStyle;
			this.ReadOnly = true;
			this.MultiSelect = false;
		}
		
		public virtual void CargarGrid()
		{	}
				
		#endregion
	}
}
