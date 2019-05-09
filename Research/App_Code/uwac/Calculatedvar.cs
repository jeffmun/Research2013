using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using uwac;


namespace uwac
{
	/// <summary>
	/// Summary description for Calculatedvar
	/// </summary>
	public class Calculatedvar
	{

		string fldname;
		string fieldlabel;
		string fldnames;
		string code;
		string calctype;

		public Calculatedvar()
		{
			//
			// TODO: Add constructor logic here
			//
		}


		public string CreateSqlCode()
		{
			if(calctype == "cutpoints")
			{
				return CreateCutpoints();
			}
			return null;
		}

		public string CreateCutpoints()
		{
			string result;

			string casebody = "";

			List<string> cutpoints = code.Split(',').ToList();

			for(int i=0; i < cutpoints.Count; i++)
			
			{
				string s = cutpoints[i];
				if (i < cutpoints.Count - 1)
				{
					casebody += String.Format(" when {0} <= {1} then '<= {1}' ", fldnames, s);
				} 
				else 
				{
					casebody += String.Format(" when {0} > {1} then '> {1}' ", fldnames, s);
				}
			}

			if(casebody != "")
				result = String.Format(", (case {0} else 'unassigned' end) as {1} ", casebody, fldname);
			else 
				result = String.Format(", 'error' as {1} ", casebody, fldname);

			return result;

		}


		public void SaveToDB()
		{
			SQL_utils sql = new SQL_utils("data");

			string sqlcode = String.Format("INSERT INTO[def].[Calculatedvar] ([fldname],[fieldlabel],[fldnames],[code],[calctype], created, createdby) VALUES('{0}','{1}','{2}','{3}','{4}', getdate(), sec.systemuser())"
				, fldname, fieldlabel, fldnames, code, calctype);

			sql.NonQuery_from_SQLstring(sqlcode);

		}


	}


	public enum Calctype
	{
		cut = 0,
		sqlcode = 1
	}
}