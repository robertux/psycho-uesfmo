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

        //Lo agrego por conveniencia
        public frmAddEditAspir()
        {
            InitializeComponent();
            this.ad = new AccesoDatos.AccesoDatos("WinApp.exe.config");
            this.ad.Conectar();
            this.ad.RellenarDS();
            this.ad.Desconectar();
            this.editMode = false;
        }

		public frmAddEditAspir(AccesoDatos.AccesoDatos pAD)
		{			
			InitializeComponent();			
            ////Se le pasa como argumento.
			//this.ad = new AccesoDatos.AccesoDatos("app.config"); //WinApp.exe.config
            this.ad = pAD;
			this.ad.Conectar();
			this.ad.RellenarDS();
			this.ad.Desconectar();
			this.editMode = false;
			this.dtpFechaNac.Value = new DateTime(DateTime.Now.Year - 15, DateTime.Now.Month, DateTime.Now.Day);
		}
		
		public frmAddEditAspir(Aspirante pAspir): this()
		{
			this.aspir = pAspir;
			this.editMode = true;
		}
		
		public void SetDefaultValues()
		{			
			this.centros = new List<centroestudio>();
			this.deptos = new List<Departamento>();
			this.ciudades = new List<Ciudad>();
			this.facultades = new List<Facultad>();
			this.carreras = new List<Carrera>();			
		}
		
		public void SetAspirValues()
		{			
			this.txtApellidos.Text = this.aspir.Apellidos;
			this.txtNombres.Text = this.aspir.Nombres;
			this.txtDireccion.Text = this.aspir.Direccion;
			this.txtTelefono.Text = this.aspir.Telefono;
			this.rbtnMasculino.Checked = (this.aspir.Sexo == 'M');
			this.rbtnFemenino.Checked = !this.rbtnMasculino.Checked;
			this.dtpFechaNac.Value = this.aspir.FechaNacimiento;
			
			int count = this.deptos.Count;
			for(int i=0; i<this.deptos.Count; i++)
				if(this.deptos[i].CodDepartamento == this.aspir.Depto.CodDepartamento)
					this.cmbDepto.SelectedIndex = i;
			
			for(int i=0; i<this.ciudades.Count; i++)
				if(this.ciudades[i].CodCiudad == this.aspir.Ciudad.CodCiudad)
					this.cmbCiudad.SelectedIndex = i;
			
			for(int i=0; i<this.cmbCentroEstudios.Items.Count; i++)
				if(this.cmbCentroEstudios.Items[i].ToString() == this.aspir.LugarEstudios.Nombre)
					this.cmbCentroEstudios.SelectedIndex = i;
			
			for(int i=0; i<this.facultades.Count; i++)
				if(this.facultades[i].CodFacultad == this.aspir.Facultad.CodFacultad)
					this.cmbFacultad.SelectedIndex = i;
			
			for(int i=0; i<this.carreras.Count; i++)
				if(this.carreras[i].CodCarrera == this.aspir.Carrera.CodCarrera)
					this.cmbCarrera.SelectedIndex = i;
		}
		
		void FrmAddEditAspirLoad(object sender, EventArgs e)
		{
			this.SetDefaultValues();
			this.CargarCentrosEstudios();
			this.CargarDeptos();
			this.CargarFacultades();			
			if(this.editMode)
				this.SetAspirValues();
		}
						
		void Button1Click(object sender, EventArgs e)
		{
			if(!this.CheckCentroEstudios())
				return;
			if(this.dtpFechaNac.Value.Year > (DateTime.Now.Year - 15))
			{
				MessageBox.Show("Introduzca una fecha de nacimiento menor o igual a " + (DateTime.Now.Year-15).ToString());
				this.dtpFechaNac.Focus();
				return;
			}
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
		
		void Button2Click(object sender, EventArgs e)
		{
			this.DialogResult = DialogResult.Cancel;
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
				this.button1.Enabled = false;
			else
				this.button1.Enabled = true;
		}
		
		void TxtApellidosTextChanged(object sender, EventArgs e)
		{
			this.CheckAceptButton();
		}
		
		void TxtNombresTextChanged(object sender, EventArgs e)
		{
			this.CheckAceptButton();
		}
		
		void CmbCentroEstudiosSelectedIndexChanged(object sender, EventArgs e)
		{
			
		}
		
		void CmbCarreraSelectedIndexChanged(object sender, EventArgs e)
		{
			
		}
		
		void CmbCentroEstudiosLeave(object sender, EventArgs e)
		{
			this.CheckCentroEstudios();
		}
		
		public bool CheckCentroEstudios()
		{
			bool centroExistente = false;			
			foreach(centroestudio centro in this.centros)
			{
				if(this.cmbCentroEstudios.Text == centro.Nombre)
					centroExistente = true;
			}
			if(!centroExistente)
			{
				if(MessageBox.Show("El Centro de estudios que ha escrito no existe. Desea agregarlo como nuevo?", "Confirmacion", MessageBoxButtons.YesNo) == DialogResult.Yes)
				{
					string maxCode = "0";
					string nombre = this.cmbCentroEstudios.Text;
					foreach(centroestudio centro in this.centros)
					{
						if(int.Parse(centro.codigo) > int.Parse(maxCode))
							maxCode = centro.codigo;
					}
					maxCode = (int.Parse(maxCode)+1).ToString();
					
					string queryAgregarCentro = "INSERT INTO centroestudio(codigo, nombre, codciudad, caracter_inst, sector) values('" + maxCode + "', '" + nombre + "', '210', 'N', 'Publico');";
					this.ad.Conectar();
					this.ad.EjecutarComando(queryAgregarCentro);
					this.ad.RellenarDS();
					this.ad.Desconectar();	
					this.centros = ManejadorMisc.GetCentroEstudios(this.ad.ds.Tables["centroestudio"]);
					this.cmbCentroEstudios.Items.Add(nombre);
					this.cmbCentroEstudios.SelectedIndex = this.cmbCentroEstudios.Items.Count-1;
					return true;
				}
				else
					return false;
			}
			return true;
		}
	}
}
