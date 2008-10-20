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
			System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
			System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.groupBox3 = new System.Windows.Forms.GroupBox();
			this.btnEvaluarCeps = new System.Windows.Forms.Button();
			this.groupBox2 = new System.Windows.Forms.GroupBox();
			this.btnEvaluarRaven = new System.Windows.Forms.Button();
			this.comboBox1 = new System.Windows.Forms.ComboBox();
			this.gridAspir1 = new WinApp.GridAspir();
			this.label1 = new System.Windows.Forms.Label();
			this.lblResultadoRaven = new System.Windows.Forms.Label();
			this.lblResultadoCeps = new System.Windows.Forms.Label();
			this.groupBox1.SuspendLayout();
			this.groupBox3.SuspendLayout();
			this.groupBox2.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.gridAspir1)).BeginInit();
			this.SuspendLayout();
			// 
			// groupBox1
			// 
			this.groupBox1.BackColor = System.Drawing.SystemColors.Control;
			this.groupBox1.Controls.Add(this.groupBox3);
			this.groupBox1.Controls.Add(this.groupBox2);
			this.groupBox1.Controls.Add(this.comboBox1);
			this.groupBox1.Controls.Add(this.gridAspir1);
			this.groupBox1.Controls.Add(this.label1);
			this.groupBox1.Location = new System.Drawing.Point(58, 46);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(904, 598);
			this.groupBox1.TabIndex = 0;
			this.groupBox1.TabStop = false;
			// 
			// groupBox3
			// 
			this.groupBox3.Controls.Add(this.lblResultadoCeps);
			this.groupBox3.Controls.Add(this.btnEvaluarCeps);
			this.groupBox3.Location = new System.Drawing.Point(31, 467);
			this.groupBox3.Name = "groupBox3";
			this.groupBox3.Size = new System.Drawing.Size(845, 104);
			this.groupBox3.TabIndex = 5;
			this.groupBox3.TabStop = false;
			this.groupBox3.Text = "Resultado Prueba CEPS";
			// 
			// btnEvaluarCeps
			// 
			this.btnEvaluarCeps.Location = new System.Drawing.Point(711, 10);
			this.btnEvaluarCeps.Name = "btnEvaluarCeps";
			this.btnEvaluarCeps.Size = new System.Drawing.Size(128, 28);
			this.btnEvaluarCeps.TabIndex = 1;
			this.btnEvaluarCeps.Text = "Evaluar";
			this.btnEvaluarCeps.UseVisualStyleBackColor = true;
			this.btnEvaluarCeps.Visible = false;
			// 
			// groupBox2
			// 
			this.groupBox2.Controls.Add(this.lblResultadoRaven);
			this.groupBox2.Controls.Add(this.btnEvaluarRaven);
			this.groupBox2.Location = new System.Drawing.Point(31, 357);
			this.groupBox2.Name = "groupBox2";
			this.groupBox2.Size = new System.Drawing.Size(845, 104);
			this.groupBox2.TabIndex = 4;
			this.groupBox2.TabStop = false;
			this.groupBox2.Text = "Resultado Prueba RAVEN";
			// 
			// btnEvaluarRaven
			// 
			this.btnEvaluarRaven.Location = new System.Drawing.Point(711, 10);
			this.btnEvaluarRaven.Name = "btnEvaluarRaven";
			this.btnEvaluarRaven.Size = new System.Drawing.Size(128, 28);
			this.btnEvaluarRaven.TabIndex = 0;
			this.btnEvaluarRaven.Text = "Evaluar";
			this.btnEvaluarRaven.UseVisualStyleBackColor = true;
			this.btnEvaluarRaven.Visible = false;
			// 
			// comboBox1
			// 
			this.comboBox1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.comboBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.comboBox1.FormattingEnabled = true;
			this.comboBox1.Location = new System.Drawing.Point(638, 22);
			this.comboBox1.Name = "comboBox1";
			this.comboBox1.Size = new System.Drawing.Size(248, 28);
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
			this.gridAspir1.Location = new System.Drawing.Point(31, 69);
			this.gridAspir1.MultiSelect = false;
			this.gridAspir1.Name = "gridAspir1";
			this.gridAspir1.ReadOnly = true;
			this.gridAspir1.RowHeadersVisible = false;
			this.gridAspir1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
			this.gridAspir1.Size = new System.Drawing.Size(845, 272);
			this.gridAspir1.TabIndex = 2;
			this.gridAspir1.SelectionChanged += new System.EventHandler(this.GridAspir1SelectionChanged);
			// 
			// label1
			// 
			this.label1.AutoSize = true;
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.label1.Location = new System.Drawing.Point(19, 16);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(143, 37);
			this.label1.TabIndex = 1;
			this.label1.Text = "Alumnos";
			// 
			// lblResultadoRaven
			// 
			this.lblResultadoRaven.Location = new System.Drawing.Point(15, 41);
			this.lblResultadoRaven.Name = "lblResultadoRaven";
			this.lblResultadoRaven.Size = new System.Drawing.Size(812, 50);
			this.lblResultadoRaven.TabIndex = 1;
			// 
			// lblResultadoCeps
			// 
			this.lblResultadoCeps.Location = new System.Drawing.Point(15, 41);
			this.lblResultadoCeps.Name = "lblResultadoCeps";
			this.lblResultadoCeps.Size = new System.Drawing.Size(812, 51);
			this.lblResultadoCeps.TabIndex = 2;
			// 
			// frmMain
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.BackColor = System.Drawing.SystemColors.AppWorkspace;
			this.ClientSize = new System.Drawing.Size(1028, 676);
			this.Controls.Add(this.groupBox1);
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
