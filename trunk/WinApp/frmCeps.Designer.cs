/*
 * Created by SharpDevelop.
 * user: Robertux
 * Date: 21/10/2008
 * Time: 02:32 a.m.
 * 
 * 
 */
namespace WinApp
{
	partial class frmCeps
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
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmCeps));
			this.gridCeps1 = new WinApp.GridCeps();
			this.button2 = new System.Windows.Forms.Button();
			this.button1 = new System.Windows.Forms.Button();
			((System.ComponentModel.ISupportInitialize)(this.gridCeps1)).BeginInit();
			this.SuspendLayout();
			// 
			// gridCeps1
			// 
			this.gridCeps1.AllowUserToAddRows = false;
			this.gridCeps1.AllowUserToDeleteRows = false;
			this.gridCeps1.AllowUserToResizeColumns = false;
			this.gridCeps1.AllowUserToResizeRows = false;
			dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
			dataGridViewCellStyle1.BackColor = System.Drawing.Color.LightGray;
			dataGridViewCellStyle1.Font = new System.Drawing.Font("Arial", 18F);
			dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.ControlText;
			dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
			dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
			dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
			this.gridCeps1.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
			this.gridCeps1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.DisplayedCells;
			this.gridCeps1.BackgroundColor = System.Drawing.SystemColors.Control;
			this.gridCeps1.BorderStyle = System.Windows.Forms.BorderStyle.None;
			this.gridCeps1.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.RaisedVertical;
			this.gridCeps1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
			dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
			dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window;
			dataGridViewCellStyle2.Font = new System.Drawing.Font("Arial", 18F);
			dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText;
			dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
			dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
			dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
			this.gridCeps1.DefaultCellStyle = dataGridViewCellStyle2;
			this.gridCeps1.Location = new System.Drawing.Point(12, 50);
			this.gridCeps1.MultiSelect = false;
			this.gridCeps1.Name = "gridCeps1";
			this.gridCeps1.Pregs = ((FuncionalidadClassLib.PreguntasCeps)(resources.GetObject("gridCeps1.Pregs")));
			this.gridCeps1.Prueba = ((FuncionalidadClassLib.PruebaCeps)(resources.GetObject("gridCeps1.Prueba")));
			this.gridCeps1.ReadOnly = true;
			this.gridCeps1.RowHeadersVisible = false;
			this.gridCeps1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
			this.gridCeps1.Size = new System.Drawing.Size(808, 388);
			this.gridCeps1.TabIndex = 0;
			this.gridCeps1.KeyDown += new System.Windows.Forms.KeyEventHandler(this.GridCeps1KeyDown);
			// 
			// button2
			// 
			this.button2.FlatAppearance.BorderSize = 0;
			this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.button2.Image = ((System.Drawing.Image)(resources.GetObject("button2.Image")));
			this.button2.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
			this.button2.Location = new System.Drawing.Point(584, 451);
			this.button2.Name = "button2";
			this.button2.Size = new System.Drawing.Size(115, 45);
			this.button2.TabIndex = 4;
			this.button2.Text = "C&ancelar";
			this.button2.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
			this.button2.UseVisualStyleBackColor = true;
			this.button2.Click += new System.EventHandler(this.Button2Click);
			// 
			// button1
			// 
			this.button1.FlatAppearance.BorderSize = 0;
			this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.button1.Image = ((System.Drawing.Image)(resources.GetObject("button1.Image")));
			this.button1.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
			this.button1.Location = new System.Drawing.Point(705, 451);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(115, 45);
			this.button1.TabIndex = 3;
			this.button1.Text = "&Calificar";
			this.button1.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
			this.button1.UseVisualStyleBackColor = true;
			this.button1.Click += new System.EventHandler(this.Button1Click);
			// 
			// frmCeps
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(832, 508);
			this.Controls.Add(this.button2);
			this.Controls.Add(this.button1);
			this.Controls.Add(this.gridCeps1);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "frmCeps";
			this.Text = "Evaluador de la Prueba CEPS";
			this.Load += new System.EventHandler(this.FrmCepsLoad);
			((System.ComponentModel.ISupportInitialize)(this.gridCeps1)).EndInit();
			this.ResumeLayout(false);
		}
		private System.Windows.Forms.Button button2;
		private System.Windows.Forms.Button button1;
		private WinApp.GridCeps gridCeps1;
	}
}
