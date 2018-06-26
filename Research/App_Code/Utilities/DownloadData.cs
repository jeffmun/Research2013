using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data.OleDb;
using AutismCenterBase.Utilities;
using System.IO;
using System.Drawing;
using System.Text;
using System.Text.RegularExpressions;



/// <summary>
/// Summary description for DownloadData
/// </summary>
public class DownloadData
{
	public DownloadData()
	{
		//
		// TODO: Add constructor logic here
		//
	}

	public static int CreateNewDownload(SqlConnection oConnData, string downloadName, string filetype, int studyID, int inclREL, string mlist, string tplist, string grplist, string sslist)
	{
		//!!!!!!!!!!!!!!!!!!!!!!!!
		//LOG THE NEW DOWNLOAD 

		int new_downloadPK = DownloadData.NewDownload_INSERT(oConnData, downloadName, filetype, studyID, inclREL, mlist, tplist, grplist, sslist);
		int new_ddversPK = DownloadData.NewDownload_vers_INSERT(oConnData, new_downloadPK );

		//The vers should always be 1 for new downloads
		SqlCommand cmdVers = new SqlCommand("select vers from datDownload_vers   where ddversPK =" + new_ddversPK.ToString(), oConnData);
		int vers = (int)cmdVers.ExecuteScalar();


///        string[] measnames = mlist_names.Split('|');

		//RETRIEVE THE DATA
		DataTable[] myDT = DownloadData.DownloadDataArray2(oConnData, Convert.ToInt16(new_ddversPK));

		string filename = "zipdata_" + new_downloadPK.ToString() + "_v" + vers.ToString();

		//string info_msg = "";
		//string data_msg = "";

		if (filetype == "Excel XML")
		{
			CreateExcel(myDT, filename);
		}

		else if (filetype == "TAB zip")
		{
			CreateTABzip(myDT, filename);
		}
		// Handle other file types here...

		///!!!!!!!!!!!!!!!!!!!!!!!!!!
		return new_ddversPK;
	}


	public static int CreateNewDownloadVersion(SqlConnection oConnData, int downloadPK, int overwrite)
	{
		int new_ddversPK;

		if (overwrite == 0)
		{
			//LOG THE NEW DOWNLOAD VERSION
			new_ddversPK = DownloadData.NewDownload_vers_INSERT(oConnData, downloadPK);
		}
		else
		{
			new_ddversPK = downloadPK;
		}

		//int new_ddversPK = 0;

		if (new_ddversPK > 0)
		{



			//The vers should always be 1 for new downloads
			SqlCommand cmdVers = new SqlCommand("select vers from datDownload_vers   where ddversPK =" + new_ddversPK.ToString(), oConnData);
			int vers = (int)cmdVers.ExecuteScalar();


			SqlCommand cmdFiletype = new SqlCommand("select filetype from datDownload   where downloadPK =" + downloadPK.ToString(), oConnData);
			string filetype = (string)cmdFiletype.ExecuteScalar();


			//string[] measnames = mlist_names.Split('|');

			//RETRIEVE THE DATA
			//  Note that the datDownload_vers_measinfo & _subjinfo tables are 
			//  populated based on what is retrieved below.  
			DataTable[] myDT = DownloadData.DownloadDataArray2(oConnData, Convert.ToInt16(new_ddversPK));

			string filename = "zipdata_" + downloadPK.ToString() + "_v" + vers.ToString();


			//string info_msg = "";
			//string data_msg = "";

			if (filetype == "Excel XML")
			{
				CreateExcel(myDT, filename);
			}

			else if (filetype == "TAB zip")
			{
				CreateTABzip(myDT, filename);
			}

		}
		else
		{
		   // new_ddversPK = -999;
		}

		return new_ddversPK;
	}




