using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using uwac;
using Obout.Ajax;

namespace uwac
{
	/// <summary>
	/// Summary description for oboutGrid_utils
	/// </summary>
	public class oboutGrid_utils : OboutInc.oboutAJAXPage
	{

		//
		// obout Suite - Enterprise License; Order ID 5321181982 
		//

		public oboutGrid_utils()
		{
			//
			// TODO: Add constructor logic here
			//
		}


		public DataTable FieldDatatypes_for_table(string tbl)
		{
			DataTable dt = FieldDatatypes_for_table(tbl, "backend");
			return dt;
		}

		public DataTable FieldDatatypes_for_table(string tbl, string db)
		{
			SQL_utils sql = new SQL_utils(db);
			DataTable dt = sql.DataTable_from_SQLstring("select column_name, data_type from information_schema.columns where table_name = '" + tbl + "'");
			sql.Close();

			return dt;
		}


		public List<SQL_utils.dbfield> Hashtable_to_dbfields(Hashtable hash, string tbl, string db)
		{
			SQL_utils sql = new SQL_utils(db);
			DataTable dt = new DataTable();
			DataTable dt_flds = FieldDatatypes_for_table(tbl, db);

			List<SQL_utils.dbfield> flds = new List<SQL_utils.dbfield>();

			foreach (DictionaryEntry d in hash)
			{
				//Get the data type for the field from the db
				try
				{
					string fldtype = dt_flds.AsEnumerable().Where(r => r.Field<string>("column_name").ToLower() == d.Key.ToString().ToLower()).Select(r => r.Field<string>("data_type")).First();
					SQL_utils.dbfield fld = new SQL_utils.dbfield();
					fld.fieldname = d.Key.ToString();
					fld.value = d.Value.ToString();
					fld.sqldbtype = fldtype;
					flds.Add(fld);
				}
				catch(Exception ex)
				{
					string x = ex.Message;
					//field not in table
				}
			}
			sql.Close();

			return flds;
		}


		public List<SQL_utils.dbfield> Hashtable_to_dbfields(Hashtable hash, string tbl, string db, string pk)
		{
			//Do not include the pk field
			SQL_utils sql = new SQL_utils(db);
			DataTable dt = new DataTable();
			DataTable dt_flds = FieldDatatypes_for_table(tbl, db);

			List<SQL_utils.dbfield> flds = new List<SQL_utils.dbfield>();

			foreach (DictionaryEntry d in hash)
			{
				//check to see if this field is present in this table
				int fld_in_table = dt_flds.AsEnumerable().Where(r => r.Field<string>("column_name").ToLower() == d.Key.ToString().ToLower()).Select(r => r.Field<string>("data_type")).Count();

				if (fld_in_table >= 1)  //if this field is in the table then add it to the list
				{

					//Get the data type for the field from the db
					string fldtype = dt_flds.AsEnumerable().Where(r => r.Field<string>("column_name").ToLower() == d.Key.ToString().ToLower()).Select(r => r.Field<string>("data_type")).First();

					//Do not create a dbfield for the pk as this is an update and the pk is only used in the where clause
					if (d.Key.ToString() != pk)
					{
						SQL_utils.dbfield fld = new SQL_utils.dbfield();
						fld.fieldname = d.Key.ToString();
						fld.value = d.Value.ToString();
						fld.sqldbtype = fldtype;
						flds.Add(fld);
					}
				}
			}
			sql.Close();
			return flds;
		}



		public List<SQL_utils.dbfield> Hashtable_to_dbfields(Hashtable hash, string tbl, string db, List<string> pks)
		{
			//Do not include the pk field
			SQL_utils sql = new SQL_utils(db);
			DataTable dt = new DataTable();
			DataTable dt_flds = FieldDatatypes_for_table(tbl, db);

			List<SQL_utils.dbfield> flds = new List<SQL_utils.dbfield>();

			foreach (DictionaryEntry d in hash)
			{
				//check to see if this field is present in this table
				int fld_in_table = dt_flds.AsEnumerable().Where(r => r.Field<string>("column_name").ToLower() == d.Key.ToString().ToLower()).Select(r => r.Field<string>("data_type")).Count();

				if (fld_in_table >= 1)  //if this field is in the table then add it to the list
				{

					//Get the data type for the field from the db
					string fldtype = dt_flds.AsEnumerable().Where(r => r.Field<string>("column_name").ToLower() == d.Key.ToString().ToLower()).Select(r => r.Field<string>("data_type")).First();

					//Do not create a dbfield for the pk as this is an update and the pk is only used in the where clause
					if (!pks.Contains(d.Key.ToString() ))
					//if (d.Key.ToString() != pk)
					{
						SQL_utils.dbfield fld = new SQL_utils.dbfield();
						fld.fieldname = d.Key.ToString();
						fld.value = d.Value.ToString();
						fld.sqldbtype = fldtype;
						flds.Add(fld);
					}
				}
			}
			sql.Close();
			return flds;
		}



