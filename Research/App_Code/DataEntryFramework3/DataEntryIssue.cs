using System;

namespace DataEntryFramework3
{
	//**new
	public class DataEntryIssue
	{
		private int _dataEntryIssueID;
		private int _studymeasID;
		private int _indexnum;
		private string _studySubjectID;
		private int _statusID;
		private string _entrytxt;
		private string _created;
		private string _createdBy;
		private string _updated;
		private string _updatedBy;

		
		public DataEntryIssue(
			int dataEntryIssueID,
			int studymeasID,
			int indexnum,
			string studySubjectID,
			int statusID,
			string entrytxt,
			string created,
			string createdBy,
			string updated,
			string updatedBy) 
		{
			_dataEntryIssueID = dataEntryIssueID;
			_studymeasID = studymeasID;
			_indexnum = indexnum;
			_studySubjectID = studySubjectID;
			_statusID = statusID;
			_entrytxt = entrytxt;
			_created = created;
			_createdBy = createdBy;
			_updated = updated;
			_updatedBy = updatedBy;
		}


		public int DataEntryIssueID
		{
			get {return _dataEntryIssueID;}
		}

		public int StudyMeasID
		{
			get{return _studymeasID;}
		}


		public int Indexnum
		{
			get{return _indexnum;}
		}

		public string StudySubjectID
		{
			get {return _studySubjectID;}
		}
		
		public int StatusID
		{
			get{return _statusID;}
		}

		public string EntryText
		{
			get {return _entrytxt; }
		}

		public string Created
		{
			get{return _created;}
		}
		public string CreatedBy
		{
			get{return _createdBy;}
		}
		public string Updated
		{
			get{return _updated;}
		}

		public string UpdatedBy
		{
			get{return _updatedBy;}
		}

	}

}
