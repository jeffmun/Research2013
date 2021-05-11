using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace uwac
{
	/// <summary>
	/// Summary description for ChunkMarker
	/// </summary>

	public class ChunkMarker
	{
		public string text { get; set; }
		public string text_end { get; set; }
		public int measureID { get; set; }
		public int linenumber_start { get; set; }
		public int linenumber_end { get; set; }
		public ChunkMarker() { }
	}
}