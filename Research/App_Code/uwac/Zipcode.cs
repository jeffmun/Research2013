using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SimpleZipCode;

/// <summary>
/// Summary description for Zipcode
/// </summary>
public class Zipcode
{
	public Zipcode()
	{
		//
		// TODO: Add constructor logic here
		//

		var zipCodes = ZipCodeSource.FromMemory().GetRepository();
	}
}



///// <summary>
///// / from https://www.bls.gov/developers/api_c.htm
///// </summary>

////Post request example version 2.0
//var httpWebRequest = (HttpWebRequest)WebRequest.Create("https://api.bls.gov/publicAPI/v2/timeseries/data/");
//httpWebRequest.ContentType = "application/json";
//httpWebRequest.Method = "POST";
////Using Javascript Serializer
//using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
//{
//  var jS = new JavaScriptSerializer();
//var newJson = jS.Serialize(new SeriesPost()
//{
//	seriesid = (new List() { "CUUR0000SA0" }).ToArray(),
//	startyear = "",
//	endyear = "",
//	catalog = true,
//	calculations = true,
//	annualaverage = true,
//	registrationKey = "EnterRegistrationKeyHere"
//});
////View the JSON output
//System.Diagnostics.Debug.WriteLine(newJson);
//  streamWriter.Write(newJson);
//  streamWriter.Flush();
//  streamWriter.Close();
//}
//


