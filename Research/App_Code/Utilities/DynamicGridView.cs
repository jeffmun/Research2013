using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.Security;
using System.Text;



namespace AutismCenterBase.Utilities
{
    /// <summary>
    /// Summary description for DynamicGridView
    /// </summary>
    public class DynamicGridView
    {
        public DynamicGridView()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }


    //TextBox
    public class DynamicGridViewTextBoxTemplate : ITemplate
    {
        string _ColName;
        DataControlRowType _rowType;
        

        public DynamicGridViewTextBoxTemplate(string ColName, DataControlRowType RowType)
        {
            _ColName = ColName;
            _rowType = RowType;
        }

        public void InstantiateIn(System.Web.UI.Control container)
        {

            switch (_rowType)
            {
                case DataControlRowType.Header:
                    Literal lc = new Literal();
                    lc.Text = "<b>" + _ColName.Replace("txt_", "") + "</b>";
                    container.Controls.Add(lc);
                    break;
                case DataControlRowType.DataRow:
                    //Literal lbl = new Literal();
                    TextBox txt = new TextBox();
                    txt.ID = "txt_"+_ColName;
                    txt.DataBinding += new EventHandler(this.txt_DataBind);
                    //HttpUtility.HtmlDecode(lbl.Text );

                    container.Controls.Add(txt);
                    break;
                case DataControlRowType.Footer:

                     TextBox ftxt = new TextBox();
                    ftxt.ID = _ColName;
                    ftxt.Text = "";
                    //ftxt.DataBinding += new EventHandler(this.txt_DataBind);
                    container.Controls.Add(ftxt);
                    break;
                default:
                    break;
            }
        }

        

        private void txt_DataBind(Object sender, EventArgs e)
        {

            //Literal lbl = (Literal)sender;
            TextBox txt = (TextBox)sender;
            GridViewRow row = (GridViewRow)txt.NamingContainer;
            string bound_value_obj = null;
            bound_value_obj = DataBinder.Eval(row.DataItem, _ColName).ToString();
            txt.Text = bound_value_obj;

            ////TODO things differently for the ItemTemplate and EditItemTemplate
            //IDataItemContainer data_item_container = (IDataItemContainer)txt.NamingContainer;
            //Type ItemType = data_item_container.GetType();

            //switch (ItemType)
            //{
            //    case ListItemType.Item:
            //        txt.Text = bound_value_obj;
            //        break;

            //    case ListItemType.EditItem:
            //        txt.Text = bound_value_obj;
            //        break;

            //}

        }

    }


    //DDL
    public class DynamicGridViewDDLTemplate : ITemplate
    {
        string _ColName;
        string _DataSrc;
        string _DataValueField;
        string _DataTextField;
        DataControlRowType _rowType;
        int _Count;

        public DynamicGridViewDDLTemplate(string ColName, string DataSrc, string DataValueField, string DataTextField, DataControlRowType RowType)
        {
            _ColName = ColName;
            //_ColName = ColName.Split('|')[0];
            _DataSrc = DataSrc;
            _DataValueField = DataValueField;
            _DataTextField = DataTextField;
            _rowType = RowType;
        }

        public void InstantiateIn(System.Web.UI.Control container)
        {
            switch (_rowType)
            {
                case DataControlRowType.Header:
                    Literal lc = new Literal();
                    lc.Text = "<b>" + _ColName.Replace("ddl_", "") + "</b>";
                    container.Controls.Add(lc);
                    break;
                case DataControlRowType.DataRow:
                    //Literal lbl = new Literal();
                    DropDownList ddl = new DropDownList();
                    ddl.ID = _ColName;
                    ddl.DataBinding += new EventHandler(this.ddl_DataBind);
                    container.Controls.Add(ddl);
                    break;
                case DataControlRowType.Footer:
                    Literal flc = new Literal();
                    flc.Text = "<b>Footer text:" + _Count + "</b>";
                    container.Controls.Add(flc);
                    break;
                default:
                    break;
            }
        }


        private void ddl_DataBind(Object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddl.NamingContainer;
            //ddl.DataSource = DataBinder.Eval(row.DataItem, _DataSrc).ToString();
            //ddl.DataSourceID = _DataSrc;
            //ddl.DataValueField = _DataValueField;
            //ddl.DataTextField = _DataTextField;
            //ddl.DataSourceID = "sql_TimePoint";
            //ddl.DataValueField = "timepointID";
            //ddl.DataTextField = "timepoint_txt";

        }

    }

    //Label
    public class DynamicGridViewLabelTemplate : ITemplate
    {
        string _ColName;
        DataControlRowType _rowType;
        int _Count;

        public DynamicGridViewLabelTemplate(string ColName, DataControlRowType RowType)
        {
            _ColName = ColName;
            _rowType = RowType;
        }
        public DynamicGridViewLabelTemplate(DataControlRowType RowType, int ArticleCount)
        {
            _rowType = RowType;
            _Count = ArticleCount;
        }

        //public void InstantiateIn(System.Web.UI.DataBoundLiteralControl container)
        public void InstantiateIn(System.Web.UI.Control container)
        {
            switch (_rowType)
            {
                case DataControlRowType.Header:
                    Literal lc = new Literal();
                    lc.Text = "<b>" + _ColName + "</b>";
                    container.Controls.Add(lc);
                    break;
                case DataControlRowType.DataRow:
                    //Literal lbl = new Literal();
                    Label lbl = new Label();
                    lbl.ID = _ColName;
                    lbl.DataBinding += new EventHandler(this.lbl_DataBind);
                    //HttpUtility.HtmlDecode(lbl.Text );

                    container.Controls.Add(lbl);
                    break;
                case DataControlRowType.Footer:
                    Literal flc = new Literal();
                    flc.Text = "<b>Footer text: </b>";
                    container.Controls.Add(flc);
                    break;
                default:
                    break;
            }
        }


