using System;
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
using AutismCenterBase.Utilities;
using System.IO;
using System.Drawing;
using System.Text;


namespace AutismCenterBase.Utilities
{
    /// <summary>
    /// Summary description for AutoGridView
    /// </summary>
    public class AutoGridView_withEdit : GridView
    {
        private string[] _control_types;
        private string[] _colnames;
        private string[] _colors;

        //private DataTable dt;
        private int _columncount;
        

        public AutoGridView_withEdit(string db, string sqlcmdtext)
            : this(db, sqlcmdtext, "gv_" + sqlcmdtext,  ",", ",")
        {
            // TODO: Add constructor logic here
        }


        public AutoGridView_withEdit(string db, string sqlcmdtext, string gvname)
            : this(db, sqlcmdtext, gvname,  ",", ",")
        {
            // TODO: Add constructor logic here
        }


        //With Auto Editing
        public AutoGridView_withEdit(string db, string sqlcmdtext, string gvname, string controltypes_CSV, string colors_CSV)
        {
            DBLookup oDBLookup = new DBLookup(db);
            DataTable dt;

            if (sqlcmdtext.StartsWith("sp"))
            {
                dt = oDBLookup.GetProc(sqlcmdtext);
            }
            else
            {
                dt = oDBLookup.GetView(sqlcmdtext);
            }


            //columns
            _columncount = dt.Columns.Count;
            _colnames = new string[_columncount];
            _control_types = new string[_columncount];
            _colors = new string[_columncount];


            _columncount = dt.Columns.Count;
            for (int c = 0; c < _columncount; c++)
            {
                _colnames[c] = dt.Columns[c].ColumnName;
            }


            //get column types 
            if (controltypes_CSV.StartsWith("all_"))
            {
                for (int i = 0; i < _columncount; i++)
                {
                    _control_types[i] = controltypes_CSV.Replace("all_", "");
                }
            }
            else
            {
                _control_types = controltypes_CSV.Split(',');
            }


            //get colors 
            if (colors_CSV.StartsWith("all_"))
            {
                for (int i = 0; i < _columncount; i++)
                {
                    _colors[i] = colors_CSV.Replace("all_", "");
                }
            }
            else
            {
                _colors = colors_CSV.Split(',');
            }



            //TOFIX: use LINQ to get the columns names
            //_colnames = (from dc in dt.Columns.Cast<DataColumn>()
            //                        select dc.ColumnName).ToArray();

            this.ID = gvname;
            this.EnableViewState = true;
            this.BorderColor.Equals(System.Drawing.Color.Silver);
            this.EditRowStyle.BackColor = Color.Yellow;

            this.AutoGenerateColumns = false;
            //TRYING TO DO THIS BELOW: 
            //this.AutoGenerateEditButton = AutoGenEditBtn;
            this.AllowSorting = true;

            TemplateField tf;

                #region using AutoGenereateEdit stuff
            CommandField cf = new CommandField();
            cf.ButtonType = ButtonType.Button;

            cf.ShowCancelButton = true;
            cf.ShowEditButton = true;
            //NOT SURE HOW INSERT OPERATES  cf.ShowInsertButton = true;

            cf.CausesValidation = false;
            this.Columns.Add(cf);
                #endregion

                ////Add the Edit/Update buttons
                //tf = new TemplateField();
                //tf.HeaderTemplate = new DynamicGridView_EditUpdateButtons("header", DataControlRowType.Header);
                //tf.ItemTemplate = new DynamicGridView_EditUpdateButtons("Edit", DataControlRowType.DataRow);
                //tf.EditItemTemplate = new DynamicGridView_EditUpdateButtons("Update", DataControlRowType.DataRow);
                
                //this.Columns.Add(tf);
         
            

            //Loop through the fields
            for (int i = 0; i < _columncount; i++)
            {
                tf = new TemplateField();

                #region Create the Control
                if (i < _control_types.Length)
                {
                    switch (_control_types[i])
                    {
                        case "l":
                            tf.HeaderTemplate = new DynamicGridViewTextTemplate(_colnames[i], DataControlRowType.Header);
                            tf.ItemTemplate = new DynamicGridViewTextTemplate(_colnames[i], DataControlRowType.DataRow);
                            tf.FooterTemplate = new DynamicGridViewTextBoxTemplate(_colnames[i], DataControlRowType.Footer);
                            tf.EditItemTemplate = new DynamicGridViewTextBoxTemplate(_colnames[i], DataControlRowType.DataRow);
                            break;

                        case "t":
                            tf.HeaderTemplate = new DynamicGridViewTextTemplate(_colnames[i], DataControlRowType.Header);
                            tf.ItemTemplate = new DynamicGridViewTextBoxTemplate(_colnames[i], DataControlRowType.DataRow);
                            tf.FooterTemplate = new DynamicGridViewTextBoxTemplate(_colnames[i], DataControlRowType.Footer);
                            break;

                        case "c":
                            tf.HeaderTemplate = new DynamicGridViewTextTemplate(_colnames[i], DataControlRowType.Header);
                            tf.ItemTemplate = new DynamicGridViewCheckBoxTemplate(_colnames[i], DataControlRowType.DataRow);
                            tf.FooterTemplate = new DynamicGridViewCheckBoxTemplate(_colnames[i], DataControlRowType.Footer);
                            break;

                        default:
                            tf.HeaderTemplate = new DynamicGridViewTextTemplate(_colnames[i], DataControlRowType.Header);
                            tf.ItemTemplate = new DynamicGridViewTextTemplate(_colnames[i], DataControlRowType.DataRow);
                            tf.FooterTemplate = new DynamicGridViewTextBoxTemplate(_colnames[i], DataControlRowType.Footer);
                            tf.EditItemTemplate = new DynamicGridViewTextBoxTemplate(_colnames[i], DataControlRowType.DataRow);
                            break;

                    }
                }
                else    //Default to a label if not specified
                {
                    tf.HeaderTemplate = new DynamicGridViewTextTemplate(_colnames[i], DataControlRowType.Header);
                    tf.ItemTemplate = new DynamicGridViewTextTemplate(_colnames[i], DataControlRowType.DataRow);

                    if (_colnames[i] == "created" || _colnames[i] == "createdBy"||_colnames[i] == "updated" || _colnames[i] == "updatedBy") {
                        tf.EditItemTemplate = new DynamicGridViewTextTemplate(_colnames[i], DataControlRowType.DataRow);
                    }
                    else {
                        tf.EditItemTemplate = new DynamicGridViewTextBoxTemplate(_colnames[i], DataControlRowType.DataRow);
                    }
                    tf.FooterTemplate = new DynamicGridViewTextBoxTemplate(_colnames[i], DataControlRowType.Footer);
                }
                #endregion


                #region  Format the Control
                if (i < _colors.Length)
                {
                    tf.HeaderStyle.CssClass = _colors[i];
                    tf.ItemStyle.CssClass = _colors[i];
                }
                else    //Default to black
                {
                    tf.HeaderStyle.CssClass = "gvBlack";
                    tf.ItemStyle.CssClass = "gvBlack";
                }
                #endregion

                this.Columns.Add(tf);

                //string[] mydatakeys = datakey.Split(',');
                //this.DataKeyNames = mydatakeys;

            }

            this.DataSource = dt;
            this.DataBind();


        }


        
        //public DataTable get_AGV_DataTable()
        //{
        //    return dt;
        //}
    }




}