	public static int NewDownload_INSERT(SqlConnection oConnData, string downloadName, string FileType, int studyID, int inclREL
		, string mlist, string tplist, string grplist, string sslist)
	{
		int new_downloadpk = 0;
		SqlCommand cmd4 = new SqlCommand();
		cmd4.Connection = oConnData;
		cmd4.CommandType = CommandType.StoredProcedure;
		cmd4.CommandText = "sp_datDownload_INSERT";

		cmd4.Parameters.AddWithValue("@downloadName", downloadName);
		cmd4.Parameters.AddWithValue("@FileType", FileType);
		cmd4.Parameters.AddWithValue("@studyID", studyID);
		cmd4.Parameters.AddWithValue("@inclREL", inclREL);
		cmd4.Parameters.AddWithValue("@meas", mlist);
		cmd4.Parameters.AddWithValue("@timepoints", tplist);
		cmd4.Parameters.AddWithValue("@grps", grplist);
		cmd4.Parameters.AddWithValue("@ss", sslist);

		cmd4.Parameters.Add("@downloadPK", SqlDbType.Int);
		cmd4.Parameters["@downloadPK"].Direction = ParameterDirection.Output;

		string result2 = "nothing";

		try
		{
			int result = cmd4.ExecuteNonQuery();

			new_downloadpk = Convert.ToInt16(cmd4.Parameters["@downloadPK"].Value);

		}
		catch (SqlException exc)
		{
			result2 = exc.Message;
		}

		return new_downloadpk;
	}



	public static int NewDownload_vers_INSERT(SqlConnection oConnData, int downloadPK)
	{
		int my_ddversPK = 0;
		//Log the properties of the retrieved data:  nvars (# of variables), nrecs (# of records returned)
		SqlCommand cmd3 = new SqlCommand();
		cmd3.Connection = oConnData;
		cmd3.CommandType = CommandType.StoredProcedure;
		cmd3.CommandText = "sp_datDownload_vers_INSERT";


		cmd3.Parameters.AddWithValue("@downloadPK", downloadPK);


		cmd3.Parameters.Add("@ddversPK", SqlDbType.Int);
		cmd3.Parameters["@ddversPK"].Direction = ParameterDirection.Output;

		try
		{
			int result = cmd3.ExecuteNonQuery();
			my_ddversPK = Convert.ToInt16(cmd3.Parameters["@ddversPK"].Value);
		}
		catch (SqlException exc)
		{
			string result2 = exc.Message;
			my_ddversPK = -888;
		}

		return my_ddversPK;
	}





	public static  object[]  DownloadDataArray(SqlConnection oConnData, int studyID, string filename, string mlist, string mlist_names, string tplist, string grplist, string sslist, int inclREL)
	{

		// jmInfo.Text += mlist_names + "<br/>" + mlist + "<br/>" + tplist + "<br/>" + grplist + "<br/>" + sslist;

		int num_info_tables = 5;   // number of information tables 