        private void lbl_DataBind(Object sender, EventArgs e)
        {
            //When the label is being bound to data this method is called which assign places the value of 
            // the _ColName column in the row's data items in the label's Text.

            //Literal lbl = (Literal)sender;
            Label lbl = (Label)sender;
            GridViewRow row = (GridViewRow)lbl.NamingContainer;
            lbl.Text = DataBinder.Eval(row.DataItem, _ColName).ToString();

        }

    }



    //HyperLink
    public class DGV_HyperLink : ITemplate
    {
        int _linktype;
        string _Col_for_text;
        string _Col_for_URLparams;
        string _textbase;
        string _urlbase;
        DataControlRowType _rowType;
        

        public DGV_HyperLink(int linktype, string Col_for_text, string Col_for_URLparams, string textbase, string urlbase, DataControlRowType RowType)
        {
            _linktype = linktype;
            _Col_for_text = Col_for_text;
            _Col_for_URLparams = Col_for_URLparams;
            _textbase = textbase;
            _urlbase = urlbase;
            _rowType = RowType;
        }

        public DGV_HyperLink(int linktype, string Col_for_text, string Col_for_URLparams, DataControlRowType RowType)
        {
            _Col_for_text = Col_for_text;
            _Col_for_URLparams = Col_for_URLparams;
            _textbase = "";
            _urlbase = "";
            _rowType = RowType;
        }

        //public void InstantiateIn(System.Web.UI.DataBoundLiteralControl container)
        public void InstantiateIn(System.Web.UI.Control container)
        {
            switch (_rowType)
            {
                case DataControlRowType.Header:
                    Literal lc = new Literal();
                    lc.Text = "<b>" + _Col_for_text + "</b>";
                    container.Controls.Add(lc);
                    break;
                case DataControlRowType.DataRow:
                    //Literal lbl = new Literal();
                    HyperLink hl = new HyperLink();
                    hl.ID = _Col_for_text;
                    string param_textbase = _textbase;
                    string param_urlbase = _urlbase;
                    
                    //hl.DataBinding += new EventHandler((sender, e) => this.hyp_DataBind(sender, e, param_textbase, param_urlbase));
                    hl.DataBinding += new EventHandler(this.hyp_DataBind);
                    
                
                    container.Controls.Add(hl);
                    break;
                case DataControlRowType.Footer:
                    Literal flc = new Literal();
                    flc.Text = "<b>Footer text: </b>";
                    container.Controls.Add(flc);
                    break;
                default:
                    break;
            }
        }


        private void hyp_DataBind(Object sender, EventArgs e) //, string param_textbase, string param_urlbase)
        {

            //Literal lbl = (Literal)sender;
            HyperLink hl = (HyperLink)sender;
            GridViewRow row = (GridViewRow)hl.NamingContainer;

            switch(_linktype)
            {
                //new hyperlinks
                /* PARAMS: linktype, Col_for_text, Col_for_URLparams, textbase, urlbase
                 *          1 :         Y i              Y i           N           Y       Column is text & URL params, needs urlbase
                 *          2 :         N                Y i           Y           Y       Column is URL params, text is textbase, needs urlbase
                 *          3 :         N                Y i           Y           N       Column is whole URL, text is textbase, NO urlbase
                 *          4 :         Y i              Y i+1         N           Y       Column is text & next Col is URL params, needs urlbase
                 * */

                case 1:
                    hl.Text = DataBinder.Eval(row.DataItem, _Col_for_text).ToString();
                    hl.NavigateUrl = _urlbase + DataBinder.Eval(row.DataItem, _Col_for_URLparams).ToString();
                    break;
                case 2:
                    hl.Text = _textbase;
                    hl.NavigateUrl = _urlbase + DataBinder.Eval(row.DataItem, _Col_for_URLparams).ToString();
                    break;
                case 3:
                    hl.Text = _textbase;
                    hl.NavigateUrl = DataBinder.Eval(row.DataItem, _Col_for_URLparams).ToString();
                    break;
                case 4:
                    hl.Text = DataBinder.Eval(row.DataItem, _Col_for_text).ToString();
                    hl.NavigateUrl = _urlbase + DataBinder.Eval(row.DataItem, _Col_for_URLparams).ToString();
                    break;
            }
        }

    }


    //HyperLink
    public class DynamicGridView_HyperLinkTemplate : ITemplate
    {
        string _ColName;
        string _ColData;
        string _url;
        DataControlRowType _rowType;
        int _Count;

        public DynamicGridView_HyperLinkTemplate(string ColName, string ColData, string url, DataControlRowType RowType)
        {
            _ColName = ColName;
            _ColData = ColData;
            _url = url;
            _rowType = RowType;
        }

        public DynamicGridView_HyperLinkTemplate(string ColName, string url, DataControlRowType RowType)
        {
            _ColName = ColName;
            _ColData = ColName;
            _url = url;
            _rowType = RowType;
        }
        public DynamicGridView_HyperLinkTemplate(DataControlRowType RowType, int ArticleCount)
        {
            _rowType = RowType;
            _Count = ArticleCount;
        }

        //public void InstantiateIn(System.Web.UI.DataBoundLiteralControl container)
        public void InstantiateIn(System.Web.UI.Control container)
        {
            switch (_rowType)
            {
                case DataControlRowType.Header:
                    Literal lc = new Literal();
                    lc.Text = "<b>" + _ColName + "</b>";
                    container.Controls.Add(lc);
                    break;
                case DataControlRowType.DataRow:
                    //Literal lbl = new Literal();
                    HyperLink hl = new HyperLink();
                    hl.ID = _ColName;
                    hl.DataBinding += new EventHandler(this.hl_DataBind);
                    //HttpUtility.HtmlDecode(lbl.Text );

                    container.Controls.Add(hl);
                    break;
                case DataControlRowType.Footer:
                    Literal flc = new Literal();
                    flc.Text = "<b>Footer text: </b>";
                    container.Controls.Add(flc);
                    break;
                default:
                    break;
            }
        }


