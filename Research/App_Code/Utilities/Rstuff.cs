using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.ComponentModel;
using System.IO;
using System.Web;

/// <summary>
/// Summary description for Rstuff
/// </summary>
public class Rstuff
{
	public Rstuff()
	{
		//
		// TODO: Add constructor logic here
		//
	}




	public static string runRscript(string Rfilename, string zipfilename, string splitby)
	{
		string info = "";
		string args = "";
		// These are the Win32 error code for file not found or access denied.
		const int ERROR_FILE_NOT_FOUND = 2;
		const int ERROR_ACCESS_DENIED = 5;

		Process myProcess = new Process();

		try
		{

			//replace with all text, and build it HERE!!
			args = "  \"E:\\inetpub\\wwwroot\\Research\\App_Data\\R\\" + Rfilename + ".R\"  \"" + zipfilename + "\" \"" + splitby + "\"  > " + zipfilename + ".log 2>&1" ;

			myProcess.StartInfo.FileName = @"C:\Program Files\R\R-3.1.1\bin\x64\Rscript.exe";
			//myProcess.StartInfo.WorkingDirectory = folder;
			myProcess.StartInfo.Arguments = args;
			myProcess.StartInfo.CreateNoWindow = true;
			//myProcess.StartInfo.RedirectStandardOutput = true;
			//myProcess.StartInfo.UseShellExecute = false;

			myProcess.Start();

			//info += myProcess.StandardOutput.ReadToEnd();

			myProcess.WaitForExit();
		}
		catch (Win32Exception e)
		{
			if (e.NativeErrorCode == ERROR_FILE_NOT_FOUND)
			{
				info += (e.Message + ". Check the path.");
			}

			else if (e.NativeErrorCode == ERROR_ACCESS_DENIED)
			{
				// Note that if your word processor might generate exceptions
				// such as this, which are handled first.
				info += (e.Message +
					". You do not have permission to print this file.");
			}
			else
			{
				info += (e.Message + args);
			}
		}

		// StreamReader ROutput = new StreamReader(/* your R output file's path should go here */)
		return info;

	}

}