using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;
using System.ComponentModel;
using System.Drawing;
using System.Globalization;

namespace Bullets
{
	namespace Visuales
	{
	    /// <summary>
	    /// Tipos de numeros que puede aceptar un control Bullets.Visuales.CustomTextBox
	    /// </summary>
	    public enum TipoNumero
	    {
	    	/// <summary>
	    	/// Acepta cualquier tipo de numeros
	    	/// </summary>
	        Todos,
	        /// <summary>
	        /// Acepta solamente numeros enteros
	        /// </summary>
	        Entero,
	        /// <summary>
	        /// Acepta solamente numeros enteros positivos y el cero
	        /// </summary>
	        EnteroSinSigno,
	        /// <summary>
	        /// Acepta solamente numeros dobles
	        /// </summary>
	        Doble,
	        /// <summary>
	        /// Acepta solamente numeros dobles positivos y el cero
	        /// </summary>
	        DobleSinSigno,
	        /// <summary>
	        /// No acepta ningunt tipo de numeros
	        /// </summary>
	        Ninguno
	    }
	
	    /// <summary>
	    /// Tipos de letras que puede aceptar un control Bullets.Visuales.CustomTextBox
	    /// </summary>
	    public enum TipoLetra
	    {
	    	/// <summary>
	    	/// Acepta cualquier tipo de letras
	    	/// </summary>
	        Todos,
	        /// <summary>
	        /// Acepta solamente letras minusculas
	        /// </summary>
	        SoloMinusculas,
	        /// <summary>
	        /// Acepta solamente letras mayusculas
	        /// </summary>
	        SoloMayusculas,
	        /// <summary>
	        /// Convierte todas las letras ingresadas a minusculas
	        /// </summary>
	        ConvertirAMinusculas,
	        /// <summary>
	        /// Convierte todas las letras ingresadas a mayusculas
	        /// </summary>
	        ConvertirAMayusculas,
	        /// <summary>
	        /// No acepta ningun tipo de letras
	        /// </summary>
	        Ninguno
	    }
	
	    /// <summary>
	    /// Clase heredada del textbox original que implementa funcionalidad de validacion
	    /// </summary>
	    [Serializable()]
	    public class CustomTextBox: TextBox
	    {
	    	/// <summary>
	    	/// Define los tipos de numeros que podra aceptar el control
	    	/// </summary>
	        private TipoNumero _aceptarNum;
	        /// <summary>
	        /// Define el numero de decimales que podra aceptar el control en el caso que el tipo de numero sea doble o doble sin signo
	        /// </summary>
	        private int _ndecs;
	        /// <summary>
	        /// Define los tipos de letras que podra aceptar el control
	        /// </summary>
	        private TipoLetra _aceptarLtr;
	        /// <summary>
	        /// Define un conjunto de caracteres permitidos por el control. Estos tendran mayor prioridad que los tipos de numeros y letras
	        /// </summary>
	        private string _caracPerm;
	        
	        /// <summary>
	        /// Define el formato local usado para los numeros que acepte el control
	        /// </summary>
	        private NumberFormatInfo nfInfo;       
	
	        #region Propiedades
	
	        /// <summary>
	        /// Especifica el tipo de numeros que el control permite recibir o si no se permite recibir numeros
	        /// </summary>
	        [Browsable(true)]
	        [Category("Datos Permitidos")]
	        [Description("Especifica el tipo de numeros que el control permite recibir o si no se permite recibir numeros")]
	        public TipoNumero AceptarNumeros
	        {
	            get { return this._aceptarNum; }
	            set { this._aceptarNum = value; }
	        }
	
	        /// <summary>
	        /// Especifica la cantidad de decimales que el control permite, si en los datos permitidos se encuentran los dobles o dobles sin signo
	        /// </summary>
	        [Browsable(true)]
	        [Category("Datos Permitidos")]
	        [Description("Especifica la cantidad de decimales que el control permite, si en los datos permitidos se encuentran los dobles o dobles sin signo")]        
	        public int NumeroDeDecimales
	        {
	            get { return this._ndecs; }
	            set { this._ndecs =  value; }
	        }
	
