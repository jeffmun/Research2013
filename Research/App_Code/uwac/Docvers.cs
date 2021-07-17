//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;

///// <summary>
///// Summary description for Docvers
///// </summary>
//public class Docvers
//{
//    public Docvers()
//    {
//        //
//        // TODO: Add constructor logic here
//        //
//    }
//}

using DevExpress.CodeParser;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
//using kaw;
using uwac;

namespace uwac
{
    /// <summary>
    /// Summary description for Docvers
    /// </summary>

    public class Docvers
    {
        public DataSet dset { get; set; }
        public int docversid { get; set; }
        public int doctypeid { get { return _doctypeid; } }
        public ProcessLog processing_results { get; set; }

        public string _file { get; set; }
        public string _relative_file { get; set; }
        public string _origfilename { get; set; }
        public string _fileext { get; set; }
        public string _docfilename { get; set; }
        public int _doctypeid { get; set; }

        public bool FileExistsLocally()
        {
            return false;
        }

        public bool HasTables()
        {
            if (dset == null) return false;
            else
            {
                return (dset.Tables.Count > 0) ? true : false;
            }
        }

        public bool noColumnHeaders { get; set; }

        public Docvers(int mydocversid, string filepath)
        {
            noColumnHeaders = false;
            processing_results = new ProcessLog(String.Format("Load Doc (docversid={0})", mydocversid));


            docversid = mydocversid;

            LoadDoc(filepath);
        }

        public Docvers(int mydocversid, string filepath, bool noColHeaders)
        {
            noColumnHeaders = noColHeaders;
            processing_results = new ProcessLog(String.Format("Load Doc (docversid={0})", mydocversid));

            docversid = mydocversid;

            LoadDoc(filepath);
        }

        private void GetDocMetaData()
        {
            if (docversid > 0)
            {
                //SQL_utils sql = new SQL_utils("backend");
                //_fileext = sql.StringScalar_from_SQLstring("Select fileext from tbldocvers where docversID=" + docversid.ToString());
                //_file = Server.MapPath(String.Format("~/webdocs/DocVersID_{0}{1}", docversid, _fileext));
                //_relative_file = String.Format("~/webdocs/DocVersID_{0}{1}", docversid, _fileext);

                //sql.NonQuery_from_SQLstring(String.Format("exec def.spDeleteDocVers_and_Data {0}", docversid));

                //bool fileexists = File.Exists(file);
            }
        }

        private void LoadDoc(string filepath)
        {
            if (docversid > 0)
            {
                SQL_utils sql = new SQL_utils("backend");

                DataTable dt_docversinfo = sql.DataTable_from_SQLstring(String.Format("select * from vwdocvers where docversid={0}", docversid));

                if (dt_docversinfo.HasRows())
                {
                    if (dt_docversinfo.Rows.Count == 1)
                    {
                        DataRow row = dt_docversinfo.Rows[0];
                        _origfilename = row["origfilename"].ToString();
                        _fileext = row["fileext"].ToString();
                        _doctypeid = Convert.ToInt32(row["doctypeid"].ToString());
                        _docfilename = row["docfilename"].ToString();
                    }


                    if (_fileext.ToLower() == ".xlsx" | _fileext.ToLower() == ".xls")
                    {
                        ReadExcelFile(filepath, _docfilename);
                    }
                    else if (_fileext.ToLower() == ".csv")
                    {
                        ReadExcelFile(filepath, _docfilename);
                    }

                }
                else
                {
                    processing_results.Log(String.Format("ERROR: docversID {0} not in DB.", docversid));
                }

            }
        }

        private void ReadExcelFile(string file_path, string filename)
        {

            Regex regex = new Regex(@"\d{4}"); //ensure that the filename has at least 4 digits


            if (regex.IsMatch(filename))
            {
                string str_docversid = regex.Match(filename).Value.ToString();
                int filename_docversid = Convert.ToInt32(str_docversid);


                string xlfile_path = String.Format("{0}{1}", file_path, filename);


                if (docversid == filename_docversid)
                {

                    if (noColumnHeaders)
                    {
                        dset = SpreadsheetGearUtils.GetDataSet(xlfile_path, false, false, SpreadsheetGear.Data.GetDataFlags.NoColumnHeaders);
                    }
                    else
                    {
                        dset = SpreadsheetGearUtils.GetDataSet(xlfile_path, false);
                    }
                    processing_results.Log(String.Format("Loaded file {0} (docversID {1})", filename, docversid));

                    if (dset != null)
                    {
                        if (_fileext.ToLower() == ".xlsx" | _fileext.ToLower() == ".xls")
                        {
                            processing_results.Log(String.Format("Excel file contains {0} sheets.", dset.Tables.Count));
                        }
                        else if (_fileext.ToLower() == ".csv")
                        {
                            if (dset.Tables.Count > 0)
                            {
                                processing_results.Log(String.Format("CSV file contains {0} rows.", dset.Tables[0].Rows.Count));
                            }
                            else
                            {
                                processing_results.Log(String.Format("CSV file not found."));
                            }
                        }
                    }
                }
                else
                {
                    processing_results.Log("No docversID provided.");
                }
            }

        }

    }

    public enum Doctype
    {

    }

}
