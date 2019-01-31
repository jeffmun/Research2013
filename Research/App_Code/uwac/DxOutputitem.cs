using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace uwac
{ 
/// <summary>
/// Summary description for DxOutputitem
/// </summary>


	public abstract class DxOutputitem
	{
		public string guid { get; set; }
		public string emptymsg { get; set; }
		public string infomsg { get; set; }
		public string output { get; set; }
		public RowColIndex rowcolIndex { get; set; }
	}

	public class RowColIndex
	{
		public int r { get; set; }
		public int c { get; set; }
		public RowColIndex() { }
	}






}