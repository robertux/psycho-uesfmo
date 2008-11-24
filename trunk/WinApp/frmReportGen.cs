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
		
		public frmReportGen()
		{			
			InitializeComponent();
		}
		
		public frmReportGen(AccesoDatos.AccesoDatos pAd): this()
		{
			this.ad = pAd;
			this.CargarFacultades();
		}
		
		public void CargarFacultades()
		{
			this.cmbFacultad.Items.Clear();
			this.facultades = ManejadorMisc.GetFacultades(this.ad.ds.Tables["facultades"]);
			foreach(Facultad fac in this.facultades)
				this.cmbFacultad.Items.Add(fac.NombreFacultad);
			if(this.cmbFacultad.Items.Count > 0)
				this.cmbFacultad.SelectedIndex = 0;
		}
		
		public void CargarCarreras(string codFacultad)
		{
			this.cmbCarrera.Items.Clear();
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
		
		void FrmReportGenLoad(object sender, EventArgs e)
		{
			
		}
		
		void CmbFacultadSelectedIndexChanged(object sender, EventArgs e)
		{
			this.CargarCarreras(this.facultades[this.cmbFacultad.SelectedIndex].CodFacultad);
		}				
		
		void Button1Click(object sender, EventArgs e)
		{
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
			vista.RowFilter = "carrera= '" + carreraSelected + "'";
			
			SaveFileDialog sfd = new SaveFileDialog();
			sfd.Title = "Guardar reporte como...";
			sfd.Filter = "Documento de Word 2003 (*.doc) | *.doc";
			if(sfd.ShowDialog(this) == DialogResult.OK)
			{
				try{
					new FuncionalidadClassLib.reportes(vista.ToTable(), this.ad, sfd.FileName);
					MessageBox.Show("Archivo generado existosamente", "Aviso");
				}catch(Exception ex){
					MessageBox.Show("Ocurrio un error al generar el reporte. Intentelo nuevamente", "Error");
					this.Close();
				}
				//new FuncionalidadClassLib.reporte_oficial(vista.ToTable(), this.ad);
			}
			this.Close();
		}
	}
}
