using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using AutismCenterBase.Utilities;
using System.IO;
using System.Drawing;
using System.Text;
using SpreadsheetGear;
using uwac;
using uwac_controls;
using Obout.Grid;
using Obout.Interface;
using Obout.ComboBox;
using Obout.SuperForm;
using NReco.PivotData;
using NReco.PivotData.Input;
using NReco.PivotData.Output;

public partial class stats_xlstats : System.Web.UI.Page
{
	private DataSet ds = new DataSet();
	private List<string> subgroups = new List<string>();

	private string cornerText = "";

	private List<string> keepCols;
	private List<string> pivotValues;
	private List<string> pivotColumns;
	private int ncols_pre_pivot;
	private string A = "A123";
	private string B = "A123";
//    private string PivotTableHtml;

	#region Page Events
	//raise events on content page for the buttons on master page
	protected void Page_Init(object sender, EventArgs e)
	{
		Master.DDL_Master_SelectStudyID.SelectedIndexChanged += new EventHandler(Master_Study_Changed);

		if (!IsPostBack)
		{
	
		}

	}

	protected void Page_PreRender(object sender, EventArgs e)
	{
	
	}

	//If the master page default study is changed, update the Measure DDL
	protected void Master_Study_Changed(object sender, EventArgs e)
	{

	}

	


	protected void Page_Load(object sender, EventArgs e)
	{
		ClientScript.GetPostBackEventReference(this, string.Empty);

		string filename = "";
		int dataproj_pk = 0;
		
		if (Request.QueryString["filename"] != null) filename = Request.QueryString["filename"];
		if (Request.QueryString["dataproj_pk"] != null) dataproj_pk = Convert.ToInt32(Request.QueryString["dataproj_pk"]);


		if (filename != "")
		{
			if (filename.EndsWith(".xlsx"))
			{

			}
		}



		if (!IsPostBack)
		{
			
			if (filename != "")
			{
				if (filename.EndsWith(".xlsx"))
				{

					ProcessXLdata(filename);
					
					// Write the DataSet to the ViewState property.
//					System.IO.StringWriter sw = new System.IO.StringWriter();
//					ds.WriteXml(sw);
//					ViewState["ds"] = sw.ToString();

				}
			}
			else if (dataproj_pk > 0)
			{
				ProcessXLdata(dataproj_pk);
			}
			else
			{
				LoadDataProjects();
			}
			LoadRadioButtonLists();

		}
		else
		{
			//System.IO.StringReader sr = new
			//System.IO.StringReader((string)(ViewState["ds"])); ds.ReadXml(sr);

		}
		

	}
	#endregion


	protected void    LoadDataProjects()
	{

		SQL_utils sql = new SQL_utils();

		DataTable dt = sql.DataTable_from_SQLstring("select dataproj_pk, cast(dataproj_pk as varchar) + '. ' + projTitle as projTitlePK from dp.DataProject where studyID = " +
			Master.Master_studyID.ToString());

		ddlDataProj.DataSource = dt;
		ddlDataProj.DataBind();

		sql.Close();
	}


	protected void LoadDataProject()
	{

		string dataproj_pk = ddlDataProj.SelectedValue.ToString();

		ddlDataProj.DataBind();

	}



	protected void AddSummaryToPanel(DataSet ds, Panel p)
	{

		HtmlTable t = new HtmlTable();
		HtmlTableRow r0 = new HtmlTableRow();
		HtmlTableRow r1 = new HtmlTableRow();
		HtmlTableCell c = new HtmlTableCell();

		Label l = new Label();
		l.Text = "<br/>" + ds.Tables[0].TableName;
		l.Font.Bold = true;
		l.Font.Size = 14;
		c.Controls.Add(l);
		c.ColSpan = 2;
		r0.Cells.Add(c);


		HtmlTableCell c0 = AddSummaryToCell(ds.Tables[0], "(numeric)", 10);
		c0.Width = "600px";
		r1.Cells.Add(c0);

		if (ds.Tables.Count > 1)
		{
			HtmlTableCell c1 = AddSummaryToCell(ds.Tables[1], "(text)", 10);
			c0.Width = "800px";
			r1.Cells.Add(c1);
		}

		t.Rows.Add(r0);
		t.Rows.Add(r1);

		p.Controls.Add(t);

	}

	protected HtmlTableCell AddSummaryToCell(DataTable dt, string labeltext, int fontsize)
	{
		HtmlTableCell c = new HtmlTableCell();

		Label l = new Label();
		l.Text = labeltext;
		l.Font.Bold = true;
		l.Font.Size = fontsize;
		l.ForeColor = System.Drawing.Color.Navy;

		GridView g = new GridView();
		g.DataSource = dt;
		g.DataBind();

		c.VAlign = "top";
		c.Controls.Add(l);
		c.Controls.Add(g);

		return c;
	}


	protected void AddTableToGrid(DataTable dt, Panel p )
	{

		AddTableToGrid(dt, p, "");

	}


	protected void AddTableToGrid(DataTable dt, Panel p, string text2)
	{
		if (dt != null)
		{
			Label l = new Label();

			string tblname = (dt.TableName != null) ? dt.TableName : " ";

			l.Text = "<br/>" + tblname;
			l.Font.Bold = true;
			l.Font.Size = 14;
			p.Controls.Add(l);

			if(text2 != "")
			{
				Label l2 = new Label();
				l2.Text = "<br/>" + text2;
				l2.Font.Size = 10;
				p.Controls.Add(l2);

			}

			GridView g = new GridView();
			g.DataSource = dt;
			g.DataBind();
			p.Controls.Add(g);
		}
		else
		{
			Label l = new Label();
			//l.Text = "<br/>Table is NULL." ;
			p.Controls.Add(l);
			
		}
	}



