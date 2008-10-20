/*
 * Created by SharpDevelop.
 * user: Robertux
 * Date: 13/10/2008
 * Time: 04:28 p.m.
 * 
 * 
 */
namespace WinApp
{
	partial class frmRaven
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
			System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
			System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
			this.gridRaven1 = new WinApp.GridRaven();
			this.pbxRaven = new System.Windows.Forms.PictureBox();
			this.button1 = new System.Windows.Forms.Button();
			((System.ComponentModel.ISupportInitialize)(this.gridRaven1)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.pbxRaven)).BeginInit();
			this.SuspendLayout();
			// 
			// gridRaven1
			// 
			this.gridRaven1.AllowUserToAddRows = false;
			this.gridRaven1.AllowUserToDeleteRows = false;
			this.gridRaven1.AllowUserToResizeColumns = false;
			this.gridRaven1.AllowUserToResizeRows = false;
			dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
			dataGridViewCellStyle3.BackColor = System.Drawing.Color.LightGray;
			dataGridViewCellStyle3.Font = new System.Drawing.Font("Arial", 18F);
			dataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.ControlText;
			dataGridViewCellStyle3.SelectionBackColor = System.Drawing.SystemColors.Highlight;
			dataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
			dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
			this.gridRaven1.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle3;
			this.gridRaven1.BackgroundColor = System.Drawing.SystemColors.Control;
			this.gridRaven1.BorderStyle = System.Windows.Forms.BorderStyle.None;
			this.gridRaven1.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.RaisedVertical;
			this.gridRaven1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
			dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
			dataGridViewCellStyle4.BackColor = System.Drawing.SystemColors.Window;
			dataGridViewCellStyle4.Font = new System.Drawing.Font("Arial", 18F);
			dataGridViewCellStyle4.ForeColor = System.Drawing.SystemColors.ControlText;
			dataGridViewCellStyle4.SelectionBackColor = System.Drawing.SystemColors.Highlight;
			dataGridViewCellStyle4.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
			dataGridViewCellStyle4.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
			this.gridRaven1.DefaultCellStyle = dataGridViewCellStyle4;
			this.gridRaven1.Location = new System.Drawing.Point(16, 20);
			this.gridRaven1.MultiSelect = false;
			this.gridRaven1.Name = "gridRaven1";
			this.gridRaven1.ReadOnly = true;
			this.gridRaven1.RowHeadersVisible = false;
			this.gridRaven1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
			this.gridRaven1.Size = new System.Drawing.Size(240, 367);
			this.gridRaven1.TabIndex = 0;
			this.gridRaven1.KeyDown += new System.Windows.Forms.KeyEventHandler(this.GridRaven1KeyDown);
			this.gridRaven1.SelectionChanged += new System.EventHandler(this.GridRaven1SelectionChanged);
			// 
			// pbxRaven
			// 
			this.pbxRaven.Location = new System.Drawing.Point(281, 20);
			this.pbxRaven.Name = "pbxRaven";
			this.pbxRaven.Size = new System.Drawing.Size(339, 367);
			this.pbxRaven.TabIndex = 1;
			this.pbxRaven.TabStop = false;
			// 
			// button1
			// 
			this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.button1.Location = new System.Drawing.Point(440, 413);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(180, 34);
			this.button1.TabIndex = 2;
			this.button1.Text = "&Calificar";
			this.button1.UseVisualStyleBackColor = true;
			// 
			// MainForm
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(632, 459);
			this.Controls.Add(this.button1);
			this.Controls.Add(this.pbxRaven);
			this.Controls.Add(this.gridRaven1);
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "MainForm";
			this.Text = "Evaluador de la Prueba RAVEN";
			this.Load += new System.EventHandler(this.MainFormLoad);
			((System.ComponentModel.ISupportInitialize)(this.gridRaven1)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.pbxRaven)).EndInit();
			this.ResumeLayout(false);
		}
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.PictureBox pbxRaven;
		private WinApp.GridRaven gridRaven1;
	}
}
