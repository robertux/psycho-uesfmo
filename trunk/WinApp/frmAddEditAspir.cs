/*
 * Created by SharpDevelop.
 * user: Robertux
 * Date: 20/10/2008
 * Time: 09:36 p.m.
 * 
 * 
 */

using System;
using System.Drawing;
using System.Windows.Forms;
using System.Collections.Generic;
using FuncionalidadClassLib;
using AccesoDatos;

namespace WinApp
{
	/// <summary>
	/// Description of frmAddEditAspir.
	/// </summary>
	public partial class frmAddEditAspir : Form
	{
		public Aspirante aspir;
		private AccesoDatos.AccesoDatos ad;
		private List<centroestudio> centros;
		private List<Departamento> deptos;
		private List<Ciudad> ciudades;
		private List<Facultad> facultades;
		private List<Carrera> carreras;
		private bool editMode;
		
		public frmAddEditAspir()
		{			
			InitializeComponent();
			this.ad = new AccesoDatos.AccesoDatos("app.config");
			this.ad.Conectar();
			this.ad.RellenarDS();
			this.ad.Desconectar();
			this.centros = new List<centroestudio>();
			this.deptos = new List<Departamento>();
			this.ciudades = new List<Ciudad>();
			this.facultades = new List<Facultad>();
			this.carreras = new List<Carrera>();
			this.editMode = false;
		}
		
		public frmAddEditAspir(Aspirante pAspir): this()
		{
			this.aspir = pAspir;
			this.txtApellidos.Text = this.aspir.Apellidos;
			this.txtNombres.Text = this.aspir.Nombres;
			this.txtDireccion.Text = this.aspir.Direccion;
			this.txtTelefono.Text = this.aspir.Telefono;
			this.rbtnMasculino.Checked = (this.aspir.Sexo == 'M');
			this.rbtnFemenino.Checked = !this.rbtnMasculino.Checked;
			this.dtpFechaNac.Value = this.aspir.FechaNacimiento;
			
			for(int i=0; i<this.deptos.Count; i++)
				if(this.deptos[i].CodDepartamento == this.aspir.Depto.CodDepartamento)
					this.cmbDepto.SelectedIndex = i;
			
			for(int i=0; i<this.ciudades.Count; i++)
				if(this.ciudades[i].CodCiudad == this.aspir.Ciudad.CodCiudad)
					this.cmbCiudad.SelectedIndex = i;
			
			for(int i=0; i<this.centros.Count; i++)
				if(this.centros[i].codigo == this.aspir.LugarEstudios.codigo)
					this.cmbCentroEstudios.SelectedIndex = i;
			
			for(int i=0; i<this.facultades.Count; i++)
				if(this.facultades[i].CodFacultad == this.aspir.Facultad.CodFacultad)
					this.cmbFacultad.SelectedIndex = i;
			
			for(int i=0; i<this.carreras.Count; i++)
				if(this.carreras[i].CodCarrera == this.aspir.Carrera.CodCarrera)
					this.cmbCarrera.SelectedIndex = i;
			
			this.editMode = true;
		}
		
		void FrmAddEditAspirLoad(object sender, EventArgs e)
		{
			this.CargarCentrosEstudios();
			this.CargarDeptos();
			this.CargarFacultades();			
		}
						
		void Button1Click(object sender, EventArgs e)
		{
			this.DialogResult = DialogResult.Cancel;
			this.Close();
		}
		
		void Button2Click(object sender, EventArgs e)
		{
			this.DialogResult = DialogResult.OK;
			string cod, estado;
			uint anioRegistrado;
			if(this.editMode)
			{
				cod = this.aspir.Codigo;
				anioRegistrado = this.aspir.AnioRegistrado;
				estado = this.aspir.Estado;
			}
			else
			{				
				cod = manejadorAspirante.GenerarCodigo(this.txtApellidos.Text, this.txtNombres.Text, this.ad.ds.Tables["aspirantes"]);
				anioRegistrado = (uint)DateTime.Now.Year;
				estado = "pendiente";
			}

			this.aspir = new Aspirante(cod, this.txtNombres.Text, this.txtApellidos.Text, "0", this.txtDireccion.Text, this.txtTelefono.Text, this.centros[this.cmbCentroEstudios.SelectedIndex], this.ciudades[this.cmbCiudad.SelectedIndex], this.deptos[this.cmbDepto.SelectedIndex], "", estado, this.carreras[this.cmbCarrera.SelectedIndex], (this.rbtnMasculino.Checked? 'M': 'F'), this.dtpFechaNac.Value, this.facultades[this.cmbFacultad.SelectedIndex], anioRegistrado, "");
			this.Close();
		}
		
		public void CargarCentrosEstudios()
		{
			this.cmbCentroEstudios.Items.Clear();
			this.centros = ManejadorMisc.GetCentroEstudios(this.ad.ds.Tables["centroestudio"]);
			foreach(centroestudio centro in this.centros)
				this.cmbCentroEstudios.Items.Add(centro.Nombre);
			if(this.cmbCentroEstudios.Items.Count > 0)
				this.cmbCentroEstudios.SelectedIndex = 0;
		}
		
		public void CargarDeptos()
		{
			this.cmbDepto.Items.Clear();
			this.deptos = ManejadorMisc.GetDepartamentos(this.ad.ds.Tables["departamentos"]);
			foreach(Departamento depto in this.deptos)
				this.cmbDepto.Items.Add(depto.NombreDepartamento);
			if(this.cmbDepto.Items.Count > 0)
				this.cmbDepto.SelectedIndex = 0;
		}
		
		public void CargarCiudades(string codDepto)
		{
			this.cmbCiudad.Items.Clear();
			this.ciudades = ManejadorMisc.GetCiudades(codDepto, this.ad.ds.Tables["ciudades"]);
			foreach(Ciudad ciud in this.ciudades)
				this.cmbCiudad.Items.Add(ciud.NombreCiudad);
			if(this.cmbCiudad.Items.Count > 0)
				this.cmbCiudad.SelectedIndex = 0;
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
		
		void CmbDeptoSelectedIndexChanged(object sender, EventArgs e)
		{
			this.CargarCiudades(this.deptos[this.cmbDepto.SelectedIndex].CodDepartamento);
		}
		
		void CmbFacultadSelectedIndexChanged(object sender, EventArgs e)
		{
			this.CargarCarreras(this.facultades[this.cmbFacultad.SelectedIndex].CodFacultad);
		}
		
		public void CheckAceptButton()
		{
			if(this.txtApellidos.Text == "" || this.txtNombres.Text == "")
				this.btnAceptar.Enabled = false;
			else
				this.btnAceptar.Enabled = true;
		}
		
		void TxtApellidosTextChanged(object sender, EventArgs e)
		{
			this.CheckAceptButton();
		}
		
		void TxtNombresTextChanged(object sender, EventArgs e)
		{
			this.CheckAceptButton();
		}
	}
}
