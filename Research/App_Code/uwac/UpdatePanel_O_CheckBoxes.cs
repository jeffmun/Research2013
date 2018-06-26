using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace uwac_controls
{
    /// <summary>
    /// Summary description for UpdatePanel_O_CheckBoxes
    /// </summary>
    public class UpdatePanel_O_CheckBoxes : UpdatePanel
    {

        //private string _name;
        private string _header;
        private string _field_name;
        private string _field_value;
        private string _field_datatype;
        private string _field_ischecked;
        private string _all_state;

        public string Header
        {
            get { return _header; }
            set { _header = value; }
        }

        public string Fieldname
        {
            get { return _field_name; }
            set { _field_name = value; }
        }

        public string Field_value
        {
            get { return _field_value; }
            set { _field_value = value; }
        }
        public string Field_datatype
        {
            get { return _field_datatype; }
            set { _field_datatype = value; }
        }
        public string Field_ischecked
        {
            get { return _field_ischecked; }
            set { _field_ischecked = value; }
        }
        public string All_state
        {
            get { return _all_state; }
            set { _all_state = value; }
        }
        
        public UpdatePanel_O_CheckBoxes()
        {
            //
            // TODO: Add constructor logic here
            //
        }



        public UpdatePanel_O_CheckBoxes(DataTable dt, string name, string header, string fld_name, string fld_value, string fld_datatype, string fld_ischecked)
        {
            this.ID = name;
            this._header = header;
            this._field_name = fld_name;
            this._field_value = fld_value;
            this._field_datatype = fld_datatype;
            this._field_ischecked = fld_ischecked;

            if (_field_ischecked == "1") _all_state = "all";
            else _all_state = "none";

            HiddenField hid_allstate = new HiddenField();
            hid_allstate.ID = "hid" + fld_value + "_allstate";
            hid_allstate.Value = _all_state;
            this.ContentTemplateContainer.Controls.Add(hid_allstate);


            Literal lit0 = new Literal(); lit0.Text = "<br/>";
            Literal lit1 = new Literal(); lit1.Text = "<br/>";

            Label lbl = new Label();
            lbl.Text = header;

            Button btn = new Button();
            btn.Text = "All";
            btn.Font.Size = FontUnit.XXSmall;
            btn.ID = "btnALL_" + header;

            btn.Click += new EventHandler(CheckALL_CheckBoxes_in_Panel);

            AsyncPostBackTrigger trigger = new AsyncPostBackTrigger();
            trigger.ControlID = btn.ID;
            trigger.EventName = "Click";
            this.Triggers.Add(trigger);


            this.ContentTemplateContainer.Controls.Add(lbl);
            this.ContentTemplateContainer.Controls.Add(lit0);
            this.ContentTemplateContainer.Controls.Add(btn);
            this.ContentTemplateContainer.Controls.Add(lit1);


            foreach (DataRow row in dt.Rows)
            {
                CheckBox chk = new CheckBox();
                chk.Text = row[_field_name].ToString();

                if (_field_ischecked != "")
                {
                    if (_field_ischecked == "1") chk.Checked = true;
                    else if (_field_ischecked == "0") chk.Checked = false;
                    else
                    {
                        int ischecked = int.Parse(row[_field_ischecked].ToString());
                        chk.Checked = (ischecked == 1) ? true : false;
                    }
                }

                chk.ID = "chk" + _field_value + "|" + row[_field_value].ToString();

                this.ContentTemplateContainer.Controls.Add(chk);

                Literal lit2 = new Literal();
                lit2.Text = "<br/>";

                this.ContentTemplateContainer.Controls.Add(lit2);
            }

            this.UpdateMode = UpdatePanelUpdateMode.Conditional;
            

        }


        public void CheckALL_CheckBoxes_in_Panel(object sender, EventArgs e)
        {
            string hidname = "hid" + _field_value + "_allstate";
            HiddenField hid_allstate = (HiddenField)this.ContentTemplateContainer.FindControl(hidname);

            foreach (Control c in this.ContentTemplateContainer.Controls)
            {
                if (c.GetType() == typeof(CheckBox))
                {
                    var chk = (CheckBox)c;
                    if (hid_allstate.Value == "all")
                    {
                        chk.Checked = false;
                    }
                    else
                    {
                        chk.Checked = true;
                    }
                }
            }


            if (hid_allstate.Value == "all") hid_allstate.Value = "none";
            else hid_allstate.Value  = "all";

            this.Update();
        }
        
        public string GetChecked_as_Where_Clause()
        {
            string s = "";


            DataTable dt = GetChecked_as_DataTable();

            string sep = (this._field_datatype == "int") ? "," : "','";

            s = string.Join(sep, dt.AsEnumerable().Select(x => x[0]));

            if (s.Length>0)
            {
                string leadingchar = (this._field_datatype == "int") ? "" : "'";
                s =  _field_value + " in (" + leadingchar  + s + leadingchar + ")";
            }

            return s;
        }


        public string GetChecked_as_CSV()
        {
            string s = "";


            DataTable dt = GetChecked_as_DataTable();

            string sep = (this._field_datatype == "int") ? "," : "','";

            s = string.Join(sep, dt.AsEnumerable().Select(x => x[0]));

            if (s.Length > 0)
            {
                string leadingchar = (this._field_datatype == "int") ? "" : "'";
            }

            return s;
        }

        public DataTable GetChecked_as_DataTable()
        {

            DataTable dt = new DataTable();
            if (_field_datatype == "int")
            {
                dt.Columns.Add(_field_value, typeof(int));
            }
            else if (_field_datatype == "text")
            {
                dt.Columns.Add(_field_value, typeof(string));
            }


            foreach (Control ctl in this.ContentTemplateContainer.Controls)
            {

                if (ctl.GetType() == typeof(CheckBox))
                {
                    CheckBox chk = (CheckBox)ctl;

                    if (chk.Checked)
                    {
                        //get the value from the ctl ID
                        string[] ctlname = ctl.ID.Split('|');
                        DataRow row = dt.NewRow();

                        if (_field_datatype == "int")
                        {
                            row[_field_value] = int.Parse(ctlname[1]);
                        }
                        else if (_field_datatype == "text")
                        {
                            row[_field_value] = ctlname[1];
                        }
                        dt.Rows.Add(row);
                    }

                }
            }

            return dt;
        }


    }
}