	protected void LoadRadioButtonLists()
	{
		SQL_utils sql = new SQL_utils();
		bool allowTxGroup = true;

		List<string> btn_text = new List<string> { "--None--", "Group", "Timepoint", "Tx Group" };
		List<string> btn_val = new List<string> { "none", "Group", "TimePoint", "txgrp" };
		for (int i = 0; i < btn_text.Count; i++)
		{
			if (btn_text[i] != "Tx Group")
			{
				rbl1.Items.Add(new System.Web.UI.WebControls.ListItem(btn_text[i], btn_val[i]));
				rbl2.Items.Add(new System.Web.UI.WebControls.ListItem(btn_text[i], btn_val[i]));
				rbl3.Items.Add(new System.Web.UI.WebControls.ListItem(btn_text[i], btn_val[i]));
			}
			else if (btn_text[i] == "Tx Group")
			{
				int istx = sql.IntScalar_from_SQLstring("select uwautism_research_backend.dbo.fnIsTxStudy(" + Master.Master_studyID.ToString() + ") as x");

				if (istx == 1)  //Only add this if it is a treatment group
				{
					rbl1.Items.Add(new System.Web.UI.WebControls.ListItem(btn_text[i], btn_val[i]));
					rbl2.Items.Add(new System.Web.UI.WebControls.ListItem(btn_text[i], btn_val[i]));
					rbl3.Items.Add(new System.Web.UI.WebControls.ListItem(btn_text[i], btn_val[i]));

					if (!allowTxGroup)  //However, this should only be enabled based on permission
					{
						rbl1.Items[i].Enabled = false;
						rbl2.Items[i].Enabled = false;
						rbl3.Items[i].Enabled = false;
					}
				}

			}

		}

		sql.Close();

		rbl1.SelectedIndex = 1;
		rbl2.SelectedIndex = 2;
		rbl3.SelectedIndex = 0;
	}




	protected void ProcessXLdata(int dataproj_pk)
	{

		SQL_utils sql = new SQL_utils();


		//DataProject
		DataTable dtinfo = sql.DataTable_from_SQLstring("select filename, N_subjects, N_measures, N_studymeas, N_datarows, N_datacols, created, TimeSinceCreated, createdBy " + 
			" from dp.vwDatafile where dataproj_pk = " + dataproj_pk.ToString() + " and isDeleted=0 " +  
			" and created = (select max(created) from dp.vwDatafile where dataproj_pk = "  + dataproj_pk.ToString() + "  and isDeleted=0 )");

		string projTitle = sql.StringScalar_from_SQLstring("select projTitle from dp.DataProject where dataproj_pk = " + dataproj_pk.ToString());

		dtinfo.TableName = projTitle ;
		
		AddTableToGrid(dtinfo, panel_fileinfo, "Info from last file created:");


		//Measures
		DataTable dtmeas = sql.DataTable_from_SQLstring("exec dp.spDataProject_Meas " + dataproj_pk.ToString()); 

		AddTableToGrid(dtmeas, panel_meas_data);



		sql.Close();

		}


	protected void ProcessXLdata(string filename)
	{

		ds = SpreadsheetGearUtils.GetDataSet(filename, false);

		Session["ds"] = ds;

		//ds = SpreadsheetGearUtils.GetDataSet_bin(filename);

		int n_tables = ds.Tables.Count;

		//ds = utilStats.LoadXLData(filename);

		//try
		//{
		//    ds.Tables.Remove("IntHx_by_TYPE");
		//    //add a link here to a page to view the IntHx stuff??
		//}
		//catch (Exception ex)
		//{ }

		//try
		//{
		//    ds.Tables.Remove("IntHx_by_CAT");
		//    //add a link here to a page to view the IntHx stuff??
		//}
		//catch (Exception ex)
		//{ }




		AddTableToGrid(ds.Tables["fileinfo"], panel_fileinfo);

		//AddTableToGrid(ds.Tables["Measures"], panel_meas);

		gvMeasures.DataSource = ds.Tables["Measures"];
		gvMeasures.DataBind();

	}



	

	protected void ShowMeasureData(string measname)
	{
		//FINISH THIS UP!!
		
		AddTableToGrid(ds.Tables[measname], panel_meas_data);

	}


	protected void ProcessXLdata_Subjects(string filename)
	{
		//DataSet ds = LoadXLData(Request.QueryString["filename"]);

		AddTableToGrid(ds.Tables["fileinfo"], panel_fileinfo);

		AddTableToGrid(ds.Tables["Measures"], panel_meas);

		gridSUBJECTS.DataSource = ds.Tables["subjects"];
		gridSUBJECTS.DataBind();

		panel_subjects.Visible = true;

		panel_datadict.Visible = false;
	}




	protected void ProcessXLdata_DataDict(string filename)
	{
		//DataSet ds = LoadXLData(Request.QueryString["filename"]);

		AddTableToGrid(ds.Tables["fileinfo"], panel_fileinfo);

		AddTableToGrid(ds.Tables["Measures"], panel_meas);


		gridDATADICT.DataSource = ds.Tables["DataDict"];
		gridDATADICT.DataBind();

		panel_datadict.Visible = true;
		panel_subjects.Visible = false;
	}

	protected void DataSet_to_XML()
	{

		string xmlSchema = ds.GetXmlSchema();
		string xmlData = ds.GetXml();

		int foo = 0;

	}


