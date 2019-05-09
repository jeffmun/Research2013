using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;
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

		public DxReport(int dp_pk, int rptpk)
		{

			dataproj_pk = dp_pk;
			LoadFromDB(rptpk);
		}

		private void Initialize()
		{
			rptnum = GetRptnum();
			rpttitle = String.Format("Report #{0}", rptnum);
			rptdesc = "";
			orders = new SessionOrders();
		}

		private void LoadFromDB(int rptpk)
		{
			SQL_utils sql = new SQL_utils("data");
			DataTable dt = sql.DataTable_from_SQLstring("select dataproj_pk, rpttitle, rptdesc, rptnum, rptfilename from dp.Report where rptpk=" + rptpk.ToString());

			rptnum = Convert.ToInt32(dt.Rows[0]["rptnum"].ToString());
			rpttitle = dt.Rows[0]["rpttitle"].ToString();
			rptdesc = dt.Rows[0]["rptdesc"].ToString();

			//Load the orders
			DataTable dt_orders = sql.DataTable_from_SQLstring("select orderpk, ordernum, ordertype, worksheet, filter, vars, objects, orderbinary from dp.ReportOrder where rptpk=" + rptpk.ToString());

			if(dt_orders.HasRows())
			{
				orders = new SessionOrders();

				foreach (DataRow row in dt_orders.Rows)
				{
					byte[] orderbytes = (byte[])(row["orderbinary"]);
					DxChartOrder neworderC = new DxChartOrder();
					using (MemoryStream ms = new MemoryStream(orderbytes))
					{
						var ser2 = new BinaryFormatter();
						neworderC = (DxChartOrder)(ser2.Deserialize(ms));
						orders.chartorders.Add(neworderC);
						orders.orders.Add(neworderC);
					}
				}
			}


			sql.Close();

			
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

				string saveorders_msg = SaveOrdersToDB(sql, rptpk);

				result = String.Format("Report saved (with {0}).", saveorders_msg);

				sql.Close();
			}


			return result;
		}

		///HERE THU 4/18
		public string SaveOrdersToDB(SQL_utils sql, int rptpk)
		{
			try
			{
				foreach (DxChartOrder chartorder in orders.chartorders)
				{
					sql.SaveChartOrder(rptpk, chartorder);

				}
				return String.Format("{0} orders saved", orders.chartorders.Count);
			}
			catch(Exception ex)
			{
				return ex.Message;
			}
		}

	}

}