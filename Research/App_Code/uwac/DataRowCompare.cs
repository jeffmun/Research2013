using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using uwac;

/// <summary>
/// Summary description for DataRowCompare
/// </summary>
public class DataRowCompare
{
    public ProcessLog log;
    public ProcessLog log_mismatches;
    public ProcessLog log_matches;
    public DataRow newrow;
    public DataRow savedrow;
    public string id { get; set; }
    public List<string> Mismatches { get; set; }
    public int num_sharedcolumns { get; set; }
    public int num_matches { get; set; }
    public int num_mismatches { get; set; }

    public Datadictionary dict { get; set; }
    public bool isREDCap { get; set; }
    public DataRowCompare(DataRow mynewrow, DataRow mysavedrow, Datadictionary mydict, bool myisREDCap)
    {
        //
        // TODO: Add constructor logic here
        //
        dict = mydict;
        isREDCap = myisREDCap;
        num_sharedcolumns = 0;
        num_matches = 0;
        num_mismatches = 0;
        log_mismatches = new ProcessLog("Data row mismatches");
        log_matches = new ProcessLog("Data row matches");

        log = new ProcessLog("Comparing data rows");

        newrow = mynewrow;
        savedrow = mysavedrow;
        CompareRows();

        if(AllMatch())
        {
            log_matches.Log(id);
        }
    }
    public string Results()
    {
        string result;

        if (num_sharedcolumns == 0) result = "No shared columns";
        else if (num_sharedcolumns == num_matches) result = "All match!";
        else
        {
            string plural = (num_mismatches == 1) ? "" : "es";
            result = String.Format("{0} mismatch{1} in {2} shared columns", num_mismatches, plural, num_sharedcolumns);
        }

        return (result);
    }



    public bool AllMatch()
    {
        bool allmatch = true;

        if (num_sharedcolumns == 0) allmatch = false;
        else if (num_mismatches > 0 & num_sharedcolumns > 0) allmatch = false;

        return (allmatch);
    }

    private void CompareRows()
    {
        List<string> new_colnames = newrow.Table.ColumnNames("lower");
        List<string> saved_colnames = savedrow.Table.ColumnNames("lower");
        id = "";

        for (int c = 0; c < newrow.ItemArray.Length; c++ )
        {
            string newcolname = new_colnames[c];

            if (newcolname == "id") id = newrow.ItemArray[c].ToString();

            if (saved_colnames.Contains(newcolname))
            {
                int savedcolidx = saved_colnames.FindIndex(a => a == newcolname);

                if(savedcolidx >= 0)
                {
                    num_sharedcolumns++;

                    string mm = (isREDCap) ? CompareStrings( dict.Fldname_TO_fldname_in_REDCap(newcolname), newcolname
                        , newrow.ItemArray[c].ToString(), savedrow.ItemArray[savedcolidx].ToString()) :
                        CompareStrings(newcolname, newcolname
                        , newrow.ItemArray[c].ToString(), savedrow.ItemArray[savedcolidx].ToString());

                    if (mm != null) log_mismatches.Log(mm);

                    //if (newrow.ItemArray[c].ToString() == savedrow.ItemArray[savedcolidx].ToString())
                    //{
                    //    num_matches++;
                    //}
                    //else // Mismatch
                    //{
                    //    num_mismatches++;
                    //    string space = "&nbsp;";
                    //    string spaces = "";
                    //    for (int i=0; i < 55 - colname.Length; i++)
                    //    {
                    //        spaces += space;
                    //    }

                    //    string mm = String.Format("id:{3} [{0}]{5}[{2}] != [{3}]", 
                    //        colname, colname2 , newrow.ItemArray[c].ToString(), savedrow.ItemArray[savedcolidx].ToString(), id, spaces);
                    //    log_mismatches.Log(mm);
                    //}

                }
            }
        }

    }

    private string CompareStrings(string colname1, string colname2, string s1, string s2)
    {

        if (s1.Trim().ToLower() == s2.Trim().ToLower())
        {
            num_matches++;
            return null;
        }
        else if ((s1 == null | s1=="") & s2 == "-9")
        {
            num_matches++;
            return null;
        }
        else // Mismatch
        {
            //TODO: NEED TO DEAL WITH DATES!!!!!!



            num_mismatches++;
            string space = "&nbsp;";
            string spaces = "";

            //int totlength = (colname1 == colname2) ? colname1.Length : colname1.Length + colname2.Length;

            //if(totlength < 55) for (int i = 0; i < 55 - totlength; i++) { spaces += space; }

            if (colname1==colname2)
            {
                return String.Format(@"<table><tr><td style=""width:300px"">id:{0} [{1}]</td><td>[{2}] != [{3}]</td></tr></table>", id, colname1,  s1, s2);
            }
            else
            {
                return String.Format(@"<table><tr><td style=""width: 300px"">id:{0} [{1}; {2}]</td><td>[{3}] != [{4}]</td></tr></table>", id, colname1, colname2, s1, s2);
                //return String.Format("id:{0} [{1}; {2}]{3}[{4}] != [{5}]", id, colname1, colname2, spaces, s1, s2);
            }
        }

    }

}