	protected void PivotMeasure(string tblname)
	{
		List<string> pivotRows = cblRows.Items.Cast<ListItem>().Where(x => x.Selected).Select(x => x.Value).ToList();
		List<string> pivotCols = cblCols.Items.Cast<ListItem>().Where(x => x.Selected).Select(x => x.Value).ToList();

		DataSet ds = (DataSet)Session["ds"];
	   
		DataTable dt = ds.Tables[tblname];

		if (dt.Rows.Count > 0)
		{
			List<string> keepCols = new List<string> { "ID", "Group", "subjstatus", "txgrp", "timepointnum", "TimePoint" };

			var fieldToIdx = new Dictionary<string,int>() {
				{"ID", 0},
				{"Group", 1},
				{"subjstatus", 2},
				{"txgrp", 3},
				{"timepointnum", 4},
				{"TimePoint", 5}
			};

			//Right now I am just processing a single field/variable but I would like to be able to pass in a list or array of the fields/variables
			string fldname = "mucss";
			List<string> vars_to_process = new List<string> { "mucss", "muvragee" };

			List<string> requested_stats = cblStats.Items.Cast<ListItem>().Where(n => n.Selected).Select(n => n.Value).ToList();

			IAggregatorFactory[] aggs = new IAggregatorFactory[requested_stats.Count];

			CountAggregatorFactory aggrN = new CountAggregatorFactory();
			AverageAggregatorFactory aggrM = new AverageAggregatorFactory(fldname);
			VarianceAggregatorFactory aggrSD = new VarianceAggregatorFactory(fldname, VarianceAggregatorValueType.StandardDeviation);
			MinAggregatorFactory aggrMin = new MinAggregatorFactory(fldname);
			MaxAggregatorFactory aggrMax = new MaxAggregatorFactory(fldname);
			SumAggregatorFactory aggrSum = new SumAggregatorFactory(fldname);

			int counter = 0;
			foreach (string s in requested_stats)
			{
				if (s == "M") aggs[counter] = aggrM;
				else if (s == "SD") aggs[counter] = aggrSD;
				else if (s == "N") aggs[counter] = aggrN;
				else if (s == "Min") aggs[counter] = aggrMin;
				else if (s == "Max") aggs[counter] = aggrMax;
				else if (s == "Sum") aggs[counter] = aggrSum;
				counter++;
			}

			CompositeAggregatorFactory compositeFactory = new CompositeAggregatorFactory(aggs);

			Func<object,string,object> getValue = (r, f) => {
				return ((object[])r)[ fieldToIdx[f] ];
			};

			var cube = new PivotData(keepCols.ToArray(), compositeFactory);


			Parallel.ForEach(vars_to_process.AsEnumerable(), (t) =>
				{
					var varPivotData = new PivotData(keepCols.ToArray(), compositeFactory);
					varPivotData.ProcessData(t, getValue);
					lock (cube)
					{
						cube.Merge(varPivotData);
					}
				});

			cube.ProcessData(new DataTableReader(dt));


			var allKeys = cube.GetDimensionKeys(); // returns array of keys for each dimension

			var pivotTable = new PivotTable(
				pivotRows.ToArray(), // row dimension(s)
				pivotCols.ToArray(), // column dimension(s)
				cube);


			var htmlResult = new StringWriter();
			var pvtHtmlWr = new PivotTableHtmlWriter(htmlResult);

			string[] aggr_labels = requested_stats.ToArray();

			pvtHtmlWr.FormatValue = (aggr, idx) => { return String.Format("{0:0.##}", aggr.Value); };
			pvtHtmlWr.FormatMeasureHeader = (aggr, idx) => { return aggr_labels[idx]; };

			pvtHtmlWr.TotalsColumn = false;
			pvtHtmlWr.TotalsRow = false;
			pvtHtmlWr.GrandTotal = false;

			pvtHtmlWr.Write(pivotTable);

			Label header = new Label();
			header.Text = "<br/><br/>" + dt.TableName;
			header.Font.Size = 12;
			header.Font.Bold = true;

			Literal lit = new Literal();
			lit.Text = htmlResult.ToString();

			panel1.Controls.Add(header);
			panel1.Controls.Add(lit);

			var jsonResult = new StringWriter();
			var pvtJsonWr = new PivotTableJsonWriter(jsonResult);

			pvtJsonWr.Write(pivotTable);


		}

	}


	static IEnumerable<object[]> GetDataChunks(List<string> keepCols, List<string> vars_to_process)
	{

		//foreach(string v in vars_to_process)
		//{
		//    var t = new DataTable
		//}


		var names = new string[] { "John", "Mary", "Steve", "Bob", "Pit", "Peter" };
		var companies = new string[] { "Google", "Microsoft", "Facebook", "Yahoo" };

		for (int i = 0; i < 50; i++)
		{
			var t = new object[100000][];

			for (int j = 0; j < t.Length; j++)
			{
				t[j] = new object[] { 
						names[j%names.Length], 
						(15+(j+i))%40, 
						companies[j%companies.Length],
						new DateTime(2000+(i+j)%15, j%12+1, (i+j)%27+1 ),
						(i+j)%20
					};
			}

			yield return t;
		}
	}

