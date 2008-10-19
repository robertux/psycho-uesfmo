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
	public partial class MainForm : Form
	{
		
		
		
		public MainForm()
		{
			InitializeComponent();
			
		}
		
		void MainFormLoad(object sender, EventArgs e)
		{
			this.gridRaven1.CargarGrid();			
		}
	}
}
