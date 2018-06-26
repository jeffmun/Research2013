using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data.OleDb;
using AutismCenterBase.Utilities;
using System.IO;
using System.Text;
using Ionic.Zip;


namespace AutismCenterBase.Utilities
{
    /// <summary>
    /// Summary description for CreateTABdelim
    /// </summary>
    public class CreateTABdelim : StringWriter
    {
        public CreateTABdelim(DataTable dt) //, string filename)
        {
            //
            // TODO: Add constructor logic here
            //
             string tab = "";
            foreach (DataColumn dc in dt.Columns)
            {
                this.Write(tab + dc.ColumnName);
                tab = "\t";
            }
            this.Write("\n");

            int i;
            foreach (DataRow dr in dt.Rows)
            {
                tab = "";
                for (i = 0; i < dt.Columns.Count; i++)
                {
                    //remove TABs
                    string notab = dr[i].ToString().Replace("\t", "");
                    this.Write(tab + notab);
                    tab = "\t";
                }
                this.Write("\n");
            }
                   
        }

    }


}