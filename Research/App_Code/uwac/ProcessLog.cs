using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ProcessLog
/// </summary>
public class ProcessLog
{
    public string logtitle { get; set; }
    private List<string> lognotes;
    public int numerrors { get; set; }
    public int numwarnings { get; set; }
    public ProcessLog(string mytitle)
    {
        logtitle = mytitle;
        numerrors = 0;
        numwarnings = 0;
        lognotes = new List<string>();

    }

    public int Numlogs()
    {
        return lognotes.Count;
    }

    public void Log(string s)
    {
        string color = "black";

        if (s.ToUpper().StartsWith("INFO")) { color = "royalblue"; }
        else if (s.ToUpper().StartsWith("PASS")) { color = "green"; }
        else if (s.ToUpper().Contains("WARNING")) { color = "orange"; numwarnings++; }
        else if (s.ToUpper().StartsWith("..FLAG")) { color = "orange"; }
        else if (s.ToUpper().Contains("ERROR")) { color = "red"; numerrors++; }

        string s_with_style = String.Format("<p style=\"display:inline; color:{0}\">{1}</p>", color, s);
        lognotes.Add(s_with_style);
    }



    public string LogNotesToHtml()
    {
        string results_html = String.Format("<b><u>{0}</u></b><br/>", logtitle);

        foreach (string i in lognotes)
        {
            results_html += i + "</br>";
        }

        results_html += "<br/>";
        return results_html;
    }

    public ASPxLabel LogNotesAsLabel()
    {
        ASPxLabel lbl = new ASPxLabel();
        lbl.EncodeHtml = false;
        lbl.Text = LogNotesToHtml();

        return lbl;
    }

}