	protected void PivotMeasure_single(string tblname)
	{
		List<string> pivotRows = cblRows.Items.Cast<ListItem>().Where(x => x.Selected).Select(x => x.Value).ToList();
		List<string> pivotCols = cblCols.Items.Cast<ListItem>().Where(x => x.Selected).Select(x => x.Value).ToList();


		if (rbl_VarRowCol.SelectedValue=="Row") pivotRows.Add("Variable");
		else if (rbl_VarRowCol.SelectedValue == "Column") pivotCols.Add("Variable");


		//ds = SpreadsheetGearUtils.GetDataSet(filename, true);
		DataSet ds = (DataSet)Session["ds"];


		DataTable dt = ds.Tables[tblname];


		if (dt.Rows.Count > 0)
		{

			List<string> keepCols = new List<string> { "ID", "Group", "subjstatus", "txgrp", "timepointnum", "TimePoint"};

			//DataTable dt2 = utilPivot.Pivot(dt, keepCols, "Variable", "Value");
			string fldname = "Value";
			List<string> vars_to_process = new List<string> { "mucss", "mucoiq", "murlagee", "muelagee", "muvragee", "mufmagee" };



			DataTable dtStacked = utilStats.StackData(dt, keepCols, vars_to_process);

			keepCols.Add("Variable");


			List<string> requested_stats = cblStats.Items.Cast<ListItem>().Where(n => n.Selected).Select(n => n.Value).ToList();

			IAggregatorFactory[] aggs = new IAggregatorFactory[requested_stats.Count];

			CountAggregatorFactory aggrN = new CountAggregatorFactory();
			AverageAggregatorFactory aggrM = new AverageAggregatorFactory(fldname);
			VarianceAggregatorFactory aggrSD = new VarianceAggregatorFactory(fldname, VarianceAggregatorValueType.StandardDeviation);
			MinAggregatorFactory aggrMin = new MinAggregatorFactory(fldname);
			MaxAggregatorFactory aggrMax = new MaxAggregatorFactory(fldname);
			SumAggregatorFactory aggrSum = new SumAggregatorFactory(fldname);

			int counter = 0;
			foreach (string s in requested_stats)
			{
				if (s == "M") aggs[counter] = aggrM;
				else if (s == "SD") aggs[counter] = aggrSD;
				else if (s == "N") aggs[counter] = aggrN;
				else if (s == "Min") aggs[counter] = aggrMin;
				else if (s == "Max") aggs[counter] = aggrMax;
				else if (s == "Sum") aggs[counter] = aggrSum;
				counter++;
			}

			CompositeAggregatorFactory compositeFactory = new CompositeAggregatorFactory(aggs);



			var cube = new PivotData(keepCols.ToArray(), compositeFactory);

			cube.ProcessData(new DataTableReader(dtStacked));


			var allKeys = cube.GetDimensionKeys(); // returns array of keys for each dimension

			var pivotTable = new PivotTable(
				pivotRows.ToArray(), // row dimension(s)
				pivotCols.ToArray(), // column dimension(s)
				cube);


			//DataTable foo = new DataTable();

			//PivotTableDataTableWriter dtwriter = new PivotTableDataTableWriter("foo");

			//DataTable foo = dtwriter.Write(pivotTable);

			//GridView gv = new GridView();
			//gv.DataSource = foo;
			//gv.DataBind();
			//panel_foo.Controls.Add(gv);

			var htmlResult = new StringWriter();
			var pvtHtmlWr = new PivotTableHtmlWriter(htmlResult);

			string[] aggr_labels = requested_stats.ToArray();

			pvtHtmlWr.FormatValue = (aggr, idx) => { return String.Format("{0:0.##}", aggr.Value); };
			pvtHtmlWr.FormatMeasureHeader = (aggr, idx) => { return aggr_labels[idx]; };

			pvtHtmlWr.TotalsColumn = false;
			pvtHtmlWr.TotalsRow = false;
			pvtHtmlWr.GrandTotal = false;

			pvtHtmlWr.Write(pivotTable);

			Label header = new Label();
			header.Text = "<br/><br/>" + dt.TableName;
			header.Font.Size = 12;
			header.Font.Bold = true;

			Literal lit = new Literal();
			lit.Text = htmlResult.ToString();

			panel1.Controls.Add(header);
			panel1.Controls.Add(lit);

			var jsonResult = new StringWriter();
			var pvtJsonWr = new PivotTableJsonWriter(jsonResult);

			pvtJsonWr.Write(pivotTable);


		}

	}



