using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

using uwac;


namespace uwac
{
	/// <summary>
	/// Summary description for DxReport
	/// </summary>
	public class DxReport
	{
		public int dataproj_pk { get; set; }
		public string rpttitle { get; set; }
		public string rptdesc { get; set; }
		public int rptnum { get; set; }
		public SessionOrders orders { get; set; }


		public DxReport()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public DxReport(int dp_pk)
		{
			dataproj_pk = dp_pk;
			Initialize();
		}


		private void Initialize()
		{
			rptnum = GetRptnum();
			rpttitle = String.Format("Report #{0}", rptnum);
			rptdesc = "";
			orders = new SessionOrders();
		}

		private int GetRptnum()
		{
			SQL_utils sql = new SQL_utils("data");
			int nextrptnum = sql.IntScalar_from_SQLstring("select coalesce(max(rptnum),0)+1 from dp.Report where dataproj_pk=" + dataproj_pk.ToString());
			sql.Close();
			return nextrptnum;
		}

		public string RptFilename()
		{
			string filename = "none";
			if (rptnum>0 & dataproj_pk>0)
			{
				filename = String.Format("Rpt{0}_dataproj{1}_{2}.docx", rptnum, dataproj_pk, DateTime_Helper.DateTime_for_filename());
			}
			return filename;
		}

		public DataTable InvoiceSummary()
		{
			DataTable dt_orders = new InvoiceSummary(orders);
			return dt_orders;
		}

		public string SaveToDB()
		{
			string result = "";



			if (rptnum > 0 & dataproj_pk > 0)
			{
				SQL_utils sql = new SQL_utils("data");

				string sqlinsert = String.Format("insert into dp.Report (dataproj_pk, rptnum, rpttitle, rptdesc, rptfilename, created, createdBy) " + 
					" values({0},{1},'{2}','{3}', '{4}',getdate(), sec.systemuser())"
					, dataproj_pk, rptnum, rpttitle, rptdesc, RptFilename());

				sql.NonQuery_from_SQLstring(sqlinsert);

				int rptpk = sql.IntScalar_from_SQLstring(String.Format("select rptpk from dp.Report where dataproj_pk={0} and rptnum={1}", dataproj_pk, rptnum));

				//foreach(DxChartOrder chartorder in _chartorders)
				//{
					
				//}

				sql.Close();
			}


			return result;
		}

		///HERE THU 4/18
		//public string SaveOrdersToDB()
		//{
		//	foreach(DxOrder order in order)
		//}

	}

}