	        /// <summary>
	        /// Especifica el tipo de letras que el control permite recibir, si no se permite recibir letras o si se convertiran automaticamente a un tipo especifico
	        /// </summary>
	        [Browsable(true)]
	        [Category("Datos Permitidos")]
	        [Description("Especifica el tipo de letras que el control permite recibir, si no se permite recibir letras o si se convertiran automaticamente a un tipo especifico")]
	        public TipoLetra AceptarLetras
	        {
	            get { return this._aceptarLtr; }
	            set { this._aceptarLtr = value; }
	        }
	
	        /// <summary>
	        /// Especifica una lista de otros caracteres especiales que el texto pueda recibir
	        /// </summary>
	        [Browsable(true)]
	        [Category("Datos Permitidos")]
	        [DefaultValue(",:;-_")]
	        [Description("Especifica una lista de otros caracteres especiales que el texto pueda recibir")]
	        public string OtrosCaracteresPermitidos
	        {
	            get { return this._caracPerm; }
	            set { this._caracPerm = value; }
	        }
	
	        /// <summary>
	        /// La propiedad text sobreescrita de la original. Valida el texto antes de recibirlo en el set
	        /// </summary>
	        [Browsable(true)]
	        [Category("Datos Permitidos")]
	        [Description("El texto asociado con el control")]
	        public override string Text
	        {
	            get
	            { return base.Text; }
	            set
	            { base.Text = this.Validar(value); }
	        }
	
	        #endregion
	
	        #region Metodos
	
	        /// <summary>
	        /// Crea una nueva instancia del control Bullets.Visuales.CustomTextBox
	        /// </summary>
	        /// <param name="carsPermitidos">Caracteres que inicialmente aceptara el control</param>
	        public CustomTextBox(string carsPermitidos)
	        {
	            this.OtrosCaracteresPermitidos = carsPermitidos;
	            this.InicializarNFInfo();
	        }
	
	        /// <summary>
	        /// Crea una nueva instancia del control Bullets.Visuales.CustomTextBox
	        /// </summary>
	        public CustomTextBox(): this("")
	        {
	        	this.InicializarNFInfo();
	        }
	
	        /// <summary>
	        /// Inicializa el NumberFormatInfo para poder ser usado en el parsing a doble del texto del control
	        /// </summary>
	        private void InicializarNFInfo()
	        {
			this.nfInfo = new NumberFormatInfo();
	        	this.nfInfo.CurrencyDecimalSeparator=".";
	        	this.nfInfo.CurrencyGroupSeparator=",";
	        	this.nfInfo.NumberDecimalSeparator=".";
	        	this.nfInfo.NumberGroupSeparator=",";        	
	        }
	        
	        /// <summary>
	        /// Devuelve una cadena como resultado de las validaciones aplicadas a la original segun la configuracion del control
	        /// </summary>
	        /// <param name="cadena">La cadena original a validar</param>
	        /// <returns></returns>
	        protected string Validar(string cadena)
	        {
	            for (int i = 0; i < cadena.Length; i++)
	            {
	                if (!this.EsValido(cadena[i]))
	                { cadena = cadena.Remove(i, 1); i = -1; }
	            }
	            if (this.AceptarLetras == TipoLetra.ConvertirAMayusculas)
	                cadena = cadena.ToUpper();
	            if (this.AceptarLetras == TipoLetra.ConvertirAMinusculas)
	                cadena = cadena.ToLower();
	            try
	            {
	                if (this.AceptarLetras == TipoLetra.Ninguno && this.OtrosCaracteresPermitidos == "" && cadena.Length > 1)
	                {
	                    double valor = double.Parse(cadena, this.nfInfo);
	                    valor = Math.Round(valor, this.NumeroDeDecimales);                    
	                    cadena = string.Format(this.nfInfo, "{0}", valor);
	                }
	            }
	            catch (Exception ex)
	            { cadena = "Exception!!!: " + ex.Message; }
	            return cadena;
	        }
	
