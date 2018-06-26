using System;
using System.Collections;

using AutismCenterBase.Utilities;
using AutismCenterBase.Security;

namespace AutismCenterBase.Reports
{
	public class LinkedReference : IEnumerable
	{
		private string sLinkText;
		private string sURL;
        private bool bNewWindow = false;
		private ArrayList aURLParams = new ArrayList();

		public string LinkText
		{
			get {return sLinkText;}
			set {sLinkText = value;}
		}

		public string URL
		{
			get {return sURL;}
			set {sURL = value;}
		}

		public ArrayList URLParams
		{
			get {return aURLParams;}
		}

        public bool OpenInNewWindow
        {
            get { return bNewWindow; }
            set { bNewWindow = value; }
        }

		public void AddURLParam(string sURLParam)
		{
			aURLParams.Add(sURLParam);
		}

		#region URLParams Enumeration
		public IEnumerator GetEnumerator()
		{
			return aURLParams.GetEnumerator();
		}

		public class IURLParams : IEnumerator
		{
			private int i = -1;
			private LinkedReference[] ILinkedRefs;

			public void Reset() {i = -1;}
			public object Current {get {return null;}}

			public IURLParams(LinkedReference[] aLinkedRefs)
			{
                this.ILinkedRefs = aLinkedRefs;
			}

			public bool MoveNext()
			{
                if (i < ILinkedRefs.Length - 1)
					return true;
				else
					return false;
			}
		}
		#endregion
	}
}
