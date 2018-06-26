using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Web.ASPxPivotGrid;
using DevExpress.XtraPivotGrid;
using DevExpress.XtraCharts;
using DevExpress.XtraCharts.Web;
using System.Drawing;

namespace uwac.trk
{


	/// <summary>
	/// Summary description for dxpivot
	/// </summary>
	public class dxpivot
	{
		public dxpivot()
		{
			//
			// TODO: Add constructor logic here
			//
		}



		public static DataTable ConvertSummaryDataSourceToDataTable(PivotSummaryDataSource source)
		{
			DataTable result = new DataTable();
			ITypedList dataProperties = source as ITypedList;
			if (dataProperties == null) return result;
			foreach (PropertyDescriptor prop in dataProperties.GetItemProperties(null))
				result.Columns.Add(prop.Name, prop.PropertyType);
			for (int row = 0; row < source.RowCount; row++)
			{
				List<object> values = new List<object>();
				foreach (DataColumn col in result.Columns)
					values.Add(source.GetValue(row, col.ColumnName));
				result.Rows.Add(values.ToArray());
			}
			return result;
		}


		public static WebChartControl CreateChart(DataTable dt_descstats, string levels_x, string levels_legend)
		{
			return CreateChart(dt_descstats, levels_x, levels_legend, 500, 200);	
		}

		public static WebChartControl CreateChart(DataTable dt_descstats, string levels_x, string levels_legend, int width, int height)
		{
			WebChartControl WebChart = new WebChartControl();


			WebChart.DataSource = dt_descstats;
			WebChart.SeriesDataMember = levels_legend;

			SideBySideBarSeriesView view = new SideBySideBarSeriesView();
			DataSourceBasedErrorBars errbar = new DataSourceBasedErrorBars("sd");
			errbar.Name = "SD";
			//errbar.NegativeErrorDataMember = "SDminus";
			//errbar.PositiveErrorDataMember = "SDplus";
			errbar.NegativeErrorDataMember = "Value_StdDev";
			errbar.PositiveErrorDataMember = "Value_StdDev";
			errbar.Direction = ErrorBarDirection.Both;
			errbar.EndStyle = ErrorBarEndStyle.Cap;
			errbar.Color = Color.Black;
			errbar.LineStyle.Thickness = 1;

			view.Indicators.Add(errbar);

			//FixedValueErrorBars fixbar = new FixedValueErrorBars("fix");
			//fixbar.Name = "fix";
			//fixbar.NegativeError = 2;
			//fixbar.PositiveError = 10;
			//fixbar.Direction = ErrorBarDirection.Both;
			//fixbar.EndStyle = ErrorBarEndStyle.Cap;
			//fixbar.Color = Color.Red;
			//fixbar.LineStyle.Thickness = 3;

			//view.Indicators.Add(fixbar);

			WebChart.SeriesTemplate.ArgumentDataMember = levels_x;
			WebChart.SeriesTemplate.ValueDataMembers.AddRange(new string[] { "Value_Average" });
			WebChart.SeriesTemplate.View = view;

			WebChart.Width = width;
			WebChart.Height = height;
			WebChart.DataBind();
			WebChart.EnableViewState = true;

			return WebChart;
		}

		public static WebChartControl CreateHist(DataTable dt_hist, string histlevels)
		{
			return CreateHist(dt_hist, histlevels, 500, 200);
		}

			public static WebChartControl CreateHist(DataTable dt_hist, string histlevels, int width, int height)
		{
			WebChartControl WebChart = new WebChartControl();


			WebChart.DataSource = dt_hist;
			WebChart.SeriesDataMember = "timept";

			SideBySideBarSeriesView view = new SideBySideBarSeriesView();
			
			WebChart.SeriesTemplate.ValueDataMembers.AddRange(new string[] { "Value_Average" });
			WebChart.SeriesTemplate.View = view;

			WebChart.Width = width;
			WebChart.Height = height;
			WebChart.DataBind();
			WebChart.EnableViewState = true;

			return WebChart;
		}


	}

}