		if (1 == 1)
		{
			string[] measureID_all = mlist.Split(',');

			string[] measname = mlist_names.Split('|');

			object[] myDT = new object[measureID_all.Length + num_info_tables];  //This allows for the subjects and datadictionary worksheets 

			SqlCommand cmd = new SqlCommand(); 
			cmd.Connection = oConnData;
			cmd.CommandType = CommandType.Text;

			//Get the File Info
			//cmd.CommandText = "exec spAUTOMEAS_FileInfo '" + filename + "','" + mlist_names + "','" + tplist + "','" + grplist + "','" + sslist + "'";
			cmd.CommandText = "exec spAUTOMEAS_FileInfo '" + filename + "'";
			SqlDataAdapter da_fi = new SqlDataAdapter(cmd);
			DataTable dt_fi = new DataTable();
			da_fi.SelectCommand = cmd;
			dt_fi.TableName = "_FileInfo";
			da_fi.Fill(dt_fi);
			myDT[0] = dt_fi;

			//Get the Subjects
			SqlDataAdapter da0 = new SqlDataAdapter(cmd);
			DataTable dt0 = new DataTable();
			cmd.CommandText = "exec spAUTOMEAS_Subjects_byGrp_SubjStatus " + studyID.ToString() + ",'" + grplist + "','" + sslist + "', 0, '1'";
			da0.SelectCommand = cmd;
			dt0.TableName = "_Subjects";
			da0.Fill(dt0);
			myDT[1] = dt0;

			//Get the Excluded Subjects
			SqlDataAdapter da0ex = new SqlDataAdapter(cmd);
			DataTable dt0ex = new DataTable();
			cmd.CommandText = "exec spAUTOMEAS_Subjects_byGrp_SubjStatus " + studyID.ToString() + ",'" + grplist + "','" + sslist + "', 0, '2'";
			da0ex.SelectCommand = cmd;
			dt0ex.TableName = "_ExclSubjects";
			da0ex.Fill(dt0ex);
			myDT[2] = dt0ex;



			//spAUTOMEAS_Subjects_byGrp_SubjStatus(  @studyID int, @grplist varchar(500), @sslist varchar(500), @staffID int = 0)

			//Get the Data Dictionary
			cmd.CommandText = "exec spAUTOMEAS_DATADICT  '" + mlist + "','" + mlist_names + "'";
			SqlDataAdapter da1 = new SqlDataAdapter(cmd);
			DataTable dt1 = new DataTable();
			da1.SelectCommand = cmd;
			dt1.TableName = "_DataDictionary";
			da1.Fill(dt1);
			myDT[3] = dt1;


			//Get the Measures Info
			cmd.CommandText = "exec spAUTOMEAS_MeasList '" + filename + "','" + mlist + "','" + tplist + "', " + inclREL.ToString();
			SqlDataAdapter da1a = new SqlDataAdapter(cmd);
			DataTable dt1a = new DataTable();
			da1a.SelectCommand = cmd;
			dt1a.TableName = "_Measures";
			da1a.Fill(dt1a);
			myDT[4] = dt1a;


			////Get the R readzip code 
			//cmd.CommandText = "select * from vwAUTOMEAS_R_readzip_code";
			//SqlDataAdapter da1b = new SqlDataAdapter(cmd);
			//DataTable dt1b = new DataTable();
			//da1b.SelectCommand = cmd;
			//dt1b.TableName = "__Rcode";
			//da1b.Fill(dt1b);
			//myDT[5] = dt1b;

		
			//Loop through the selected measures 
			for (int i = 0; i < measureID_all.Length; i++)
			{

				string sqlcmd = "exec spAUTOMEAS_by_timepointlist2TEST " + studyID.ToString() + ", '" + measureID_all[i].ToString() + "', '" + tplist + "', '" + grplist + "', '" + sslist + "'," + inclREL.ToString() + ",0,0" ; //final params are StaffID(pass as zero) and test(pass as zero)
				//jmInfo.Text += sqlcmd + "......." + measname[i] + "<br/>";

				SqlCommand cmd2 = new SqlCommand();
				cmd2.Connection = oConnData;
				cmd2.CommandType = CommandType.Text;
				cmd2.CommandText = sqlcmd;
				SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
				DataTable dt2 = new DataTable();

				dt2.TableName = measname[i];
				da2.Fill(dt2);

				myDT[i + num_info_tables] = dt2;

			   //jmInfo.Text += "nrows=" + dt2.Rows.Count.ToString() + "<br/>";
			}

			return myDT;



		}
		//Log it
		//Save it?


	}