	protected void CreatePivotTable(string tblname, List<string> flds_to_process)
	{
		List<string> pivotRows = cblRows.Items.Cast<ListItem>().Where(x => x.Selected).Select(x => x.Value).ToList();
		List<string> pivotCols = cblCols.Items.Cast<ListItem>().Where(x => x.Selected).Select(x => x.Value).ToList();


		//ds = SpreadsheetGearUtils.GetDataSet(filename, true);
		DataSet ds = (DataSet)Session["ds"];


		DataTable dt = ds.Tables[tblname];


		if (dt.Rows.Count > 0)
		{

			List<string> keepCols = new List<string> { "ID", "Group", "subjstatus", "txgrp", "timepointnum", "TimePoint" };

			//List<string> flds_to_process = new List<string> { "mucss", "mucoiq", "murlagee", "muelagee", "muvragee", "mufmagee" };

			List<string> requested_stats = cblStats.Items.Cast<ListItem>().Where(n => n.Selected).Select(n => n.Value).ToList();


			List<utilPivotTable.AggrFx> req_aggrfx = utilPivotTable.StringToAggrFx(requested_stats);

			PivotTable pivotTable = utilPivotTable.DataTable_to_PivotTable(dt, keepCols, pivotRows, pivotCols, flds_to_process, req_aggrfx, rbl_VarRowCol.SelectedValue);



			//var dataTableWr = new PivotTableDataTableWriter("Test");
			//var foo = dataTableWr.Write(pivotTable);

			//GridView gv = new GridView();
			//gv.DataSource = foo;
			//gv.DataBind();
			//panel_foo.Controls.Add(gv);

			var htmlResult = new StringWriter();
			var pvtHtmlWr = new PivotTableHtmlWriter(htmlResult);

			string[] aggr_labels = requested_stats.ToArray();

			pvtHtmlWr.FormatValue = (aggr, idx) => { return String.Format("{0:0.##}", aggr.Value); };
			pvtHtmlWr.FormatMeasureHeader = (aggr, idx) => { return aggr_labels[idx]; };

			pvtHtmlWr.TotalsColumn = false;
			pvtHtmlWr.TotalsRow = false;
			pvtHtmlWr.GrandTotal = false;

			pvtHtmlWr.Write(pivotTable);


			Label header = new Label();
			header.Text = "<br/><br/>" + dt.TableName;
			header.Font.Size = 12;
			header.Font.Bold = true;

			Literal lit = new Literal();
			lit.Text = htmlResult.ToString();

			panel1.Controls.Add(header);
			panel1.Controls.Add(lit);

			//var jsonResult = new StringWriter();
			//var pvtJsonWr = new PivotTableJsonWriter(jsonResult);

			//pvtJsonWr.Write(pivotTable);


		}

	}




//    protected void ProcessXLdata_Summary (string filename)
	protected void Summarize_Measures_in_XL (string filename)
	{
		
		if (!String.IsNullOrEmpty(filename))
		{

			//Process thepivot table selections
			List<string> pivotRows = cblRows.Items.Cast<ListItem>().Where(x => x.Selected).Select(x => x.Value).ToList();
			List<string> pivotCols = cblCols.Items.Cast<ListItem>().Where(x => x.Selected).Select(x => x.Value).ToList();

			List<String> pivotVars = pivotRows;
			pivotVars.AddRange(pivotCols);

			//Remove dups from selected columns
			List<string> duplicateKeys = pivotVars.GroupBy(x => x)
				.Where(group => group.Count() > 1)
				.Select(group => group.Key).ToList();



			foreach (string dup in duplicateKeys)
			{
				pivotCols.Remove(dup);
			}

			pivotVars = pivotVars.Distinct().ToList();


			//Add checks to make sure that stats and Variable are selected
			bool continueflag = true;
			if (!pivotVars.Contains("stats"))
			{
				continueflag = false;
			}
			else if (!pivotVars.Contains("Variable"))
			{
				continueflag = false;
			}

			if (continueflag)
			{


				ds = SpreadsheetGearUtils.GetDataSet(filename, true);

				panel_datadict.Visible = false;
				panel_subjects.Visible = false;

				//        DataSet ds = (DataSet)ViewState["ds"];

				AddTableToGrid(ds.Tables["fileinfo"], panel_fileinfo);
				AddTableToGrid(ds.Tables["Measures"], panel_meas);


				DataTable dict = ds.Tables["DataDict"];


				//var meas = ds.Tables["Measures"].Rows.OfType<DataRow>()
				//    .Select(dr => dr.Field<string>("measname")).ToList();

				DataTable dt_meas = ds.Tables["Measures"];

				List<string> meas = dt_meas.AsEnumerable()
					.Select(dr => dr.Field<string>("measname")).ToList();


				//var meas = dt_meas.AsEnumerable()
				//    .Select(dr => dr.Field<string>("measname")).ToList();


				List<string> exclude_tables = new List<string> { "fileinfo", "Subjects", "Subjects_excluded", "DataDict", "Measures", "M-CHAT" };

				//Loop through each table and get the descriptive stats summary for all
				//numeric and text variables. 
				foreach (DataTable dt in ds.Tables)
				{
					if (!exclude_tables.Contains(dt.TableName))
					{

						if (meas.Contains(dt.TableName))
						{
							var vars = from row in dict.AsEnumerable()
									   where row.Field<string>("measname") == dt.TableName
									   select row;

							if (dt.TableName.StartsWith("IntHx_by_"))
							{
								Label lbl = new Label();
								lbl.Text = "<br/><br/>" + dt.TableName + " is also in this data file (" + dt.Rows.Count.ToString() + " records).";
								lbl.Font.Bold = true;
								panel1.Controls.Add(lbl);
							}
							else
							{

								if (dt.TableName.StartsWith("Mul"))
								{
									//process selected groupingvars




									////List<string> grpvars = new List<string> { "Group", "TimePoint", "txgrp" };



									////List<string> requested_stats = new List<string> { "M", "SD", "N"  }; //, "SD", "N", "Min" };

									//List<string> requested_stats = cblStats.Items.Cast<ListItem>().Where(n => n.Selected).Select(n => n.Value).ToList();


									//DataTable grp_stats = utilStats.DataTable_DescStats_ByGroup(dt, dt.TableName, ds.Tables["DataDict"], pivotVars, "stacked", false, requested_stats); //, rbl_stackwide.SelectedValue.ToString());


									////keepCols = new List<string> {"TimePoint", "Variable", "Label"};
									////pivotValues = new List<string> { "M", "SD", "N"} ; //, "SD", "N", "Min" };
									////string pivotColumn = "Group";


									//keepCols = new List<string> { "Group", "Variable", "Label", "stat" };

									

									//string pivotColumn = "TimePoint";


									//cornerText = dt.TableName;


									////List<string> pivotColumns = new List<string> {
									////"Group", "TimePoint" };
									//pivotValues = new List<string> { "statvalue" }; //, "SD", "N", "Min" };

									////DataTable grp_stats1 = utilPivot.Pivot(grp_stats, keepCols, "TimePoint", pivotValues);

									////DataTable grp_stats2 = utilPivot.PivotX(grp_stats, keepCols, pivotColumns, pivotValues);



									#region tofix
									var cube = new PivotData(pivotVars.ToArray(), new VarianceAggregatorFactory("value"));


									cube.ProcessData(new DataTableReader(dt));


									var allKeys = cube.GetDimensionKeys(); // returns array
									// of keys for
									// each dimension
									var GroupKeys = allKeys[0]; // dimension at index=0 is "Product"
									var TimePointKeys = allKeys[1]; // dimension at index=1 is "Country"

									var pivotTable = new PivotTable(
										pivotRows.ToArray(), // row dimension(s)
										pivotCols.ToArray(), // column dimension(s)
										cube);


									var htmlResult = new StringWriter();
									var pvtHtmlWr = new PivotTableHtmlWriter(htmlResult);
									pvtHtmlWr.Write(pivotTable);


									Label header = new Label();
									header.Text = "<br/><br/>" + dt.TableName;
									header.Font.Size = 12;
									header.Font.Bold = true;

									Literal lit = new Literal();
									lit.Text = htmlResult.ToString();

									panel1.Controls.Add(header);
									panel1.Controls.Add(lit);
									#endregion


									//GridView gv = new GridView();
									//gv.DataSource = pivotTable; gv.DataBind();


									//Row and column keys are represented by pvtTbl.RowKeys and pvtTbl.ColumnKeys collections; 
									//values / totals could be accessed by indexer (for example: pvtTbl[0,0].Value ) 
									//or by row+column key (for example: pivotData[new Key(new DateTime(2012, 3, 30, 11, 42, 00)), new Key(4)].Value ).


									//pivotColumn = "Group";
									//List<string> keepCols2 = new List<string> {  "Variable", "Label", "stat" };
									//DataTable grp_stats3 = utilPivot.Pivot(grp_stats2,
									//keepCols2, pivotColumn, pivotValues);



									//GridView gv = utilPivot.FixHeadersAfterPivot(grp_stats2, keepCols, pivotColumn, pivotValues, "foo");
									//panel1.Controls.Add(gv);



									//GridView gv0 = new GridView();
									//gv0.DataSource = grp_stats1;
									//gv0.DataBind();
									//panel1.Controls.Add(gv0);

									//GridView gv1 = new GridView();
									//gv1.DataSource = grp_stats3;
									//gv1.DataBind();
									//panel1.Controls.Add(gv1);



									if (1 == 2)
									{
										//get descriptives table
										DataSet stats = utilStats.DataTable_Summary(dt, vars.CopyToDataTable());


										stats.Tables[0].TableName = dt.TableName + " Summary";

										if (stats.Tables.Count > 1)
										{
											stats.Tables[1].TableName = dt.TableName + " Summary (text)";
										}

										AddSummaryToPanel(stats, panel1);
										//AddTableToGrid(stats.Tables[0], panel1);
										//AddTableToGrid(stats.Tables[1], panel1);
									}

								}
							}
						}
						else
						{
							//AddTableToGrid(dt, panel1);
						}
					}
				}
			}
			else
			{
				//need to select variable & stats
			}
		}

	}




