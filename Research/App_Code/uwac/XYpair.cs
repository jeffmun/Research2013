using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

namespace uwac
{
	/// <summary>
	/// Summary description for XYpair
	/// </summary>


	//public class XYpair
	//{
	//	public XYpair()
	//	{
	//		//
	//		// TODO: Add constructor logic here
	//		//
	//	}
	//}




	public class XYpair
	{
		private string _xvar;
		private string _yvar;
		private Color _color;

		public string xvar { get { return _xvar; } set { _xvar = value; } }
		public string yvar { get { return _yvar; } set { _yvar = value; } }

		public Color color { get { return _color; } set { _color = value; } }


	}

	public class XYpairs
	{
		private List<XYpair> _pairs;
		public List<XYpair> pairs { get { return _pairs; } set { _pairs = value; } }

		public XYpairs(List<string> vars)
		{
			_pairs = new List<XYpair>();

			for (int i = 0; i < vars.Count; i++)
			{
				for (int j = i + 1; j < vars.Count; j++)
				{
					XYpair pair = new XYpair { xvar = vars[i], yvar = vars[j] };
					_pairs.Add(pair);
				}

			}
		}

		public XYpairs(List<string> vars, Color color)
		{
			_pairs = new List<XYpair>();

			for (int i = 0; i < vars.Count; i++)
			{
				for (int j = i + 1; j < vars.Count; j++)
				{
					XYpair pair = new XYpair { xvar = vars[i], yvar = vars[j], color = color };
					_pairs.Add(pair);
				}

			}
		}

		public XYpairs(List<string> xvars, List<string> yvars)
		{
			_pairs = new List<XYpair>();

			for (int i = 0; i < xvars.Count; i++)
			{
				for (int j = 0; j < yvars.Count; j++)
				{
					if (xvars[i] != yvars[j])
					{
						XYpair pair = new XYpair { xvar = xvars[i], yvar = yvars[j] };
						_pairs.Add(pair);
					}
				}

			}
		}

		public XYpairs(List<string> vars, List<string> rptmeas, XYpairType type)
		{
			_pairs = new List<XYpair>();
			string x = "";
			string y = "";
			if (type == XYpairType.DiffVar_WithinLevelsOfRptMeas)
			{
				for (int i = 0; i < rptmeas.Count; i++)
				{
					for (int j = 0; j < (vars.Count - 1); j++)
					{
						for (int k = j + 1; k < vars.Count; k++)
						{
							x = String.Format("{0}_{1}", rptmeas[i], vars[j]);
							y = String.Format("{0}_{1}", rptmeas[i], vars[k]);
							XYpair pair = new XYpair { xvar = x, yvar = y };
							_pairs.Add(pair);
						}
					}
				}
			}

			else if (type == XYpairType.DiffVar_AcrossLevelsOfRptMeas)
			{
				for (int i = 0; i < rptmeas.Count; i++)
				{
					for (int j = i+1; j < rptmeas.Count; j++)
					{
						for (int k = 0; k < vars.Count; k++)
						{
							for (int l = 0; l < vars.Count; l++)
							{
								x = String.Format("{0}_{1}", rptmeas[i], vars[k]);
								y = String.Format("{0}_{1}", rptmeas[j], vars[l]);
								if ((i != j) & (k != l))
								{
									XYpair pair = new XYpair { xvar = x, yvar = y };
									_pairs.Add(pair);
								}
							}
						}
					}
				}
			}

			else if (type == XYpairType.SameVar_AcrossLevelsOfRptMeas)
			{
				for (int i = 0; i < vars.Count; i++)
				{
					for (int j = 0; j < (rptmeas.Count - 1); j++)
					{
						for (int k = j + 1; k < rptmeas.Count; k++)
						{
							x = String.Format("{0}_{1}", rptmeas[j], vars[i]);
							y = String.Format("{0}_{1}", rptmeas[k], vars[i]);
							XYpair pair = new XYpair { xvar = x, yvar = y };
							_pairs.Add(pair);
						}
					}
				}
			}

		}


		public void RemoveInverse()
		{
			List<int> indices_to_remove = new List<int>();
			for(int i=0; i < _pairs.Count; i++)
			{
				for (int j = (_pairs.Count-1);  j > i; j--)
				{
					string x1 = _pairs[i].xvar;
					string y1 = _pairs[i].yvar;
					string x2 = _pairs[j].xvar;
					string y2 = _pairs[j].yvar;

					bool b1 = (x1 == x2 & y1 == y2) ? true : false;
					bool b2 = (x1 == y2 & y1 == x2) ? true : false;

					if (b1 | b2 )
					{
						indices_to_remove.Add(j);
					}
				}

			}

			foreach(int k in indices_to_remove)
			{
				_pairs.RemoveAt(k);
			}
			
		}
	}

	//public enum XYpairType : int
	//{
	//	SameVar_AcrossLevelsOfRptMeas = 0,
	//	DiffVar_WithinLevelsOfRptMeas = 1,
	//	DiffVar_AcrossLevelsOfRptMeas = 2
	//}

}