		public int getPKval_from_Hashtable(Hashtable hash, string pk)
		{
			int pkval = -1;
			foreach (DictionaryEntry d in hash)
			{
				//Get the value of the pk field
				if (d.Key.ToString().ToLower() == pk.ToLower())
				{
					pkval = Convert.ToInt32(d.Value.ToString());
				}
			}
			return pkval;
		}



		public Dictionary<string,int> getPKvals_from_Hashtable(Hashtable hash, List<string> pks)
		{
			Dictionary<string, int> pkvals = new Dictionary<string, int>();

			foreach (DictionaryEntry d in hash)
			{
				//Get the value of the pk field
				if (pks.Contains(d.Key.ToString()) )
				{
					pkvals.Add(d.Key.ToString(), Convert.ToInt32(d.Value.ToString()));
				}
			}
			return pkvals;
		}



		public string oGrid_UpdateData(Hashtable hash, string tbl, string db, string schema, string pk)
		{
			int pkval = getPKval_from_Hashtable(hash, pk);

			List<SQL_utils.dbfield> flds = Hashtable_to_dbfields(hash, tbl, db, pk);
			SQL_utils sql = new SQL_utils(db);

			string x = sql.sql_update_from_list(schema, tbl, flds, pk, pkval);
			sql.Close();

			return x;
		}

		public string oGrid_UpdateData(Hashtable hash, string linktbl, string db, string schema, List<string> pks)
		{
			Dictionary<string,int> pkvals = getPKvals_from_Hashtable(hash, pks);

			List<SQL_utils.dbfield> flds = Hashtable_to_dbfields(hash, linktbl, db, pks);
			SQL_utils sql = new SQL_utils(db);

			string x = sql.sql_update_from_list(schema, linktbl, flds, pkvals);
			sql.Close();

			return x;
		}



		public string oGrid_UpdateData(Hashtable hash, string tbl, string db, string schema, string pk, int[] pkvals)
		{
			//int pkval = getPKval_from_Hashtable(hash, pk);

			List<SQL_utils.dbfield> flds = Hashtable_to_dbfields(hash, tbl, db, pk);
			SQL_utils sql = new SQL_utils(db);

			string x = sql.sql_update_from_list(schema, tbl, flds, pk, pkvals);
			sql.Close();

			return x;
		}





		public string oGrid_InsertData(Hashtable hash, string tbl, string db, string schema)
		{
			List<SQL_utils.dbfield> flds = Hashtable_to_dbfields(hash, tbl, db);
			SQL_utils sql = new SQL_utils(db);

			string x = sql.sql_insert_from_list(schema, tbl, flds);
			sql.Close();

			return x;
		}


		public string oGrid_InsertData(Hashtable hash, string tbl, string db, string schema, string pk, int pkval)
		{
			List<SQL_utils.dbfield> flds = Hashtable_to_dbfields(hash, tbl, db);
			SQL_utils sql = new SQL_utils(db);

			string x = sql.sql_insert_from_list(schema, tbl, flds, pk, pkval);

			sql.Close();
			return x;
		}


		public string oGrid_DeleteData(string tbl, string db, string schema, string pk, int pkval)
		{
			SQL_utils sql = new SQL_utils(db);
			string x = sql.sql_delete(schema, tbl, pk, pkval);
			sql.Close();
			return x;
		}



		public string oGrid_DeleteData(Hashtable hash, string tbl, string db, string schema, string pk)
		{
			int pkval = getPKval_from_Hashtable(hash, pk);
			SQL_utils sql = new SQL_utils(db);
			string x = sql.sql_delete(schema, tbl, pk, pkval, true);
			sql.Close();
			return x;
		}

		public string oGrid_DeleteData(Hashtable hash, string tbl, string db, string schema, string pk, bool validate)
		{
			int pkval = getPKval_from_Hashtable(hash, pk);
			SQL_utils sql = new SQL_utils(db);
			string x = sql.sql_delete(schema, tbl, pk, pkval, validate);
			sql.Close();
			return x;
		}