	//protected void FixHeadersAfterPivot(GridView gv, List<string> keepCols, List<string> pivotValues, int ncols_pre_pivot)
	//{
	//    //if (e.Row.RowType == DataControlRowType.Header)
	//    //{
	//    //    GridView HeaderGrid = (GridView)sender;

	//        GridViewRow eRow = gv.Rows[0];

	//        //create the new corner cell
	//        int ncols = gv.Columns.Count;
	//        int ncols_in_pivot = ncols_pre_pivot - keepCols.Count;

	//        GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
	//        TableCell HeaderCell = new TableCell();
	//        HeaderCell.Text = cornerText;
	//        HeaderCell.ColumnSpan = keepCols.Count;
	//        HeaderCell.CssClass = "foo2";
	//        HeaderGridRow.Cells.Add(HeaderCell);

	//        //create cells for each pivotValue
	//        for (int i = 0; i < pivotValues.Count; i++)
	//        {
	//            int ncells_in_set = ncols_in_pivot / pivotValues.Count;
	//            HeaderCell = new TableCell();
	//            HeaderCell.Text = pivotValues[i];
	//            HeaderCell.ColumnSpan = ncells_in_set;
	//            HeaderCell.CssClass = "foo1";
	//            HeaderGridRow.Cells.Add(HeaderCell);

	//            //Change the text (by removing the pivotValue from the existing
	//            //header row)
	//            for (int j = 0; j < ncells_in_set; j++)
	//            {
	//                int idx = keepCols.Count + (i * ncells_in_set) + j;
	//                eRow.Cells[idx].Text = eRow.Cells[idx].Text.Replace("_" + pivotValues[i], "");
	//            }
	//        }

	//        //gvMergeHeader.Controls[0].Controls.AddAt(0, HeaderGridRow);
	//        gv.Controls[0].Controls.AddAt(0, HeaderGridRow);

	//    //}
	//}



	protected List<string> GetSubgroups()
	{
		List<string> s = new List<string>();
		s.Clear();
		if (rbl1.SelectedValue != "none") s.Add(rbl1.SelectedValue);
		if (rbl2.SelectedValue != "none" & rbl2.SelectedValue != rbl1.SelectedValue) s.Add(rbl2.SelectedValue);
		if (rbl3.SelectedValue != "none" & rbl3.SelectedValue != rbl1.SelectedValue & rbl3.SelectedValue != rbl2.SelectedValue) s.Add(rbl3.SelectedValue);

		if (s.Count == 0) s.Add("");

		return s;

	}



