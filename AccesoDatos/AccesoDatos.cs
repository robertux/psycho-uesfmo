using System;
using System.Data;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System.Configuration;
using XmlClassLib;
using CrypterClassLib;

namespace AccesoDatos
{
    public class AccesoDatos
    {
        private string _uid;
        private string _pwd;
        private string _host;
        private string _dbname;
        private MySqlConnection _cn;
        private MySqlDataAdapter _daAdministradores;
        private MySqlCommandBuilder _cbAdministradores;
        private MySqlDataAdapter _daAspirantes;
        private MySqlCommandBuilder _cbAspirantes;
        private MySqlDataAdapter _daGrupos;
        private MySqlCommandBuilder _cbGrupos;
        private MySqlDataAdapter _daPruebaCeps;
        private MySqlCommandBuilder _cbPruebaCeps;
        private MySqlDataAdapter _daPruebaRaven;
        private MySqlCommandBuilder _cbPruebaRaven;
        private MySqlDataAdapter _daRespuestas;
        private MySqlCommandBuilder _cbRespuestas;
        private MySqlDataAdapter _daResultadosCeps;
        private MySqlCommandBuilder _cbResultadosCeps;
        private MySqlDataAdapter _daResultadosRaven;
        private MySqlCommandBuilder _cbResultadosRaven;
        private MySqlDataAdapter _daCentrosComputo;
        private MySqlCommandBuilder _cbCentrosComputo;
        private MySqlDataAdapter _daCiudades;
        private MySqlCommandBuilder _cbCiudades;
        private MySqlDataAdapter _daDepartamentos;
        private MySqlCommandBuilder _cbDepartamentos;
        private MySqlDataAdapter _daFacultades;
        private MySqlCommandBuilder _cbFacultades;
        private MySqlDataAdapter _daCarreras;
        private MySqlCommandBuilder _cbCarreras;
        private MySqlDataAdapter _dacentroestudio;
        private MySqlCommandBuilder _cbcentroestudio;
        private DataSet _ds;     
        private ConfigManager cm;

        #region Propiedades

        public ConnectionState Estado
        {
            get { return this._cn.State; }
        }

        public string Usuario
        {
            get { return this._uid; }
            set
            {
            	this._uid = (string.IsNullOrEmpty(value)? PsychoCrypter.Desencriptar(this.cm["usuario"]) : value) ;
            }
        }

        public string Clave
        {
            get { return this._pwd; }
            set 
            { 
            	this._pwd = (string.IsNullOrEmpty(value)? PsychoCrypter.Desencriptar(this.cm["clave"]) : value);
            }
        }

        public string Servidor
        {
            get { return this._host; }
            set 
            { 
            	this._host = (string.IsNullOrEmpty(value)? PsychoCrypter.Desencriptar(this.cm["servidor"]) : value);
            }
        }

        public string BaseDatos
        {
            get { return this._dbname; }
            set 
            { 
            	this._dbname = (string.IsNullOrEmpty(value)? PsychoCrypter.Desencriptar(this.cm["basedatos"]) : value);
            }
        }

        public String CadenaConexion
        {
            get { return "server=" + this.Servidor + "; user id=" + this.Usuario + "; password=" + this.Clave + "; database=" + this.BaseDatos + ";"; }
        }

        public DataSet ds
        {
            get { return this._ds; }
            set { this._ds = value; }
        }

        #endregion

        #region Metodos

        public AccesoDatos(string ConfigFile) 
        {
            this.cm = new ConfigManager(ConfigFile);
            this.InicializarVariables("","","","");
        }

        public AccesoDatos(string tuid, string tpwd, string thost, string tdbname)
        {        	
        	this.InicializarVariables(tuid, tpwd, thost, tdbname);            
         }
        
