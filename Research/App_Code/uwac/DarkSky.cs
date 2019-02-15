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

}