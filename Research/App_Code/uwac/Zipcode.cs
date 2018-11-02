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