	        /// <summary>
	        /// Devuelve un valor booleano que indica si el caracter introducido es valido segun la configuracion del control
	        /// </summary>
	        /// <param name="caracter">El caracter a verificar</param>
	        /// <returns></returns>
	        public Boolean EsValido(char caracter)
	        {
	            if(this.OtrosCaracteresPermitidos.Contains(caracter.ToString()))
	                return true;
	            if (char.IsDigit(caracter))
	                if (this.AceptarNumeros != TipoNumero.Ninguno)
	                    return true;
	            if (char.IsLetter(caracter))
	            {
	                if(this.AceptarLetras == TipoLetra.SoloMayusculas && char.IsLower(caracter))
	                    return false;
	                if (this.AceptarLetras == TipoLetra.SoloMinusculas && char.IsUpper(caracter))
	                    return false;
	                if (this.AceptarLetras != TipoLetra.Ninguno)
	                    return true;
	            }
	            if (caracter == '.')
	                if ((this.AceptarNumeros == TipoNumero.Doble || this.AceptarNumeros == TipoNumero.DobleSinSigno || this.AceptarNumeros == TipoNumero.Todos) && (this.Text.IndexOf('.') == this.Text.LastIndexOf('.')))
	                    return true;
	            if (caracter == '-')
	                if ((this.AceptarNumeros == TipoNumero.Doble || this.AceptarNumeros == TipoNumero.Entero || this.AceptarNumeros == TipoNumero.Todos) && !(this.Text.Contains("-")))
	                    return true;
	            return false;
	        }
	
	        /// <summary>
	        /// Devuelve un valor booleano que indica si la tecla es valida(Si pertenece a las que el control si permite y no imprimen un caracter. P. Ej. backspace, enter, cursores, etc.
	        /// </summary>
	        /// <param name="tecla"></param>
	        /// <returns></returns>
	        protected Boolean EsTeclaValida(Keys tecla)
	        {
	            switch (tecla)
	            {
	                case Keys.Back:      	  
	                case Keys.Delete:
	                case Keys.Down:
	                case Keys.End:
	                case Keys.Enter:
	                case Keys.Home:
	                case Keys.Insert:
	                case Keys.Left:
	                case Keys.PageDown:
	                case Keys.PageUp:
	                case Keys.Right:
	                case Keys.Up:
	                    return true;	                    
	                default:
	                    return false;
	            }
	        }
	
	        /// <summary>
	        /// Metodo sobreescrito del original para que los caracteres introducidos al control sean validados
	        /// </summary>
	        /// <param name="e"></param>
	        protected override void OnKeyPress(KeyPressEventArgs e)
	        {
	        	if(char.IsLetterOrDigit(e.KeyChar) || char.IsPunctuation(e.KeyChar) || char.IsSymbol(e.KeyChar))
	        	{
	        		if (e.KeyChar.ToString().ToUpper() != this.Validar(e.KeyChar.ToString()).ToUpper())
					e.Handled = true;
				if (this.AceptarLetras == TipoLetra.ConvertirAMayusculas)
					e.KeyChar = char.ToUpper(e.KeyChar);
				if (this.AceptarLetras == TipoLetra.ConvertirAMinusculas)
					e.KeyChar = char.ToLower(e.KeyChar);
	        	}
	        }
	
	        /// <summary>
	        /// Metodo sobreescrito del original para que los caracteres introducidos al control sean validados
	        /// </summary>
	        /// <param name="e"></param>
	        protected override void OnKeyDown(KeyEventArgs e)
	        {
	        	if(e.KeyCode != Keys.Back && e.KeyCode != Keys.Enter)
	        	{
	            		if (!this.EsTeclaValida(e.KeyCode))
	                		e.Handled = true;
	        	}
	        }
	
	        protected override void OnPaint(PaintEventArgs e)
	        {
	            Graphics gr = this.CreateGraphics();
	            gr.Clear(this.BackColor);
	            SolidBrush sbr = new SolidBrush(Color.Blue);
	            gr.DrawRectangle(new Pen(sbr), this.Left, this.Top, this.Width, this.Height);
	        }
	
	        #endregion      
	        
	    }
	}
}