        private void hl_DataBind(Object sender, EventArgs e)
        {
            //When the label is being bound to data this method is called which assign places the value of 
            // the _ColName column in the row's data items in the label's Text.

            //Literal lbl = (Literal)sender;
            HyperLink hl = (HyperLink)sender;
            GridViewRow row = (GridViewRow)hl.NamingContainer;
            
            hl.Text = DataBinder.Eval(row.DataItem, _ColName).ToString();
            hl.NavigateUrl = _url + DataBinder.Eval(row.DataItem, _ColData).ToString();
            
        }

    }




    //Text
    public class DynamicGridViewTextTemplate : ITemplate
    {
        string _ColName;
        DataControlRowType _rowType;
        int _Count;

        public DynamicGridViewTextTemplate(string ColName, DataControlRowType RowType)
        {
            _ColName = ColName;
            _rowType = RowType;
        }
        public DynamicGridViewTextTemplate(DataControlRowType RowType, int ArticleCount)
        {
            _rowType = RowType;
            _Count = ArticleCount;
        }

        //public void InstantiateIn(System.Web.UI.DataBoundLiteralControl container)
        public void InstantiateIn(System.Web.UI.Control container)
        {
            switch (_rowType)
            {
                case DataControlRowType.Header:
                    Literal lc = new Literal();
                    lc.Text = "<b>" + _ColName + "</b>";
                    container.Controls.Add(lc);
                    break;
                case DataControlRowType.DataRow:
                    //Literal lbl = new Literal();
                    Label lbl = new Label();
                    lbl.ID = _ColName;
                    lbl.DataBinding += new EventHandler(this.lbl_DataBind);
                    //HttpUtility.HtmlDecode(lbl.Text );

                    container.Controls.Add(lbl);
                    break;
                case DataControlRowType.Footer:
                    Literal flc = new Literal();
                    flc.Text = "<b>Footer text: </b>";
                    container.Controls.Add(flc);
                    break;
                default:
                    break;
            }
        }


        private void lbl_DataBind(Object sender, EventArgs e)
        {
            //When the label is being bound to data this method is called which assign places the value of 
            // the _ColName column in the row's data items in the label's Text.

            //Literal lbl = (Literal)sender;
            Label lbl = (Label)sender;
            GridViewRow row = (GridViewRow)lbl.NamingContainer;
            lbl.Text = DataBinder.Eval(row.DataItem, _ColName).ToString();

        }

    }


    //Literal
    public class DynamicGridViewLiteralTemplate : ITemplate
    {
        string _ColName;
        DataControlRowType _rowType;
        int _Count;

        public DynamicGridViewLiteralTemplate(string ColName, DataControlRowType RowType)
        {
            _ColName = ColName;
            _rowType = RowType;
        }

        //        public DynamicGridViewLiteralTemplate(DataControlRowType RowType, int ArticleCount)
        //        {
        //            _rowType = RowType;
        //            _Count = ArticleCount;
        //        }

        //public void InstantiateIn(System.Web.UI.DataBoundLiteralControl container)
        public void InstantiateIn(System.Web.UI.Control container)
        {
            switch (_rowType)
            {
                case DataControlRowType.Header:
                    Literal lc = new Literal();
                    lc.Text = "<b>" + _ColName + "</b>";
                    container.Controls.Add(lc);
                    break;
                case DataControlRowType.DataRow:
                    Literal rlc = new Literal();
                    rlc.DataBinding += new EventHandler(this.lit_DataBind);

                    container.Controls.Add(rlc);
                    break;
                case DataControlRowType.Footer:
                    Literal flc = new Literal();
                    flc.Text = "<b>Footer text:" + _Count + "</b>";
                    container.Controls.Add(flc);
                    break;
                default:
                    break;
            }
        }


        private void lit_DataBind(Object sender, EventArgs e)
        {
            Literal lit = (Literal)sender;
            GridViewRow row = (GridViewRow)lit.NamingContainer;
            lit.Text = DataBinder.Eval(row.DataItem, _ColName).ToString();
        }

    }


    //URL
    public class DynamicGridViewURLTemplate : ITemplate
    {
        string _ColNameText;
        string _ColNameURL;
        DataControlRowType _rowType;

        public DynamicGridViewURLTemplate(string ColNameText, string ColNameURL, DataControlRowType RowType)
        {
            _ColNameText = ColNameText;
            _ColNameURL = ColNameURL;
            _rowType = RowType;
        }


        public void InstantiateIn(System.Web.UI.Control container)
        {
            switch (_rowType)
            {
                case DataControlRowType.Header:
                    //USE the literal when just placing text straight into the cell
                    //Literal lc = new Literal();
                    //lc.Text = "<b>" + _ColNameURL + "</b>";

                    HyperLink hpl_h = new HyperLink();
                    hpl_h.Target = "_blank";
                    hpl_h.NavigateUrl = _ColNameURL;
                    hpl_h.Text = _ColNameText;
                    container.Controls.Add(hpl_h);
                    break;
                case DataControlRowType.DataRow:

                    HyperLink hpl_r = new HyperLink();

                    hpl_r.Target = "_blank";
                    hpl_r.DataBinding += new EventHandler(this.hpl_DataBind_content_pipe_URL);
                    container.Controls.Add(hpl_r);
                    break;
                default:
                    break;
            }
        }



        private void hpl_DataBind(Object sender, EventArgs e)
        {
            HyperLink hpl = (HyperLink)sender;
            GridViewRow row = (GridViewRow)hpl.NamingContainer;
            //hpl.NavigateUrl = DataBinder.Eval(row.DataItem, _ColNameURL).ToString();
            //hpl.Text = "<div class=\"Post\"><div class=\"PostTitle\">" + DataBinder.Eval(row.DataItem, _ColNameText).ToString() + "</div></div>";

            hpl.NavigateUrl = DataBinder.Eval(row.DataItem, _ColNameURL).ToString();
            hpl.Text = DataBinder.Eval(row.DataItem, _ColNameText).ToString();
        }