	public static DataTable[] DownloadDataArray2(SqlConnection oConnData, int ddversPK)
	{

		int num_info_tables = 6;   // number of information tables 

		SqlCommand cmdN = new SqlCommand("select count(*) from datDownload_measure where downloadPK=(select downloadPK from datDownload_vers where ddversPK="+ddversPK.ToString()+")", oConnData);
		int num_meas = (int)cmdN.ExecuteScalar();


		if (num_meas >= 1)
		{
		   // string[] measureID_all = mlist.Split(',');

		   // string[] measname = mlist_names.Split('|');

			DataTable[] myDT = new DataTable[num_info_tables + num_meas];
		//    object[] myDT = new object[measureID_all.Length + num_info_tables];  //This allows for the subjects and datadictionary worksheets 



			string[] cmnds = new string[num_info_tables]; string[] tblnames = new string[num_info_tables];

			// -- create proc sp_datDownload_GET_Subjects
			// -- (@studyID int, @timepoints varchar(200), @grps varchar(200), @ss varchar(200), @ddversPK int, @included varchar(20), @logit int, @return_Ns int )

			cmnds[0] = "exec sp_datDownload_GET_FileInfo " + ddversPK.ToString();
			cmnds[1] = "exec sp_datDownload_GET_Subjects 0,'','','', " + ddversPK.ToString() + ", 'in' , 1, 0 ";
			cmnds[2] = "exec sp_datDownload_GET_Subjects 0,'','','', " + ddversPK.ToString() + ", 'out', 0, 0 ";
			cmnds[3] = "exec sp_datDownload_GET_MeasList " + ddversPK.ToString();
			cmnds[4] = "exec sp_datDownload_GET_StudyMeasList " + ddversPK.ToString();
			cmnds[5] = "exec sp_datDownload_GET_DATADICT " + ddversPK.ToString();
			//cmnds[x] = "exec sp_datDownload_GET_Subjects_OtherStudies " + ddversPK.ToString() + ", 'in' ";
			//cmnds[x] = "exec sp_datDownload_GET_Subjects_OtherStudies " + ddversPK.ToString() + ", 'out' ";



			tblnames[0] = "_FileInfo";
			tblnames[1] = "_Subj" ;
			tblnames[2] = "_Subj_Excl";
			tblnames[3] = "_Meas";
			tblnames[4] = "_StudyMeas"; 
			tblnames[5] = "_Dict";
			//tblnames[x] = "_Subj_Oth";
			//tblnames[x] = "_Subj_Oth_Excl";


			for (int i=0; i < num_info_tables; i++)
			{
				SqlCommand cmd = new SqlCommand();
				cmd.Connection = oConnData;
				cmd.CommandType = CommandType.Text;
				cmd.CommandText = cmnds[i];

				SqlDataAdapter da = new SqlDataAdapter(cmd);
				DataTable dt = new DataTable();
				
				da.Fill(dt);
				dt.TableName = tblnames[i];
				myDT[i] = dt;
				
			}



			//Loop through the selected measures 
			for (int j = 0; j < num_meas; j++)
			{

				int jplus1 = j + 1;

				//Get the measname so we can name the DataTable we create
				SqlCommand cmdMeasName = new SqlCommand("exec sp_datDownload_vers_GET_measname   " + ddversPK.ToString() + ", " + jplus1.ToString(), oConnData);
				string measname = (string)cmdMeasName.ExecuteScalar();

				//Get the data
				string sqlcmd = "exec sp_datDownload_GET_MeasData " + ddversPK.ToString() + ", " + jplus1.ToString(); //final params are StaffID(pass as zero) and test(pass as zero)

				SqlCommand cmd2 = new SqlCommand();
				cmd2.Connection = oConnData;
				cmd2.CommandType = CommandType.Text;
				cmd2.CommandText = sqlcmd;
				SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
				DataTable dt2 = new DataTable();

				dt2.TableName = measname;
				da2.Fill(dt2);

				myDT[j + num_info_tables] = dt2;

				//Subtract 5 because we don't want to count these fields:
				//  "timept_num","timept","studymeasid","studymeasname","id"  
				int ncols = dt2.Columns.Count>5 ? dt2.Columns.Count - 5: 0;

				//Log the properties of the retrieved data:  nvars (# of variables), nrecs (# of records returned)
				SqlCommand cmd3 = new SqlCommand();
				cmd3.Connection = oConnData;
				cmd3.CommandType = CommandType.Text;
				cmd3.CommandText = "exec sp_datDownload_vers_measinfo_INSERT " + ddversPK.ToString()+ ", " + jplus1.ToString() + ", " + ncols.ToString() + ", " + dt2.Rows.Count.ToString()  ;

				cmd3.ExecuteNonQuery();

			}

		   return myDT;



		}
		else //num_meas not >= 1
		{
			return null;
		}
		////Log it
		////Save it?


	}




	////public static string LogDownload_vers(SqlConnection oConnData, int downloadPK, int vers)
	////{

	////    SqlCommand cmd4 = new SqlCommand();
	////    cmd4.Connection = oConnData;
	////    cmd4.CommandType = CommandType.StoredProcedure;
	////    cmd4.CommandText = "sp_datDownload_vers_INSERT";

	////    cmd4.Parameters.AddWithValue("@downloadPK", downloadPK);
	////    cmd4.Parameters.AddWithValue("@vers", vers);

	////    cmd4.Parameters.Add("@ddversPK", SqlDbType.Int);
	////    cmd4.Parameters["@ddversPK"].Direction = ParameterDirection.Output;

