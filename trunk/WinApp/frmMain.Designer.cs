﻿/*
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
			this.label6 = new System.Windows.Forms.Label();
			this.label5 = new System.Windows.Forms.Label();
			this.label4 = new System.Windows.Forms.Label();
			this.label7 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.button3 = new System.Windows.Forms.Button();
			this.button2 = new System.Windows.Forms.Button();
			this.button1 = new System.Windows.Forms.Button();
			this.gridManager1 = new GridAddIns.GridManager();
			this.label2 = new System.Windows.Forms.Label();
			this.btnDelAspir = new System.Windows.Forms.Button();
			this.btnEditAspir = new System.Windows.Forms.Button();
			this.btnAddAspir = new System.Windows.Forms.Button();
			this.groupBox3 = new System.Windows.Forms.GroupBox();
			this.lblDetallesResultadoCeps = new System.Windows.Forms.Label();
			this.lblResultadoCeps = new System.Windows.Forms.Label();
			this.btnEvaluarCeps = new System.Windows.Forms.Button();
			this.groupBox2 = new System.Windows.Forms.GroupBox();
			this.lblDetallesResultadoRaven = new System.Windows.Forms.Label();
			this.lblResultadoRaven = new System.Windows.Forms.Label();
			this.btnEvaluarRaven = new System.Windows.Forms.Button();
			this.comboBox1 = new System.Windows.Forms.ComboBox();
			this.gridAspir1 = new WinApp.GridAspir();
			this.label1 = new System.Windows.Forms.Label();
			this.label8 = new System.Windows.Forms.Label();
			this.groupBox1.SuspendLayout();
			this.groupBox3.SuspendLayout();
			this.groupBox2.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.gridAspir1)).BeginInit();
			this.SuspendLayout();
			// 
			// groupBox1
			// 
			this.groupBox1.BackColor = System.Drawing.SystemColors.Control;
			this.groupBox1.Controls.Add(this.label6);
			this.groupBox1.Controls.Add(this.label8);
			this.groupBox1.Controls.Add(this.label5);
			this.groupBox1.Controls.Add(this.label4);
			this.groupBox1.Controls.Add(this.label7);
			this.groupBox1.Controls.Add(this.label3);
			this.groupBox1.Controls.Add(this.button3);
			this.groupBox1.Controls.Add(this.button2);
			this.groupBox1.Controls.Add(this.button1);
			this.groupBox1.Controls.Add(this.gridManager1);
			this.groupBox1.Controls.Add(this.label2);
			this.groupBox1.Controls.Add(this.btnDelAspir);
			this.groupBox1.Controls.Add(this.btnEditAspir);
			this.groupBox1.Controls.Add(this.btnAddAspir);
			this.groupBox1.Controls.Add(this.groupBox3);
			this.groupBox1.Controls.Add(this.groupBox2);
			this.groupBox1.Controls.Add(this.comboBox1);
			this.groupBox1.Controls.Add(this.gridAspir1);
			this.groupBox1.Controls.Add(this.label1);
			this.groupBox1.Location = new System.Drawing.Point(58, 23);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(904, 681);
			this.groupBox1.TabIndex = 0;
			this.groupBox1.TabStop = false;
			// 
			// label6
			// 
			this.label6.Location = new System.Drawing.Point(442, 64);
			this.label6.Name = "label6";
			this.label6.Size = new System.Drawing.Size(59, 26);
			this.label6.TabIndex = 12;
			this.label6.Text = "Generar Reportes";
			this.label6.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
			// 
			// label5
			// 
			this.label5.AutoSize = true;
			this.label5.Location = new System.Drawing.Point(388, 68);
			this.label5.Name = "label5";
			this.label5.Size = new System.Drawing.Size(43, 13);
			this.label5.TabIndex = 12;
			this.label5.Text = "Eliminar";
			// 
			// label4
			// 
			this.label4.AutoSize = true;
			this.label4.Location = new System.Drawing.Point(332, 68);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(34, 13);
			this.label4.TabIndex = 12;
			this.label4.Text = "Editar";
			// 
			// label7
			// 
			this.label7.AutoSize = true;
			this.label7.Location = new System.Drawing.Point(824, 90);
			this.label7.Name = "label7";
			this.label7.Size = new System.Drawing.Size(53, 13);
			this.label7.TabIndex = 12;
			this.label7.Text = "Refrescar";
			// 
			// label3
			// 
			this.label3.AutoSize = true;
			this.label3.Location = new System.Drawing.Point(270, 68);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(44, 13);
			this.label3.TabIndex = 12;
			this.label3.Text = "Agregar";
			// 
			// button3
			// 
			this.button3.FlatAppearance.BorderSize = 0;
			this.button3.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
			this.button3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.button3.Image = ((System.Drawing.Image)(resources.GetObject("button3.Image")));
			this.button3.Location = new System.Drawing.Point(835, 53);
			this.button3.Name = "button3";
			this.button3.Size = new System.Drawing.Size(34, 35);
			this.button3.TabIndex = 11;
			this.button3.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
			this.button3.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
			this.button3.UseVisualStyleBackColor = true;
			this.button3.Click += new System.EventHandler(this.Button3Click);
			// 
			// button2
			// 
			this.button2.FlatAppearance.BorderSize = 0;
			this.button2.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
			this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.button2.Image = ((System.Drawing.Image)(resources.GetObject("button2.Image")));
			this.button2.Location = new System.Drawing.Point(443, 7);
			this.button2.Name = "button2";
			this.button2.Size = new System.Drawing.Size(55, 56);
			this.button2.TabIndex = 10;
			this.button2.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
			this.button2.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
			this.button2.UseVisualStyleBackColor = true;
			this.button2.Click += new System.EventHandler(this.Button2Click);
			// 
			// button1
			// 
			this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
			this.button1.Image = ((System.Drawing.Image)(resources.GetObject("button1.Image")));
			this.button1.Location = new System.Drawing.Point(820, 110);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(56, 37);
			this.button1.TabIndex = 9;
			this.button1.UseVisualStyleBackColor = true;
			this.button1.Click += new System.EventHandler(this.Button1Click);
			// 
			// gridManager1
			// 
			this.gridManager1.CasoSensitivo = false;
			this.gridManager1.Columnas = ((System.Collections.ObjectModel.Collection<string>)(resources.GetObject("gridManager1.Columnas")));
			this.gridManager1.EstiloResaltadoBgColor = System.Drawing.Color.LightBlue;
			this.gridManager1.EstiloResaltadoFgColor = System.Drawing.Color.DarkBlue;
			this.gridManager1.EstiloResaltadoFuente = System.Drawing.FontStyle.Regular;
			this.gridManager1.Location = new System.Drawing.Point(31, 105);
			this.gridManager1.MostrarCombo = false;
			this.gridManager1.Name = "gridManager1";
			this.gridManager1.NombreDataGridView = "gridAspir1";
			this.gridManager1.Operacion = GridAddIns.GridManagerOperaciones.Filtrado;
			this.gridManager1.Size = new System.Drawing.Size(783, 42);
			this.gridManager1.TabIndex = 8;
			this.gridManager1.TabStop = false;
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(31, 59);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(227, 15);
			this.label2.TabIndex = 7;
			this.label2.Text = "label2";
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
			this.btnAddAspir.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.btnAddAspir.Image = ((System.Drawing.Image)(resources.GetObject("btnAddAspir.Image")));
			this.btnAddAspir.Location = new System.Drawing.Point(264, 7);
			this.btnAddAspir.Name = "btnAddAspir";
			this.btnAddAspir.Size = new System.Drawing.Size(55, 56);
			this.btnAddAspir.TabIndex = 6;
			this.btnAddAspir.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
			this.btnAddAspir.UseVisualStyleBackColor = true;
			this.btnAddAspir.Click += new System.EventHandler(this.BtnAddAspirClick);
			// 
			// groupBox3
			// 
			this.groupBox3.Controls.Add(this.lblDetallesResultadoCeps);
			this.groupBox3.Controls.Add(this.lblResultadoCeps);
			this.groupBox3.Controls.Add(this.btnEvaluarCeps);
			this.groupBox3.Location = new System.Drawing.Point(31, 556);
			this.groupBox3.Name = "groupBox3";
			this.groupBox3.Size = new System.Drawing.Size(845, 104);
			this.groupBox3.TabIndex = 5;
			this.groupBox3.TabStop = false;
			this.groupBox3.Text = "Resultado Prueba CEPS";
			// 
			// lblDetallesResultadoCeps
			// 
			this.lblDetallesResultadoCeps.BackColor = System.Drawing.SystemColors.Control;
			this.lblDetallesResultadoCeps.Location = new System.Drawing.Point(8, 26);
			this.lblDetallesResultadoCeps.Name = "lblDetallesResultadoCeps";
			this.lblDetallesResultadoCeps.Size = new System.Drawing.Size(282, 74);
			this.lblDetallesResultadoCeps.TabIndex = 2;
			// 
			// lblResultadoCeps
			// 
			this.lblResultadoCeps.BackColor = System.Drawing.SystemColors.Control;
			this.lblResultadoCeps.Location = new System.Drawing.Point(296, 24);
			this.lblResultadoCeps.Name = "lblResultadoCeps";
			this.lblResultadoCeps.Size = new System.Drawing.Size(449, 76);
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
			this.groupBox2.Controls.Add(this.lblDetallesResultadoRaven);
			this.groupBox2.Controls.Add(this.lblResultadoRaven);
			this.groupBox2.Controls.Add(this.btnEvaluarRaven);
			this.groupBox2.Location = new System.Drawing.Point(31, 446);
			this.groupBox2.Name = "groupBox2";
			this.groupBox2.Size = new System.Drawing.Size(845, 104);
			this.groupBox2.TabIndex = 4;
			this.groupBox2.TabStop = false;
			this.groupBox2.Text = "Resultado Prueba RAVEN";
			// 
			// lblDetallesResultadoRaven
			// 
			this.lblDetallesResultadoRaven.BackColor = System.Drawing.SystemColors.Control;
			this.lblDetallesResultadoRaven.Location = new System.Drawing.Point(6, 26);
			this.lblDetallesResultadoRaven.Name = "lblDetallesResultadoRaven";
			this.lblDetallesResultadoRaven.Size = new System.Drawing.Size(282, 74);
			this.lblDetallesResultadoRaven.TabIndex = 2;
			// 
			// lblResultadoRaven
			// 
			this.lblResultadoRaven.BackColor = System.Drawing.SystemColors.Control;
			this.lblResultadoRaven.Location = new System.Drawing.Point(294, 25);
			this.lblResultadoRaven.Name = "lblResultadoRaven";
			this.lblResultadoRaven.Size = new System.Drawing.Size(451, 75);
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
			this.gridAspir1.Location = new System.Drawing.Point(31, 164);
			this.gridAspir1.MultiSelect = false;
			this.gridAspir1.Name = "gridAspir1";
			this.gridAspir1.ReadOnly = true;
			this.gridAspir1.RowHeadersVisible = false;
			this.gridAspir1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
			this.gridAspir1.Size = new System.Drawing.Size(845, 274);
			this.gridAspir1.TabIndex = 2;
			this.gridAspir1.TotalEvaluados = 0;
			this.gridAspir1.TotalPendientes = 0;
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
			// label8
			// 
			this.label8.AutoSize = true;
			this.label8.Location = new System.Drawing.Point(827, 147);
			this.label8.Name = "label8";
			this.label8.Size = new System.Drawing.Size(40, 13);
			this.label8.TabIndex = 12;
			this.label8.Text = "Buscar";
			// 
			// frmMain
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.BackColor = System.Drawing.SystemColors.AppWorkspace;
			this.ClientSize = new System.Drawing.Size(1018, 753);
			this.Controls.Add(this.groupBox1);
			this.Name = "frmMain";
			this.Text = "Psycho Evaluador";
			this.groupBox1.ResumeLayout(false);
			this.groupBox1.PerformLayout();
			this.groupBox3.ResumeLayout(false);
			this.groupBox2.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this.gridAspir1)).EndInit();
			this.ResumeLayout(false);
		}
		private System.Windows.Forms.Label label8;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Label label7;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.Button button3;
		private System.Windows.Forms.Button button2;
		private System.Windows.Forms.Button button1;
		private GridAddIns.GridManager gridManager1;
		private System.Windows.Forms.Label lblDetallesResultadoRaven;
		private System.Windows.Forms.Label lblDetallesResultadoCeps;
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