        private void hpl_DataBind_content_pipe_URL(Object sender, EventArgs e)
        {
            HyperLink hpl = (HyperLink)sender;


            GridViewRow row = (GridViewRow)hpl.NamingContainer;
            //hpl.NavigateUrl = DataBinder.Eval(row.DataItem, _ColNameURL).ToString();
            //hpl.Text = "<div class=\"Post\"><div class=\"PostTitle\">" + DataBinder.Eval(row.DataItem, _ColNameText).ToString() + "</div></div>";

            //string s = DataBinder.Eval(row.DataItem, _ColNameURL).ToString();

            //string celltext = s.Substring(0, s.IndexOf("|"));
            //string url = s.Substring(s.IndexOf("|") + 1, s.Length - s.IndexOf("|"));

            //Crazy dynamic processing of the cell contents and link
            //hpl.Text = DataBinder.Eval(row.DataItem, _ColNameText).ToString();
            //hpl.Text = "<%(FormatCellLink(" + DataBinder.Eval(row.DataItem, _ColNameText).ToString() + "\", \"text\"))%>";
            //hpl.NavigateUrl = "cnn.com";
            hpl.Text = FormatCellLink(DataBinder.Eval(row.DataItem, _ColNameText).ToString(), "text");
            hpl.NavigateUrl = FormatCellLink(DataBinder.Eval(row.DataItem, _ColNameText).ToString(), "url");
            // hpl.NavigateUrl = DataBinder.Eval(row.DataItem, _ColNameText).ToString().Substring(DataBinder.Eval(row.DataItem, _ColNameText).ToString().IndexOf("|") + 1, DataBinder.Eval(row.DataItem, _ColNameText).ToString().Length - DataBinder.Eval(row.DataItem, _ColNameText).ToString().IndexOf("|"));

            //hpl.NavigateUrl = DataBinder.Eval(row.DataItem, _ColNameURL).ToString();
            //hpl.Text = DataBinder.Eval(row.DataItem, _ColNameText).ToString();
        }


        public static string FormatCellLink(string contents, string type)
        {

            if (type == "text")
                if (contents.IndexOf("|") > 1) return contents.Substring(0, contents.IndexOf("|"));
                else return "";
            //return contents.Substring(0, contents.IndexOf("|"));
            else if (type == "url")
                //if (contents.IndexOf("|") > 1) return contents.Substring(contents.IndexOf("|") + 1, contents.Length - contents.IndexOf("|"));
                //else return "cnn.com";
                if (contents.IndexOf("|") > 1) return contents.Substring(contents.IndexOf("|") + 1);
                else return "cnn.com";
            //return "cnn.com";
            else
                return contents;
        }

    }

    //Edit/Update LinkButtons
    public class DynamicGridView_EditUpdateButtons : ITemplate
    {
        string _ColName;  //the contents of this column when evaluated row by row are applied to each button property that uses this
        DataControlRowType _rowType;
        
        int _Count;  //used when overloaded for the footer totals

        public DynamicGridView_EditUpdateButtons(string ColName, DataControlRowType RowType)
        {
            _ColName = ColName;
            _rowType = RowType;
        }

        public void InstantiateIn(System.Web.UI.Control container)
        {
            switch (_rowType)
            {
                case DataControlRowType.Header:

                    Literal lc = new Literal();
                    lc.Text = "<b>" + _ColName + "</b>";
                    container.Controls.Add(lc);
                    break;
                case DataControlRowType.DataRow:
                    Button lnk = new Button();
                    lnk.ID = _ColName;
                    lnk.CommandName = _ColName;
                    lnk.DataBinding += new EventHandler(this.lnk_DataBind);
                    lnk.CausesValidation = false;
                    container.Controls.Add(lnk);

                    if (_ColName == "Update")
                    {//also add "Cancel"
                        Button lnk2 = new Button();
                        lnk2.ID = "Cancel";
                        lnk2.CommandName = "Cancel";
                        lnk2.DataBinding += new EventHandler(this.lnk_DataBind_for_Cancel);
                        lnk2.CausesValidation = false;
                        container.Controls.Add(lnk2);
                    }


                    break;
                case DataControlRowType.Footer:
                    Literal flc = new Literal();
                    flc.Text = "<b>Footer text:" + _Count + "</b>";
                    container.Controls.Add(flc);
                    break;
                default:
                    break;
            }
        }

        private void lnk_DataBind_for_Cancel(Object sender, EventArgs e)
        {
            Button lnk = (Button)sender;
            GridViewRow row = (GridViewRow)lnk.NamingContainer;

            lnk.Text = "Cancel";
            lnk.CommandName = "Cancel";
        }

        private void lnk_DataBind(Object sender, EventArgs e)
        {
            Button lnk = (Button)sender;
            GridViewRow row = (GridViewRow)lnk.NamingContainer;

            lnk.Text = _ColName;
            lnk.CommandName = _ColName;

            //lnk.CommandArgument = DataBinder.Eval(row.DataItemIndex, _ColName ).ToString();
            //lnk.CommandArgument = DataBinder.Eval(row.DataItem, _ColName).ToString();


            //switch (_ColName)
            //{
            //    case "Edit":
            //        lnk.Text = "Edit";
            //        lnk.CommandName = 
            //        //lnk.CommandName = "rowcmd_Edit_StaffDetails";  //use in the "switch" statement inside the method to process the click
            //        break;
            //}


            ////Don't seem to do anything
            //string cmdarg = DataBinder.Eval(row.DataItem, _ColName).ToString();
            //try
            //{
            //    if (Convert.ToInt16(cmdarg) > 0) { lnk.Visible = true; }
            //    else { lnk.Visible = false; }
            //}
            //catch { }

        }


        private void lbl_DataBind(Object sender, EventArgs e)
        {
            //Literal lbl = (Literal)sender;
            Label lbl = (Label)sender;
            GridViewRow row = (GridViewRow)lbl.NamingContainer;
            lbl.Text = DataBinder.Eval(row.DataItem, _ColName).ToString();

        }

    }


