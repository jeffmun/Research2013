using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using uwac;


namespace uwac
{

	/// <summary>
	/// Summary description for Uploader
	/// </summary>
	public static class Uploader
	{

		public static string UploadDoc(FileUpload up, UploadSettings s)
		{
			if (!s.IsAllowed)
			{
				return "File extension not allowed.";
			}
			else
			{
				if (up.HasFile)
				{
					//save the file
					try
					{
						//log the file
						int docversID = s.LogUpload_Doc();

						if (docversID > 0)
						{
							try
							{
								s.docfilename = String.Format("DocVersID_{0}{1}", docversID, s.fileext);
								string myfilepath = String.Format("{0}{1}", s.filepath, s.docfilename);
								up.PostedFile.SaveAs(myfilepath);

								s.Update_DocFileName();

							}
							catch(Exception ex)
							{
								return String.Format("Error: [{0}]", ex.Message);
							}
						}


						return "ok";
					}
					catch(Exception ex)
					{
						return "rats";
					}
				}
			}
			return "unhandled";
		}
	}

	public class UploadSettings
	{
		private List<string> allowedExts;
		public int docID { get; set; }
		public int docversID { get; set; }
		public UploadFiletype uploadfiletype { get; set; }
		public DbEntityType linked_entitytype { get; set; }
		public int linked_entityID { get; set; }
		public string docfilename { get; set; }
		public string doctitle { get; set; }
		public string docdesc { get; set; }
		public int doctypeID { get; set; }
		public int docstatusID { get; set; }
		public string fileext { get; set; }
		public string filepath { get; set; }
		
		public string origfilename{ get; set; }
		public bool IsAllowed { get { return (allowedExts.Contains(fileext)) ? true : false;  } }
		public string results { get; set; }

		public UploadSettings(string myfilepath, string myfilename, UploadFiletype myuploadtype )
		{
			Initialize(myfilepath, myfilename, myuploadtype, NextDocID(), DefaultExts());
		}

		public UploadSettings(string myfilepath, string myfilename, UploadFiletype myuploadtype, List<string> myexts)
		{
			Initialize(myfilepath, myfilename, myuploadtype, NextDocID(), myexts);
		}
		public UploadSettings(string myfilepath, string myfilename, UploadFiletype myuploadtype, int mydocID, List<string> myexts)
		{
			Initialize(myfilepath, myfilename, myuploadtype, mydocID, myexts);
		}


		private void Initialize(string myfilepath, string myfilename, UploadFiletype myuploadtype, int mydocID, List<string> myexts)
		{
			filepath = myfilepath;
			origfilename = myfilename;
			uploadfiletype = myuploadtype;
			//docID = mydocID;
			allowedExts = myexts;

			fileext = myfilename.Substring(myfilename.LastIndexOf("."));
			//docversID = NextDocVersID();
		}


		private int NextDocVersID()
		{
			SQL_utils sql = new SQL_utils("backend");
			int id = sql.IntScalar_from_SQLstring("select max(docversID) + 1 from tbldocvers");
			sql.Close();

			docfilename = String.Format("DocVersID_{0}{1}", id, fileext);

			return id;
		}
		private int NextDocID()
		{
			SQL_utils sql = new SQL_utils("backend");
			int id = sql.IntScalar_from_SQLstring("select max(docID) + 1 from tbldoc");
			sql.Close();
			return id;
		}


		public string LogUpload()
		{
			if(uploadfiletype == UploadFiletype.Doc)
			{
				return LogUpload_Doc().ToString();
			}
			else if (uploadfiletype == UploadFiletype.Data)
			{
				return "Need to implement LogUpload_Data();";
			}
			return "Unhandled LogUpload()";
			
		}




		public string UnlogUpload()
		{
			try
			{
				SQL_utils sql = new SQL_utils("kawdata");
				if (docID > 0)
				{
					sql.NonQuery_from_SQLstring(String.Format("delete from tbldoc where docID={0}", docID));
				}
				if (docversID > 0)
				{
					sql.NonQuery_from_SQLstring(String.Format("delete from def.DataUpload where docversID={0}", docversID));
					sql.NonQuery_from_SQLstring(String.Format("delete from tbldocvers where docversID={0}", docversID));
				}
				return "File not logged.";
			}
			catch (Exception ex)
			{
				return "Unlogging Error.";
			}
		}


		public bool Update_DocFileName()
		{
			try
			{
				SQL_utils sql = new SQL_utils("backend");
				sql.NonQuery_from_SQLstring(
					String.Format("update tblDocVers set DocFileName = '{0}' where docversID={1}", docfilename, docversID));
				sql.Close();
				return true;
			}
			catch(Exception ex)
			{
				return false;
			}
		}

		public int LogUpload_Doc()
		{
			

			OrderedDictionary newvalues = new OrderedDictionary();
			//newvalues.Add("docID", docID);
			//newvalues.Add("docversID", docversID);
			newvalues.Add("docfilename", docfilename);
			newvalues.Add("doctitle", doctitle);
			newvalues.Add("docdesc", docdesc);
			newvalues.Add("doctypeID", doctypeID);
			newvalues.Add("docstatusID", docstatusID);
			newvalues.Add("fileext", fileext);
			newvalues.Add("origfilename", origfilename);

			//Insert Doc
			docID = DxDbOps.InsertSqlCode_ReturnPK(newvalues, "tblDoc", "backend", "dbo", "DocID");

			if (docID > 0)
			{
				newvalues.Add("DocID", docID);

				//Insert DocVers
				docversID = DxDbOps.InsertSqlCode_ReturnPK(newvalues, "tblDocVers", "backend", "dbo", "DocVersID");

				//Insert entity link - we link this DocID to this MeasureID
				SQL_utils sql = new SQL_utils("backend");

				string sql_doc = String.Format("select docID from tbldoc where doctitle='{0}' and created > dateadd(minute, -3, getdate())", doctitle);
				string sql_docvers = String.Format("select docversID from tbldocvers where origfilename='{0}' and docID={1} and created > dateadd(minute, -3, getdate())"
					, origfilename, docID);

				int thisDocID = sql.IntScalar_from_SQLstring(sql_doc);
				int thisDocVersID = sql.IntScalar_from_SQLstring(sql_docvers);


				string fk_code = String.Format("insert into tblDocFK(DocID, EntitytypeID, EntityID) values({0}, {1}, {2})"
					, thisDocID, (int)linked_entitytype, linked_entityID);

				if (thisDocID == docID & thisDocVersID == docversID)
				{

					docfilename = String.Format("DocVersID_{0}{1}", docversID, fileext);
					sql.NonQuery_from_SQLstring(fk_code);
					sql.Close();

					return docversID;
				}
				else
				{
					sql.Close();

					return -1;
				}
			}
			return -1;

		}

		public List<string> DefaultExts()
		{
			return new List<string>{ ".docx", ".xlsx", ".pptx", ".doc", ".xls", ".ppt", ".pdf", ".rtf" , ".txt", ".csv",
											 ".wmv", ".mp3", ".wav", ".avi", ".mov", ".mpeg", ".mpg",  ".gif", ".png", ".jpeg", ".jpg", ".bmp",
											 ".sps", ".sav", ".spo", ".R", ".Rdata", ".zip"};
		}

	}

	public enum UploadFiletype
	{
		Doc = 0,
		Data = 1
	}
}