using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.Linq;
using System.Diagnostics;
using System.Linq;
using System.Linq.Dynamic;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using DevExpress.Web;
using DevExpress.XtraCharts;
using DevExpress.XtraCharts.Web;
using LinqStatistics;
using MathNet.Numerics.Statistics;
using uwac;
using uwac.trk;
using Accord.Statistics.Analysis;
using Accord.Statistics.Testing;
using Accord.Statistics.Models.Regression.Linear;


namespace uwac 
{

	public class AccordStats
	{
		public Table OutputTable { get; set; }
		public string OutputMainTitle { get; set; }
		public List<OutputGridview> OutputGridviews { get; set; }
	}

	public class OutputGridview
	{
		public string Title;
		public ASPxGridView Grid;
	}



	public class List_O_PCA
	{
		private List<PCA> _pcas;
		public List<PCA> pcas { get { return _pcas; } }

		public List_O_PCA(DPData dpdata, List<string> numvars, string method, string groupingvar)
		{
			_pcas = new List<PCA>();
			DataSubsets subsets = new DataSubsets(dpdata.dt, numvars, groupingvar);

			foreach (DataSubset subset in subsets.subsets)
			{
				if (subset.dt != null)
				{
					if (subset.dt.Rows.Count > 0)
					{
						DataTable mydt = dpdata.Data_SelectColumns(subset.dt, numvars, false, true);
						if (mydt != null)
						{
							PCA pca = new PCA(mydt, numvars, method, subset.Cols_and_Vals_ToString());
							if (pca.final_N > 0) _pcas.Add(pca);
						}
					}
				}
			}
		}
	}

	public class PCA : AccordStats
	{
		private PrincipalComponentAnalysis _pca { get; set; }
		private DataTable _dt;
		private double[][] _data;
		private List<string> _numvars;
		private int _final_N { get; set; }
		private string _method { get; set; }
		private string _subtitle { get; set; }

		public PrincipalComponentAnalysis pca { get { return _pca; } }
		public int final_N { get { return _final_N; } }
		public string method { get { return _method; } }
		public string subtitle { get { return _subtitle; } }


		public PCA(DPData dpdata, List<string> numvars, string method, string subtitle)
		{
			_numvars = numvars;
			_method = method;
			_subtitle = subtitle;

			//need to select only the vars passed in
			_dt = dpdata.Data_SelectColumns(_numvars, false, true);

			ConvertData();
		}


		public PCA(DataTable mydt, List<string> numvars, string method, string subtitle)
		{
			_numvars = numvars;
			_method = method;
			_subtitle = subtitle;

			//vars already selected
			_dt = mydt;

			ConvertData();
		}


		public void ConvertData()  //assumes all vars in mydt are for use in the PCA
		{
			if (_dt != null)
			{
				if (_dt.Rows.Count > 0)
				{
					_data = Accord.Math.Matrix.ToJagged(_dt);
					_final_N = _data.Length;
					if (_final_N > 2)
					{
						runPCA();
					}

				}
				else
				{
					_final_N = 0;
				}
			}
			else
			{
				_final_N = 0;
			}
			//double[][] _data0 = new ConvertDataTableToMatrix(_dt).matrix;
		}


		public void runPCA() //DataTable mydt, List<string> numvars, string method, string subtitle)
		{

			if (_dt == null || _final_N == 0)
			{
				_subtitle += " *No data rows*";
				_final_N = 0;
			}
			else
			{

				////from http://accord-framework.net/docs/html/T_Accord_Statistics_Analysis_PrincipalComponentAnalysis.htm 
				PrincipalComponentMethod mymethod = new PrincipalComponentMethod();
				if (method == "Center")
				{
					mymethod = PrincipalComponentMethod.Center;
				}
				else if (method == "Standardize")
				{
					mymethod = PrincipalComponentMethod.Standardize;
				}



				var pca = new PrincipalComponentAnalysis()
				{
					Method = mymethod,
					Whiten = true
				};

				// Learn the PCA projection using passing the cov matrix
				MultivariateLinearRegression transform = pca.Learn(_data);

				// Now, we can transform data as usual
				double[][] out1 = pca.Transform(_data);

				_pca = pca;

				buildPCAtable();
			}

		}