    //Button
    public class DynamicGridViewButtonTemplate : ITemplate
    {
        string _ColName;  //the contents of this column when evaluated row by row are applied to each button property that uses this
        DataControlRowType _rowType;
        string _btnText;
        int _Count;  //used when overloaded for the footer totals

        public DynamicGridViewButtonTemplate(string ColName, DataControlRowType RowType)
        {
            _ColName = ColName;
            _rowType = RowType;
        }

        public DynamicGridViewButtonTemplate(string ColName, string btnText, DataControlRowType RowType)
        {
            _ColName = ColName;
            _btnText = btnText;
            _rowType = RowType;
        }

        public DynamicGridViewButtonTemplate(DataControlRowType RowType, int ArticleCount)
        {
            _rowType = RowType;
            _Count = ArticleCount;
        }

        public void InstantiateIn(System.Web.UI.Control container)
        {
            switch (_rowType)
            {
                case DataControlRowType.Header:
                    Literal lc = new Literal();
                    lc.Text = "<b>" + _ColName.Replace("btn_", "") + "</b>";
                    container.Controls.Add(lc);
                    break;
                case DataControlRowType.DataRow:
                    Button btn = new Button();
                    btn.ID = _ColName;
                    btn.CssClass = "ButtonText";
                    btn.DataBinding += new EventHandler(this.btn_DataBind);
                    container.Controls.Add(btn);
                    break;
                case DataControlRowType.Footer:
                    Literal flc = new Literal();
                    flc.Text = "<b>Footer text:" + _Count + "</b>";
                    container.Controls.Add(flc);
                    break;
                default:
                    break;
            }
        }


        private void btn_DataBind(Object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;

            switch (_ColName)
            {
                   //TODO: MOVE BACK TO THEIR PAGES IN THE _ROWDATABOUND METHOD WHERE THE COLUMN NAME CAN BE PROCESSED AND THERE UPDATE THESE PROPERTIES

                case "btn_EditStaff":
                    btn.Text = "Edit";
                    btn.CssClass = "ButtonText";
                    break;

                case "btn_AddMeas":
                    btn.Text = "Add meas";
                    btn.CssClass = "ButtonText";
                    break;
                case "btn_AddConsent":
                    btn.Text = "Add consent";
                    btn.CssClass = "ButtonText";
                    btn.Font.Size = 8;
                    break;
                case "btn_AddCFV":
                    btn.Text = "Add new version";
                    btn.CssClass = "ButtonText";
                    break;
                case "btn_AddAction":
                    btn.Text = "Add Action";
                    btn.CssClass = "ButtonText";
                    break;
                case "btn_DeleteSM":
                    btn.Text = "X";
                    btn.OnClientClick = "confirm_SMdelete()";
                    break;
                case "btn_DeleteSA":
                    btn.Text = "X";
                    btn.OnClientClick = "confirm_SAdelete()";
                    break;

                case "btn_MoveSM":
                    btn.Text = "Move";
                    btn.CssClass = "ButtonText";
                    break;

                case "btn_destSA":
                    btn.Text = "Move here";
                    btn.CssClass = "ButtonText";
                    break;

                case "btn_EditAction":
                    btn.Text = "Edit";
                    btn.CssClass = "ButtonText";
                    break;
                case "btn_EditMeas":
                    btn.Text = "Edit";
                    btn.CssClass = "ButtonText";
                    break;

                case "btn_AddRelSM":
                    btn.Text = "Add REL";
                    btn.CssClass = "ButtonText";
                    break;

            }

            btn.Text = _btnText;
            btn.CommandArgument = DataBinder.Eval(row.DataItem, _ColName).ToString();
            btn.CommandName = _ColName;  //use in the "switch" statement inside the method to process the click

            string cmdarg = DataBinder.Eval(row.DataItem, _ColName).ToString();
            try
            {
                if (Convert.ToInt16(cmdarg) > 0) { btn.Visible = true; }
                else { btn.Visible = false; }
            }
            catch { }

        }


        private void lbl_DataBind(Object sender, EventArgs e)
        {
            //Literal lbl = (Literal)sender;
            Label lbl = (Label)sender;
            GridViewRow row = (GridViewRow)lbl.NamingContainer;
            lbl.Text = DataBinder.Eval(row.DataItem, _ColName).ToString();

        }

    }

    //Edit/Update LinkButtons
    public class DynamicGridView_EditUpdateLinkButtons : ITemplate
    {
        string _ColName;  //the contents of this column when evaluated row by row are applied to each button property that uses this
        DataControlRowType _rowType;
        int _Count;  //used when overloaded for the footer totals

        public DynamicGridView_EditUpdateLinkButtons(string ColName, DataControlRowType RowType)
        {
            _ColName = ColName;
            _rowType = RowType;
        }

        public void InstantiateIn(System.Web.UI.Control container)
        {
            switch (_rowType)
            {
                case DataControlRowType.Header:

                    Literal lc = new Literal();
                    lc.Text = "<b>" + _ColName + "</b>";
                    container.Controls.Add(lc);
                    break;
                case DataControlRowType.DataRow:
                    LinkButton lnk = new LinkButton();
                    lnk.ID = _ColName;
                    lnk.CommandName = _ColName;  
                    lnk.DataBinding += new EventHandler(this.lnk_DataBind);
                    lnk.CausesValidation = false;
                    container.Controls.Add(lnk);

                    if (_ColName == "Update")
                    {//also add "Cancel"
                        LinkButton lnk2 = new LinkButton();
                        lnk2.ID = "Cancel";
                        lnk2.CommandName = "Cancel";   
                        lnk2.DataBinding += new EventHandler(this.lnk_DataBind_for_Cancel);
                        lnk2.CausesValidation = false;
                        container.Controls.Add(lnk2);
                    }


                    break;
                case DataControlRowType.Footer:
                    Literal flc = new Literal();
                    flc.Text = "<b>Footer text:" + _Count + "</b>";
                    container.Controls.Add(flc);
                    break;
                default:
                    break;
            }
        }

