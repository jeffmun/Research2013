using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using NReco.PivotData;
using NReco.PivotData.File;
using NReco.PivotData.Output;
using uwac;

public partial class AC_CHDDrpt : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{




	}


	

	protected DataTable GetValantData_From_To2(List<string> rows, List<string> cols, List<string> functions, bool useGTE0)
	{

		//Note that this stored proc will create a single record for each patientID and determine the minimum agegroup and the dx for the period requested.
		SQL_utils sql = new SQL_utils("backend");

		DataTable dt = new DataTable();
		string sqlcode = String.Format("exec vtj.spCHDDrpt '{0}', '{1}'", txtDate1.Text, txtDate2.Text);

		dt = sql.DataTable_from_SQLstring(sqlcode);

		return dt;
	}



	protected void LoadYr2(Panel p, List<string> rows, List<string> cols, List<string> functions, string title, bool useGTE0, bool useFromTo)
	{


		DataTable dt = new DataTable();

		if (useFromTo)
		{
			dt = GetValantData_From_To2(rows, cols, functions, useGTE0);
		}
		else
		{
			//this branch no longer used
			//dt = GetValantData(rows, cols, functions, useGTE0);
		}





		List<string> keepCols = new List<string>();
		keepCols.AddRange(rows);
		keepCols.AddRange(cols);

		PivotData cube;
		PivotTable pivotTable;
		string[] aggr_labels = new string[functions.Count];

		if (functions.Count > 1)
		{
			IAggregatorFactory[] aggs = new IAggregatorFactory[functions.Count];

			for (int f = 0; f < functions.Count; f++)
			{
				if (functions[f] == "Sum")
				{
					aggs[f] = new SumAggregatorFactory("n");
					aggr_labels[f] = "sum n";
				}
				else if (functions[f] == "Monthly Avg")
				{
					aggs[f] = new AverageAggregatorFactory("amt");
					aggr_labels[f] = "Monthly Avg";
				}
				else if (functions[f] == "N Patients")
				{
					aggs[f] = new CountUniqueAggregatorFactory("patientID");
					aggr_labels[f] = "N Patients";
				}
				else if (functions[f] == "N Patients Dx")
				{
					aggs[f] = new CountUniqueAggregatorFactory("patientID_DX");
					aggr_labels[f] = "N Patients Dx";
				}
				else if (functions[f] == "N Patients Tx")
				{
					aggs[f] = new CountUniqueAggregatorFactory("patientID_TX");
					aggr_labels[f] = "N Patients Tx";
				}
				else if (functions[f] == "N Visits")
				{
					aggs[f] = new SumAggregatorFactory("n_appt");
					aggr_labels[f] = "N Visits";
				}
				else if (functions[f] == "N Visits Dx")
				{
					aggs[f] = new SumAggregatorFactory("n_appt_dx");
					aggr_labels[f] = "N Visits Dx";
				}
				else if (functions[f] == "N Visits Tx")
				{
					aggs[f] = new SumAggregatorFactory("n_appt_Tx");
					aggr_labels[f] = "N Visits Tx";
				}
 
			}

			CompositeAggregatorFactory compositeFactory = new CompositeAggregatorFactory(aggs);

			cube = new PivotData(keepCols.ToArray(), compositeFactory);
			cube.ProcessData(new DataTableReader(dt));
			pivotTable = new PivotTable(rows.ToArray(), cols.ToArray(), cube);

		}
		else
		{
			switch (functions[0])
			{
				case "Sum":
					cube = new PivotData(keepCols.ToArray(), new SumAggregatorFactory("n"));
					break;
				case "Monthly Avg":
					cube = new PivotData(keepCols.ToArray(), new AverageAggregatorFactory("amt"));
					break;
				case "N Patients":
					cube = new PivotData(keepCols.ToArray(), new CountUniqueAggregatorFactory("patientID"));
					break;
				default:
					cube = new PivotData(keepCols.ToArray(), new CountAggregatorFactory());

					break;
			}
			cube.ProcessData(new DataTableReader(dt));
			pivotTable = new PivotTable(rows.ToArray(), cols.ToArray(), cube);

		}




		var htmlResult = new StringWriter();

		var pvtHtmlWr = new MyHtmlWriter2(htmlResult);

		if (functions.Count >= 1)
		{
			pvtHtmlWr.FormatValue = (aggr, idx) =>
			{

				string newval = (Convert.ToDouble(aggr.Value.ToString()) >= 0) ? String.Format("{0:n0}", aggr.Value) : "<div class=\"negcell\">" + String.Format("{0:n0}", aggr.Value) + "</div>";
				return newval;
			};

			//pvtHtmlWr.FormatValue = (aggr, idx) => { return String.Format("{0:0}", aggr.Value); };
			pvtHtmlWr.FormatMeasureHeader = (aggr, idx) => { return aggr_labels[idx]; };

		}
		else
		{
			//pvtHtmlWr.FormatValue(aggr, idx) =>
			//{

			//    string newval = (Convert.ToDouble(aggr.Value.ToString()) >= 0) ? String.Format("{0:n0}", aggr.Value) : "<div class=\"negcell\">" + String.Format("{0:n0}", aggr.Value) + "</div>";
			//    return newval;
			//};
		}


		pvtHtmlWr.RowHeaderClass = "row1";
		pvtHtmlWr.ColumnHeaderClass = "col1";
		pvtHtmlWr.MeasureHeaderClass = "meashead";


		pvtHtmlWr.SubtotalDimensions = new string[] { "Direct" };
		pvtHtmlWr.SubtotalRows = true;

		pvtHtmlWr.AllowHtml = true;
		pvtHtmlWr.TotalsColumn = false;
		pvtHtmlWr.TotalsRow = true;
		pvtHtmlWr.GrandTotal = false;

		pvtHtmlWr.Write(pivotTable);


		Label header = new Label();
		header.Text = "<br/>" + title;
		header.Font.Size = 12;
		header.Font.Bold = true;

		Literal lit = new Literal();

		lit.Text = htmlResult.ToString();

		p.Controls.Add(header);
		p.Controls.Add(lit);



	}


	protected void btnLoad2_Click(object sender, EventArgs e)
	{


		bool useFromTo = true; // (!String.IsNullOrEmpty(txtDate1.Text) & !String.IsNullOrEmpty(txtDate2.Text)) ? true : false;

		List<string> cols = new List<string> { ddlMode.SelectedValue.ToString() };

	

		LoadYr2(panel1, new List<string> { "ptSex" }, cols, new List<string> { "N Patients", "N Visits", "N Patients Dx", "N Visits Dx", "N Patients Tx", "N Visits Tx" }, "by Sex", false, useFromTo);
		LoadYr2(panel1, new List<string> { "agegroup" }, cols, new List<string> { "N Patients", "N Visits", "N Patients Dx", "N Visits Dx", "N Patients Tx", "N Visits Tx" }, "by Age Group", false, useFromTo);
		LoadYr2(panel1, new List<string> { "CHDDpurpose_rpt" }, cols, new List<string> { "N Patients", "N Visits", "N Patients Dx", "N Visits Dx", "N Patients Tx", "N Visits Tx" }, "by Purpose", false, useFromTo);
		LoadYr2(panel1, new List<string> { "CHDDdiscipline" }, cols, new List<string> { "N Patients", "N Visits", "N Patients Dx", "N Visits Dx", "N Patients Tx", "N Visits Tx" }, "by Discipline<br/>(Patients seen by mutliple disciplines,<br/> but counted only once in the Totals)", false, useFromTo);

		LoadYr2(panel2, new List<string> { "CHDDdx1" }, cols, new List<string> { "N Patients", "N Visits", "N Patients Dx", "N Visits Dx", "N Patients Tx", "N Visits Tx" }, "by Diagnosis 1", false, useFromTo);
		LoadYr2(panel2, new List<string> { "CHDDdx1", "CHDDdx2" }, cols, new List<string> { "N Patients", "N Visits", "N Patients Dx", "N Visits Dx", "N Patients Tx", "N Visits Tx" }, "by Diagnosis 1 & 2", false, useFromTo);

		LoadYr2(panel3, new List<string> { "providerID" }, cols, new List<string> { "N Patients", "N Visits", "N Patients Dx", "N Visits Dx", "N Patients Tx", "N Visits Tx" }, "by Provider <br/>(Patients often seen by multiple providers,<br/> but counted only once in the Totals)", false, useFromTo);




	}


}



public class MyHtmlWriter2 : NReco.PivotData.Output.PivotTableHtmlWriter
{

	public MyHtmlWriter2(TextWriter writer)
		: base(writer)
	{

	}

	protected override void OnWriteValueCell(NReco.PivotData.Output.PivotTableHtmlWriter.ValueCellContext valueContext)
	{

		try
		{
			if (valueContext.RowKey.DimKeys.Contains("EQUIPMENT"))
			{
				valueContext.AddCssClass("cssDirectTotal");
			}
			if (valueContext.ColumnKey.DimKeys.Contains("Projected"))
			{
				valueContext.AddCssClass("cssProjected");
			}


		}
		catch (Exception ex) 
		{
			string x = ex.Message;
		}
	}


	protected override void OnWriteKeyCell(NReco.PivotData.Output.PivotTableHtmlWriter.KeyCellContext keyContext)
	{
		if (keyContext.Dimension == "FacilityName")
		{
			if ("Projected".Equals(keyContext.DimensionKey))
				keyContext.AddCssClass("cssProjected");
		}
	}

}

