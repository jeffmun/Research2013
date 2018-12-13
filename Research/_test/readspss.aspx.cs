using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uwac;
using uwac.trk;
using SpssLib;
using System.IO;
using SpssLib.DataReader;
using SpssLib.SpssDataset;
using System.Data;
using System.Diagnostics;
using DevExpress.Web;

public partial class _test_readspss : BasePage
{
	protected void Page_Load(object sender, EventArgs e)
	{

		if (!IsPostBack)
		{
			myspss();
		}
		else{

			if(Session["spsssav"] != null)
			{
				gv.DataSource = (DataTable)Session["spsssav"];
				gv.DataBind();
			}
		}
	}


	protected void myspss()
	{

		string path = @"U:\Eureka\";
		string file = @"EUREKA_Data_For_Upload_11_9_18_nopwd.sav";

		//Datadictionary dict = new Datadictionary(@"U:\Eureka\EUREKA_Data_For_Upload_11_9_18_nopwd.sav");
		//dict.measureid = 4860;
		//dict.tblpk = 1759;

		//string result = dict.SaveToDB();
		//lbl.Text = result;

		Spsssav sav = new Spsssav(path, file);
		lbl.Text = file;

		DataTable dt = sav.data;

		dt = dt.RemoveRowsWithNullID();

		Session["spsssav"] = dt;

		gv.DataSource = dt;
		gv.DataBind();

		panel.Controls.Add(gv);


		//SQL_utils sql = new SQL_utils("data");

		//sql.Close();


			// Iterate through all data rows in the file
			//foreach (var record in spssDataset.Records)
			//{
			//	foreach (var variable in spssDataset.Variables)
			//	{
			//		Debug.Write(variable.Name);
			//		Debug.Write(':');
			//		// Use the corresponding variable object to get the values.
			//		Debug.Write(record.GetValue(variable));
			//		// This will get the missing values as null, text with out extra spaces,
			//		// and date values as DateTime.
			//		// For original values, use record[variable] or record[int]
			//		Debug.Write('\t');
			//	}
			//	Debug.WriteLine("");
			//}
		}
	


	//protected void v()
	//{
		// Create Variable list


		//var variables = new List<Variable>
		//	{
		//		new Variable
		//		{
		//			Label = "The variable Label",
		//			ValueLabels = new Dictionary<double, string>
		//					{
		//						{1, "Label for 1"},
		//						{2, "Label for 2"},
		//					},
		//			Name = "avariablename_01",
		//			PrintFormat = new OutputFormat(FormatType.F, 8, 2),
		//			WriteFormat = new OutputFormat(FormatType.F, 8, 2),
		//			Type = DataType.Numeric,
		//			Width = 10,
		//			MissingValueType = MissingValueType.NoMissingValues
		//		},
		//		new Variable
		//		{
		//			Label = "Another variable",
		//			ValueLabels = new Dictionary<double, string>
		//						{
		//							{1, "this is 1"},
		//							{2, "this is 2"},
		//						},
		//			Name = "avariablename_02",
		//			PrintFormat = new OutputFormat(FormatType.F, 8, 2),
		//			WriteFormat = new OutputFormat(FormatType.F, 8, 2),
		//			Type = DataType.Numeric,
		//			Width = 10,
		//			MissingValueType = MissingValueType.OneDiscreteMissingValue
		//		}
		//	};
		//// Set the one special missing value
		//variables[1].MissingValues[0] = 999;

		//// Default options
		//var options = new SpssOptions();

		//using (FileStream fileStream = new FileStream("data.sav", FileMode.Create, FileAccess.Write))
		//{
		//	using (var writer = new SpssWriter(fileStream, variables, options))
		//	{
		//		// Create and write records
		//		var newRecord = writer.CreateRecord();
		//		newRecord[0] = 15d;
		//		newRecord[1] = 15.5d;
		//		writer.WriteRecord(newRecord);

		//		newRecord = writer.CreateRecord();
		//		newRecord[0] = null;
		//		newRecord[1] = 200d;
		//		writer.WriteRecord(newRecord);
		//		writer.EndFile();
		//	}
		//}
	//}

}