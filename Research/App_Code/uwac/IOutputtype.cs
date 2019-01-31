using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace uwac
{
	/// <summary>
	/// Summary description for IOutputtype
	/// </summary>

	public interface IOutputtype
	{
		void SetOutputtype(DxOutputtype dxOutputtype);
		void Initialize();
	}

	public enum DxOutputtype : int
	{
		Histogram = 0,
		Barchart = 1,
		StackedBarchart = 2,
		Scatterplot = 3,
		Lineplot = 4,
		PCA = 5,
		Actogram = 6,
		Crosstabs = 7
	}
}