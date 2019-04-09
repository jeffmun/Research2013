using DevExpress.Office.Utils;
using DevExpress.Pdf;
using DevExpress.XtraRichEdit.API.Native;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using uwac;

/// <summary>
/// Summary description for DxDoc
/// </summary>
public class DxDoc
{
	private string _path;
	private string _projtitle;
	private string _datafile;
	private string _filename;

	private string _creator_netid; // { get; set; }
	public bool printDebug { get; set; }

	public DxDoc()
	{
		_creator_netid = "testing";
		//
		// TODO: Add constructor logic here
		//
	}

	public DxDoc(DxChartFactory factory, string projtitle, string datafile, string netid)
	{
		_creator_netid = netid;
		//Document doc = new DevExpress.XtraRichEdit.API.Native.Document();
	}
	//public DxDoc(DxChartFactory factory, string path, string filename, string projtitle, string datafile, string netid)
	//{
	//	_creator_netid = netid;
	//	_path = path;
	//	_projtitle = projtitle;
	//	_datafile = datafile;
	//	_filename = filename;

	//	MakeDocx(factory);

	////Document doc = new DevExpress.XtraRichEdit.API.Native.Document();
	//}

	//public DxDoc(List<DxChartOrder> ordersC, string path, string filename, string projtitle, string datafile, string netid)
	public DxDoc(List<DxChartOrder> ordersC, string path, string projtitle, string datafile, string netid)
	{
		_creator_netid = netid;
		_path = path;
		_projtitle = projtitle;
		_datafile = datafile;
		_filename = "test.docx"; // filename;

		MakeDocx(ordersC);

		//Document doc = new DevExpress.XtraRichEdit.API.Native.Document();
	}



	public DxDoc(DataTable dt_plots, List<string> htmltables, string path, string filename, string projtitle, string datafile, string netid)
	{
		_creator_netid = netid;
		_path = path;
		_projtitle = projtitle;
		_datafile = datafile;
		_filename = filename;

		MakeDocx(dt_plots, htmltables);

		//Document doc = new DevExpress.XtraRichEdit.API.Native.Document();
	}

	public DxDoc(DataTable dt_plots, DataTable dt_tables, string path, string filename, string projtitle, string datafile, string netid)
	{
		_creator_netid = netid;
		_path = path;
		_projtitle = projtitle;
		_datafile = datafile;
		_filename = filename;

		MakeDocx(dt_plots, dt_tables);

		//Document doc = new DevExpress.XtraRichEdit.API.Native.Document();
	}



	protected void DocxHeader(DevExpress.XtraRichEdit.API.Native.Document doc, string s1, string s2)
	{
		DevExpress.XtraRichEdit.API.Native.Section firstSection = doc.Sections[0];
		// Create an empty header.
		SubDocument newHeader = firstSection.BeginUpdateHeader();
		firstSection.EndUpdateHeader(newHeader);
		// Check whether the document already has a header (the same header for all pages).
		if (firstSection.HasHeader(DevExpress.XtraRichEdit.API.Native.HeaderFooterType.Primary))
		{
			SubDocument myHeader = firstSection.BeginUpdateHeader();
			doc.ChangeActiveDocument(myHeader);
			doc.CaretPosition = myHeader.CreatePosition(0);

			string txt = String.Format("{0}     p.", s1);
			DocumentRange range = myHeader.InsertText(myHeader.CreatePosition(0), txt);
			Field fld = myHeader.Fields.Create(range.End, "PAGE"); //  "PAGE \\* ARABICDASH");
			myHeader.Fields.Update();

			myHeader.Paragraphs.Append();
			string user_time = String.Format("{0}     {1:MM/dd/yy H:mm}", _creator_netid, System.DateTime.Now);
			myHeader.AppendText(String.Format("{0}                             {1}", s2, user_time));


			firstSection.EndUpdateHeader(myHeader);
		}

	}

