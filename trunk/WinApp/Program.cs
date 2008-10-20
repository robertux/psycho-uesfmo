/*
 * Created by SharpDevelop.
 * user: Robertux
 * Date: 13/10/2008
 * Time: 04:28 p.m.
 * 
 * 
 */

using System;
using System.Windows.Forms;

namespace WinApp
{
	/// <summary>
	/// Class with program entry point.
	/// </summary>
	internal sealed class Program
	{
		/// <summary>
		/// Program entry point.
		/// </summary>
		[STAThread]
		private static void Main(string[] args)
		{
			Application.EnableVisualStyles();
			Application.SetCompatibleTextRenderingDefault(false);
			Application.Run(new frmMain());
		}
		
	}
}
