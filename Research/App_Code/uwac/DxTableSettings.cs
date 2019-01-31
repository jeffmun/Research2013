using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace uwac
{
	/// <summary>
	/// Summary description for DxTableSettings
	/// </summary>
	public abstract class DxTableSettings : IOutputtype
	{
		private DxOutputtype _outputtype; 

		private List<string> vars;

		public DxOutputtype outputtype { get { return _outputtype; } set { _outputtype = value; } }

		public DxLayout layout { get; set; }

		private int _maxRow = 4;
		private int _maxCol = 2;
		public int maxRow { get { return _maxRow; } set { _maxRow = value; } }
		public int maxCol { get { return _maxCol; } set { _maxCol = value; } }

		public DxTableSettings()
		{

		}

		//public DxTableSettings(DxOutputType mydxOutputType)
		//{
		//	SetOutputType(mydxOutputType);
		//	Initialize();
		//}

		public void Initialize()
		{ }


		public void SetOutputtype(DxOutputtype mydxOutputtype)
		{
			_outputtype = mydxOutputtype;
		}
	}

	public enum DxTableType : int
	{
		Crosstabs = 0
	}
}