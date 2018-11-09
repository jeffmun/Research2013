using DevExpress.Pdf;
using DevExpress.XtraRichEdit.API.Native;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using uwac;

/// <summary>
/// Summary description for DxDoc
/// </summary>
public class DxDoc
{
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

	protected void MakeDocx(DxChartFactory factory, string path, string projtitle, string datafile)
	{
		log(" ====== MakeDocx ======");
		//const float imageLocationX = 40;
		//const float imageLocationY = 40;
		//int counter = 0;
		//string path = @"C:\_temp\factory\";

		factory.ChartsToDisk(path);

		string fileName = String.Format(@"{0}{1}", path, "Test.docx");


		using (DevExpress.XtraRichEdit.RichEditDocumentServer srv = new DevExpress.XtraRichEdit.RichEditDocumentServer())
		{

			DevExpress.XtraRichEdit.API.Native.Document doc = srv.Document;

			DocxHeader(doc, projtitle, datafile);

			DocumentPosition pos = doc.Range.Start;
			//New Section

			foreach (DxChartOrder order in factory.orders)
			{
				foreach (DxChartBatch batch in order.batches)
				{
					foreach (DxChart chart in batch.charts)
					{
						string chartfile = String.Format(@"{0}{1}.png", path, chart.guid);
						log(chartfile);
						//MemoryStream s = new MemoryStream();
						//chart.chart.ExportToImage(s, System.Drawing.Imaging.ImageFormat.Png);
						doc.Images.Insert(pos, DocumentImageSource.FromFile(chartfile));

					}
				}
			}



			srv.SaveDocument(fileName, DevExpress.XtraRichEdit.DocumentFormat.OpenXml);
		}


		//System.Diagnostics.Process.Start(fileName);


		//MemoryStream ms = new MemoryStream();
		//srv.SaveDocument(ms, DevExpress.XtraRichEdit.DocumentFormat.OpenXml);
		////System.Diagnostics.Process.Start(fileName);

		//ms.Seek(0, SeekOrigin.Begin);
		//byte[] output = ms.ToArray();


		//Response.ContentType = "application/docx";
		//Response.AddHeader("content-disposition", String.Format("attachment;filename={0}", fileName));
		//Response.Cache.SetCacheability(HttpCacheability.NoCache);
		//Response.OutputStream.Write(output, 0, output.Length);
		//Response.End();


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




	protected void DeleteChartFiles()
	{
		System.IO.DirectoryInfo di = new DirectoryInfo(@"c:\_temp\factory\");

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