		public void buildPCAtable()
		{
			int nvars = _numvars.Count;

			if (_pca == null || _final_N == 0)
			{
				ASPxLabel label = new ASPxLabel();
				label.Text = string.Format("PCA analysis, listwise deletion N = {0} {1}", _final_N, _subtitle);
				label.Font.Bold = true;
				ASPxLabel labela = new ASPxLabel();

				Table t = new Table();
				TableRow r1 = new TableRow();
				TableCell c1 = new TableCell();
				c1.Controls.Add(label);

				OutputTable = t;
			}
			else
			{

				DataTable dt_pca = new DataTable();
				dt_pca.Columns.Add("index", typeof(int));
				dt_pca.Columns.Add("eigenvalue", typeof(double));
				dt_pca.Columns.Add("proportion_of_variance", typeof(double));
				dt_pca.Columns.Add("cum_proportion_of_variance", typeof(double));

				foreach (Accord.Statistics.Analysis.PrincipalComponent comp in _pca.Components)
				{
					DataRow row = dt_pca.NewRow();
					row["index"] = comp.Index + 1;
					row["eigenvalue"] = Math.Round(comp.Eigenvalue, 4);
					row["proportion_of_variance"] = Math.Round(comp.Proportion, 4);
					row["cum_proportion_of_variance"] = Math.Round(comp.CumulativeProportion, 4);
					dt_pca.Rows.Add(row);
				}


				ASPxGridView gv = new ASPxGridView();
				gv.DataSource = dt_pca;
				gv.DataBind();


				DataTable dt_compmatrix = new DataTable();
				dt_compmatrix.Columns.Add("varname", typeof(string));
				for (int n = 0; n < nvars; n++)
				{
					dt_compmatrix.Columns.Add(String.Format("PC{0}", n + 1), typeof(double));
				}

				for (int i = 0; i < nvars; i++)
				{
					DataRow row = dt_compmatrix.NewRow();
					row[0] = _numvars[i];
					for (int j = 0; j < _numvars.Count; j++)
					{
						row[j + 1] = Math.Round(_pca.ComponentMatrix[i, j] * _pca.SingularValues[j], 4);
					}
					dt_compmatrix.Rows.Add(row);
				}


				ASPxGridView gv2 = new ASPxGridView();
				gv2.DataSource = dt_compmatrix;
				gv2.DataBind();


				#region build table

				string lbl1 = string.Format("PCA analysis, listwise deletion N = {0} {1}", _final_N, _subtitle);
				string lbl1a = string.Format("{0}Method: {1}", Environment.NewLine, _method);
				string lbl2 = string.Format("{0}Factor loadings", Environment.NewLine); ;

				ASPxLabel label = new ASPxLabel();
				label.Text = lbl1;
				label.Font.Bold = true;
				ASPxLabel labela = new ASPxLabel();
				labela.Text = lbl1a;
				labela.Font.Bold = true;
				ASPxLabel label2 = new ASPxLabel();
				label2.Text = lbl2;
				label2.Font.Bold = true;


				OutputGridviews = new List<OutputGridview>();

				OutputMainTitle = lbl1;

				OutputGridviews.Add(new OutputGridview() { Title = lbl1a, Grid = gv });
				OutputGridviews.Add(new OutputGridview() { Title = lbl2, Grid = gv2 });



				Table t = new Table();
				TableRow r1 = new TableRow();
				TableCell c1 = new TableCell();
				c1.Controls.Add(label);
				c1.Controls.Add(labela);
				c1.Controls.Add(gv);

				TableCell c2 = new TableCell();
				c2.Controls.Add(label2);
				c2.Controls.Add(gv2);
				c1.Width = 550;
				r1.Cells.Add(c1);
				r1.Cells.Add(c2);
				t.Rows.Add(r1);

				TableRow r2 = new TableRow();
				TableCell c21 = new TableCell();
				ASPxHyperLink hyp1 = new ASPxHyperLink()
				{
					NavigateUrl = "http://accord-framework.net/docs/html/T_Accord_Statistics_Analysis_PrincipalComponentAnalysis.htm",
					Text = "Conducted with Accord.NET Framework v3.8.0 (with whiten=true)"
				};
				ASPxLabel l21 = new ASPxLabel();
				l21.Text = string.Format(" and results with test data match those obtained using the ");

				ASPxHyperLink hyp2 = new ASPxHyperLink()
				{
					NavigateUrl = "http://stat.ethz.ch/R-manual/R-devel/library/stats/html/prcomp.html",
					Text = "R 'prcomp' package."
				};
				Literal l22 = new Literal();
				l22.Text = "<br/>However, users should replicate these results on their own before publication!";



				c21.ColumnSpan = 2;
				c21.Controls.Add(hyp1);
				c21.Controls.Add(l21);
				c21.Controls.Add(hyp2);
				c21.Controls.Add(l22);
				r2.Cells.Add(c21);
				t.Rows.Add(r2);

				TableRow r3 = new TableRow();
				TableCell c31 = new TableCell() { ColumnSpan = 2 };
				ASPxHyperLink hyp3 = new ASPxHyperLink()
				{
					NavigateUrl = "https://arxiv.org/ftp/arxiv/papers/1210/1210.7463.pdf",
					Text = "Link to Accord.NET PCA tutorial."
				};
				c31.Controls.Add(hyp3);
				r3.Cells.Add(c31);

				t.Rows.Add(r3);
				#endregion

				OutputTable = t;
			}

		}
	}


}