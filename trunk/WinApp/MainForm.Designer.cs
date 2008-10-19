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
	partial class MainForm
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
			this.gridRaven1 = new WinApp.GridRaven();
			((System.ComponentModel.ISupportInitialize)(this.gridRaven1)).BeginInit();
			this.SuspendLayout();
			// 
			// gridRaven1
			// 
			this.gridRaven1.AllowUserToAddRows = false;
			this.gridRaven1.AllowUserToDeleteRows = false;
			this.gridRaven1.AllowUserToResizeColumns = false;
			this.gridRaven1.AllowUserToResizeRows = false;
			dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
			dataGridViewCellStyle1.BackColor = System.Drawing.Color.LightGray;
			dataGridViewCellStyle1.Font = new System.Drawing.Font("Arial", 18F);
			dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.ControlText;
			dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
			dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
			dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
			this.gridRaven1.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
			this.gridRaven1.BackgroundColor = System.Drawing.SystemColors.Control;
			this.gridRaven1.BorderStyle = System.Windows.Forms.BorderStyle.None;
			this.gridRaven1.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.RaisedVertical;
			this.gridRaven1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
			dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
			dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window;
			dataGridViewCellStyle2.Font = new System.Drawing.Font("Arial", 18F);
			dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText;
			dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
			dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
			dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
			this.gridRaven1.DefaultCellStyle = dataGridViewCellStyle2;
			this.gridRaven1.Location = new System.Drawing.Point(12, 12);
			this.gridRaven1.MultiSelect = false;
			this.gridRaven1.Name = "gridRaven1";
			this.gridRaven1.ReadOnly = true;
			this.gridRaven1.RowHeadersVisible = false;
			this.gridRaven1.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
			this.gridRaven1.Size = new System.Drawing.Size(240, 332);
			this.gridRaven1.TabIndex = 0;
			// 
			// MainForm
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(632, 356);
			this.Controls.Add(this.gridRaven1);
			this.Name = "MainForm";
			this.Text = "Evaluador de la Prueba RAVEN";
			this.Load += new System.EventHandler(this.MainFormLoad);
			((System.ComponentModel.ISupportInitialize)(this.gridRaven1)).EndInit();
			this.ResumeLayout(false);
		}
		private WinApp.GridRaven gridRaven1;
	}
}
