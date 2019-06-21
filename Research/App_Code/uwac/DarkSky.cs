using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using DarkSkyApi;
using DarkSkyApi.Models;


/// <summary>
/// Summary description for DarkSky
/// </summary>
public class DarkSky
{

	//Jeff Munson API key
	//9a9c19a4d9a62d812bf17136c99cc6cf 

	// Zucker Hillside hospital
	//40°45'09.7"N 73°42'39.3"W
	//40.752700, -73.710906

	//Central Park
	//40°46'53.5"N 73°57'60.0"W
	//40.781531, -73.966657

	//18 miles north, White Plains Hospital
	//41°01'35.0"N 73°46'05.9"W	
	//41.026394, -73.768312

	//38 miles north NewYork-Presbyterian/Hudson Valley Hospital, Cortlandt Manor NY
	//41°17'33.9"N 73°53'34.1"W
	//41.292741, -73.892797

	//28 miles west, University Hospital in Newark
	//40°44'25.5"N 74°11'22.9"W
	//40.740423, -74.189698

	//33 miles E NE, Stony Brook University Hospital
	//40°54'34.6"N 73°06'48.4"W
	//40.909615, -73.113439



	public DarkSky()
	{
		//
		// TODO: Add constructor logic here
		//

	}

	public async Task XAsync()
	{
		var client = new DarkSkyService("9a9c19a4d9a62d812bf17136c99cc6cf");

		Forecast result = await client.GetTimeMachineWeatherAsync(47.650479, -122.3091841, DateTimeOffset.Now);

	}

	//public struct Location
	//{
	//	float lat;
	//	float lon;
	//}

}