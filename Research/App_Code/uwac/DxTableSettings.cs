using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace uwac
{
	/// <summary>
	/// Summary description for DxTableSettings
	/// </summary>
	public class DxTableSettings
	{
		private DxTableType _tabletype;
		private List<string> vars;

		public DxTableType tabletype { get { return _tabletype; } set { _tabletype = value; } }
		public DxLayout layout { get; set; }

		private int _maxRow = 4;
		private int _maxCol = 2;
		public int maxRow { get { return _maxRow; } set { _maxRow = value; } }
		public int maxCol { get { return _maxCol; } set { _maxCol = value; } }


		public DxTableSettings()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public void SetTableType(DxTableType dxTableType)
		{
			_tabletype = dxTableType;
		}
	}

	public enum DxTableType : int
	{
		Crosstabs = 0
	}
}