	protected void MakeDocx(DataTable dt_plotfiles, DataTable dt_output) //, string path, string projtitle, string datafile)
	{
		log(" ====== MakeDocx (DataTable dt_plotfiles, DataTable dt_tables) ======");


		using (DevExpress.XtraRichEdit.RichEditDocumentServer srv = new DevExpress.XtraRichEdit.RichEditDocumentServer())
		{

			DevExpress.XtraRichEdit.API.Native.Document doc = srv.Document;
			doc.Unit = DevExpress.Office.DocumentUnit.Inch;
			doc.Sections[0].Page.PaperKind = System.Drawing.Printing.PaperKind.Letter;
			doc.Sections[0].Margins.Left = 0.5f;
			doc.Sections[0].Margins.Right = 0.5f;
			doc.Sections[0].Margins.Top = 0.5f;
			doc.Sections[0].Margins.Bottom = 0.5f;


			DocxHeader(doc, _projtitle, _datafile);

			DocumentPosition pos = doc.Range.Start;
			//New Section

			doc.Paragraphs.Append();

			doc.AppendHtmlText("<h3>Plots</h3>");
			doc.Paragraphs.Append();
			foreach (DataRow row in dt_plotfiles.Rows)
			{

				doc.AppendSingleLineText(String.Format("#{0}",row["index"].ToString()));
				doc.Paragraphs.Append();

				AppendChart(doc, _path, row["filename"].ToString());

				doc.Paragraphs.Append();
			}

			if (dt_output.HasRows())
			{
				doc.AppendHtmlText("<br/><br/><h3>Tables</h3>");
				doc.Paragraphs.Append();
				foreach (DataRow row in dt_output.Rows)
				{
					doc.AppendSingleLineText(String.Format("#{0}", row["index"].ToString()));
					doc.Paragraphs.Append();

					doc.AppendHtmlText(row["contents"].ToString());

					doc.Paragraphs.Append();
				}
			}

			doc.InsertSection(doc.Range.End);


			try
			{
				srv.SaveDocument(_filename, DevExpress.XtraRichEdit.DocumentFormat.OpenXml);
			}
			catch(Exception ex)
			{

			}
		}



	}


	protected void MakeDocx(DataTable dt_plotfiles, List<string> htmltables) //, string path, string projtitle, string datafile)
	{
		log(" ====== MakeDocx (DataTable dt_plotfiles, List<string> htmltables) ======");


		using (DevExpress.XtraRichEdit.RichEditDocumentServer srv = new DevExpress.XtraRichEdit.RichEditDocumentServer())
		{

			DevExpress.XtraRichEdit.API.Native.Document doc = srv.Document;
			doc.Unit = DevExpress.Office.DocumentUnit.Inch;
			doc.Sections[0].Page.PaperKind = System.Drawing.Printing.PaperKind.Letter;
			doc.Sections[0].Margins.Left = 0.5f;
			doc.Sections[0].Margins.Right = 0.5f;
			doc.Sections[0].Margins.Top = 0.5f;
			doc.Sections[0].Margins.Bottom = 0.5f;


			DocxHeader(doc, _projtitle, _datafile);

			DocumentPosition pos = doc.Range.Start;
			//New Section

			doc.Paragraphs.Append();

			doc.AppendSingleLineText("The start of it all!");
			doc.Paragraphs.Append();


			foreach (DataRow row in dt_plotfiles.Rows)
			{

				doc.AppendSingleLineText(String.Format("#{0}", row["index"].ToString()));
				doc.Paragraphs.Append();

				AppendChart(doc, _path, row["filename"].ToString());

				doc.Paragraphs.Append();
			}


			doc.AppendHtmlText("<br/><br/><h3>Tables</h3>");
			foreach (string t in htmltables)
			{
				doc.AppendHtmlText(t);
				doc.Paragraphs.Append();
			}

			doc.InsertSection(doc.Range.End);


			try
			{
				srv.SaveDocument(_filename, DevExpress.XtraRichEdit.DocumentFormat.OpenXml);
			}
			catch (Exception ex)
			{

			}
		}



	}



	//protected void MakeDocx(DxChartFactory factory) //, string path, string projtitle, string datafile)

