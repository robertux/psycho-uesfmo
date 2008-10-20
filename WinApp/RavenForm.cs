/*
 * Created by SharpDevelop.
 * user: Robertux
 * Date: 13/10/2008
 * Time: 04:28 p.m.
 * 
 * 
 */

using System;
using System.Collections.Generic;
using System.Drawing;
using System.Windows.Forms;
using FuncionalidadClassLib;

namespace WinApp
{
	/// <summary>
	/// Description of MainForm.
	/// </summary>
	public partial class frmRaven : Form
	{
		
		public frmRaven()
		{
			InitializeComponent();			
		}
				
		void MainFormLoad(object sender, EventArgs e)
		{
			this.gridRaven1.CargarGrid();			
		}
		
		void GridRaven1SelectionChanged(object sender, EventArgs e)
		{
			if(this.gridRaven1.SelectedRows[0].Index != -1)
			{
				this.pbxRaven.ImageLocation = Application.StartupPath +  "\\Media\\Raven\\" + (this.gridRaven1.SelectedRows[0].Index + 1).ToString() + ".jpg";				
			}
		}
		
		void GridRaven1KeyDown(object sender, KeyEventArgs e)
		{
			
			int sIndex = this.gridRaven1.SelectedRows[0].Index;
			if(e.KeyValue >= 97) //Equivalente a la tecla numeral 1
			{
				if(sIndex >= 24) //Desde la pregunta 25 se tienen 8 posibles respuestas
				{
					if(e.KeyValue <= 104)	//Equivalente a la tecla numeral 8
					{
						this.gridRaven1.Rows[sIndex].Cells[1].Value = (e.KeyValue - 96).ToString();
						this.gridRaven1[sIndex] = e.KeyValue - 96;
						if(sIndex < (this.gridRaven1.Rows.Count-1))
						{
							this.gridRaven1.Rows[sIndex+1].Cells[0].Selected = true;
							this.gridRaven1.Rows[sIndex+1].Cells[1].Selected = true;
							this.gridRaven1.Rows[sIndex].Cells[0].Selected = false;
							this.gridRaven1.Rows[sIndex].Cells[1].Selected = false;
						}
					}
				}
				else	//Las preguntas anteriores a la 25 solo tienen 6 posibles respuestas
				{
					if(e.KeyValue <= 102)	//Equivalente a la tecla numeral 6
					{
						this.gridRaven1.SelectedRows[0].Cells[1].Value = (e.KeyValue - 96).ToString();
						this.gridRaven1[sIndex] = e.KeyValue - 96;
						if(sIndex < (this.gridRaven1.Rows.Count-1))
						{
							this.gridRaven1.Rows[sIndex+1].Cells[0].Selected = true;
							this.gridRaven1.Rows[sIndex+1].Cells[1].Selected = true;
							this.gridRaven1.Rows[sIndex].Cells[0].Selected = false;
							this.gridRaven1.Rows[sIndex].Cells[1].Selected = false;							
						}
					}
				}
			}
		}
		
	}
}
