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
			this.SuspendLayout();
			// 
			// button2
			// 
			this.button2.FlatAppearance.BorderSize = 0;
			this.button2.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
			this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.button2.Image = ((System.Drawing.Image)(resources.GetObject("button2.Image")));
			this.button2.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
			this.button2.Location = new System.Drawing.Point(196, 136);
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
			this.button1.Image = ((System.Drawing.Image)(resources.GetObject("button1.Image")));
			this.button1.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
			this.button1.Location = new System.Drawing.Point(318, 136);
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
			// frmReportGen
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(445, 196);
			this.Controls.Add(this.cmbFacultad);
			this.Controls.Add(this.button2);
			this.Controls.Add(this.button1);
			this.Controls.Add(this.cmbCarrera);
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "frmReportGen";
			this.Text = "Generar Reportes";
			this.Load += new System.EventHandler(this.FrmReportGenLoad);
			this.ResumeLayout(false);
		}
		private System.Windows.Forms.ComboBox cmbFacultad;
		private System.Windows.Forms.ComboBox cmbCarrera;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.Button button2;
	}
}
