/*
 * Created by SharpDevelop.
 * user: Robertux
 * Date: 20/11/2008
 * Time: 11:23 a.m.
 * 
 * 
 */
namespace WinApp
{
	partial class frmReportGen
	{
		/// <summary>
		/// Designer variable used to keep track of non-visual components.
		/// </summary>
		private System.ComponentModel.IContainer components = null;
		
		/// <summary>
		/// Disposes resources used by the form.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing) {
				if (components != null) {
					components.Dispose();
				}
			}
			base.Dispose(disposing);
		}
		
		/// <summary>
		/// This method is required for Windows Forms designer support.
		/// Do not change the method contents inside the source code editor. The Forms designer might
		/// not be able to load this method if it was changed manually.
		/// </summary>
		private void InitializeComponent()
		{
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmReportGen));
			this.button2 = new System.Windows.Forms.Button();
			this.button1 = new System.Windows.Forms.Button();
			this.cmbCarrera = new System.Windows.Forms.ComboBox();
			this.cmbFacultad = new System.Windows.Forms.ComboBox();
			this.textBox1 = new System.Windows.Forms.TextBox();
			this.button3 = new System.Windows.Forms.Button();
			this.label1 = new System.Windows.Forms.Label();
			this.SuspendLayout();
			// 
			// button2
			// 
			this.button2.FlatAppearance.BorderSize = 0;
			this.button2.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
			this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.button2.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
			this.button2.Location = new System.Drawing.Point(196, 179);
			this.button2.Name = "button2";
			this.button2.Size = new System.Drawing.Size(115, 45);
			this.button2.TabIndex = 18;
			this.button2.Text = "&Cancelar";
			this.button2.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
			this.button2.UseVisualStyleBackColor = true;
			this.button2.Click += new System.EventHandler(this.Button2Click);
			// 
			// button1
			// 
			this.button1.FlatAppearance.BorderSize = 0;
			this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
			this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.button1.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
			this.button1.Location = new System.Drawing.Point(318, 179);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(115, 45);
			this.button1.TabIndex = 17;
			this.button1.Text = "&Aceptar";
			this.button1.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
			this.button1.UseVisualStyleBackColor = true;
			this.button1.Click += new System.EventHandler(this.Button1Click);
			// 
			// cmbCarrera
			// 
			this.cmbCarrera.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.cmbCarrera.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.cmbCarrera.FormattingEnabled = true;
			this.cmbCarrera.Location = new System.Drawing.Point(12, 62);
			this.cmbCarrera.Name = "cmbCarrera";
			this.cmbCarrera.Size = new System.Drawing.Size(420, 28);
			this.cmbCarrera.TabIndex = 16;
			// 
			// cmbFacultad
			// 
			this.cmbFacultad.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.cmbFacultad.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.cmbFacultad.FormattingEnabled = true;
			this.cmbFacultad.Location = new System.Drawing.Point(12, 28);
			this.cmbFacultad.Name = "cmbFacultad";
			this.cmbFacultad.Size = new System.Drawing.Size(420, 28);
			this.cmbFacultad.TabIndex = 19;
			this.cmbFacultad.SelectedIndexChanged += new System.EventHandler(this.CmbFacultadSelectedIndexChanged);
			// 
			// textBox1
			// 
			this.textBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.textBox1.Location = new System.Drawing.Point(12, 96);
			this.textBox1.Name = "textBox1";
			this.textBox1.ReadOnly = true;
			this.textBox1.Size = new System.Drawing.Size(330, 26);
			this.textBox1.TabIndex = 20;
			this.textBox1.Text = "Nombre y ruta del archivo a generar...";
			// 
			// button3
			// 
			this.button3.FlatAppearance.BorderSize = 0;
			this.button3.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
			this.button3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.button3.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
			this.button3.Location = new System.Drawing.Point(348, 96);
			this.button3.Name = "button3";
			this.button3.Size = new System.Drawing.Size(85, 26);
			this.button3.TabIndex = 18;
			this.button3.Text = "&Examinar";
			this.button3.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
			this.button3.UseVisualStyleBackColor = true;
			this.button3.Click += new System.EventHandler(this.Button3Click);
			// 
			// label1
			// 
			this.label1.AutoEllipsis = true;
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.label1.Location = new System.Drawing.Point(11, 135);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(421, 23);
			this.label1.TabIndex = 21;
			// 
			// frmReportGen
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(445, 236);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.textBox1);
			this.Controls.Add(this.cmbFacultad);
			this.Controls.Add(this.button3);
			this.Controls.Add(this.button2);
			this.Controls.Add(this.button1);
			this.Controls.Add(this.cmbCarrera);
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "frmReportGen";
			this.Text = "Generar Reportes";
			this.ResumeLayout(false);
			this.PerformLayout();
		}
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Button button3;
		private System.Windows.Forms.TextBox textBox1;
		private System.Windows.Forms.ComboBox cmbFacultad;
		private System.Windows.Forms.ComboBox cmbCarrera;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.Button button2;
	}
}
