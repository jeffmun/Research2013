using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using uwac;

/// <summary>
/// Summary description for ProcessLogs
/// </summary>
public class ProcessLogs
{
    public List<ProcessLog> logs { get; set; }
    public int numerrors { get; set; }
    public int numwarnings { get; set; }

    public ProcessLogs()
    {
        //
        // TODO: Add constructor logic here
        //
        logs = new List<ProcessLog>();

    }

    public void AddLog(ProcessLog log)
    {
        logs.Add(log);
    }

    public string LogNotesToHtml()
    {
        string html = "";
        foreach (ProcessLog log in logs)
        {
            html += log.LogNotesToHtml() + "<br/>";
        }
        return html;
    }

    public int Numerrors()
    {
        int numerrors = 0;
        foreach (ProcessLog log in logs)
        {
            numerrors += log.numerrors;
        }
        return numerrors;
    }

    public int Numwarnings()
    {
        int numwarnings = 0;
        foreach (ProcessLog log in logs)
        {
            numwarnings += log.numwarnings;
        }
        return numwarnings;
    }

    public void SaveLogsToDB(int docversid, string tblname, int nrows)
    {

        SQL_utils sql2 = new SQL_utils();

        string htmlresults = "";

        foreach (ProcessLog log in logs)
        {
            numerrors += log.numerrors;
            numwarnings += log.numwarnings;

            htmlresults += log.LogNotesToHtml();
        }


        string code1 = String.Format("insert into tblDocVers_ProcessingResults_OldLogs (  docversid, tblname, processing_results, nrows_attempted, numerrors, numwarnings, created, createdby, moved_to_oldlogs) " +
                " select docversid, tblname, processing_results, nrows_attempted, numerrors, numwarnings, created, createdby, getdate() from tblDocVers_ProcessingResults where docversid={0}", docversid);
        string code2 = String.Format("delete from tblDocVers_ProcessingResults where docversid={0}", docversid);

        string code3 = String.Format("insert into tblDocVers_ProcessingResults (docversid, tblname, processing_results, nrows_attempted, numerrors, numwarnings, created, createdby) values({0},'{1}','{2}',{3},{4},{5}, getdate(), sec.systemuser())"
            , docversid, tblname, LogNotesToHtml(), nrows, Numerrors(), Numwarnings());


        string result1 = sql2.NonQuery_from_SQLstring_withReturnMsg(code1);
        string result2 = sql2.NonQuery_from_SQLstring_withReturnMsg(code2);
        string result3 = sql2.NonQuery_from_SQLstring_withReturnMsg(code3);
        sql2.Close();

    }
}