	protected void MakeDocx(List<DxChartOrder> ordersC) //, string path, string projtitle, string datafile)
	{
		log(" ====== MakeDocx (DxChartFactory factory) ======");
		//const float imageLocationX = 40;
		//const float imageLocationY = 40;
		//int counter = 0;
		//string path = @"C:\_temp\factory\";

	
		string fileName = String.Format(@"{0}{1}", _path, _filename);


		using (DevExpress.XtraRichEdit.RichEditDocumentServer srv = new DevExpress.XtraRichEdit.RichEditDocumentServer())
		{

			DevExpress.XtraRichEdit.API.Native.Document doc = srv.Document;
			doc.Unit = DevExpress.Office.DocumentUnit.Inch;
			doc.Sections[0].Page.PaperKind = System.Drawing.Printing.PaperKind.Letter;
			doc.Sections[0].Margins.Left = 0.5f;
			doc.Sections[0].Margins.Right = 0.5f;
			doc.Sections[0].Margins.Top = 0.5f;
			doc.Sections[0].Margins.Bottom = 0.5f;


			DocxHeader(doc, _projtitle, _datafile);

			DocumentPosition pos = doc.Range.Start;
			//New Section

			foreach (DxChartOrder order in ordersC)
			{
				doc.Paragraphs.Append(); 

				if(order.dt_selectedvars != null)
				{
					AppendDataTable(doc, order.dt_selectedvars);
					doc.Paragraphs.Append();
				}
				doc.AppendSingleLineText(order.InvoiceToString());
				doc.Paragraphs.Append();


				foreach (DxChartBatch batch in order.batches)
				{
					//foreach (DxChart chart in batch.charts)
					//{
					//	string chartfile = String.Format(@"{0}{1}.png", _path, chart.guid);
					//	log(chartfile);
					//	//MemoryStream s = new MemoryStream();
					//	//chart.chart.ExportToImage(s, System.Drawing.Imaging.ImageFormat.Png);

					//	doc.Images.Insert(pos, DocumentImageSource.FromFile(chartfile));

					//	doc.Images[doc.Images.Count - 1].ScaleX = 0.5f;
					//	doc.Images[doc.Images.Count - 1].ScaleY = 0.5f;

					//}
					if (batch.charts.Count > 0)
					{

						doc.AppendSingleLineText(batch.batchtitle);
						doc.Paragraphs.Append();

						AppendCharts(pos, batch, doc);
						doc.Paragraphs.Append();
					}
				}


				doc.InsertSection(doc.Range.End);
			}



			srv.SaveDocument(fileName, DevExpress.XtraRichEdit.DocumentFormat.OpenXml);
		}


	}


