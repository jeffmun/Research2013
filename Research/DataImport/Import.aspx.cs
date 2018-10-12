using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// Imports needed for R
using System.Threading;
using System.IO;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using RDotNet;
using RDotNet.NativeLibrary;
using uwac;


public partial class DataImport_Import : BasePage
{
	public REngine engine;

	protected void Page_Init(object sender, EventArgs e)
	{
		REngine.SetEnvironmentVariables();
		if (engine == null)
		{
			engine = REngine.GetInstance();
			engine.Initialize();
		}
	}

	protected void Page_Load(object sender, EventArgs e)
	{

		SQL_utils sql = new SQL_utils("data");
		DataTable dt = sql.DataTable_from_SQLstring("select top 20 a.id, wk, bunk, id_of_friend, friendrating, isfriend, isnotfriend from all_sociometrics a join all_apexbunk b ON a.id = b.id where isfriend = 1");

		string JSONresult;
		JSONresult = JsonConvert.SerializeObject(dt);

		sql.Close();

		//REngine.SetEnvironmentVariables(@"C:\Program Files\R\R-3.5.1\bin\i386\");
		//REngine engine = REngine.GetInstance();
		//string path = System.Environment.GetEnvironmentVariable("Path"); 

		//string path = @"C:\code\Rpackages;" + @"C:\Program Files\R\R-3.5.1\bin\i386\;"; 
		//System.Environment.SetEnvironmentVariable("Path", path);

		//string[] args = new string[];

		string rHome = null;
		string rPath = null;
		//if (args.Length > 0)
		//	rPath = args[0];
		//if (args.Length > 1)
		//	rHome = args[1];

		NativeUtility native = new NativeUtility();

		var loginfo = native.FindRPaths(ref rPath, ref rHome);

		string info = "";

		foreach (var obj in loginfo)
		{
			info += String.Format("{0}{1}", "  ", obj.ToString());
		}

		//string result = String.Join("_", info.ToString());

		//string result = "foo";

		Literal lit = new Literal();
		lit.Text = String.Format("{0}{1}{2}", "first tRy: ", info, JSONresult);

		panel.Controls.Add(lit);



		NumericVector group1 = engine.CreateNumericVector(new double[] { 30.02, 29.99, 30.11, 29.97, 30.01, 29.99 });
		engine.SetSymbol("group1", group1);
		engine.Evaluate("m <- mean(group1)").AsList();
		double m1 = engine.GetSymbol("m").AsNumeric().First();

		string foo = "foo";
		//engine.Dispose();


		//REngine.SetEnvironmentVariables(@"C:\Program Files\R\R-3.5.1\bin\i386\");
		//REngine engine = REngine.GetInstance();
		////engine.Evaluate("library(RODBC)");
		//engine.Initialize();



		//NumericVector group1 = engine.CreateNumericVector(new double[] { 30.02, 29.99, 30.11, 29.97, 30.01, 29.99 });
		//engine.SetSymbol("group1", group1);
		//NumericVector group2 = engine.Evaluate("group2 <- c(29.89, 29.93, 29.72, 29.98, 30.02, 229.98)").AsNumeric();



		//NumericVector data = engine.Evaluate("data <- c(1,2,3,4,5,6,7,8)").AsNumeric();
		//engine.Evaluate("m <- mean(data)");
		//NumericVector x = engine.GetSymbol("m").AsNumeric();



		//engine = REngine.GetInstance(); 
		//engine.Initialize();


		//GenericVector foo = engine.Evaluate("foo <- .libPaths()").AsList();


		//engine.Evaluate("library(jsonlite)");
		//engine.SetSymbol("js", engine.CreateCharacter(JSONresult));
		////engine.Evaluate("library(ggplot2)");
		//engine.Evaluate("df <- fromJSON(js)");
		//engine.Evaluate("m <- mean(df$id)");
		//NumericVector x = engine.GetSymbol("m").AsNumeric();


		//engine.Evaluate("p <- ggplot(df)");
		//engine.Evaluate("p1 <- p + geom_point(aes(x=id, y=id_of_friend, color=factor(bunk)), alpha=.2)");






		//// A somewhat contrived but customary Hello World:
		//CharacterVector charVec = engine.CreateCharacterVector(new[] { "Hello, R world!, .NET speaking" });
		//engine.SetSymbol("greetings", charVec);
		//engine.Evaluate("str(greetings)"); // print out in the console
		//string[] a = engine.Evaluate("'Hi there .NET, from the R engine'").AsCharacter().ToArray();




		//DataFrame df = engine.CreateDataFrame(cols, colNames.ToArray(), stringsAsFactors: true);






	}
}