	protected void Display_DescStats_for_dset(string filename)
	{
		ds = SpreadsheetGearUtils.GetDataSet(filename);

		panel_datadict.Visible = false;
		panel_subjects.Visible = false;
		AddTableToGrid(ds.Tables["fileinfo"], panel_fileinfo);
		AddTableToGrid(ds.Tables["Measures"], panel_meas);

		subgroups = GetSubgroups();
		ViewState["subgroups"] = subgroups;


		var meas = ds.Tables["Measures"].Rows.OfType<DataRow>()
			.Select(dr => dr.Field<string>("measname")).ToList();


		List<string> excl = new List<string> { "fileinfo", "subjects", "subjects_excluded", "DataDict", "Measures" };

		//Loop through each table and get the descriptive stats summary for all
		//numeric and text variables. 
		foreach(DataTable dtorig in ds.Tables)
		{
			DataTable dt = dtorig.Copy();
			if (!excl.Contains(dt.TableName) )
			{
				if(meas.Contains(dt.TableName))
				{
					//if (dt.TableName == "Mullen") {

						//just send those where InAnalysis = 2
						DataTable dict = ds.Tables["DataDict"];


						List<string> vars2 = (from row in dict.AsEnumerable()
								   where row.Field<string>("measname") == dt.TableName & row.Field<string>("InAnalysis")=="2"
								   select row.Field<string>("varname")).ToList<string>();


						vars2.AddRange(subgroups); //Add in the grouping variables too

						List<string> vars_to_remove = new List<string>();

						foreach(DataColumn col in dt.Columns)
						{
							if(!vars2.Contains(col.ColumnName))
							{
								vars_to_remove.Add(col.ColumnName);
							}
						}

						foreach (string x in vars_to_remove)
						{
							dt.Columns.Remove(x);
						}


						Display_DescStats_for_table(dt, subgroups);
					//}
				}
			}
		}
	}

	
	protected void Display_DescStats_for_table(DataTable dt, List<string> groupvars)
	{
		int counter=0;
		DataTable dt_desc = new DataTable();
		string tname = dt.TableName;


		counter++;


		//dt_desc = utilStats.DataTable_DescStats_ByGroup(dt, tname, subgroups);
		////, rbl_stackwide.SelectedValue.ToString());
		dt_desc = utilStats.DataTable_DescStats_ByGroup(dt, tname, groupvars, true); //, rbl_stackwide.SelectedValue.ToString());

		//Sort the data
		DataView dt_desc_sorted = new DataView(dt_desc);


		//Remove the grouping vars





		string subgroups_csv = String.Join(",", groupvars.ToArray<string>());
		string comma = (groupvars[0] != "") ? "," : "";

		if (rbl_varsfirstlast.SelectedValue == "first")
		{
			//Place the Variable and label first
			dt_desc.Columns["Label"].SetOrdinal(0);
			dt_desc.Columns["Variable"].SetOrdinal(0);

			dt_desc_sorted.Sort = "Variable, Label" + comma + subgroups_csv;
		}
		else
		{
			dt_desc_sorted.Sort = subgroups_csv + comma + " Variable, Label";
		}


		//Check for at least some valid cases
		int NValidCases = dt_desc.AsEnumerable().Sum(r => r.Field<int>("N"));

		Label lbl = new Label(); lbl.Font.Size = 12; lbl.Font.Bold = true;
		lbl.Text = "<br/><br/>" + tname; //dt_desc.TableName;
		Panel_descstats.Controls.Add(lbl);

		Label lbl2 = new Label();

		//No valid cases 
		if (NValidCases == 0 & tname != "Subjects")
		{
			lbl2.Text = "<br/><i>There were no valid cases for the selected variables.</i>";
			lbl2.Font.Size = 10;
			lbl2.Font.Bold = true;
			lbl2.ForeColor = System.Drawing.Color.DarkRed;

			Panel_descstats.Controls.Add(lbl2);
		}
		else if (NValidCases > 0)
		{



			//Create the GridView
			GridView gv = new GridView();
			gv.ID = "gv" + counter.ToString();

			//GridView gv = (GridView)Panel_descstats.FindControlRecursive("gv"
			//+ counter.ToString());
			gv.EnableViewState = true;

			gv.DataSource = dt_desc_sorted;
			gv.RowDataBound += new GridViewRowEventHandler(gvDescStats_RowDataBound);
			gv.DataBind();
			Panel_descstats.Controls.Add(gv);

			////GVLineChart lc = utilCharts.BoxPlot(dt_desc_sorted.ToTable(), "Variable","M", "SD", 400,300);
			//GVColumnChart col = utilCharts.ColumnChart(dt_desc_sorted.ToTable(), "Variable", "M", "SD", 400, 300);
			//col.EnableViewState = true;

			//Panel p = (Panel)Panel_descstats.FindControlRecursive("colPanel" +
			//counter.ToString()); p.Controls.Add(col);



			#region HighChart
			//List<Dictionary<string, object>> allSeries = new List<Dictionary<string, object>>();
			//foreach (DataRow dr1 in dt_desc_sorted.ToTable().Rows)
			//{
			//    Dictionary<string, object> aSeries = new Dictionary<string, object>();
			//    aSeries["name"] = dr1["name"];
			//    aSeries["data"] = new List<int>();
			//    int N = dr1.ItemArray.Length;
			//    for (int i = 1; i < N; i++)
			//    {
			//        ((List<int>)aSeries["data"]).Add((int)dr1[i]);
			//    }
			//    allSeries.Add(aSeries);
			//}
			//string jsonSeries = Newtonsoft.Json.JsonConvert.SerializeObject(allSeries);
						

//                 DotNet.Highcharts.Highcharts chart = new DotNet.Highcharts.Highcharts("chart");

//                 chart.SetPlotOptions(new PlotOptions { Column })
//                 chart.SetXAxis(new XAxis
//{
//    Categories = new[] { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" }
//})
//.SetSeries(new Series() jsonSeries );
//{
//    Data = new Data(new object[] { 29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4 })
//});

//                 Literal lit = new Literal();

//                 lit.Text = chart.ToHtmlString();

			#endregion

 
		}

		
	}