        private void lnk_DataBind_for_Cancel(Object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            GridViewRow row = (GridViewRow)lnk.NamingContainer;

            lnk.Text = "Cancel";
            lnk.CommandName = "Cancel";
        }

        private void lnk_DataBind(Object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            GridViewRow row = (GridViewRow)lnk.NamingContainer;

            lnk.Text = _ColName;
            lnk.CommandName = _ColName;
            //lnk.CommandArgument = "999";
            //lnk.CommandArgument = DataBinder.Eval(row.DataItem, _ColName).ToString();


            //switch (_ColName)
            //{
            //    case "Edit":
            //        lnk.Text = "Edit";
            //        lnk.CommandName = 
            //        //lnk.CommandName = "rowcmd_Edit_StaffDetails";  //use in the "switch" statement inside the method to process the click
            //        break;
            //}


            ////Don't seem to do anything
            //string cmdarg = DataBinder.Eval(row.DataItem, _ColName).ToString();
            //try
            //{
            //    if (Convert.ToInt16(cmdarg) > 0) { lnk.Visible = true; }
            //    else { lnk.Visible = false; }
            //}
            //catch { }

        }


        private void lbl_DataBind(Object sender, EventArgs e)
        {
            //Literal lbl = (Literal)sender;
            Label lbl = (Label)sender;
            GridViewRow row = (GridViewRow)lbl.NamingContainer;
            lbl.Text = DataBinder.Eval(row.DataItem, _ColName).ToString();

        }

    }


    //LinkButton
    public class DynamicGridViewLinkButtonTemplate : ITemplate
    {
        string _ColName;  //the contents of this column when evaluated row by row are applied to each button property that uses this
        DataControlRowType _rowType;
        

        int _Count;  //used when overloaded for the footer totals

        public DynamicGridViewLinkButtonTemplate(string ColName, DataControlRowType RowType)
        {
            _ColName = ColName;
            _rowType = RowType;
        }
        public DynamicGridViewLinkButtonTemplate(DataControlRowType RowType, int ArticleCount)
        {
            _rowType = RowType;
            _Count = ArticleCount;
        }

        public void InstantiateIn(System.Web.UI.Control container)
        {
            switch (_rowType)
            {
                case DataControlRowType.Header:
                    
                    Literal lc = new Literal();
                    lc.Text = "<b>" + _ColName.Replace("lnk_", "") + "</b>";
                    container.Controls.Add(lc);
                    break;
                case DataControlRowType.DataRow:
                    LinkButton lnk = new LinkButton();
                    lnk.ID = _ColName;
                    lnk.CommandName = _ColName;   //use in the "switch" statement inside the method to process the click
                    lnk.DataBinding += new EventHandler(this.lnk_DataBind);
                    container.Controls.Add(lnk);
                    break;
                case DataControlRowType.Footer:
                    Literal flc = new Literal();
                    flc.Text = "<b>Footer text:" + _Count + "</b>";
                    container.Controls.Add(flc);
                    break;
                default:
                    break;
            }
        }


        private void lnk_DataBind(Object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            GridViewRow row = (GridViewRow)lnk.NamingContainer;

            switch (_ColName)
            {
                case "lnk_EditStaff":
                    lnk.Text = "Edit";
                    //lnk.CommandName = "rowcmd_Edit_StaffDetails";  //use in the "switch" statement inside the method to process the click
                    break;
            }


            lnk.CommandArgument = DataBinder.Eval(row.DataItem, _ColName).ToString();
            
            ////Don't seem to do anything
            //string cmdarg = DataBinder.Eval(row.DataItem, _ColName).ToString();
            //try
            //{
            //    if (Convert.ToInt16(cmdarg) > 0) { lnk.Visible = true; }
            //    else { lnk.Visible = false; }
            //}
            //catch { }

        }


        private void lbl_DataBind(Object sender, EventArgs e)
        {
            //Literal lbl = (Literal)sender;
            Label lbl = (Label)sender;
            GridViewRow row = (GridViewRow)lbl.NamingContainer;
            lbl.Text = DataBinder.Eval(row.DataItem, _ColName).ToString();

        }

    }


    //CheckBox
    public class DynamicGridViewCheckBoxTemplate : ITemplate
    {
        string _ColName;  //the contents of this column when evaluated row by row are applied to each button property that uses this
        DataControlRowType _rowType;

        int _Count;  //used when overloaded for the footer totals

        public DynamicGridViewCheckBoxTemplate(string ColName, DataControlRowType RowType)
        {
            _ColName = ColName;
            _rowType = RowType;
        }
        public DynamicGridViewCheckBoxTemplate(DataControlRowType RowType, int ArticleCount)
        {
            _rowType = RowType;
            _Count = ArticleCount;
        }

        public void InstantiateIn(System.Web.UI.Control container)
        {
            switch (_rowType)
            {
                case DataControlRowType.Header:
                    Literal lc = new Literal();
                    lc.Text = "<b>" + _ColName.Replace("chk_", "") + "</b>";
                    container.Controls.Add(lc);
                    break;
                case DataControlRowType.DataRow:
                    CheckBox chk = new CheckBox();
                    chk.ID = _ColName;
                    chk.DataBinding += new EventHandler(this.chk_DataBind);
                    container.Controls.Add(chk);
                    break;
                case DataControlRowType.Footer:
                    CheckBox fchk = new CheckBox();
                    fchk.ID = _ColName;
                    fchk.Checked = false;
                    container.Controls.Add(fchk);
                    break;
                default:
                    break;
            }
        }


        private void chk_DataBind(Object sender, EventArgs e)
        {
            CheckBox chk = (CheckBox)sender;
            GridViewRow row = (GridViewRow)chk.NamingContainer;

            chk.Checked = Convert.ToBoolean(DataBinder.Eval(row.DataItem, _ColName));


            //switch (_ColName)
            //{
            //    case "chkAddToGroup":
            //        chk.Text = "Add to group";
            //        break;
            //}

        }


