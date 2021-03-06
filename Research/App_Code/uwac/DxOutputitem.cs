﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace uwac
{
	/// <summary>
	/// Summary description for DxOutputitem
	/// </summary>


	[Serializable]
	public abstract class DxOutputitem
	{
		public string guid { get; set; }
		public string emptymsg { get; set; }
		public string infomsg { get; set; }
		public string output { get; set; }
		public RowColIndex rowcolIndex { get; set; }
	}

	[Serializable]
	public class RowColIndex
	{
		public int r { get; set; }
		public int c { get; set; }
		public RowColIndex() { }
		public RowColIndex(int rownum, int colnum) {
			r = rownum;
			c = colnum;
		}
	}


	[Serializable]
	public class DxOutputchunk
	{
		public List<DxOutputitem> items { get; set; }

		public DxOutputchunk() { }
	}


}