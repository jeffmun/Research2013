using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UploadedFileInfo
/// </summary>


namespace uwac
{


	public class UploadedFileInfo
	{
		public string UniqueFileName { get; set; }
		public string OriginalFileName { get; set; }
		public string FilePath { get; set; }
		public string FileSize { get; set; }
		public string SummaryInfo { get; set; }

		public UploadedFileInfo()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