        private void lbl_DataBind(Object sender, EventArgs e)
        {
            //Literal lbl = (Literal)sender;
            Label lbl = (Label)sender;
            GridViewRow row = (GridViewRow)lbl.NamingContainer;
            lbl.Text = DataBinder.Eval(row.DataItem, _ColName).ToString();

        }

    }

    //CommandField
    public class DynamicGridView_CommandField : ITemplate
    {
        string _ColName;  //the contents of this column when evaluated row by row are applied to each button property that uses this
        DataControlRowType _rowType;
        

        int _Count;  //used when overloaded for the footer totals

        public DynamicGridView_CommandField(string ColName, DataControlRowType RowType)
        {
            _ColName = ColName;
            _rowType = RowType;
        }
        public DynamicGridView_CommandField(DataControlRowType RowType, int ArticleCount)
        {
            _rowType = RowType;
            _Count = ArticleCount;
        }

        public void InstantiateIn(System.Web.UI.Control container)
        {
            switch (_rowType)
            {
                case DataControlRowType.Header:
                    Literal lc = new Literal();
                    lc.Text = "meEdit";
                    container.Controls.Add(lc);
                    break;
                case DataControlRowType.DataRow:
                    CommandField cf = new CommandField();
                    cf.ButtonType = ButtonType.Button;

                    cf.ShowCancelButton = true;
                    cf.ShowEditButton = true;
                    cf.ShowInsertButton = true;
                    cf.ShowSelectButton = true;

                    cf.SelectText = "Sel";
                    cf.EditText = "Ed";
                    cf.InsertText = "Ins";

                    cf.ButtonType = ButtonType.Button;
                    cf.Visible = true;
                    cf.InsertVisible = true;

                    //Button btn = new Button();
                    //btn.ID = "btn_meEdit";
                    //btn.CssClass = "ButtonText";
                    //btn.DataBinding += new EventHandler(this.btn_DataBind);
                    //container.Controls.Add(btn);
                    break;
                case DataControlRowType.Footer:
                    Literal flc = new Literal();
                    flc.Text = "<b>Footer text:</b>";
                    container.Controls.Add(flc);
                    break;
                default:
                    break;
            }
        }


        private void btn_DataBind(Object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;

            switch (_ColName)
            {
                //TODO: MOVE BACK TO THEIR PAGES IN THE _ROWDATABOUND METHOD WHERE THE COLUMN NAME CAN BE PROCESSED AND THERE UPDATE THESE PROPERTIES

                case "btn_DeleteSM":
                    btn.Text = "X";
                    btn.OnClientClick = "confirm_SMdelete()";
                    break;

            }


            btn.CommandArgument = DataBinder.Eval(row.DataItem, _ColName).ToString();
            btn.CommandName = _ColName;  //use in the "switch" statement inside the method to process the click

            string cmdarg = DataBinder.Eval(row.DataItem, _ColName).ToString();
            try
            {
                if (Convert.ToInt16(cmdarg) > 0) { btn.Visible = true; }
                else { btn.Visible = false; }
            }
            catch { }

        }


        private void lbl_DataBind(Object sender, EventArgs e)
        {
            //Literal lbl = (Literal)sender;
            Label lbl = (Label)sender;
            GridViewRow row = (GridViewRow)lbl.NamingContainer;
            lbl.Text = DataBinder.Eval(row.DataItem, _ColName).ToString();

        }

    }



    /*
    // To tweak for hyperlinks
     * 
     * public class GridViewHyperlinkTemplate : ITemplate
{
    private DataControlRowType templateType;
    private string columnName;
    private string url;
    private string text;

    public GridViewHyperlinkTemplate(DataControlRowType type, 
        string colname, string URL, string Text)
    {
        templateType = type;
        columnName = colname;
        url = URL;
        text = Text;
    }

    public void InstantiateIn(System.Web.UI.Control container)
    {
        switch (templateType)
        {
            case DataControlRowType.Header:
                Literal lc = new Literal();
                lc.Text = "<b>" + columnName+ "</b>"; 
                container.Controls.Add(lc);
                break;
            case DataControlRowType.DataRow:
                HyperLink hl = new HyperLink();
                hl.Target = "_blank";
                hl.CssClass = "ReportNoWrap";
                hl.DataBinding += new EventHandler(this.hl_DataBinding);

                container.Controls.Add(hl);
                break;
            default:
                break;
        }
    }

    private void hl_DataBinding(Object sender, EventArgs e)
    {
        HyperLink hl = (HyperLink)sender;
        GridViewRow row = (GridViewRow)hl.NamingContainer;
        hl.NavigateUrl = DataBinder.Eval(row.DataItem, url).ToString();
        hl.Text = DataBinder.Eval(row.DataItem, text).ToString();
    }

}
     * */

    #region DynamicGridViewPipeLabelsTemplate
    //public class DynamicGridViewPipeLabelsTemplate : ITemplate
    //{
    //    string _ColNameText;
    //    string _ColNameURL;
    //    DataControlRowType _rowType;

    //    public DynamicGridViewPipeLabelsTemplate(string ColNameText, string ColNameURL, DataControlRowType RowType)
    //    {
    //        _ColNameText = ColNameText;
    //        _ColNameURL = ColNameURL;
    //        _rowType = RowType;
    //    }


    //    public void InstantiateIn(System.Web.UI.Control container)
    //    {
    //        switch (_rowType)
    //        {
    //            case DataControlRowType.Header:
    //                //USE the literal when just placing text straight into the cell
    //                Literal lc = new Literal();
    //                lc.Text = "<b>" + _ColNameURL + "</b>";

