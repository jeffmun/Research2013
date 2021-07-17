using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

using uwac;

/// <summary>
/// Summary description for SleepSensorBox
/// </summary>
public class SleepSensorBox : Datapipeline
{
	public DataTable dt_sleepsensorbox;
	public string _id { get; set; }
	public int _timepointid { get; set; }

	public SleepSensorBox(int docversid, string filepath, string id, int timepointid)
	{
		_id = id;
		_timepointid = timepointid;

		Initialize(docversid, filepath);

		//date, time, lux, avg dBA, max dBA, temp(F) 


	}

	private void Initialize(int docversid, string filepath)
	{
		bool noColHeaders = true;
		_docvers = new Docvers(docversid, filepath, noColHeaders);

		_log = new ProcessLog(String.Format("Actigraphy Import (docversid={0})", _docvers.docversid));
		_logs.AddLog(_docvers.processing_results);
		_logs.AddLog(_log);

		if (_docvers.HasTables())
		{
			_docvers.dset.Tables[0].AddRowNumColumn();
			_log.Log(String.Format("origfilename = {0}", _docvers._origfilename));
		}
	}

}