        protected void InicializarVariables(string tuid, string tpwd, string thost, string tdbname)
        {
        	this.Usuario = tuid;
            this.Clave = tpwd;
            this.Servidor = thost;
            this.BaseDatos = tdbname;
            
            this._cn = new MySqlConnection(this.CadenaConexion);
            this.ds = new DataSet("dataset1");
            
            this._daAdministradores = new MySqlDataAdapter(new MySqlCommand("SELECT * FROM administradores",this._cn));
            this._cbAdministradores = new MySqlCommandBuilder(this._daAdministradores);

            this._daAspirantes = new MySqlDataAdapter(new MySqlCommand("SELECT * FROM aspirantes", this._cn));
            this._cbAspirantes = new MySqlCommandBuilder(this._daAspirantes);

            this._daGrupos = new MySqlDataAdapter(new MySqlCommand("SELECT * FROM grupos", this._cn));
            this._cbGrupos = new MySqlCommandBuilder(this._daGrupos);

            this._daPruebaCeps = new MySqlDataAdapter(new MySqlCommand("SELECT * FROM pruebaceps", this._cn));
            this._cbPruebaCeps = new MySqlCommandBuilder(this._daPruebaCeps);

            this._daPruebaRaven = new MySqlDataAdapter(new MySqlCommand("SELECT * FROM pruebaraven", this._cn));
            this._cbPruebaRaven = new MySqlCommandBuilder(this._daPruebaRaven);

            this._daRespuestas = new MySqlDataAdapter(new MySqlCommand("SELECT * FROM respuestas", this._cn));
            this._cbRespuestas = new MySqlCommandBuilder(this._daRespuestas);

            this._daResultadosCeps = new MySqlDataAdapter(new MySqlCommand("SELECT * FROM resultadosceps", this._cn));
            this._cbResultadosCeps = new MySqlCommandBuilder(this._daResultadosCeps);

            this._daResultadosRaven = new MySqlDataAdapter(new MySqlCommand("SELECT * FROM resultadosraven", this._cn));
            this._cbResultadosRaven = new MySqlCommandBuilder(this._daResultadosRaven);

            this._daCentrosComputo = new MySqlDataAdapter(new MySqlCommand("SELECT * FROM centroscomputo", this._cn));
            this._cbCentrosComputo = new MySqlCommandBuilder(this._daCentrosComputo);

            this._daCiudades = new MySqlDataAdapter(new MySqlCommand("SELECT * FROM ciudades", this._cn));
            this._cbCiudades = new MySqlCommandBuilder(this._daCiudades);

            this._daDepartamentos = new MySqlDataAdapter(new MySqlCommand("SELECT * FROM departamentos", this._cn));
            this._cbDepartamentos = new MySqlCommandBuilder(this._daDepartamentos);

            this._daFacultades = new MySqlDataAdapter(new MySqlCommand("SELECT * FROM facultades", this._cn));
            this._cbFacultades = new MySqlCommandBuilder(this._daFacultades);

            this._daCarreras = new MySqlDataAdapter(new MySqlCommand("SELECT * FROM carreras", this._cn));
            this._cbCarreras = new MySqlCommandBuilder(this._daCarreras);

            this._dacentroestudio = new MySqlDataAdapter(new MySqlCommand("SELECT * FROM centroestudio", this._cn));
            this._cbcentroestudio = new MySqlCommandBuilder(this._dacentroestudio);
        }
                                            

        public void Conectar()
        {
            if (this.Estado == ConnectionState.Closed)
                this._cn.Open();
        }

        public void Desconectar()
        {
            if (this.Estado == ConnectionState.Open)
                this._cn.Close();
        }