	private void AppendCharts(DocumentPosition pos, DxChartBatch batch, Document doc)
	{
		float scaleX = 0.5f - (batch.maxCol * .03f);

		AppendCharts(pos, batch, doc, scaleX, scaleX);

	}
	private void AppendCharts(DocumentPosition pos, DxChartBatch batch, Document doc, float scaleX, float scaleY)
	{

		bool addHeaderRow = true;
		if (batch.layout == DxLayout.Upper)
		{

			int numrows = (addHeaderRow) ? batch.maxRow + 1 : batch.maxRow;


			doc.BeginUpdate();
			DevExpress.XtraRichEdit.API.Native.Table t = doc.Tables.Create(doc.Range.End, numrows, batch.maxCol, AutoFitBehaviorType.AutoFitToContents);

			t.Borders.Top.LineColor = Color.White;
			t.Borders.Bottom.LineColor = Color.White;
			t.Borders.Left.LineColor = Color.White;
			t.Borders.Right.LineColor = Color.White;

			t.Borders.InsideHorizontalBorder.LineStyle = TableBorderLineStyle.None;
			t.Borders.InsideVerticalBorder.LineStyle = TableBorderLineStyle.None;

			if (addHeaderRow)
			{
				for(int h=0; h < batch.maxCol; h++)
				{
					if(h>0) doc.InsertText(t[0, h].Range.Start, batch.vars[h]);
					if(h>0) doc.InsertText(t[h, 0].Range.Start, batch.vars[h-1]);

					t.Cell(h, 0).VerticalAlignment = TableCellVerticalAlignment.Center;
				}

			}

			//t.Rows.Add(CreateHeaderRow(batch.vars, ncols));
			int counter = 0;
			for (int r = 0; r < batch.maxRow; r++)
			{
				for (int c = r; c < batch.maxCol; c++)
				{
					if (c > r)
					{

						int bumprow = (addHeaderRow) ? 1 : 0;

						int idx = GetDiagIndex(r, c, batch.maxRow);



						string chartfile = String.Format(@"{0}{1}.png", _path, batch.charts[counter].guid);
						counter++;

						DevExpress.XtraRichEdit.API.Native.TableCell cell = t.Cell(r + bumprow, c);
						doc.Images.Insert(cell.Range.Start, DocumentImageSource.FromFile(chartfile));

						doc.Images[doc.Images.Count - 1].ScaleX = scaleX;
						doc.Images[doc.Images.Count - 1].ScaleY = scaleY;
					}

				}
			}

			

			doc.EndUpdate();

		}
		else
		{
			foreach (DxChart chart in batch.charts)
			{
				string chartfile = String.Format(@"{0}{1}.png", _path, chart.guid);
				log(chartfile);
				//MemoryStream s = new MemoryStream();
				//chart.chart.ExportToImage(s, System.Drawing.Imaging.ImageFormat.Png);

				doc.Images.Insert(pos, DocumentImageSource.FromFile(chartfile));

				doc.Images[doc.Images.Count - 1].ScaleX = 0.5f;
				doc.Images[doc.Images.Count - 1].ScaleY = 0.5f;

			}
		}



	}


	public void AppendChart(Document doc, string path, string filename)
	{
		float scaleX = 1.0f;
		float scaleY = 1.0f;

		string chartfile = String.Format("{0}{1}", path, filename);

		try
		{
			DocumentPosition pos = doc.Range.End;
			
			DocumentImageSource.FromFile(chartfile);


			doc.Images.Insert(pos, DocumentImageSource.FromFile(chartfile));

			var size = doc.Images[doc.Images.Count - 1].Size;


			if(size.Width > 7.5)
			{
				scaleX = 7.5f / size.Width;
				scaleY = scaleX;
			}


			doc.Images[doc.Images.Count - 1].ScaleX = scaleX;
			doc.Images[doc.Images.Count - 1].ScaleY = scaleY;
		}
		catch(Exception ex) 
		{ 

		}
	}

	public int GetDiagIndex(int r, int c, int n)
	{
		//k = (n * (n - 1) / 2) - (n - r) * ((n - r) - 1) / 2 + c - r - 1
		int idx = (n * (n - 1) / 2) - (n - r) * ((n - r) - 1) / 2 + c - r - 1;
		return idx;




	}


