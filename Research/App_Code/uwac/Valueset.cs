using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace uwac
{
	/// <summary>
	/// Summary description for Valueset
	/// </summary>

	[Serializable]
	public class Valueset
	{
		public int localvaluesetid { get; set; }
		public int fieldvaluesetid { get; set; }
		public string valuesetname { get; set; }
		public List<Valuesetitem> valitems { get; set; }
		public int numtimesused { get; set; }

		public Valueset()
		{
			valitems = new List<Valuesetitem>();
		}
		public Valueset(string raw_vallabels)
		{
			string[] delimiter = new string[] { " | " };
			List<string> raw_vallabel = raw_vallabels.Split(delimiter, StringSplitOptions.RemoveEmptyEntries).ToList();

			if (raw_vallabel.Count > 0)
			{
				valitems = new List<Valuesetitem>();

				foreach (string raw_vl in raw_vallabel)
				{
					List<string> val_and_label = raw_vl.Split(new string[] { ", " }, StringSplitOptions.RemoveEmptyEntries).ToList();

					Valuesetitem vi = new Valuesetitem(Convert.ToInt32(val_and_label[0]), val_and_label[1]);
					if (vi != null)
					{
						valitems.Add(vi);
					}
				}
			}
		}

		public Valueset(string tblname, string fldname)
		{
			valitems = new List<Valuesetitem>();

			SQL_utils sql = new SQL_utils("data");

			DataTable dt = sql.DataTable_from_SQLstring(String.Format("select * from datFieldValueSetItem where fieldvaluesetid = " +
				" (select fieldvaluesetid from def.fld where tblpk={0} and fldname='{1}')", tblname, fldname));

			fieldvaluesetid = dt.AsEnumerable().Select(f => f.Field<int>("fieldvaluesetid")).Min();

			foreach (DataRow row in dt.Rows)
			{
				int val = Convert.ToInt32(row["FieldValue"]);
				string label = row["FieldValueLabel"].ToString();
				Valuesetitem itm = new Valuesetitem(val, label);

				valitems.Add(itm);
			}
			sql.Close();
		}


		public Valueset(int myvaluesetid)
		{
			valitems = new List<Valuesetitem>();
			fieldvaluesetid = myvaluesetid;

			SQL_utils sql = new SQL_utils("data");

			DataTable dt = sql.DataTable_from_SQLstring(String.Format("select * from datFieldValueSetItem where fieldvaluesetid = {0}", fieldvaluesetid));

			foreach (DataRow row in dt.Rows)
			{
				int val = Convert.ToInt32(row["FieldValue"]);
				string label = row["FieldValueLabel"].ToString();
				Valuesetitem itm = new Valuesetitem(val, label);

				valitems.Add(itm);
			}
			sql.Close();
		}

		public string LabelFromValue(int myvalue)
		{
			foreach (Valuesetitem itm in valitems)
			{
				if ((int)itm.value == myvalue) return itm.label;
			}
			return null;
		}


		public int ValueFromLabel(string mylabel)
		{
			foreach (Valuesetitem itm in valitems)
			{
				if (itm.label.ToLower() == mylabel.ToLower()) return (int)itm.value;
			}
			return -9876;
		}

	}

}