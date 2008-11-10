/*
 * Created by SharpDevelop.
 * user: Robertux
 * Date: 19/10/2008
 * Time: 05:10 p.m.
 * 
 * 
 */
namespace WinApp
{
	partial class frmMain
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
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmMain));
			System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
			System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.btnDelAspir = new System.Windows.Forms.Button();
			this.btnEditAspir = new System.Windows.Forms.Button();
			this.btnAddAspir = new System.Windows.Forms.Button();
			this.groupBox3 = new System.Windows.Forms.GroupBox();
			this.lblResultadoCeps = new System.Windows.Forms.Label();
			this.btnEvaluarCeps = new System.Windows.Forms.Button();
			this.groupBox2 = new System.Windows.Forms.GroupBox();
			this.lblResultadoRaven = new System.Windows.Forms.Label();
			this.btnEvaluarRaven = new System.Windows.Forms.Button();
			this.comboBox1 = new System.Windows.Forms.ComboBox();
			this.gridAspir1 = new WinApp.GridAspir();
			this.label1 = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.groupBox1.SuspendLayout();
			this.groupBox3.SuspendLayout();
			this.groupBox2.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.gridAspir1)).BeginInit();
			this.SuspendLayout();
			// 
			// groupBox1
			// 
			this.groupBox1.BackColor = System.Drawing.SystemColors.Control;
			this.groupBox1.Controls.Add(this.label2);
			this.groupBox1.Controls.Add(this.btnDelAspir);
			this.groupBox1.Controls.Add(this.btnEditAspir);
			this.groupBox1.Controls.Add(this.btnAddAspir);
			this.groupBox1.Controls.Add(this.groupBox3);
			this.groupBox1.Controls.Add(this.groupBox2);
			this.groupBox1.Controls.Add(this.comboBox1);
			this.groupBox1.Controls.Add(this.gridAspir1);
			this.groupBox1.Controls.Add(this.label1);
			this.groupBox1.Location = new System.Drawing.Point(58, 46);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(904, 669);
			this.groupBox1.TabIndex = 0;
			this.groupBox1.TabStop = false;
			// 
			// btnDelAspir
			// 
			this.btnDelAspir.FlatAppearance.BorderSize = 0;
			this.btnDelAspir.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
			this.btnDelAspir.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.btnDelAspir.Image = ((System.Drawing.Image)(resources.GetObject("btnDelAspir.Image")));
			this.btnDelAspir.Location = new System.Drawing.Point(382, 7);
			this.btnDelAspir.Name = "btnDelAspir";
			this.btnDelAspir.Size = new System.Drawing.Size(55, 56);
			this.btnDelAspir.TabIndex = 6;
			this.btnDelAspir.UseVisualStyleBackColor = true;
			this.btnDelAspir.Click += new System.EventHandler(this.BtnDelAspirClick);
			// 
			// btnEditAspir
			// 
			this.btnEditAspir.FlatAppearance.BorderSize = 0;
			this.btnEditAspir.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
			this.btnEditAspir.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.btnEditAspir.Image = ((System.Drawing.Image)(resources.GetObject("btnEditAspir.Image")));
			this.btnEditAspir.Location = new System.Drawing.Point(325, 7);
			this.btnEditAspir.Name = "btnEditAspir";
			this.btnEditAspir.Size = new System.Drawing.Size(55, 56);
			this.btnEditAspir.TabIndex = 6;
			this.btnEditAspir.UseVisualStyleBackColor = true;
			this.btnEditAspir.Click += new System.EventHandler(this.BtnEditAspirClick);
			// 
			// btnAddAspir
			// 
			this.btnAddAspir.FlatAppearance.BorderSize = 0;
			this.btnAddAspir.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
			this.btnAddAspir.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.btnAddAspir.Image = ((System.Drawing.Image)(resources.GetObject("btnAddAspir.Image")));
			this.btnAddAspir.Location = new System.Drawing.Point(264, 7);
			this.btnAddAspir.Name = "btnAddAspir";
			this.btnAddAspir.Size = new System.Drawing.Size(55, 56);
			this.btnAddAspir.TabIndex = 6;
			this.btnAddAspir.UseVisualStyleBackColor = true;
			this.btnAddAspir.Click += new System.EventHandler(this.BtnAddAspirClick);
			// 
			// groupBox3
			// 
			this.groupBox3.Controls.Add(this.lblResultadoCeps);
			this.groupBox3.Controls.Add(this.btnEvaluarCeps);
			this.groupBox3.Location = new System.Drawing.Point(31, 546);
			this.groupBox3.Name = "groupBox3";
			this.groupBox3.Size = new System.Drawing.Size(845, 104);
			this.groupBox3.TabIndex = 5;
			this.groupBox3.TabStop = false;
			this.groupBox3.Text = "Resultado Prueba CEPS";
			// 
			// lblResultadoCeps
			// 
			this.lblResultadoCeps.Location = new System.Drawing.Point(15, 41);
			this.lblResultadoCeps.Name = "lblResultadoCeps";
			this.lblResultadoCeps.Size = new System.Drawing.Size(730, 51);
			this.lblResultadoCeps.TabIndex = 2;
			// 
			// btnEvaluarCeps
			// 
			this.btnEvaluarCeps.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
			this.btnEvaluarCeps.Image = ((System.Drawing.Image)(resources.GetObject("btnEvaluarCeps.Image")));
			this.btnEvaluarCeps.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
			this.btnEvaluarCeps.Location = new System.Drawing.Point(751, 10);
			this.btnEvaluarCeps.Name = "btnEvaluarCeps";
			this.btnEvaluarCeps.Size = new System.Drawing.Size(88, 44);
			this.btnEvaluarCeps.TabIndex = 1;
			this.btnEvaluarCeps.Text = "Evaluar";
			this.btnEvaluarCeps.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
			this.btnEvaluarCeps.UseVisualStyleBackColor = true;
			this.btnEvaluarCeps.Visible = false;
			this.btnEvaluarCeps.Click += new System.EventHandler(this.BtnEvaluarCepsClick);
			// 
			// groupBox2
			// 
			this.groupBox2.Controls.Add(this.lblResultadoRaven);
			this.groupBox2.Controls.Add(this.btnEvaluarRaven);
			this.groupBox2.Location = new System.Drawing.Point(31, 436);
			this.groupBox2.Name = "groupBox2";
			this.groupBox2.Size = new System.Drawing.Size(845, 104);
			this.groupBox2.TabIndex = 4;
			this.groupBox2.TabStop = false;
			this.groupBox2.Text = "Resultado Prueba RAVEN";
			// 
			// lblResultadoRaven
			// 
			this.lblResultadoRaven.Location = new System.Drawing.Point(15, 41);
			this.lblResultadoRaven.Name = "lblResultadoRaven";
			this.lblResultadoRaven.Size = new System.Drawing.Size(730, 50);
			this.lblResultadoRaven.TabIndex = 1;
			// 
			// btnEvaluarRaven
			// 
			this.btnEvaluarRaven.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
			this.btnEvaluarRaven.Image = ((System.Drawing.Image)(resources.GetObject("btnEvaluarRaven.Image")));
			this.btnEvaluarRaven.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
			this.btnEvaluarRaven.Location = new System.Drawing.Point(751, 10);
			this.btnEvaluarRaven.Name = "btnEvaluarRaven";
			this.btnEvaluarRaven.Size = new System.Drawing.Size(88, 44);
			this.btnEvaluarRaven.TabIndex = 0;
			this.btnEvaluarRaven.Text = "Evaluar";
			this.btnEvaluarRaven.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
			this.btnEvaluarRaven.UseVisualStyleBackColor = true;
			this.btnEvaluarRaven.Visible = false;
			this.btnEvaluarRaven.Click += new System.EventHandler(this.BtnEvaluarRavenClick);
			// 
			// comboBox1
			// 
			this.comboBox1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.comboBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.comboBox1.FormattingEnabled = true;
			this.comboBox1.Location = new System.Drawing.Point(638, 22);
			this.comboBox1.Name = "comboBox1";
			this.comboBox1.Size = new System.Drawing.Size(238, 28);
			this.comboBox1.TabIndex = 3;
			this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.ComboBox1SelectedIndexChanged);
			// 
			// gridAspir1
			// 
			this.gridAspir1.AllowUserToAddRows = false;
			this.gridAspir1.AllowUserToDeleteRows = false;
			this.gridAspir1.AllowUserToResizeColumns = false;
			this.gridAspir1.AllowUserToResizeRows = false;
			dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
			dataGridViewCellStyle1.BackColor = System.Drawing.Color.LightGray;
			dataGridViewCellStyle1.Font = new System.Drawing.Font("Arial", 18F);
			dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.ControlText;
			dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
			dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
			dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
			this.gridAspir1.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
			this.gridAspir1.Aspirs = null;
			this.gridAspir1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.DisplayedCells;
			this.gridAspir1.BackgroundColor = System.Drawing.SystemColors.Control;
			this.gridAspir1.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.RaisedVertical;
			this.gridAspir1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
			dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
			dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window;
			dataGridViewCellStyle2.Font = new System.Drawing.Font("Arial", 18F);
			dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText;
			dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
			dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
			dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
			this.gridAspir1.DefaultCellStyle = dataGridViewCellStyle2;
			this.gridAspir1.Location = new System.Drawing.Point(31, 77);
			this.gridAspir1.MultiSelect = false;
			this.gridAspir1.Name = "gridAspir1";
			this.gridAspir1.ReadOnly = true;
			this.gridAspir1.RowHeadersVisible = false;
			this.gridAspir1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
			this.gridAspir1.Size = new System.Drawing.Size(845, 353);
			this.gridAspir1.TabIndex = 2;
			this.gridAspir1.SelectionChanged += new System.EventHandler(this.GridAspir1SelectionChanged);
			// 
			// label1
			// 
			this.label1.AutoSize = true;
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.label1.Location = new System.Drawing.Point(31, 22);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(143, 37);
			this.label1.TabIndex = 1;
			this.label1.Text = "Alumnos";
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(31, 59);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(227, 15);
			this.label2.TabIndex = 7;
			this.label2.Text = "label2";
			// 
			// frmMain
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.BackColor = System.Drawing.SystemColors.AppWorkspace;
			this.ClientSize = new System.Drawing.Size(1028, 755);
			this.Controls.Add(this.groupBox1);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
			this.MaximizeBox = false;
			this.Name = "frmMain";
			this.Text = "frmMain";
			this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
			this.groupBox1.ResumeLayout(false);
			this.groupBox1.PerformLayout();
			this.groupBox3.ResumeLayout(false);
			this.groupBox2.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this.gridAspir1)).EndInit();
			this.ResumeLayout(false);
		}
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Button btnDelAspir;
		private System.Windows.Forms.Button btnEditAspir;
		private System.Windows.Forms.Button btnAddAspir;
		private System.Windows.Forms.Label lblResultadoRaven;
		private System.Windows.Forms.Label lblResultadoCeps;
		private System.Windows.Forms.Button btnEvaluarRaven;
		private System.Windows.Forms.Button btnEvaluarCeps;
		private System.Windows.Forms.GroupBox groupBox2;
		private System.Windows.Forms.GroupBox groupBox3;
		private System.Windows.Forms.ComboBox comboBox1;
		private WinApp.GridAspir gridAspir1;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.GroupBox groupBox1;
	}
}