	protected void gvDescStats_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		GridView gv = (GridView)sender;

		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			//Hide the First Column
			//e.Row.Cells[0].Visible = false;
		}

		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			if (subgroups[0] != "")
			{
				int ncols = e.Row.Cells.Count;
				int numsubgroups = subgroups.Count;
				try
				{
					double z = Convert.ToDouble(e.Row.Cells[ncols - 2].Text);
					string Variable = e.Row.Cells[subgroups.Count].Text;


					int intz = (int)utilStats.RoundToNearestX(Math.Abs(z * 100), 5);  //from 0 to 200 by 5's

					string pad_intz = (intz < 10) ? "00" : (intz < 100) ? "0" : "";
					string posneg = (z < 0) ? "NEG" : "POS";

					System.Web.UI.WebControls.Image bar = new System.Web.UI.WebControls.Image();

					if (intz >= 0 & intz <= 200)
					{
						//string str_url =
						//@"http://faculty.washington.edu/jeffmun/images/ruler2/ruler2"
						//+ posneg + pad_intz + intz.ToString() + ".png";
						string str_url = @"~/images/ruler2/ruler2" + posneg + pad_intz + intz.ToString() + ".png";

						//ruler2xxx###.png are images of -2SD to +2SD
						bar.ImageUrl = str_url;
						bar.CssClass = "graph";
						e.Row.Cells[ncols - 1].Controls.Add(bar);
					}
					else
					{
						e.Row.Cells[ncols - 1].Controls.Clear();
						e.Row.Cells[ncols - 1].Text = "";
					}
				}
				catch (Exception)
				{
					//keep going, there is likely no z column
				}

			}
		}


		//Merge cells by subgroups 
		int RowSpan = 2;

		int n_cols_to_merge = 0;

		if (subgroups[0] != "") n_cols_to_merge = subgroups.Count + 2;

		for (int s = 0; s < n_cols_to_merge; s++)  //loop through subgroups + 2 (to also include Variable and Label)
		{
			for (int i = gv.Rows.Count - 2; i >= 0; i--)
			{
				GridViewRow currRow = gv.Rows[i];
				GridViewRow prevRow = gv.Rows[i + 1];
				if (currRow.Cells[s].Text == prevRow.Cells[s].Text)
				{
					currRow.Cells[s].RowSpan = RowSpan;
					prevRow.Cells[s].Visible = false;
					RowSpan += 1;
				}
				else
				{
					RowSpan = 2;
				}

				if (i % 3 == 0)
				{
					//currRow.BorderWidth
					//currRow.BackColor = System.Drawing.Color.Violet;
				}

			}
		}


	}




	//protected void Submit(object sender, EventArgs e)
	//{
	//    string name = HttpUtility.UrlEncode(Encrypt(txtName.Text.Trim()));
	//    string technology = HttpUtility.UrlEncode(Encrypt(ddlTechnology.SelectedItem.Value));
	//    Response.Redirect(string.Format("~/CS2.aspx?name={0}&technology={1}", name, technology));
	//}

	//private string Encrypt(string clearText)
	//{
	//    string EncryptionKey = "MAKV2SPBNI99212";
	//    byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
	//    using (Aes encryptor = Aes.Create())
	//    {
	//        Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
	//        encryptor.Key = pdb.GetBytes(32);
	//        encryptor.IV = pdb.GetBytes(16);
	//        using (MemoryStream ms = new MemoryStream())
	//        {
	//            using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
	//            {
	//                cs.Write(clearBytes, 0, clearBytes.Length);
	//                cs.Close();
	//            }
	//            clearText = Convert.ToBase64String(ms.ToArray());
	//        }
	//    }
	//    return clearText;
	//}



	//private string Decrypt(string cipherText)
	//{
	//    string EncryptionKey = "MAKV2SPBNI99212";
	//    cipherText = cipherText.Replace(" ", "+");
	//    byte[] cipherBytes = Convert.FromBase64String(cipherText);
	//    using (Aes encryptor = Aes.Create())
	//    {
	//        Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
	//        encryptor.Key = pdb.GetBytes(32);
	//        encryptor.IV = pdb.GetBytes(16);
	//        using (MemoryStream ms = new MemoryStream())
	//        {
	//            using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
	//            {
	//                cs.Write(cipherBytes, 0, cipherBytes.Length);
	//                cs.Close();
	//            }
	//            cipherText = Encoding.Unicode.GetString(ms.ToArray());
	//        }
	//    }
	//    return cipherText;
	//}



	protected void btnSUBJECTS_Click(object sender, EventArgs e)
	{
		if (panel_subjects.Visible == true)
		{
			panel_subjects.Visible = false;
			btnSUBJECTS.Text = "Show";
		}
		else
		{
			panel_subjects.Visible = true;
			btnSUBJECTS.Text = "Hide";

		}
		panel_subjects.Update();
	}


	protected void btnDATADICT_Click(object sender, EventArgs e)
	{
		if (panel_datadict.Visible == true)
		{
			panel_datadict.Visible = false;
			btnDATADICT.Text = "Show";
		}
		else
		{
			panel_datadict.Visible = true;
			btnDATADICT.Text = "Hide";

		}
		panel_datadict.Update();
	}



	protected void btnSummaryAll_Click(object sender, EventArgs e)
	{

		PivotMeasure(Request.QueryString["filename"]);

		//DataSet_to_XML();
	}


	protected void btnOpenSubjects_Click(object sender, EventArgs e)
	{
		ProcessXLdata_Subjects(Request.QueryString["filename"]);

	}
	protected void btnOpenDataDict_Click(object sender, EventArgs e)
	{
		ProcessXLdata_DataDict(Request.QueryString["filename"]);
	}
	protected void btnGetStats_Click(object sender, EventArgs e)
	{
		Display_DescStats_for_dset(Request.QueryString["filename"]);
	}


	protected void btnStats_Click(object sender, EventArgs e)
	{
		//PivotMeasure_single("Mullen");

		string selectedRows = hidRows.Value;

		string vars_csv = txtVars.Text.ToString();

		List<string> flds_to_process = vars_csv.Split(',').ToList();


		CreatePivotTable("Mullen", flds_to_process);


		List<string> rows = new List<string>();

		

		//string info = "";
		//DataSet ds = (DataSet)Session["ds"];
		//foreach(DataTable dt in ds.Tables)
		//{
		//    info += dt.TableName + "  Nrecs=" + dt.Rows.Count.ToString() + "<br/>";
		//}

		//lblInfo.Text = info;
	}
	protected void cblRows_SelectedIndexChanged(object sender, EventArgs e)
	{
		int x = 0;


		//lblSelRows.Text;

	}
}