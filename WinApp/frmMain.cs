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
            ////Primero instanciamos el acceso a datos
            ////(renombrado de app.config a WinApp.exe.config para poderlo usar con ClickOnce)
            this.ad = new AccesoDatos.AccesoDatos("WinApp.exe.config");
            ////Como ya existe un acceso a datos, lo pasamos al gridAspir1.
            //this.gridAspir1.AD = this.ad;

			this.CargarCombo();
            ////La siguiente linea NO es necesaria, pues en CargarCombo(), se llama a
            ////ComboBox1SelectedIndexChanged(), en donde se ejecuta CargarGrid(...).
			//this.gridAspir1.CargarGrid();
			
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
			{
				this.gridAspir1.CargarGrid((int)this.comboBox1.Items[this.comboBox1.SelectedIndex]);
				if(this.gridAspir1.Rows.Count == 0)
				{
					this.btnEditAspir.Enabled = false;
					this.btnDelAspir.Enabled = false;
					this.label1.Text = "Alumnos";
					this.label2.Text = "Evaluados: 0    Pendientes: 0";
				}
				else
				{
					this.btnEditAspir.Enabled = true;
					this.btnDelAspir.Enabled = true;
					this.label1.Text = "Alumnos(" + this.gridAspir1.Rows.Count.ToString() + ")";
					this.label2.Text = "Evaluados: " + this.gridAspir1.TotalEvaluados.ToString() + "    Pendientes: " + this.gridAspir1.TotalPendientes.ToString();
				}
			}
		}
		
		void GridAspir1SelectionChanged(object sender, EventArgs e)
		{
			this.lblResultadoCeps.Text = "";
			this.lblResultadoRaven.Text = "";
			this.btnEvaluarCeps.Visible = false;
			this.btnEvaluarRaven.Visible = false;
			if(this.gridAspir1.SelectedRows.Count == 0) return;
			int sIndex = this.gridAspir1.SelectedRows[0].Index;
            ////Para Que?, si ya existe?
			//AccesoDatos.AccesoDatos ad = new AccesoDatos.AccesoDatos("WinApp.exe.config");
			ad.Conectar();
			ad.RellenarDS();
			ad.Desconectar();
			Aspirante aspir = this.gridAspir1.Aspirs[sIndex];
			aspir = ManejadorPruebas.GetResultados(aspir, ad.ds.Tables["resultadosceps"], ad.ds.Tables["resultadosraven"]);
			
			if(aspir.ResRaven  == null)
			{
				this.btnEvaluarRaven.Visible = true;
				this.lblResultadoRaven.Text = "";
				this.lblDetallesResultadoRaven.Text = "";
			}
			else
			{
				this.btnEvaluarRaven.Visible = false;				
				this.lblResultadoRaven.Text = aspir.ResRaven.Diagnostico;
				if(aspir.ResRaven.Diagnostico == "NO SE PUEDE DAR UN DIAGNOSTICO")
				{
					this.btnEvaluarRaven.Visible = true;
					//this.gridAspir1.SelectedRows[0].Cells[4].Value = "pendiente";					
					
				}
				else
				{
					this.lblDetallesResultadoRaven.Text = "puntaje: " + aspir.ResRaven.Puntaje.ToString() + "\n" +
						"percentil: " + aspir.ResRaven.Percentil.ToString() + "\n";					
				}
			}
			if(aspir.ResCeps == null)
			{
				this.btnEvaluarCeps.Visible = true;
				this.lblResultadoCeps.Text = "";
				this.lblDetallesResultadoCeps.Text = "";
			}
			else
			{
				this.btnEvaluarCeps.Visible = false;
				this.lblResultadoCeps.Text = aspir.ResCeps.Diagnostico;
				this.lblDetallesResultadoCeps.Text = "C: " + aspir.ResCeps.PControl.ToString() + "\n" +
					"E: " + aspir.ResCeps.PExtrover + "\n" + 
					"P: " + aspir.ResCeps.PParan + "\n" +
					"S: " + aspir.ResCeps.PSin + "\n";
			}
		}	
		
		void BtnAddAspirClick(object sender, EventArgs e)
		{
			frmAddEditAspir frmasp = new frmAddEditAspir(this.ad);
			frmasp.ShowDialog(this);
			if(frmasp.DialogResult == DialogResult.OK)
			{
				if(frmasp.aspir != null)
				{
					manejadorAspirante.agregarAspirante(frmasp.aspir, this.ad.ds.Tables["aspirantes"]);
					this.ad.Conectar();
					this.ad.ActualizarBD();					
					this.ad.Desconectar();
                    ////Otra linea no necesaria, GridAspir ya tiene ad.
                    //this.gridAspir1.AD = this.ad;
					this.gridAspir1.CargarGrid((int)this.comboBox1.Items[this.comboBox1.SelectedIndex]);
					this.btnEditAspir.Enabled = true;
					this.btnDelAspir.Enabled = true;
					this.label1.Text = "Alumnos(" + this.gridAspir1.Rows.Count.ToString() + ")";
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
				if(this.gridAspir1.Rows.Count == 0)
				{
					this.btnEditAspir.Enabled = false;
					this.btnDelAspir.Enabled = false;
				}
				this.label1.Text = "Alumnos(" + this.gridAspir1.Rows.Count.ToString() + ")";
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
		
		void BtnEvaluarRavenClick(object sender, EventArgs e)
		{
			this.gridAspir1.Aspirs[this.gridAspir1.SelectedRows[0].Index].ResRaven = null;	
			manejadorAspirante.modificarAspirante(this.gridAspir1.Aspirs[this.gridAspir1.SelectedRows[0].Index], this.ad.ds.Tables["aspirantes"]);										
			this.ad.Conectar();
			this.ad.EjecutarComando("DELETE FROM resultadosraven where codaspirante = '" + this.gridAspir1.Aspirs[this.gridAspir1.SelectedRows[0].Index].Codigo +  "';");
			this.ad.ActualizarBD();
			this.ad.Desconectar();
			
			frmRaven frmr = new frmRaven();
			frmr.ShowDialog(this);
			if(frmr.DialogResult == DialogResult.OK)
			{
				this.ad.Conectar();
				this.ad.RellenarDS();
				//this.ad.Desconectar();
				Aspirante selectedAspir = this.gridAspir1.Aspirs[this.gridAspir1.SelectedRows[0].Index];
				selectedAspir.PruebaR = frmr.Prueba;
				selectedAspir = ManejadorPruebas.RealizarPruebaRaven(selectedAspir, frmr.Prueba);
				selectedAspir.ResRaven.codresult =  (int.Parse(ManejadorPruebas.GetMaxCodeResultados(this.ad.ds.Tables["resultadosraven"])) + 1).ToString();
				selectedAspir.Estado = "evaluado";
				this.gridAspir1.SelectedRows[0].Cells[4].Value = "evaluado";
				selectedAspir.ResCeps = null;			//solo para evitar un bug de la funcionalidad
				ManejadorPruebas.AgregarResultados(selectedAspir, this.ad.ds.Tables["resultadosceps"], this.ad.ds.Tables["resultadosraven"]);				
				manejadorAspirante.modificarAspirante(selectedAspir, this.ad.ds.Tables["aspirantes"]);
				//this.ad.Conectar();
				this.ad.ActualizarBD();
				this.ad.Desconectar();
				this.GridAspir1SelectionChanged(this, new EventArgs());				
			}
		}
		
		void BtnEvaluarCepsClick(object sender, EventArgs e)
		{
			frmCeps frmc = new frmCeps();
			frmc.ShowDialog(this);
			if(frmc.DialogResult == DialogResult.OK)
			{
				this.gridAspir1.Aspirs[this.gridAspir1.SelectedRows[0].Index] = ManejadorPruebas.RealizarPruebaCeps(this.gridAspir1.Aspirs[this.gridAspir1.SelectedRows[0].Index], frmc.Prueba);				
				this.gridAspir1.Aspirs[this.gridAspir1.SelectedRows[0].Index].ResCeps.codresult = (int.Parse(ManejadorPruebas.GetMaxCodeResultados(this.ad.ds.Tables["resultadosceps"])) + 1).ToString().PadLeft(7, '0');
				this.gridAspir1.Aspirs[this.gridAspir1.SelectedRows[0].Index].Estado = "evaluado";
				this.gridAspir1.SelectedRows[0].Cells[4].Value = "evaluado";
				for(int i=0; i<this.gridAspir1.Columns.Count;i++)
					this.gridAspir1.SelectedRows[0].Cells[i].Style = this.gridAspir1.EstiloEvaluado;
				this.gridAspir1.Aspirs[this.gridAspir1.SelectedRows[0].Index].ResRaven = null;   				//solo para evitar un bug de la funcionalidad
				ManejadorPruebas.AgregarResultados(this.gridAspir1.Aspirs[this.gridAspir1.SelectedRows[0].Index], this.ad.ds.Tables["resultadosceps"], this.ad.ds.Tables["resultadosraven"]);
				manejadorAspirante.modificarAspirante(this.gridAspir1.Aspirs[this.gridAspir1.SelectedRows[0].Index], this.ad.ds.Tables["aspirantes"]);
				this.ad.Conectar();
				this.ad.ActualizarBD();
				this.ad.Desconectar();
				this.GridAspir1SelectionChanged(this, new EventArgs());
				this.gridAspir1.TotalEvaluados += 1;
				this.gridAspir1.TotalPendientes -= 1;
				this.label2.Text = "Evaluados: " + this.gridAspir1.TotalEvaluados.ToString() + "    Pendientes: " + this.gridAspir1.TotalPendientes.ToString();
			}
		}
	}
}