	////    string result2 = "nothing";

	////    try
	////    {
	////        int result = cmd4.ExecuteNonQuery();

	////        int newpk = Convert.ToInt16(cmd4.Parameters["@ddversPK"].Value);
	////        result2 = newpk.ToString();
	////    }
	////    catch (SqlException exc)
	////    {
	////        result2 = exc.Message;
	////    }

	////    return result2;
	////}




	////public static void LogDownload(SqlConnection oConnData, int studyID, string mlist, string tplist, string grplist, string sslist, string mlist_allvars, string mlist_names, string tplist_names, string grplist_names, string sslist_names, string downloadName, int inclREL, string FileType)
	////{
	////    string sqllog = "INSERT INTO datDownload (studyID,mlist,tplist,grplist,sslist,mlist_allvars,mlist_names,tplist_names, grplist_names, sslist_names, downloadName,filetype,inclREL,[created],[createdBy]) " +
	////    "VALUES ( " + studyID.ToString() + ",'" + mlist + "','" + tplist + "','" + grplist + "','" + sslist + "','" + mlist_allvars + "','" + mlist_names + "','" +
	////        tplist_names + "','" + grplist_names + "','" + sslist_names + "','" + downloadName + "','" + FileType + "'," + inclREL.ToString() + ",getdate(), system_user)";


	////    SqlCommand cmd3 = new SqlCommand();
	////    cmd3.Connection = oConnData;
	////    cmd3.CommandType = CommandType.Text;
	////    cmd3.CommandText = sqllog;

	////    try
	////    {
	////        int result = cmd3.ExecuteNonQuery();
	////    }
	////    catch (SqlException exc)
	////    {
			
	////    }


	////}


	//public DataTable CreateDataTable(string[] datatypes)
	//{
	//    DataTable dt = new DataTable();
	//    //AddColumns
	//    for (int c = 0; c < datatypes.Length; c++)
	//    {
	//        switch (datatypes[c]){
	//            case "int":             
	//                dt.Columns.Add(c.ToString(), typeof(int));
	//                break;
	//            case "float":
	//                dt.Columns.Add(c.ToString(), typeof(float));
	//                break;
	//        }
	//    }
	//    return dt;
	//}





	protected static void CreateExcel(DataTable[] myDT, string filename)
	{
		StringWriter xl = new CreateExcelXML(myDT, filename, 80);
		DownloadData.SaveToWebServer(xl, filename);  //Saves
		//DownloadData.SaveToBrowser(xl, filename);
		xl.Close();
	}

	protected static string CreateTABzip(DataTable[] myDT, string filename)
	{
		string info_msg = "";
		if (myDT == null)
		{
			info_msg += " **ERROR: DataTable array returned null.";
		}
		else
		{
			try
			{
				Object zip1 = new CreateZip(myDT, filename, "webserver", "zipdata");
				//Object zip2 = new CreateZip(myDT, filename, "browser");

				info_msg += "Created file:<br/><b>" + filename + ".zip</b><br/><br/>INFO Files:<br/>";

			}
			catch (Exception exc) 
			{
				info_msg += "** ERROR creating .zip file **<br/>" + exc.Message;
			}

		}

		return info_msg;
	}





	public static void SaveToBrowser(StringWriter sw, string filename)
	{
		string attachment = "attachment; filename=\"" + filename + ".xml\"";
		HttpContext.Current.Response.ClearContent();
		HttpContext.Current.Response.AddHeader("content-disposition", attachment);
		HttpContext.Current.Response.ContentType = "application/ms-excel";

		//return file to the browser
		HttpContext.Current.Response.Write(sw.ToString());
		HttpContext.Current.Response.End();

	}


	public static void SaveToWebServer(StringWriter sw, string filename)
	{
		//save to the webserver
//        string webFilename = Convert.ToString(Server.MapPath("~\\App_Data\\DataDownloads\\")) + filename + ".xml";
		string webFilename = Convert.ToString(@"E:\inetpub\wwwroot\Research\App_Data\DataDownloads\") + filename + ".xml";
		StreamWriter sw2 = new StreamWriter(webFilename);
		sw2.Write(sw.ToString());
		sw2.Close();

	}

}