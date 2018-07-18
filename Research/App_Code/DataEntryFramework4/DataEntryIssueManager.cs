using System;
using System.Collections;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DataEntryFramework4
{
	public class CustomRepeater : Repeater
	{
		// subclassed so I can pass DataTable to repeater that contains
		// current list of allowed issue status values
		public DataTable IssueStatus;

	}

	public class DataEntryIssueManager
	{
		private int _studyMeasID;
		private string _studySubjectID;
		private int _indexnum;


		public DataEntryIssueManager(int StudyMeasID, string StudySubjectID, int Indexnum)
		{
			_studyMeasID = StudyMeasID;
			_studySubjectID = StudySubjectID;
			_indexnum = Indexnum;

		}

		private SqlConnection _DBConnection = null;
		private SqlConnection DBConnection 
		{
			get
			{
				if (_DBConnection == null)
				{
					string connectString = ConfigurationManager.AppSettings["sqlDataConnection.ConnectionString"];
					_DBConnection = new SqlConnection(connectString);
				}
				return _DBConnection;
			}
		}



		//public ArrayList DataEntryIssues = new ArrayList();

		public void Fetch(CustomRepeater _dataIssuesRepeater)
		{
			try 
			{
				SqlCommand cmd = new SqlCommand();
				cmd.Connection = DBConnection;
				string sql = " select * from datDataEntryIssueStatus order by statusid; ";
				sql += "select * from datDataEntryIssue ";
				sql += "where studymeasid=@studyMeasID and indexnum = @indexnum and studysubjectID = @studySubjectID ";
				sql += "order by dataEntryIssueID;";
				cmd.CommandType = CommandType.Text;
				cmd.CommandText = sql;
				cmd.Parameters.Add("@studyMeasID", SqlDbType.Int, 4);
				cmd.Parameters.Add("@indexnum", SqlDbType.Int, 4);
				cmd.Parameters.Add("@studySubjectID", SqlDbType.VarChar, 15);
				cmd.Parameters["@studyMeasID"].Value = _studyMeasID;
				cmd.Parameters["@indexnum"].Value = _indexnum;
				cmd.Parameters["@studySubjectID"].Value = _studySubjectID;
				SqlDataAdapter adapter = new SqlDataAdapter();
				adapter.SelectCommand = cmd;
				DataSet ds = new DataSet();
				adapter.Fill(ds);

				_dataIssuesRepeater.IssueStatus = ds.Tables[0];
				_dataIssuesRepeater.DataSource = ds.Tables[1];
				_dataIssuesRepeater.DataBind();
			}
			catch(Exception Ex)
			{
				string s = Ex.Message;
			}
			finally
			{
				if (DBConnection != null) DBConnection.Close();
			}

		}


		public void Add()
		{
			try 
			{
				SqlCommand cmdAdd = new SqlCommand();
				cmdAdd.Connection = DBConnection;
				string sqlAdd = "insert into datdataentryissue ";
				sqlAdd += "(studymeasid, indexnum, studysubjectid) ";
				sqlAdd += "values (@studyMeasID, @indexnum, @studySubjectID)";
				cmdAdd.CommandType = CommandType.Text;
				cmdAdd.CommandText = sqlAdd;
				cmdAdd.Parameters.Add("@studyMeasID", SqlDbType.Int, 4);
				cmdAdd.Parameters.Add("@indexnum", SqlDbType.Int, 4);
				cmdAdd.Parameters.Add("@studySubjectID", SqlDbType.VarChar, 15);
				cmdAdd.Parameters["@studyMeasID"].Value = _studyMeasID;
				cmdAdd.Parameters["@indexnum"].Value = _indexnum;
				cmdAdd.Parameters["@studySubjectID"].Value = _studySubjectID;

				DBConnection.Open();
				cmdAdd.ExecuteNonQuery();
			}
			catch(Exception Ex)
			{
				string s = Ex.Message;
			}
			finally
			{
				if (DBConnection != null) DBConnection.Close();
			}
		}
		
		public void Delete(RepeaterItem r)
		{
			try 
			{
				//get issue id from hidden input control in repeater
				int issueID = int.Parse(((HtmlInputHidden)r.FindControl("hiddenIssueID")).Value);
				SqlCommand cmdDelete = new SqlCommand();
				cmdDelete.Connection = DBConnection;
				string sqlDelete = "delete from datdataentryissue ";
				sqlDelete += "where dataEntryIssueID = @dataEntryIssueID";
				cmdDelete.CommandType = CommandType.Text;
				cmdDelete.CommandText = sqlDelete;
				cmdDelete.Parameters.Add("@dataEntryIssueID", SqlDbType.Int, 4);
				cmdDelete.Parameters["@dataEntryIssueID"].Value = issueID;

				DBConnection.Open();
				cmdDelete.ExecuteNonQuery();
			}
			catch(Exception Ex)
			{
				string s = Ex.Message;
			}
			finally
			{
				if (DBConnection != null) DBConnection.Close();
			}
			
		}


		public void Save(RepeaterItem r)
		{
			try 
			{
				int issueID = int.Parse(((HtmlInputHidden)r.FindControl("hiddenIssueID")).Value);
				int statusID = int.Parse(((DropDownList)r.FindControl("lbStatus")).SelectedValue);
				string entryTxt = ((TextBox)r.FindControl("txtEntry")).Text;
				SqlCommand cmdSave = new SqlCommand();
				cmdSave.Connection = DBConnection;

				string sqlSave = "update datdataentryissue set ";
				sqlSave += "statusid = @statusID, entrytxt = @entryTxt ";
				sqlSave += "where dataentryissueid = @dataEntryIssueID";
				cmdSave.CommandType = CommandType.Text;
				cmdSave.CommandText = sqlSave;

				cmdSave.Parameters.Add("@statusID", SqlDbType.Int, 4);
				cmdSave.Parameters.Add("@entryTxt", SqlDbType.VarChar, 1000);
				cmdSave.Parameters.Add("@dataEntryIssueID", SqlDbType.Int, 4);
				cmdSave.Parameters["@statusID"].Value = statusID;

				if (entryTxt.Trim() == string.Empty)
					cmdSave.Parameters["@entryTxt"].Value = DBNull.Value;
				else
					cmdSave.Parameters["@entryTxt"].Value = entryTxt;

				cmdSave.Parameters["@dataEntryIssueID"].Value = issueID;

				DBConnection.Open();
				cmdSave.ExecuteNonQuery();
			}
			catch(Exception Ex)
			{
				string s = Ex.Message;
			}
			finally
			{
				if (DBConnection != null) DBConnection.Close();
			}
			

		}

	
	}
}