	private void AppendDataTable(Document document, DataTable dataTable)
	{
		int dataTableRows = dataTable.Rows.Count;
		int dataTableColumns = dataTable.Columns.Count;
		List<string> columnsToDisplay = new List<string>();

		for (int i = 0; i < dataTableColumns; i++)
		{
			string name = dataTable.Columns[i].ColumnName;

			// Skip PrimaryKey columns
			if (!name.ToUpper().EndsWith("ID"))
				columnsToDisplay.Add(name);
		}

		document.BeginUpdate();

		DevExpress.XtraRichEdit.API.Native.Table table = document.Tables.Create(document.Range.End, dataTableRows + 1, columnsToDisplay.Count, AutoFitBehaviorType.AutoFitToContents);

		//table.Borders.InsideHorizontalBorder.LineColor = Color.DarkBlue;
		//table.Borders.InsideVerticalBorder.LineColor = Color.DarkBlue;
		//table.Borders.InsideHorizontalBorder.LineThickness = 0.5f;
		//table.Borders.InsideHorizontalBorder.LineStyle = TableBorderLineStyle.Single;
		//table.Borders.InsideVerticalBorder.LineThickness = 0.5f;
		//table.Borders.InsideVerticalBorder.LineStyle = TableBorderLineStyle.Single;

		//table.LeftPadding = Units.InchesToDocumentsF(0.01f);

		//table.FirstRow.Height = Units.InchesToDocumentsF(0.5f);
		//table.FirstRow.HeightType = HeightType.Exact;

		ParagraphProperties pp = document.BeginUpdateParagraphs(table.FirstRow.Range);
		pp.Alignment = ParagraphAlignment.Left;
		document.EndUpdateParagraphs(pp);

		CharacterProperties cp = document.BeginUpdateCharacters(table.FirstRow.Range);
		//cp.FontName = "Courier New";
		cp.Bold = true;
		cp.ForeColor = Color.DarkGreen;
		document.EndUpdateCharacters(cp);

		//for (int i = 0; i < table.FirstRow.Cells.Count; i++)
		//{
		//	table.FirstRow.Cells[i].HeightType = HeightType.Auto;
		//	table.FirstRow.Cells[i].VerticalAlignment = TableCellVerticalAlignment.Top;
			//table.FirstRow.Cells[i].BackgroundColor = Color.DarkBlue;
			//table.FirstRow.Cells[i].VerticalAlignment = TableCellVerticalAlignment.Center;
		//}

		// Fill table header with column names
		for (int i = 0; i < columnsToDisplay.Count; i++)
		{
			document.InsertText(table[0, i].Range.Start, columnsToDisplay[i]);
		}

		// Fill table body with data
		table.ForEachCell(delegate (DevExpress.XtraRichEdit.API.Native.TableCell cell, int rowIndex, int cellIndex) {
			if (rowIndex > 0)
			{
				document.InsertText(cell.Range.Start, dataTable.Rows[rowIndex - 1][columnsToDisplay[cellIndex]].ToString());
			}
		});
		document.EndUpdate();
	}




	protected float DocxAddPageHeader(PdfGraphics g, int pagenumber, string projtitle, string datafile, string selecteddata)
	{
		float y = 10f;
		float x = 10f;
		float x_right = 760f;
		float yoffset = 4f;
		SolidBrush black = (SolidBrush)Brushes.Black;
		using (Font font16 = new Font("Arial", 16, FontStyle.Bold | FontStyle.Underline))
		using (Font font12 = new Font("Segoe UI", 12))
		using (Font font = new Font("Segoe UI", 10))
		{

			string page = String.Format("pg. {0}", pagenumber.ToString());
			string s1 = projtitle;
			string s2 = datafile;
			string s3 = selecteddata;


			string user_time = String.Format("{0}     {1:MM/dd/yy H:mm}", _creator_netid, System.DateTime.Now);


			//page number
			g.DrawString(page, font, black, x_right - (g.MeasureString(page, font).Width), 10);
			//project title
			g.DrawString(s1, font16, black, x, y);
			y = y + g.MeasureString(s1, font16).Height - yoffset;
			//file, user, date
			g.DrawString(s2, font12, black, x, y);
			float x2 = x_right - g.MeasureString(user_time, font).Width;
			g.DrawString(user_time, font, black, x2, y);
			y = y + g.MeasureString(s2, font12).Height - yoffset;
			//Worksheet & filter
			g.DrawString(s3, font, black, x, y);
			y = y + g.MeasureString(s3, font).Height - yoffset;

		}


		return y;
	}




	protected void DeleteChartFiles(string path)
	{
		//System.IO.DirectoryInfo di = new DirectoryInfo(@"c:\_temp\factory\");
		//System.IO.DirectoryInfo di = new DirectoryInfo(System.MapPath(@"\App_Data\factory\"));
		System.IO.DirectoryInfo di = new DirectoryInfo(path);

		foreach (FileInfo file in di.GetFiles())
		{
			file.Delete();
		}
	}



	protected void log(string s)
	{
		if (printDebug)
		{
			Debug.Print(s);
		}
	}

}