/*
 * Created by SharpDevelop.
 * user: Robertux
 * Date: 20/11/2008
 * Time: 11:23 a.m.
 * 
 * 
 */

using System;
using System.Drawing;
using System.Data;
using System.Windows.Forms;
using FuncionalidadClassLib;
using System.Collections.Generic;


namespace WinApp
{
	/// <summary>
	/// Description of frmReportGen.
	/// </summary>
	public partial class frmReportGen : Form
	{
		private AccesoDatos.AccesoDatos ad;
		private List<Facultad> facultades;
		private List<Carrera> carreras;
		private int anioRegistrado;
		private string rutaArchivoGuardar;
		
		public frmReportGen()
		{			
			InitializeComponent();
		}
		
		public frmReportGen(AccesoDatos.AccesoDatos pAd, int anioReg): this()
		{
			this.ad = pAd;
			this.CargarFacultades();
			this.anioRegistrado = anioReg;
			this.rutaArchivoGuardar = "";
		}
		
		public void CargarFacultades()
		{
			this.cmbFacultad.Items.Clear();
			this.facultades = ManejadorMisc.GetFacultades(this.ad.ds.Tables["facultades"]);
			foreach(Facultad fac in this.facultades)
				this.cmbFacultad.Items.Add(fac.NombreFacultad);
			if(this.cmbFacultad.Items.Count > 0)
			{
				this.cmbFacultad.Items.Add("[Todas]");
				this.cmbFacultad.SelectedIndex = 0;
			}
		}
		
		public void CargarCarreras(string codFacultad)
		{
			this.cmbCarrera.Items.Clear();
			if(this.cmbFacultad.Text == "[Todas]")
			{
				this.cmbCarrera.Items.Add("[Todas]");
				this.cmbCarrera.SelectedIndex = 0;
				return;
			}
			this.carreras = ManejadorMisc.GetCarreras(codFacultad, this.ad.ds.Tables["carreras"]);
			foreach(Carrera ca in this.carreras)
				this.cmbCarrera.Items.Add(ca.NombreCarrera);
			if(this.cmbCarrera.Items.Count > 0)
				this.cmbCarrera.SelectedIndex = 0;
		}
		
		void Button2Click(object sender, EventArgs e)
		{
			this.Close();
		}
				
		void CmbFacultadSelectedIndexChanged(object sender, EventArgs e)
		{
			if(this.cmbFacultad.Text == "[Todas]")
				this.CargarCarreras(""); //Internamente, al darse cuenta que la facultad seleccionada es [Todas], hara lo mismo con las carreras
			else
				this.CargarCarreras(this.facultades[this.cmbFacultad.SelectedIndex].CodFacultad);
		}				
		
		void Button1Click(object sender, EventArgs e)
		{
			if(this.rutaArchivoGuardar == "")
			{
				this.Button3Click(this, new EventArgs());				
				if(this.rutaArchivoGuardar == "")
					return;
			}
			string carreraSelected = "";
			foreach(Carrera cr in this.carreras)
			{				
				if(cr.NombreCarrera == this.cmbCarrera.Text)
				{
					carreraSelected = cr.CodCarrera;
					break;
				}
			}
			
			DataView vista = this.ad.ds.Tables["aspirantes"].DefaultView;
			String strFiltro = "anioregistrado=" + this.anioRegistrado;
			
			if(this.cmbCarrera.Text != "[Todas]")
				strFiltro += " AND carrera= '" + carreraSelected + "'";
							
			vista.RowFilter = strFiltro;						
				try{					
					
					this.cmbFacultad.Enabled = false;
					this.cmbCarrera.Enabled = false;
					this.button1.Enabled = false;
					this.button3.Enabled = false;
					
					this.label1.Text = "Creando el documento " + this.rutaArchivoGuardar;
					PsychoReportGenerator rGen = new PsychoReportGenerator(this.rutaArchivoGuardar, this.ad);
					
					//int i = 0;
					foreach(DataRow fila in vista.ToTable().Rows)
					{																		
						Aspirante currentAspir = manejadorAspirante.GetAspirante(fila["codigo"].ToString(), this.ad.ds);
						this.label1.Text = "Agregando al reporte los datos del estudiante " + currentAspir.Apellidos + ", " + currentAspir.Nombres;
						currentAspir = ManejadorPruebas.GetResultados(currentAspir, this.ad.ds.Tables["resultadosceps"], this.ad.ds.Tables["resultadosraven"]);
						rGen.AgregarAspirante(currentAspir);					
						//if(++i == 10) break;
					}
					rGen.Cerrar();					
					MessageBox.Show("Archivo generado existosamente", "Aviso");
				}catch(Exception ex){
					throw ex;
					MessageBox.Show("Ocurrio un error al generar el reporte. Intentelo nuevamente", "Error");
				}				
			this.Close();
		}
		
		void Button3Click(object sender, EventArgs e)
		{
			SaveFileDialog sfd = new SaveFileDialog();
			sfd.Title = "Guardar reporte como...";
			sfd.Filter = "Archivo de Microsoft Word (*.doc) | *.doc";
			if(sfd.ShowDialog() == DialogResult.OK)
			{
				this.rutaArchivoGuardar = sfd.FileName;
				this.textBox1.Text = sfd.FileName;
			}
		}
	}
}
