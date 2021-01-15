using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using uwac;

/// <summary>
/// Summary description for SleepEnvironment
/// </summary>
public class SleepEnvironment
{
    public DataTable dt_slpenv { get; set; }
    public ProcessLog log { get; set; }

    public Docvers docvers;



//  Sample data:
//log 1 init:    ***OK***,,,,
//log 1 status:    ***OK***,,,,
//log 1 SD card:    ***OK***,,,,
//log 1 root dir:    ***OK***,,,,
//log 1 log file:    ***OK***,,,,
//log 2 init:    ***OK***,,,,
//log 2 status:    ***OK***,,,,
//log 2 SD card:    ***OK***,,,,
//log 2 root dir:    ***OK***,,,,
//log 2 log file:    ***OK***,,,,
//real-time clock:    ***OK***,,,,
//light sensor:    ***OK***,,,,
//Reading settings...,,,,
//Gain:,2, Integration Time:,800,
//,,,,
//date,time,lux,sound,temp(F)
//5/14/2020,16:10:27,235,79,69.7
//5/14/2020,16:10:38,227,80.3,69.5
//5/14/2020,16:10:49,235,74.2,69.1
//5/14/2020,16:11:00,235,44.1,69
//5/14/2020,16:11:11,233,82.9,68.9
//5/14/2020,16:11:21,235,41.5,68.8



    public SleepEnvironment()
    {
        //
        // TODO: Add constructor logic here
        //
        log = new ProcessLog("SleepEnvironment processing log");
        CreateTable();

    }

    public void CreateTable()
    {
        DataTable dt_ssb = new DataTable();

        dt_ssb.Columns.Add(new DataColumn("id", typeof(string)));
        dt_ssb.Columns.Add(new DataColumn("ssb_date", typeof(string)));
        dt_ssb.Columns.Add(new DataColumn("ssb_time", typeof(string)));
        dt_ssb.Columns.Add(new DataColumn("ssb_lux", typeof(float)));
        dt_ssb.Columns.Add(new DataColumn("ssb_sound", typeof(float)));
        dt_ssb.Columns.Add(new DataColumn("ssb_temp", typeof(float)));
        dt_ssb.Columns.Add(new DataColumn("ssb_cmnt", typeof(string)));

    }
}