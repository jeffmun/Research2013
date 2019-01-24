using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace uwac
{
	/// <summary>
	/// Summary description for DxTable
	/// </summary>
	/// 	[Serializable]
	public abstract class DxTable 
	{

		public string guid { get; set; }
		public string emptymsg { get; set; }
		public string output { get; set; }

		public DxTable()
		{
			//
			// TODO: Add constructor logic here
			//
			Guid newguid = Guid.NewGuid();
			guid = newguid.ToString();

		}

	}



}