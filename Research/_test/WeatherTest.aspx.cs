using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Threading.Tasks;
using DarkSkyApi;
using DarkSkyApi.Models;
using System.Diagnostics;
using System.Data;
using uwac;
using uwac.trk;

public partial class _test_WeatherTest : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		RegisterAsyncTask(new PageAsyncTask(GetWeather));


		string lat1 = txtlat.Text;
		string lon1 = txtlong.Text;

	}

	protected void btnSubmit_Click(object sender, EventArgs e)
	{
		//double lat = Convert.ToSingle(txtlat.Text);
		//double lon = Convert.ToSingle(txtlong.Text);

		//DarkSky sky = new DarkSky();

		//var forecast = sky.GetWeather(lat, lon, DateTimeOffset.Now);
		//await GetWeather();
	}


	public async Task GetWeather()
	{
		string slat = txtlat.Text;
		string slon = txtlong.Text;

		//slat = "40.909615";
		//slon = "-73.113439";

		if (slat != "" & slon != "")
		{
			var client = new DarkSkyService("9a9c19a4d9a62d812bf17136c99cc6cf");

			//Forecast result = await client.GetTimeMachineWeatherAsync(lat, lon, date);
			var numcalls = client.ApiCallsMade;

			//Don't go above 1000 for now to keep it all free
			if (numcalls > 950)
			{
				lblResults.Text = "You've made more than 950 requests today.";
			}
			else
			{

				DateTime d1 = Convert.ToDateTime(date1.Value);
				d1 = DateTime.SpecifyKind(d1, DateTimeKind.Local);

				DateTimeOffset date = d1;

				double lat = Convert.ToDouble(slat);
				double lon = Convert.ToDouble(slon);

				try
				{
					Forecast result = await client.GetTimeMachineWeatherAsync(lat, lon, date);

					DataTable dt = HourlyInfo(result);

					if (dt.Rows.Count > 0)
					{
						grid.DataSource = dt;
						grid.DataBind();
						grid.Visible = true;

						SQL_utils sql = new SQL_utils("data");

						string bulkinsertresult = sql.BulkInsert(dt, "ALL_WeatherInfo");
						sql.Close();

						lblResults.Text = bulkinsertresult;
					}

				}
				catch (Exception ex)
				{
					Debug.WriteLine("** ERROR in TimeMachineWeatherAsync");
					Debug.WriteLine(ex.Message);
					lblResults.Text += ex.Message;

					string param = String.Format("<br/>Lat:{0}  Long:{1}  Date:{2}", lat, lon, date.ToString());

					//lblResults.Text += param;
				}
			}
		}
	}


	protected DataTable HourlyInfo(Forecast forecast)
	{
		DataTable dt = new DataTable();

		dt.Columns.Add(new DataColumn("TimeZone", typeof(string)));
		dt.Columns.Add(new DataColumn("Latitude", typeof(double)));
		dt.Columns.Add(new DataColumn("Longitude", typeof(double)));
		//dt.Columns.Add(new DataColumn("Time", typeof(DateTimeOffset)));
		dt.Columns.Add(new DataColumn("Time", typeof(DateTime)));
		dt.Columns.Add(new DataColumn("Summary", typeof(string)));
		dt.Columns.Add(new DataColumn("Temperature", typeof(double)));
		dt.Columns.Add(new DataColumn("ApparentTemperature", typeof(double)));
		dt.Columns.Add(new DataColumn("Humidity", typeof(double)));
		dt.Columns.Add(new DataColumn("CloudCover", typeof(double)));
		dt.Columns.Add(new DataColumn("PrecipitationAccumulation", typeof(double)));
		dt.Columns.Add(new DataColumn("PrecipitationIntensity", typeof(double)));
		dt.Columns.Add(new DataColumn("PrecipitationProbability", typeof(double)));
		dt.Columns.Add(new DataColumn("PrecipitationType", typeof(string)));
		dt.Columns.Add(new DataColumn("WindSpeed", typeof(double)));
		dt.Columns.Add(new DataColumn("WindGust", typeof(double)));
		dt.Columns.Add(new DataColumn("WindBearing", typeof(int)));
		dt.Columns.Add(new DataColumn("DewPoint", typeof(double)));
		dt.Columns.Add(new DataColumn("Ozone", typeof(double)));
		dt.Columns.Add(new DataColumn("Pressure", typeof(double)));
		dt.Columns.Add(new DataColumn("UVIndex", typeof(double)));
		dt.Columns.Add(new DataColumn("Visibility", typeof(double)));






		List<string> hrs = new List<string>();
		foreach(HourDataPoint hr in forecast.Hourly.Hours)
		{
			DataRow row = dt.NewRow();

			row["TimeZone"] = forecast.TimeZone;
			row["Latitude"] = forecast.Latitude;
			row["Longitude"] = forecast.Longitude;
			row["Time"] = hr.Time.DateTime;
			row["Summary"] = hr.Summary;
			row["Temperature"] = Math.Round(hr.Temperature,2);
			row["ApparentTemperature"] = Math.Round(hr.ApparentTemperature,2);
			row["Humidity"] = Math.Round(hr.Humidity,4);
			row["CloudCover"] = Math.Round(hr.CloudCover,4);
			row["PrecipitationAccumulation"] = Math.Round(hr.PrecipitationAccumulation,4);
			row["PrecipitationIntensity"] = Math.Round(hr.PrecipitationIntensity,4);
			row["PrecipitationProbability"] = Math.Round(hr.PrecipitationProbability,4);
			row["PrecipitationType"] = hr.PrecipitationType;
			row["WindSpeed"] = Math.Round(hr.WindSpeed,2);

			row["WindGust"] = Math.Round(hr.WindGust,2);
			row["WindBearing"] = hr.WindBearing;
			row["DewPoint"] = Math.Round(hr.DewPoint,2);
			row["Ozone"] = Math.Round(hr.Ozone, 5);
			row["Pressure"] = Math.Round(hr.Pressure,2);
			row["UVIndex"] = Math.Round(hr.UVIndex,2);
			row["Visibility"] = Math.Round(hr.Visibility, 2);


			dt.Rows.Add(row);
		}

		return dt;
	}


}