		public string oGrid_DeleteData(string tbl, string db, string schema, string pk, int pkval, bool validate)
		{
			SQL_utils sql = new SQL_utils(db);
			string x = sql.sql_delete(schema, tbl, pk, pkval, validate);
			sql.Close();
			return x;
		}




		public string ExecuteDBAction(Hashtable hash, string mode, string tbl, string db, string schema, string pk )
		{
			string msg = "";
			bool cont = true;
			if (mode == "insert")
			{
				msg = this.oGrid_InsertData(hash, tbl, db, schema, pk, 0);
			}
			else if (mode == "update")
			{
				msg = this.oGrid_UpdateData(hash, tbl, db, schema, pk);
			}
			else if (mode == "delete")
			{
				msg = this.oGrid_DeleteData(hash, tbl, db, schema, pk, true);
			}
			else
			{
				msg = "ExecuteDBAction not implemented for " + mode;
				cont = false;
			}

			if(cont)
			{

				string additional_msg = this.PostProcessDBAction(mode, tbl, hash);

				Session[tbl + "_msg"] = msg + additional_msg; // +"<br/>" + e.Record["objpk"].ToString();

				if (msg.StartsWith("NOT DELETED"))
				{
					if (tbl == "studymeas")
					{
						Session["studymeasID_toDelete"] = hash["studymeasID"].ToString();
						//btnOVERRIDE_studymeas.Visible = true;
					}
					else if (tbl == "studyaction")
					{
						Session["studyactionID_toDelete"] = hash["studyactionID"].ToString();
						//btnOVERRIDE_studyaction.Visible = true;
					}
				}
			}

			return msg;
		}


		public string PostProcessDBAction(string mode, string entity, Hashtable hash)
		{
			//Handle any followup stuff that is needed.

			///things like:
			///change an action's name, then all actions in the subjects should change name too
			///change an action's timepoint, then all studymeas in it should change too
			///move and studymeas to a different studyaction, move it in subjects too
			///insert/delete records from a child table


			string msg2 = "";

			if (mode == "insert")
			{
				if (entity == "studymeas")
				{
					msg2 = "<br/>Make sure to add this to subjects who need it.";
				}
				if (entity == "studyaction")
				{
					msg2 = "<br/>Make sure to add this to subjects who need it.";
				}
			}


			if (entity == "tblstudymeas")
			{
				//Find groupIDs to delete
				//DataTable pks_to_delete


			}
			


			return msg2;
		}


		//public DataTable GetPks_to_Delete(string db, string schema, string tbl, string pkfld, string pks_to_keep)
		//{
		//    SQL_utils sql = new SQL_utils(db);
		//    DataTable dt = new DataTable();

		//    string sqlcode= "";

		//    if(tbl == "tblstudymeas" & pkfld=="groupID")
		//    {
		//        sqlcode = "select studymeasgroupID from tblstudymeasgroup where studymeasID = " + "x" + "  and " + pkfld +  " not in " + 
		//            "  (select val from dbo.fnSplitCSV_int('" + pks_to_keep + "'))"
		//    }
		//    dt = sql.DataTable_from_SQLstring()
		//}



		//public void ProcessGridAction(Hashtable hash, string mode, string entity, string str_studyid)
		//{
		//    string msg = "";

