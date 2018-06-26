using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Configuration;
using System.Collections;
using System.Web;


/// <summary>
/// Summary description for edit_uwac_data
/// </summary>
public class edit_uwac_data
{
	public edit_uwac_data()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    ////WE CAN ADAPT THE FOLLOWING TO USE STRONGLY-TYPED PARAMETERS EVEN THOUGH WE USE "COMMANDTEXT"
    ////from http://weblogs.sqlteam.com/jeffs/archive/2006/07/21/10728.aspx
        //Dim ID As Integer = 12
        //Dim Name As String = "O'Neil"
        //Dim TranDate As Date = Now.Date

        //Dim cm As New SqlCommand("", YourConnection)
        //cm.CommandText = "DELETE FROM YourTable WHERE ID=@ID and Name=@Name and TranDate=@TranDate"
        //cm.Parameters.Add("@ID", SqlDbType.Int).Value = ID
        //cm.Parameters.Add("@Name", SqlDbType.VarChar).Value = Name
        //cm.Parameters.Add("@TranDate", SqlDbType.DateTime).Value = TranDate


    public static SqlCommand sql_update_from_dict(string tbl, Dictionary<string, string> dict, string pk, int pkval)
    {
        SqlCommand cmd = sql_update_from_dict("ac", tbl, dict, pk, pkval);
        return cmd;
    }


    public static SqlCommand sql_update_from_dict (string schema, string tbl, Dictionary<string, string> dict, string pk, int pkval)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        string sql = "update " + schema + "." + tbl;
        int counter = 0;

        foreach(KeyValuePair<string, string> entry in dict)
            {
                string sep = (counter > 0) ? ", " : " set ";

                sql += sep + entry.Key + "= '" + CleanString(entry.Value.ToString()) + "' ";
                counter++;
            }

        sql += ", updated=getdate(), updatedBy=system_user  where " + pk + "=" + pkval.ToString();

        cmd.CommandText = sql;
        return cmd;
        //return sql;
    }

    public static SqlCommand sql_insert_from_dict(string tbl, Dictionary<string, string> dict )
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        string sql = "insert into " + tbl + "( " ;
        int counter = 0;

        string vars = "";
        string vals = "";

        foreach (KeyValuePair<string, string> entry in dict)
        {
            string sep = (counter > 0) ? ", " : " ";
            // do something with entry.Value or entry.Key
            vars += sep + entry.Key;
            vals += sep + "'" + CleanString(entry.Value.ToString()) + "'";
        }

        sql +=  vars + ", created, createdBy) values (" + vals + ", getdate(), system_user)";

        cmd.CommandText = sql;
        return cmd;
    }


    // This is a simple attempt to scrub the input so that it does not contain SQL reserved words like "drop", "delete", "insert", "update" that can be used 
    // as a SQL injection.
    // See:  https://msdn.microsoft.com/en-us/library/ff648339.aspx  


    public static string CleanString(string text)
    {
        string cleanvalue = text.Replace("DROP", "/*DR0P*/");
        cleanvalue = cleanvalue.Replace("DELETE", "/*D3L3T3*/");
        cleanvalue = cleanvalue.Replace("INSERT", "/*INS3RT*/");
        cleanvalue = cleanvalue.Replace("UPDATE", "/*UPD4T3*/");

        return cleanvalue;
    }

}