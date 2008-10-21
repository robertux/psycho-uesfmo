/*
 * Created by SharpDevelop.
 * user: Robertux
 * Date: 21/10/2008
 * Time: 02:32 a.m.
 * 
 * 
 */

using System;
using System.Drawing;
using System.Windows.Forms;
using FuncionalidadClassLib;

namespace WinApp
{
	/// <summary>
	/// Description of frmCeps.
	/// </summary>
	public partial class frmCeps : Form
	{
		public PruebaCeps Prueba
		{
			get { return this.gridCeps1.Prueba; }
		}
		
		public PreguntasCeps Pregs
		{
			get { return this.gridCeps1.Pregs; }
		}
		
		public frmCeps()
		{
			InitializeComponent();
		}
		
		void FrmCepsLoad(object sender, EventArgs e)
		{
			this.gridCeps1.CargarGrid();
		}
		
		void Button1Click(object sender, EventArgs e)
		{
			this.DialogResult = DialogResult.OK;
			this.Close();
		}
		
		void Button2Click(object sender, EventArgs e)
		{
			this.DialogResult = DialogResult.Cancel;
			this.Close();
		}
		
		void GridCeps1KeyDown(object sender, KeyEventArgs e)
		{
			Console.WriteLine(e.KeyCode);
			if(this.gridCeps1.SelectedRows.Count == 0) return;
			int sIndex = this.gridCeps1.SelectedRows[0].Index;
			if(e.KeyValue >= 97)		//Equivalente a la tecla numeral 1
			{
				if(e.KeyValue <= 99)	//Equivalente a la tecla numeral 3
				{
					if((e.KeyValue - 96) == 1) this.gridCeps1.Rows[sIndex].Cells[2].Value = "Si";
					if((e.KeyValue - 96) == 2) this.gridCeps1.Rows[sIndex].Cells[2].Value = "?";
					if((e.KeyValue - 96) == 3) this.gridCeps1.Rows[sIndex].Cells[2].Value = "No";
					this.gridCeps1[sIndex] = e.KeyValue - 96;
					if(sIndex < (this.gridCeps1.Rows.Count-1))
					{
						this.gridCeps1.Rows[sIndex+1].Cells[0].Selected = true;
						this.gridCeps1.Rows[sIndex+1].Cells[1].Selected = true;
						this.gridCeps1.Rows[sIndex+1].Cells[2].Selected = true;
						this.gridCeps1.Rows[sIndex].Cells[0].Selected = false;
						this.gridCeps1.Rows[sIndex].Cells[1].Selected = false;
						this.gridCeps1.Rows[sIndex].Cells[2].Selected = false;
					}
				}
			}
		}
				
	}
}
