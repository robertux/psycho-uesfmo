/*
 * Created by SharpDevelop.
 * user: Robertux
 * Date: 19/10/2008
 * Time: 05:10 p.m.
 * 
 * 
 */

using System;
using System.Drawing;
using System.Windows.Forms;
using FuncionalidadClassLib;
using AccesoDatos;

namespace WinApp
{
	/// <summary>
	/// Description of frmMain.
	/// </summary>
	public partial class frmMain : Form
	{
		private AccesoDatos.AccesoDatos ad;
		
		public frmMain()
		{
			InitializeComponent();
			this.CargarCombo();
			this.gridAspir1.CargarGrid();
			this.ad = new AccesoDatos.AccesoDatos("app.config");
			this.ad.Conectar();
			this.ad.RellenarDS();
			this.ad.Desconectar();
		}
		
		private void CargarCombo()
		{
			this.comboBox1.Items.Clear();
			for(int i = DateTime.Now.Year; i >= (DateTime.Now.Year - 10); i--)
				this.comboBox1.Items.Add(i);
			this.comboBox1.SelectedIndex = 0;
		}
		
		void ComboBox1SelectedIndexChanged(object sender, EventArgs e)
		{
			if(this.comboBox1.SelectedIndex != -1)
				this.gridAspir1.CargarGrid((int)this.comboBox1.Items[this.comboBox1.SelectedIndex]);
		}
		
		void GridAspir1SelectionChanged(object sender, EventArgs e)
		{
			this.lblResultadoCeps.Text = "";
			this.lblResultadoRaven.Text = "";
			this.btnEvaluarCeps.Visible = false;
			this.btnEvaluarRaven.Visible = false;
			if(this.gridAspir1.SelectedRows.Count == 0) return;
			int sIndex = this.gridAspir1.SelectedRows[0].Index;
			AccesoDatos.AccesoDatos ad = new AccesoDatos.AccesoDatos("app.config");
			ad.Conectar();
			ad.RellenarDS();
			ad.Desconectar();
			Aspirante aspir = this.gridAspir1.Aspirs[sIndex];
			aspir = ManejadorPruebas.GetResultados(aspir, ad.ds.Tables["resultadosceps"], ad.ds.Tables["resultadosraven"]);
			
			if(aspir.ResRaven  == null)
			{
				this.btnEvaluarRaven.Visible = true;
				this.lblResultadoRaven.Text = "";
			}
			else
			{
				this.btnEvaluarRaven.Visible = false;
				this.lblResultadoRaven.Text = aspir.ResRaven.Diagnostico;
			}
			if(aspir.ResCeps == null)
			{
				this.btnEvaluarCeps.Visible = true;
				this.lblResultadoCeps.Text = "";
			}
			else
			{
				this.btnEvaluarCeps.Visible = false;
				this.lblResultadoCeps.Text = aspir.ResCeps.Diagnostico;
			}
		}
		
		void BtnEvaluarRavenClick(object sender, EventArgs e)
		{
			frmRaven frmr = new frmRaven();
			frmr.ShowDialog(this);
		}
		
		
		void BtnAddAspirClick(object sender, EventArgs e)
		{
			frmAddEditAspir frmasp = new frmAddEditAspir();
			frmasp.ShowDialog(this);
			if(frmasp.DialogResult == DialogResult.OK)
			{
				if(frmasp.aspir != null)
				{
					manejadorAspirante.agregarAspirante(frmasp.aspir, this.ad.ds.Tables["aspirantes"]);
					this.ad.Conectar();
					this.ad.ActualizarBD();					
					this.ad.Desconectar();
					this.gridAspir1.CargarGrid((int)this.comboBox1.Items[this.comboBox1.SelectedIndex]);
				}
			}
		}
		
		
		void BtnDelAspirClick(object sender, EventArgs e)
		{
			if(MessageBox.Show("Esta seguro que desea borrar este aspirante?","Confirmacion", MessageBoxButtons.YesNo) == DialogResult.Yes)
			{
				manejadorAspirante.eliminarAspirante(this.gridAspir1.Aspirs[this.gridAspir1.SelectedRows[0].Index],this.ad.ds.Tables["aspirantes"]);
				this.ad.Conectar();
				this.ad.ActualizarBD();
				this.ad.EjecutarComando("DELETE FROM aspirantes WHERE codigo = '" + this.gridAspir1.Aspirs[this.gridAspir1.SelectedRows[0].Index].Codigo + "'");
				this.ad.Desconectar();
				this.gridAspir1.CargarGrid((int)this.comboBox1.Items[this.comboBox1.SelectedIndex]);
			}
		}
		
		void BtnEditAspirClick(object sender, EventArgs e)
		{
			frmAddEditAspir frmasp = new frmAddEditAspir(this.gridAspir1.Aspirs[this.gridAspir1.SelectedRows[0].Index]);
			frmasp.ShowDialog(this);
			if(frmasp.DialogResult == DialogResult.OK)
			{
				manejadorAspirante.modificarAspirante(frmasp.aspir, this.ad.ds.Tables["aspirantes"]);
				this.ad.Conectar();
				this.ad.ActualizarBD();					
				this.ad.Desconectar();
				this.gridAspir1.CargarGrid((int)this.comboBox1.Items[this.comboBox1.SelectedIndex]);
			}
		}
		
		void BtnEvaluarCepsClick(object sender, EventArgs e)
		{
			frmCeps frmc = new frmCeps();
			frmc.ShowDialog(this);
		}
	}
}
