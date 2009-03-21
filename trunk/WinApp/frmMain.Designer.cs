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
			this.components = new System.ComponentModel.Container();
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmMain));
			System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
			System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.button4 = new System.Windows.Forms.Button();
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
			this.ctxAccionesAspir = new System.Windows.Forms.ContextMenuStrip(this.components);
			this.editarAspiranteToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.toolStripMenuItem2 = new System.Windows.Forms.ToolStripMenuItem();
			this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
			this.generarReporteIndividualToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.groupBox1.SuspendLayout();
			this.groupBox3.SuspendLayout();
			this.groupBox2.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.gridAspir1)).BeginInit();
			this.ctxAccionesAspir.SuspendLayout();
			this.SuspendLayout();
			// 
			// groupBox1
			// 
			this.groupBox1.AutoSize = true;
			this.groupBox1.BackColor = System.Drawing.SystemColors.Control;
			this.groupBox1.Controls.Add(this.button4);
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
			this.groupBox1.Dock = System.Windows.Forms.DockStyle.Fill;
			this.groupBox1.Location = new System.Drawing.Point(0, 0);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(804, 585);
			this.groupBox1.TabIndex = 0;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "Psycho Evaluador";
			// 
			// button4
			// 
			this.button4.FlatAppearance.BorderSize = 0;
			this.button4.Image = ((System.Drawing.Image)(resources.GetObject("button4.Image")));
			this.button4.ImageAlign = System.Drawing.ContentAlignment.TopCenter;
			this.button4.Location = new System.Drawing.Point(792, 19);
			this.button4.Name = "button4";
			this.button4.Size = new System.Drawing.Size(84, 74);
			this.button4.TabIndex = 12;
			this.button4.Text = "Ayuda";
			this.button4.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
			this.button4.UseVisualStyleBackColor = true;
			// 
			// button3
			// 
			this.button3.FlatAppearance.BorderSize = 0;
			this.button3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.button3.Image = ((System.Drawing.Image)(resources.GetObject("button3.Image")));
			this.button3.Location = new System.Drawing.Point(835, 110);
			this.button3.Name = "button3";
			this.button3.Size = new System.Drawing.Size(41, 40);
			this.button3.TabIndex = 11;
			this.button3.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
			this.button3.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
			this.button3.UseVisualStyleBackColor = true;
			this.button3.Click += new System.EventHandler(this.Button3Click);
			// 
			// button2
			// 
			this.button2.FlatAppearance.BorderSize = 0;
			this.button2.Image = ((System.Drawing.Image)(resources.GetObject("button2.Image")));
			this.button2.ImageAlign = System.Drawing.ContentAlignment.TopCenter;
			this.button2.Location = new System.Drawing.Point(702, 19);
			this.button2.Name = "button2";
			this.button2.Size = new System.Drawing.Size(84, 73);
			this.button2.TabIndex = 10;
			this.button2.Text = "Reportes";
			this.button2.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
			this.button2.UseVisualStyleBackColor = true;
			this.button2.Click += new System.EventHandler(this.Button2Click);
			// 
			// button1
			// 
			this.button1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
			this.button1.Image = ((System.Drawing.Image)(resources.GetObject("button1.Image")));
			this.button1.Location = new System.Drawing.Point(650, 110);
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
			this.gridManager1.Size = new System.Drawing.Size(599, 42);
			this.gridManager1.TabIndex = 8;
			this.gridManager1.TabStop = false;
			this.gridManager1.Text = "Ingrese un criterio de busqueda:";
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(31, 74);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(227, 15);
			this.label2.TabIndex = 7;
			this.label2.Text = "label2";
			// 
			// btnDelAspir
			// 
			this.btnDelAspir.FlatAppearance.BorderSize = 0;
			this.btnDelAspir.Image = ((System.Drawing.Image)(resources.GetObject("btnDelAspir.Image")));
			this.btnDelAspir.ImageAlign = System.Drawing.ContentAlignment.TopCenter;
			this.btnDelAspir.Location = new System.Drawing.Point(612, 18);
			this.btnDelAspir.Name = "btnDelAspir";
			this.btnDelAspir.Size = new System.Drawing.Size(84, 74);
			this.btnDelAspir.TabIndex = 6;
			this.btnDelAspir.Text = "Eliminar";
			this.btnDelAspir.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
			this.btnDelAspir.UseVisualStyleBackColor = true;
			this.btnDelAspir.Click += new System.EventHandler(this.BtnDelAspirClick);
			// 
			// btnEditAspir
			// 
			this.btnEditAspir.FlatAppearance.BorderSize = 0;
			this.btnEditAspir.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F);
			this.btnEditAspir.Image = ((System.Drawing.Image)(resources.GetObject("btnEditAspir.Image")));
			this.btnEditAspir.ImageAlign = System.Drawing.ContentAlignment.TopCenter;
			this.btnEditAspir.Location = new System.Drawing.Point(522, 18);
			this.btnEditAspir.Name = "btnEditAspir";
			this.btnEditAspir.Size = new System.Drawing.Size(84, 74);
			this.btnEditAspir.TabIndex = 6;
			this.btnEditAspir.Text = "Editar";
			this.btnEditAspir.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
			this.btnEditAspir.UseVisualStyleBackColor = true;
			this.btnEditAspir.Click += new System.EventHandler(this.BtnEditAspirClick);
			// 
			// btnAddAspir
			// 
			this.btnAddAspir.FlatAppearance.BorderSize = 0;
			this.btnAddAspir.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.btnAddAspir.Image = ((System.Drawing.Image)(resources.GetObject("btnAddAspir.Image")));
			this.btnAddAspir.ImageAlign = System.Drawing.ContentAlignment.TopCenter;
			this.btnAddAspir.Location = new System.Drawing.Point(432, 18);
			this.btnAddAspir.Name = "btnAddAspir";
			this.btnAddAspir.Size = new System.Drawing.Size(84, 74);
			this.btnAddAspir.TabIndex = 6;
			this.btnAddAspir.Text = "Agregar";
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
			this.comboBox1.Location = new System.Drawing.Point(724, 116);
			this.comboBox1.Name = "comboBox1";
			this.comboBox1.Size = new System.Drawing.Size(101, 28);
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
			this.gridAspir1.MouseDown += new System.Windows.Forms.MouseEventHandler(this.GridAspir1MouseDown);
			this.gridAspir1.SelectionChanged += new System.EventHandler(this.GridAspir1SelectionChanged);
			// 
			// label1
			// 
			this.label1.AutoSize = true;
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.label1.Location = new System.Drawing.Point(31, 19);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(143, 37);
			this.label1.TabIndex = 1;
			this.label1.Text = "Alumnos";
			// 
			// ctxAccionesAspir
			// 
			this.ctxAccionesAspir.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
									this.editarAspiranteToolStripMenuItem,
									this.toolStripMenuItem2,
									this.toolStripSeparator1,
									this.generarReporteIndividualToolStripMenuItem});
			this.ctxAccionesAspir.Name = "ctxAccionesAspir";
			this.ctxAccionesAspir.Size = new System.Drawing.Size(223, 76);
			// 
			// editarAspiranteToolStripMenuItem
			// 
			this.editarAspiranteToolStripMenuItem.Name = "editarAspiranteToolStripMenuItem";
			this.editarAspiranteToolStripMenuItem.Size = new System.Drawing.Size(222, 22);
			this.editarAspiranteToolStripMenuItem.Text = "Editar aspirante...";
			this.editarAspiranteToolStripMenuItem.Click += new System.EventHandler(this.EditarAspiranteToolStripMenuItemClick);
			// 
			// toolStripMenuItem2
			// 
			this.toolStripMenuItem2.Name = "toolStripMenuItem2";
			this.toolStripMenuItem2.Size = new System.Drawing.Size(222, 22);
			this.toolStripMenuItem2.Text = "Eliminar aspirante...";
			this.toolStripMenuItem2.Click += new System.EventHandler(this.ToolStripMenuItem2Click);
			// 
			// toolStripSeparator1
			// 
			this.toolStripSeparator1.Name = "toolStripSeparator1";
			this.toolStripSeparator1.Size = new System.Drawing.Size(219, 6);
			// 
			// generarReporteIndividualToolStripMenuItem
			// 
			this.generarReporteIndividualToolStripMenuItem.Name = "generarReporteIndividualToolStripMenuItem";
			this.generarReporteIndividualToolStripMenuItem.Size = new System.Drawing.Size(222, 22);
			this.generarReporteIndividualToolStripMenuItem.Text = "Generar reporte individual...";
			this.generarReporteIndividualToolStripMenuItem.Click += new System.EventHandler(this.GenerarReporteIndividualToolStripMenuItemClick);
			// 
			// frmMain
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.BackColor = System.Drawing.SystemColors.AppWorkspace;
			this.ClientSize = new System.Drawing.Size(804, 585);
			this.Controls.Add(this.groupBox1);
			this.DoubleBuffered = true;
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MaximizeBox = false;
			this.Name = "frmMain";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "Psycho Evaluador";
			this.groupBox1.ResumeLayout(false);
			this.groupBox1.PerformLayout();
			this.groupBox3.ResumeLayout(false);
			this.groupBox2.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this.gridAspir1)).EndInit();
			this.ctxAccionesAspir.ResumeLayout(false);
			this.ResumeLayout(false);
			this.PerformLayout();
		}
		private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem2;
		private System.Windows.Forms.ToolStripMenuItem generarReporteIndividualToolStripMenuItem;
		private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;		
		private System.Windows.Forms.ToolStripMenuItem editarAspiranteToolStripMenuItem;
		private System.Windows.Forms.ContextMenuStrip ctxAccionesAspir;
		private System.Windows.Forms.Button button4;
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
