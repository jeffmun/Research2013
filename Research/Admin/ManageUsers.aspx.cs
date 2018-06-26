using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using uwac;


public partial class Admin_ManageUsers : System.Web.UI.Page
{

	const int ERROR_FILE_NOT_FOUND = 2;
	const int ERROR_ACCESS_DENIED = 5;
	string info;
	string args;

	protected void Page_Load(object sender, EventArgs e)
	{
	}

	protected DataTable GetRecentUsers()
	{

		SQL_utils sql = new SQL_utils("backend");

		DataTable dt = sql.DataTable_from_SQLstring("select coalesce(netid, actdirID) username from tblstaff a where lastlogindate > '2017-07-01'");

		foreach (DataRow row in dt.Rows)
		{
			lblUsers.Text += row["username"].ToString() + "; ";
		}

		sql.Close();

		return dt;
	}



	protected void ExecuteCode_Click(object sender, EventArgs e)
	{
		DataTable dtusers = GetRecentUsers();

		for(int i=0; i< 3; i++)
		{
			DataRow row = dtusers.Rows[i];

			TestIt(row["username"].ToString());
		}
	}



	protected void CreateBatFile(List<string> contents, string fileName)
	{
		if (!String.IsNullOrEmpty(fileName))
		{
			if (System.IO.File.Exists(fileName)) System.IO.File.Delete(fileName);
		}

		try
		{
			using (StreamWriter _testData = new StreamWriter(fileName, false))
			{
				foreach(string s in contents)
				{
					_testData.WriteLine(s); // Write the file.
				}
			}
		}
		catch(Exception ex)
		{
			var msg = ex.Message;
		}

	}

	protected void ExecBatFile(string filename)
	{
		Process myProcess = new Process();
		try
		{
			myProcess.StartInfo.FileName = filename;
			myProcess.StartInfo.CreateNoWindow = false;
			myProcess.StartInfo.UseShellExecute = false;
			myProcess.Start();

			myProcess.WaitForExit();
			myProcess.Close();
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

	}

	protected string ReadOutput(string outputfile)
	{
		StreamReader output = new StreamReader(outputfile);
		string output_text = output.ReadToEnd().ToString();
		output.Close();
		return output_text;
	}

	protected void TestIt(string username)
	{
		string cmdfile = @"C:\inetpub\sites\icacls.bat";
		string outputfile = @"C:\inetpub\sites\icacls_out.txt";

		List<string> batcontents = new List<string>();
		batcontents.Add( String.Format(@"icacls ""C:\inetpub\sites\Research"" / grant:r  ""netid\{0}"":RX  /T  /Q ", username ));
		batcontents.Add( String.Format(@"icacls ""C:\inetpub\sites\Research\App_Data\webdocs"" / grant:r  ""netid\{0}"":RX  /T  /Q ", username));
		batcontents.Add( String.Format(@"icacls ""C:\inetpub\sites\Research\App_Data\DataDownloads"" / grant:r  ""netid\{0}"":RX  /T  /Q > ""{1}"" ", username, outputfile));


		///* Apply - Read & Execute, List Folder Contents, Read */
		//select 'icacls "C:\inetpub\sites\Research"  /grant:r  "netid\' + coalesce(netid, actdirID) + '":RX  /T  /Q' cmd
		//from tblstaff a where lastlogindate > '2017-07-01'

		///* Webdocs  --  Apply - Modify access (includes Modify, Read & Execute, List folder contents, Read, Write*/
		//select 'icacls "C:\inetpub\sites\Research\App_Data\webdocs"  /grant:r  "netid\' +  coalesce(netid, actdirID) + '":M  /T  /Q' cmd
		//from tblstaff a where lastlogindate > '2017-07-01'

		///* DataDownloads  --  Apply - Modify access (includes Modify, Read & Execute, List folder contents, Read, Write*/
		//select 'icacls "C:\inetpub\sites\Research\App_Data\DataDownloads"  /grant:r  "netid\' +  coalesce(netid, actdirID) + '":M  /T  /Q' cmd
		//from tblstaff a where lastlogindate > '2017-07-01'



		batcontents.Add("USE[master]");
		batcontents.Add("GO");
		batcontents.Add(String.Format(@"CREATE LOGIN[AUTISM\{0}] FROM WINDOWS WITH DEFAULT_DATABASE =[uwautism_research_backend], DEFAULT_LANGUAGE =[us_english]", username));
		batcontents.Add("GO");




		CreateBatFile(batcontents, cmdfile);
		ExecBatFile(cmdfile);

		Input.Text = String.Join(";", batcontents);
		string txt = ReadOutput(outputfile);

		ResultBox.Text = username + " *** " + txt;

	}





}