		//    if (entity == "tbltimepoint")
		//    {
		//        if (mode == "insert")
		//        {
		//            if (hash["studyID"] == "") hash["studyID"] = str_studyid;
		//            msg = this.oGrid_InsertData(hash, "tblTimepoint", "backend", "dbo", "TimepointID", 0);
		//        }
		//        else if (mode == "update")
		//        {
		//            msg = this.oGrid_UpdateData(hash, "tblTimepoint", "backend", "dbo", "TimepointID");
		//        }
		//        else if (mode == "delete")
		//        {
		//            msg = this.oGrid_DeleteData("tbltimepoint", "backend", "dbo", "timepointID", Convert.ToInt32(hash["timepointID"].ToString()), true);
		//        }
		//    }
		//    else if (entity == "tblgroup")
		//    {
		//        if (mode == "insert")
		//        {
		//            if (hash["studyID"] == "") hash["studyID"] = str_studyid;
		//            msg = this.oGrid_InsertData(hash, "tblGroup", "backend", "dbo", "groupID", 0);
		//        }
		//        else if (mode == "update")
		//        {
		//            msg = this.oGrid_UpdateData(hash, "tblGroup", "backend", "dbo", "groupID");
		//        }
		//        else if (mode == "delete")
		//        {
		//            msg = this.oGrid_DeleteData("tblGroup", "backend", "dbo", "groupID", Convert.ToInt32(hash["groupID"].ToString()), true);
		//        }
		//    }
		//    else if (entity == "tblsubjstatus")
		//    {
		//        if (mode == "insert")
		//        {
		//            if (hash["studyID"] == "") hash["studyID"] = str_studyid;
		//            msg = this.oGrid_InsertData(hash, "tblSS", "backend", "dbo", "ssID", 0);
		//        }
		//        else if (mode == "update")
		//        {
		//            msg = this.oGrid_UpdateData(hash, "tblSS", "backend", "dbo", "ssID");
		//        }
		//        else if (mode == "delete")
		//        {
		//            msg = this.oGrid_DeleteData("tblSS", "backend", "dbo", "ssID", Convert.ToInt32(hash["ssID"].ToString()), true);
		//        }
		//    }
		//    else if (entity == "tblstudyaction")
		//    {
		//        if (mode == "insert")
		//        {
		//            if (hash["studyID"] == "") hash["studyID"] = str_studyid;
		//            msg = this.oGrid_InsertData(hash, "tblStudyaction", "backend", "dbo", "studyactionID", 0);
		//        }
		//        else if (mode == "update")
		//        {
		//            msg = this.oGrid_UpdateData(hash, "tblStudyaction", "backend", "dbo", "studyactionID");
		//        }
		//        else if (mode == "delete")
		//        {
		//            msg = this.oGrid_DeleteData("tblStudyaction", "backend", "dbo", "studyactionID", Convert.ToInt32(hash["studyactionID"].ToString()), true);
		//        }
		//    }
		//    else if (entity == "tblstudymeas")
		//    {
		//        if (mode == "insert")
		//        {
		//            if (hash["groupIDs"] == "")
		//            {
		//                msg = "NOT SAVED. Select the groups that will get this measure (Ctl-click for multi-select).";
		//            }
		//            else
		//            {
		//                if (hash["studyID"] == "") hash["studyID"] = str_studyid;
		//                msg = this.oGrid_InsertData(hash, "tblStudymeas", "backend", "dbo", "studymeasID", 0);

		//                string[] groupIDs = hash["groupIDs"].ToString().Split(',');


		//                string newpk = msg.Replace("INSERTED! New pk = ", "");

		//                foreach (string s in groupIDs)
		//                {
		//                    Hashtable hash2 = new Hashtable();
		//                    hash2.Add("groupID", s);
		//                    hash2.Add("studymeasID", newpk);
		//                    string child_msg = this.oGrid_InsertData(hash2, "tblstudymeasgroup", "backend", "dbo", "studymeasgroupID", 0);

		//                    msg += child_msg;

		//                }
		//            }
		//        }
		//        else if (mode == "update")
		//        {

		//            msg = this.oGrid_UpdateData(hash, "tblStudymeas", "backend", "dbo", "studymeasID");


		//        }
		//        else if (mode == "delete")
		//        {

		//            msg = this.oGrid_DeleteData("tblStudymeas", "backend", "dbo", "studymeasID", Convert.ToInt32(hash["studymeasID"].ToString()), true);
		//        }
		//    }
		//    else
		//    {
		//        msg = "ProcessGridAction not completed for " + entity;
		//    }


		//    string additional_msg = this.PostProcessGridAction(mode, entity);

		//    Session[entity + "_msg"] = msg + additional_msg; // +"<br/>" + e.Record["objpk"].ToString();

		//    if (msg.StartsWith("NOT DELETED"))
		//    {
		//        if (entity == "tblstudymeas")
		//        {
		//            Session["studymeasID_toDelete"] = hash["studymeasID"].ToString();
		//            //btnOVERRIDE_studymeas.Visible = true;
		//        }
		//        else if (entity == "tblstudyaction")
		//        {
		//            Session["studyactionID_toDelete"] = hash["studyactionID"].ToString();
		//            //btnOVERRIDE_studyaction.Visible = true;
		//        }
		//    }

		//    //LoadEntity(entity);
		//}




		public string PostProcessGridAction(string mode, string entity)
		{
			//Handle any followup stuff that is needed.

			///things like:
			///change an action's name, then all actions in the subjects should change name too
			///change an action's timepoint, then all studymeas in it should change too
			///move and studymeas to a different studyaction, move it in subjects too


			string msg2 = "";

			if (mode == "insert")
			{
				if (entity == "studymeas")
				{
					msg2 = "<br/>Make sure to add this to subjects who need it.";
				}
				if (entity == "studyaction")
				{
					msg2 = "<br/>Make sure to add this to subjects who need it.";
				}
			}

			return msg2;
		}



	}
}