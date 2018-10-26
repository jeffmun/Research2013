using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace uwac
{
	/// <summary>
	/// Summary description for DbEntity
	/// </summary>
	public class DbEntity
	{

		public DbEntityType entitytype { get; set; }
		public string db { get; set; }
		public string schema { get; set; }
		public string table_name { get; set; }
		public string pkfld { get; set; }
		public string namefld { get; set; }
		public string fulldb { get {
				if (db == "data") return "uwautism_research_data";
				else if (db == "backend") return "uwautism_research_backend";
				else return "uwautism_research_backend";
			}
		}

		public DbEntity(DbEntityType myentitytype)
		{
			entitytype = myentitytype;

			if (myentitytype == DbEntityType.studymeas)
			{
				db = "backend";
				schema = "dbo";
				table_name = "tblstudymeas";
				pkfld = "studymeasID";
				namefld = "studymeasname";
			}
			else if (myentitytype == DbEntityType.measure)
			{
				db = "backend";
				schema = "dbo";
				table_name = "tblmeasure";
				pkfld = "measureID";
				namefld = "measname";
			}
			else if (myentitytype == DbEntityType.tbl)
			{
				db = "data";
				schema = "def";
				table_name = "tbl";
				pkfld = "tblpk";
				namefld = "tblname";

			}
			else if (myentitytype == DbEntityType.fld)
			{
				db = "data";
				schema = "def";
				table_name = "fld";
				pkfld = "fldpk";
				namefld = "fldname";
			}
			else if (myentitytype == DbEntityType.timepoint)
			{
				db = "backend";
				schema = "dbo";
				table_name = "tbltimepoint";
				pkfld = "timepointID";
				namefld = "timepoint_text";
			}
		}
	}

	//public enum DbEntityType2
	//{
	//	study = 0,
	//	subject = 1,
	//	measure = 2,
	//	studymeas = 3,
	//	tbl = 4,
	//	fld = 5,
	//	timepoint = 6
	//}

	public enum DbEntityType  // select * from tblEntityType
	{
		group = 0,
		measure = 1,
		studymeas = 2,
		consentformversion = 3,
		subject = 4,
		household = 5,
		study = 6,
		staffteam = 7,
		datasharesite = 8,
		studyaction = 9,
		studyactiongroup = 10,
		databaseentity = 11,
		tutorial = 12,
		person = 13,
		subjectconsentform = 14,
		tbl = 15,
		fld = 16,
		timepoint = 17
	}



}