        public void RellenarDS()
        {
            this.ds.Clear();
            this._daAdministradores.Fill(this.ds, "administradores");
            this._daGrupos.Fill(this.ds, "grupos");
            this._daAspirantes.Fill(this.ds, "aspirantes");
            this._daPruebaCeps.Fill(this.ds, "pruebaceps");
            this._daPruebaRaven.Fill(this.ds, "pruebaraven");
            this._daRespuestas.Fill(this.ds, "respuestas");
            this._daResultadosCeps.Fill(this.ds, "resultadosceps");
            this._daResultadosRaven.Fill(this.ds, "resultadosraven");
            this._daCentrosComputo.Fill(this.ds, "centroscomputo");
            this._daCiudades.Fill(this.ds, "ciudades");
            this._daDepartamentos.Fill(this.ds, "departamentos");
            this._daFacultades.Fill(this.ds, "facultades");
            this._daCarreras.Fill(this.ds, "carreras");
            this._dacentroestudio.Fill(this.ds, "centroestudio");
        }

        public void RellenarDS(string cuales)
        {
            this.ds.Clear();
            if(cuales.ToUpper().Contains("ADMINISTRADORES"))
                this._daAdministradores.Fill(this.ds, "administradores");
            if(cuales.ToUpper().Contains("ASPIRANTES"))
                this._daAspirantes.Fill(this.ds, "aspirantes");
            if(cuales.ToUpper().Contains("GRUPOS"))
                this._daGrupos.Fill(this.ds, "grupos");
            if(cuales.ToUpper().Contains("PRUEBACEPS"))
                this._daPruebaCeps.Fill(this.ds, "pruebaceps");
            if(cuales.ToUpper().Contains("PRUEBARAVEN"))
                this._daPruebaRaven.Fill(this.ds, "pruebaraven");
            if(cuales.ToUpper().Contains("RESPUESTAS"))
                this._daRespuestas.Fill(this.ds, "respuestas");
            if(cuales.ToUpper().Contains("RESULTADOSCEPS"))
                this._daResultadosCeps.Fill(this.ds, "resultadosceps");
            if(cuales.ToUpper().Contains("RESULTADOSRAVEN"))
                this._daResultadosRaven.Fill(this.ds, "resultadosraven");
            if (cuales.ToUpper().Contains("CENTROSCOMPUTO"))
                this._daCentrosComputo.Fill(this.ds, "centroscomputo");
            if(cuales.ToUpper().Contains("CIUDADES"))
                this._daCiudades.Fill(this.ds, "ciudades");
            if(cuales.ToUpper().Contains("DEPARTAMENTOS"))
                this._daDepartamentos.Fill(this.ds, "departamentos");
            if(cuales.ToUpper().Contains("FACULTADES"))
                this._daFacultades.Fill(this.ds, "facultades");
            if(cuales.ToUpper().Contains("CARRERAS"))
                this._daCarreras.Fill(this.ds, "carreras");
            if(cuales.ToUpper().Contains("centroestudio"))
                this._dacentroestudio.Fill(this.ds, "centroestudio");
        }

        public void ActualizarBD()
        {        
            this._daAdministradores.Update(this.ds, "administradores");            
            this._daGrupos.Update(this.ds, "grupos");
            this._daAspirantes.Update(this.ds, "aspirantes");            
            this._daPruebaCeps.Update(this.ds, "pruebaceps");
            this._daPruebaRaven.Update(this.ds, "pruebaraven");
            //this._daRespuestas.Update(this.ds, "respuestas");
            this._daResultadosCeps.Update(this.ds, "resultadosceps");
            this._daResultadosRaven.Update(this.ds, "resultadosraven");
            this._daCentrosComputo.Update(this.ds, "centroscomputo");
            this._daCiudades.Update(this.ds, "ciudades");
            this._daDepartamentos.Update(this.ds, "departamentos");
            this._daFacultades.Update(this.ds, "ciudades");
            this._daCarreras.Update(this.ds, "carreras");
            this._dacentroestudio.Update(this.ds, "centroestudio");

            this.ds.AcceptChanges();
        }
        
        public void EjecutarComando(string cmdQuery)
        {
        	MySqlCommand cmd = new MySqlCommand(cmdQuery, this._cn);
        	cmd.ExecuteNonQuery();
        }

        #endregion

      


    }
}