    //                //HyperLink hpl_h = new HyperLink();
    //                //hpl_h.Target = "_blank";
    //                //hpl_h.NavigateUrl = _ColNameURL;
    //                //hpl_h.Text = _ColNameText;
    //                //container.Controls.Add(hpl_h);
    //                break;
    //            case DataControlRowType.DataRow:

    //                Label hpl_r = new HyperLink();

    //                hpl_r.Target = "_blank";
    //                hpl_r.DataBinding += new EventHandler(this.hpl_DataBind_content_pipe_URL);
    //                container.Controls.Add(hpl_r);
    //                break;
    //            default:
    //                break;
    //        }
    //    }



    //    private void hpl_DataBind(Object sender, EventArgs e)
    //    {
    //        HyperLink hpl = (HyperLink)sender;
    //        GridViewRow row = (GridViewRow)hpl.NamingContainer;
    //        //hpl.NavigateUrl = DataBinder.Eval(row.DataItem, _ColNameURL).ToString();
    //        //hpl.Text = "<div class=\"Post\"><div class=\"PostTitle\">" + DataBinder.Eval(row.DataItem, _ColNameText).ToString() + "</div></div>";

    //        hpl.NavigateUrl = DataBinder.Eval(row.DataItem, _ColNameURL).ToString();
    //        hpl.Text = DataBinder.Eval(row.DataItem, _ColNameText).ToString();
    //    }

    //    private void hpl_DataBind_content_pipe_URL(Object sender, EventArgs e)
    //    {
    //        HyperLink hpl = (HyperLink)sender;


    //        GridViewRow row = (GridViewRow)hpl.NamingContainer;
    //        //hpl.NavigateUrl = DataBinder.Eval(row.DataItem, _ColNameURL).ToString();
    //        //hpl.Text = "<div class=\"Post\"><div class=\"PostTitle\">" + DataBinder.Eval(row.DataItem, _ColNameText).ToString() + "</div></div>";

    //        //string s = DataBinder.Eval(row.DataItem, _ColNameURL).ToString();

    //        //string celltext = s.Substring(0, s.IndexOf("|"));
    //        //string url = s.Substring(s.IndexOf("|") + 1, s.Length - s.IndexOf("|"));

    //        //Crazy dynamic processing of the cell contents and link
    //        //hpl.Text = DataBinder.Eval(row.DataItem, _ColNameText).ToString();
    //        //hpl.Text = "<%(FormatCellLink(" + DataBinder.Eval(row.DataItem, _ColNameText).ToString() + "\", \"text\"))%>";
    //        //hpl.NavigateUrl = "cnn.com";
    //        hpl.Text = FormatCellLink(DataBinder.Eval(row.DataItem, _ColNameText).ToString(), "text");
    //        hpl.NavigateUrl = FormatCellLink(DataBinder.Eval(row.DataItem, _ColNameText).ToString(), "url");
    //        // hpl.NavigateUrl = DataBinder.Eval(row.DataItem, _ColNameText).ToString().Substring(DataBinder.Eval(row.DataItem, _ColNameText).ToString().IndexOf("|") + 1, DataBinder.Eval(row.DataItem, _ColNameText).ToString().Length - DataBinder.Eval(row.DataItem, _ColNameText).ToString().IndexOf("|"));

    //        //hpl.NavigateUrl = DataBinder.Eval(row.DataItem, _ColNameURL).ToString();
    //        //hpl.Text = DataBinder.Eval(row.DataItem, _ColNameText).ToString();
    //    }


    //    public static string FormatCellLink(string contents, string type)
    //    {

    //        if (type == "text")
    //            if (contents.IndexOf("|") > 1) return contents.Substring(0, contents.IndexOf("|"));
    //            else return "";
    //        //return contents.Substring(0, contents.IndexOf("|"));
    //        else if (type == "url")
    //            //if (contents.IndexOf("|") > 1) return contents.Substring(contents.IndexOf("|") + 1, contents.Length - contents.IndexOf("|"));
    //            //else return "cnn.com";
    //            if (contents.IndexOf("|") > 1) return contents.Substring(contents.IndexOf("|") + 1);
    //            else return "cnn.com";
    //        //return "cnn.com";
    //        else
    //            return contents;
    //    }

    //}
    #endregion




    //maybe use these as helper functions

    //// ---- GetCellByName ----------------------------------
    ////
    //// pass in a GridViewRow and a database column name 
    //// returns a DataControlFieldCell or null

    //static public DataControlFieldCell GetCellByName(GridViewRow Row, String CellName)
    //{
    //    foreach (DataControlFieldCell Cell in Row.Cells)
    //    {
    //        if (Cell.ContainingField.ToString() == CellName)
    //            return Cell;
    //    }
    //    return null;
    //}




    //// ---- GetColumnIndexByHeaderText ----------------------------------
    ////
    //// pass in a GridView and a Column's Header Text
    //// returns index of the column if found 
    //// returns -1 if not found 

    //static public int GetColumnIndexByHeaderText(GridView aGridView, String ColumnText)
    //{
    //    TableCell Cell;
    //    for (int Index = 0; Index < aGridView.HeaderRow.Cells.Count; Index++)
    //    {
    //        Cell = aGridView.HeaderRow.Cells[Index];
    //        if (Cell.Text.ToString() == ColumnText)
    //            return Index;
    //    }
    //    return -1;
    //}

    //// ---- GetColumnIndexByDBName ----------------------------------
    ////
    //// pass in a GridView and a database field name
    //// returns index of the bound column if found 
    //// returns -1 if not found 

    //static public int GetColumnIndexByDBName(GridView aGridView, String ColumnText)
    //{
    //    System.Web.UI.WebControls.BoundField DataColumn;

    //    for (int Index = 0; Index < aGridView.Columns.Count; Index++)
    //    {
    //        DataColumn = aGridView.Columns[Index] as System.Web.UI.WebControls.BoundField;

    //        if (DataColumn != null)
    //        {
    //            if (DataColumn.DataField == ColumnText)
    //                return Index;
    //        }
    //    }
    //    return -1;
    //}

}