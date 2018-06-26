using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.ComponentModel.Design;
using System.Data.SqlClient;
using System.Data;
using System.Data.Common;

using DataEntryFramework;

namespace DataEntryFramework.Old.Design
{

	public class DataEntryControllerComponentEditorForm : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Button btnInclude2;
		private System.Windows.Forms.Button btnExclude2;
		private System.Windows.Forms.ColumnHeader FieldSetup;
		private System.Windows.Forms.ListView lvwColumns;
		private System.Windows.Forms.ColumnHeader FieldName;
		private System.Windows.Forms.ColumnHeader FieldDataType;
		private System.Windows.Forms.CheckBox chkIsDoubleEntryField;
		private System.Windows.Forms.CheckBox chkIsReadOnly;
		private System.Windows.Forms.CheckBox chkIsEntryValueRequired;
		private System.Windows.Forms.CheckBox chkIsEntryField;
		private System.Windows.Forms.CheckBox chkIsInsertValueRequired;
		private System.Windows.Forms.CheckBox chkIsInsertField;
		private System.Windows.Forms.Button btnUpdateSelected;
		private System.Windows.Forms.Button btnGetColumns;
		private System.Windows.Forms.Button okButton;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.TextBox textBox2;
		private System.Windows.Forms.Button btnCreateFields;
		private System.ComponentModel.Container components = null;




		public  string CrLf = "" + Convert.ToChar(13) + Convert.ToChar(10);
		//public const string SQL_CONNECTION_COMPONENTNAME = "sqlDataConnection";

		private string _primaryKeyColumnName = string.Empty; //primarykey property of controller
		private string _verifiedFieldColumnName = string.Empty; //verified property of controller
		private string _lookupField1 = string.Empty;
		private string _lookupField2 = string.Empty;
		private string _databaseTable = string.Empty;
		private ArrayList _dataFieldColumns = new ArrayList();
		
		// holds constructed sql strings
		private string _sqlUpdateVerified = string.Empty;
		private string _sqlLookup = string.Empty;
		private string _sqlInsert = string.Empty;
		private string _sqlSelect = string.Empty;
		private string _sqlUpdate = string.Empty;
		private System.Windows.Forms.ComboBox cbDataColumns;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.ColumnHeader TableIndexOrder;
		private System.Windows.Forms.Button btnUp;
		private System.Windows.Forms.Button btnDown;

		private DataEntryController _dec = null;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.ComboBox cbInsertDataColumns;
		private System.Windows.Forms.ComboBox cbReadOnlyDataColumns;
		private System.Windows.Forms.Label label5;

		private const int LIST_TAB_ORDER_COL = 3;


		public DataEntryControllerComponentEditorForm(DataEntryController dec)
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			_dec = dec;

			//get values user set on control for primarykey, verified
			_primaryKeyColumnName = dec.PrimaryKeyField;
			_verifiedFieldColumnName = dec.VerifiedField;
			_databaseTable = dec.DatabaseTable;
			_lookupField1 = dec.LookupField1;
			_lookupField2 = dec.LookupField2;

//			txtConnectString.Text = "packet size=4096;integrated security=SSPI;data source=autism-SQL;persist security info=False;initial catalog=uwautism_research_data";
//			txtSqlTable.Text = "edst3_ppvt";
			
			//wireup check box event handler
			chkIsInsertField.CheckedChanged += new EventHandler(this.FieldTypeCheckedHandler);
			chkIsInsertValueRequired.CheckedChanged += new EventHandler(this.FieldTypeCheckedHandler);
			chkIsEntryField.CheckedChanged += new EventHandler(this.FieldTypeCheckedHandler);
			chkIsEntryValueRequired.CheckedChanged += new EventHandler(this.FieldTypeCheckedHandler);
			chkIsReadOnly.CheckedChanged += new EventHandler(this.FieldTypeCheckedHandler);
			chkIsDoubleEntryField.CheckedChanged += new EventHandler(this.FieldTypeCheckedHandler);

			// get the database columsn.  If any exceptions
			//occur GetColumns shows it in a modal dialog then closes this form.
			GetColumns();


			// set default data columns
			cbDataColumns.SelectedIndex = 2;
			cbInsertDataColumns.SelectedIndex = 2;
			cbReadOnlyDataColumns.SelectedIndex = 1;


			this.btnUp.Click += new System.EventHandler(this.btnReorder_Click);
			this.btnDown.Click += new System.EventHandler(this.btnReorder_Click);

		}


		private void btnReorder_Click(object sender, System.EventArgs e)
		{


			//nothing to do if nothing is selected
			if (lvwColumns.SelectedItems.Count > 0 ) 
			{
			
				// save a list of the selected fields
				ArrayList selected = new ArrayList();
				foreach (ListViewItem i in lvwColumns.SelectedItems)
				{
					selected.Add(i.Tag);
				}
			

				int idxFirst = lvwColumns.SelectedItems[0].Index;
				int idxLast =  lvwColumns.SelectedItems[lvwColumns.SelectedItems.Count-1].Index;
				short tabIdxFirst = ((DataFieldColumn)lvwColumns.Items[idxFirst].Tag).TabIndex;
				short tabIdxLast= ((DataFieldColumn)lvwColumns.Items[idxLast].Tag).TabIndex;
				
				if ( ((Button)sender).Text == "Up")
				{
					// make preceding field last (if it exists)
					if (idxFirst > 0)
					{	
						((DataFieldColumn)lvwColumns.Items[idxFirst-1].Tag).TabIndex = tabIdxLast;

						// move selected up one
						for (int idx = idxFirst; idx <= idxLast; ++idx)
						{
							((DataFieldColumn)lvwColumns.Items[idx].Tag).TabIndex--;
						}

					}
				}

				if ( ((Button)sender).Text == "Down")
				{

					// give the field after the last one selected
					// the same tabindex of the first (if it exists)
					if (idxLast < (lvwColumns.Items.Count-1) )
					{	
						((DataFieldColumn)lvwColumns.Items[idxLast + 1].Tag).TabIndex = tabIdxFirst;

						// move selected down one
						for (int idx = idxFirst; idx <= idxLast; ++idx)
						{
							((DataFieldColumn)lvwColumns.Items[idx].Tag).TabIndex++;
						}

					}
				}


				//refresh
				FillListView();

				// reselect items that were moved
				foreach(ListViewItem i in lvwColumns.Items)
				{
					if (selected.Contains(i.Tag))
						i.Selected = true;
				}


				// set focus back to list
				lvwColumns.Focus();


			
			
			} //if (lvwColumns.SelectedItems.Count > 0 )
					
		}

		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if(components != null)
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.btnInclude2 = new System.Windows.Forms.Button();
			this.btnExclude2 = new System.Windows.Forms.Button();
			this.FieldSetup = new System.Windows.Forms.ColumnHeader();
			this.lvwColumns = new System.Windows.Forms.ListView();
			this.FieldName = new System.Windows.Forms.ColumnHeader();
			this.FieldDataType = new System.Windows.Forms.ColumnHeader();
			this.TableIndexOrder = new System.Windows.Forms.ColumnHeader();
			this.chkIsDoubleEntryField = new System.Windows.Forms.CheckBox();
			this.chkIsReadOnly = new System.Windows.Forms.CheckBox();
			this.chkIsEntryValueRequired = new System.Windows.Forms.CheckBox();
			this.chkIsEntryField = new System.Windows.Forms.CheckBox();
			this.chkIsInsertValueRequired = new System.Windows.Forms.CheckBox();
			this.chkIsInsertField = new System.Windows.Forms.CheckBox();
			this.btnUpdateSelected = new System.Windows.Forms.Button();
			this.btnGetColumns = new System.Windows.Forms.Button();
			this.okButton = new System.Windows.Forms.Button();
			this.label3 = new System.Windows.Forms.Label();
			this.button1 = new System.Windows.Forms.Button();
			this.textBox2 = new System.Windows.Forms.TextBox();
			this.btnCreateFields = new System.Windows.Forms.Button();
			this.cbDataColumns = new System.Windows.Forms.ComboBox();
			this.label1 = new System.Windows.Forms.Label();
			this.btnUp = new System.Windows.Forms.Button();
			this.btnDown = new System.Windows.Forms.Button();
			this.label2 = new System.Windows.Forms.Label();
			this.label4 = new System.Windows.Forms.Label();
			this.cbInsertDataColumns = new System.Windows.Forms.ComboBox();
			this.cbReadOnlyDataColumns = new System.Windows.Forms.ComboBox();
			this.label5 = new System.Windows.Forms.Label();
			this.SuspendLayout();
			// 
			// btnInclude2
			// 
			this.btnInclude2.Location = new System.Drawing.Point(96, 336);
			this.btnInclude2.Name = "btnInclude2";
			this.btnInclude2.TabIndex = 49;
			this.btnInclude2.Text = "Include";
			this.btnInclude2.Click += new System.EventHandler(this.btnInclude2_Click);
			// 
			// btnExclude2
			// 
			this.btnExclude2.Location = new System.Drawing.Point(8, 336);
			this.btnExclude2.Name = "btnExclude2";
			this.btnExclude2.TabIndex = 48;
			this.btnExclude2.Text = "Exclude";
			this.btnExclude2.Click += new System.EventHandler(this.btnExclude2_Click);
			// 
			// FieldSetup
			// 
			this.FieldSetup.Text = "Field Setup";
			this.FieldSetup.Width = 147;
			// 
			// lvwColumns
			// 
			this.lvwColumns.AllowColumnReorder = true;
			this.lvwColumns.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
																						 this.FieldName,
																						 this.FieldSetup,
																						 this.FieldDataType,
																						 this.TableIndexOrder});
			this.lvwColumns.GridLines = true;
			this.lvwColumns.HideSelection = false;
			this.lvwColumns.Location = new System.Drawing.Point(8, 104);
			this.lvwColumns.Name = "lvwColumns";
			this.lvwColumns.Size = new System.Drawing.Size(536, 216);
			this.lvwColumns.TabIndex = 47;
			this.lvwColumns.View = System.Windows.Forms.View.Details;
			this.lvwColumns.ColumnClick += new System.Windows.Forms.ColumnClickEventHandler(this.lvwColumns_ColumnClick);
			// 
			// FieldName
			// 
			this.FieldName.Text = "Field Name";
			this.FieldName.Width = 127;
			// 
			// FieldDataType
			// 
			this.FieldDataType.Text = "Field Data Type";
			this.FieldDataType.Width = 115;
			// 
			// TableIndexOrder
			// 
			this.TableIndexOrder.Text = "Tab Index";
			this.TableIndexOrder.Width = 78;
			// 
			// chkIsDoubleEntryField
			// 
			this.chkIsDoubleEntryField.Location = new System.Drawing.Point(264, 440);
			this.chkIsDoubleEntryField.Name = "chkIsDoubleEntryField";
			this.chkIsDoubleEntryField.TabIndex = 46;
			this.chkIsDoubleEntryField.Text = "Double Entry";
			// 
			// chkIsReadOnly
			// 
			this.chkIsReadOnly.Location = new System.Drawing.Point(144, 440);
			this.chkIsReadOnly.Name = "chkIsReadOnly";
			this.chkIsReadOnly.TabIndex = 45;
			this.chkIsReadOnly.Text = "Read-Only";
			// 
			// chkIsEntryValueRequired
			// 
			this.chkIsEntryValueRequired.Location = new System.Drawing.Point(280, 408);
			this.chkIsEntryValueRequired.Name = "chkIsEntryValueRequired";
			this.chkIsEntryValueRequired.Size = new System.Drawing.Size(152, 24);
			this.chkIsEntryValueRequired.TabIndex = 44;
			this.chkIsEntryValueRequired.Text = "Entry Value Required";
			// 
			// chkIsEntryField
			// 
			this.chkIsEntryField.Location = new System.Drawing.Point(232, 376);
			this.chkIsEntryField.Name = "chkIsEntryField";
			this.chkIsEntryField.TabIndex = 43;
			this.chkIsEntryField.Text = "Entry";
			// 
			// chkIsInsertValueRequired
			// 
			this.chkIsInsertValueRequired.Location = new System.Drawing.Point(144, 408);
			this.chkIsInsertValueRequired.Name = "chkIsInsertValueRequired";
			this.chkIsInsertValueRequired.Size = new System.Drawing.Size(160, 24);
			this.chkIsInsertValueRequired.TabIndex = 42;
			this.chkIsInsertValueRequired.Text = "Insert Value Required";
			// 
			// chkIsInsertField
			// 
			this.chkIsInsertField.Location = new System.Drawing.Point(144, 376);
			this.chkIsInsertField.Name = "chkIsInsertField";
			this.chkIsInsertField.Size = new System.Drawing.Size(72, 24);
			this.chkIsInsertField.TabIndex = 41;
			this.chkIsInsertField.Text = "Insert";
			// 
			// btnUpdateSelected
			// 
			this.btnUpdateSelected.Location = new System.Drawing.Point(8, 376);
			this.btnUpdateSelected.Name = "btnUpdateSelected";
			this.btnUpdateSelected.Size = new System.Drawing.Size(112, 23);
			this.btnUpdateSelected.TabIndex = 40;
			this.btnUpdateSelected.Text = "Update Selected";
			this.btnUpdateSelected.Click += new System.EventHandler(this.btnUpdateSelected_Click);
			// 
			// btnGetColumns
			// 
			this.btnGetColumns.Location = new System.Drawing.Point(336, 56);
			this.btnGetColumns.Name = "btnGetColumns";
			this.btnGetColumns.Size = new System.Drawing.Size(120, 23);
			this.btnGetColumns.TabIndex = 39;
			this.btnGetColumns.Text = "Get Columns";
			this.btnGetColumns.Visible = false;
			this.btnGetColumns.Click += new System.EventHandler(this.btnGetColumns_Click);
			// 
			// okButton
			// 
			this.okButton.Location = new System.Drawing.Point(8, 512);
			this.okButton.Name = "okButton";
			this.okButton.TabIndex = 34;
			this.okButton.Text = "&Done";
			this.okButton.Click += new System.EventHandler(this.okButton_Click);
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(16, 16);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(184, 72);
			this.label3.TabIndex = 51;
			this.label3.Text = "Field Setup Codes: [I] = Insert, [Ir] = Insert Required, [E] = Entry, [Er] = Entr" +
				"y Required, [D] = Double Entry, [R] = Read Only.";
			// 
			// button1
			// 
			this.button1.Location = new System.Drawing.Point(344, 16);
			this.button1.Name = "button1";
			this.button1.TabIndex = 52;
			this.button1.Text = "button1";
			this.button1.Visible = false;
			this.button1.Click += new System.EventHandler(this.button1_Click);
			// 
			// textBox2
			// 
			this.textBox2.Location = new System.Drawing.Point(264, 112);
			this.textBox2.Multiline = true;
			this.textBox2.Name = "textBox2";
			this.textBox2.Size = new System.Drawing.Size(232, 224);
			this.textBox2.TabIndex = 53;
			this.textBox2.Text = "";
			this.textBox2.Visible = false;
			// 
			// btnCreateFields
			// 
			this.btnCreateFields.Location = new System.Drawing.Point(8, 464);
			this.btnCreateFields.Name = "btnCreateFields";
			this.btnCreateFields.Size = new System.Drawing.Size(80, 23);
			this.btnCreateFields.TabIndex = 54;
			this.btnCreateFields.Text = "Create Fields";
			this.btnCreateFields.Click += new System.EventHandler(this.btnCreateFields_Click);
			// 
			// cbDataColumns
			// 
			this.cbDataColumns.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.cbDataColumns.Items.AddRange(new object[] {
															   "0",
															   "1",
															   "2",
															   "3",
															   "4"});
			this.cbDataColumns.Location = new System.Drawing.Point(336, 480);
			this.cbDataColumns.Name = "cbDataColumns";
			this.cbDataColumns.Size = new System.Drawing.Size(56, 21);
			this.cbDataColumns.TabIndex = 55;
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(112, 480);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(208, 23);
			this.label1.TabIndex = 56;
			this.label1.Text = "Data table columns (0=no table):";
			// 
			// btnUp
			// 
			this.btnUp.Enabled = false;
			this.btnUp.Location = new System.Drawing.Point(552, 216);
			this.btnUp.Name = "btnUp";
			this.btnUp.TabIndex = 57;
			this.btnUp.Text = "Up";
			// 
			// btnDown
			// 
			this.btnDown.Enabled = false;
			this.btnDown.Location = new System.Drawing.Point(552, 256);
			this.btnDown.Name = "btnDown";
			this.btnDown.TabIndex = 58;
			this.btnDown.Text = "Down";
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(112, 512);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(184, 23);
			this.label2.TabIndex = 59;
			this.label2.Text = "Insert table columns (0=no table):";
			// 
			// label4
			// 
			this.label4.Location = new System.Drawing.Point(112, 544);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(208, 23);
			this.label4.TabIndex = 60;
			this.label4.Text = "Read-only table columns (0=no table):";
			// 
			// cbInsertDataColumns
			// 
			this.cbInsertDataColumns.Items.AddRange(new object[] {
																	 "0",
																	 "1",
																	 "2",
																	 "3",
																	 "4"});
			this.cbInsertDataColumns.Location = new System.Drawing.Point(336, 504);
			this.cbInsertDataColumns.Name = "cbInsertDataColumns";
			this.cbInsertDataColumns.Size = new System.Drawing.Size(56, 21);
			this.cbInsertDataColumns.TabIndex = 61;
			// 
			// cbReadOnlyDataColumns
			// 
			this.cbReadOnlyDataColumns.Items.AddRange(new object[] {
																	   "0",
																	   "1",
																	   "2",
																	   "3",
																	   "4"});
			this.cbReadOnlyDataColumns.Location = new System.Drawing.Point(336, 536);
			this.cbReadOnlyDataColumns.Name = "cbReadOnlyDataColumns";
			this.cbReadOnlyDataColumns.Size = new System.Drawing.Size(56, 21);
			this.cbReadOnlyDataColumns.TabIndex = 62;
			// 
			// label5
			// 
			this.label5.Location = new System.Drawing.Point(584, 8);
			this.label5.Name = "label5";
			this.label5.Size = new System.Drawing.Size(40, 23);
			this.label5.TabIndex = 63;
			this.label5.Text = "v 1.0";
			// 
			// DataEntryControllerComponentEditorForm
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(640, 585);
			this.Controls.Add(this.label5);
			this.Controls.Add(this.cbReadOnlyDataColumns);
			this.Controls.Add(this.cbInsertDataColumns);
			this.Controls.Add(this.label4);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.btnDown);
			this.Controls.Add(this.btnUp);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.cbDataColumns);
			this.Controls.Add(this.btnCreateFields);
			this.Controls.Add(this.button1);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.btnInclude2);
			this.Controls.Add(this.btnExclude2);
			this.Controls.Add(this.lvwColumns);
			this.Controls.Add(this.chkIsDoubleEntryField);
			this.Controls.Add(this.chkIsReadOnly);
			this.Controls.Add(this.chkIsEntryValueRequired);
			this.Controls.Add(this.chkIsEntryField);
			this.Controls.Add(this.chkIsInsertValueRequired);
			this.Controls.Add(this.chkIsInsertField);
			this.Controls.Add(this.btnUpdateSelected);
			this.Controls.Add(this.btnGetColumns);
			this.Controls.Add(this.okButton);
			this.Controls.Add(this.textBox2);
			this.Name = "DataEntryControllerComponentEditorForm";
			this.Text = "DataEntryControllerComponentEditorForm";
			this.ResumeLayout(false);

		}
		#endregion
	
//		[STAThread]
//		static void Main() 
//		{
//			Application.Run(new DataEntryControllerComponentEditorForm());
//		}
	

		private void BuildSQL()
		{
			//throw error if any required inputs are missing
			if (_primaryKeyColumnName == string.Empty || _verifiedFieldColumnName == string.Empty
				|| _databaseTable == string.Empty || _lookupField1 == string.Empty)
				throw new Exception("PrimaryKeyField, VerifiedField, DatabaseTable and at least LookupField1 controller properties are required.");

			//sqlUpdateVerified
			_sqlUpdateVerified = "UPDATE " + _databaseTable + " SET " + _verifiedFieldColumnName + " = @" + 
				_verifiedFieldColumnName + " WHERE (" + _primaryKeyColumnName + " = @" + _primaryKeyColumnName + 
				"); SELECT * FROM " + _databaseTable + "  WHERE " + _primaryKeyColumnName + "= @" + _primaryKeyColumnName + ";";

			//sqlLookup
			_sqlLookup = "SELECT " + _databaseTable + ".*  FROM " + _databaseTable + 
					" WHERE (" + _lookupField1 + " = @" + _lookupField1 + ") " +
				((_lookupField2 != string.Empty)? " AND (" + _lookupField2 + "= @" + _lookupField2 + 
				" OR @" + _lookupField2 + " IS NULL)":"");

			//sqlInsert
			_sqlInsert = "INSERT INTO " + _databaseTable + " (";
			bool first = true;
			foreach (DataFieldColumn d in _dataFieldColumns)
			{
				if (d.IsInsertField == true && d.Excluded == false)
				{
					_sqlInsert += ((!first)?",":"") + d.ColumnName;
					first = false;
				}
			}

			_sqlInsert += "," + _verifiedFieldColumnName;
			_sqlInsert += ") VALUES (";
			
			first = true;
			foreach (DataFieldColumn d in _dataFieldColumns)
			{
				if (d.IsInsertField == true && d.Excluded == false)
				{
					_sqlInsert += ((!first)?",":"") + "@" + d.ColumnName;
					first = false;
				}
			}
			_sqlInsert += ", @" + _verifiedFieldColumnName;
			_sqlInsert += ");";

			_sqlInsert += " SELECT * FROM " + _databaseTable + 
				" WHERE " + _primaryKeyColumnName + " = @@IDENTITY;";


			//sqlSelect
			_sqlSelect = "SELECT " + _databaseTable + ".* FROM " +  _databaseTable +
				" WHERE " + _primaryKeyColumnName + " = @" + _primaryKeyColumnName;

			//sqlUpdate
			_sqlUpdate = "UPDATE " + _databaseTable + " SET ";
			first = true;
			foreach(DataFieldColumn d in _dataFieldColumns)
			{
				if (d.IsEntryField && d.Excluded == false)
				{
					_sqlUpdate += ((!first)?",":"") + d.ColumnName + "=@" + d.ColumnName;
					first = false;
				}
			}
			
			_sqlUpdate += "," + _verifiedFieldColumnName + "=@" + _verifiedFieldColumnName + " ";
			_sqlUpdate += " WHERE " + _primaryKeyColumnName + "=@" + _primaryKeyColumnName + "; ";
			_sqlUpdate += "SELECT * FROM " + _databaseTable + " WHERE " + _primaryKeyColumnName + "=@" + _primaryKeyColumnName + "; ";

		}




		private void FieldTypeCheckedHandler(Object sender, System.EventArgs e) 
		{
			//MessageBox.Show( ((CheckBox)sender).Name + ": " + ((CheckBox)sender).Checked);

			/*
			 * Property Consistency rules:
			 * 
			 * If IsEntryValueRequired = T then set IsEntryField = T
			 * if IsInsertValueRequired = T then set IsInsertField = T
			 * If IsEntryField = F then set IsEntryValueRequired = F and IsDoubleEntryField = F
			 * if IsInsertField = F the set IsInsertValueRequired = F
			 * If IsDoubleEntryField = T the set IsEntryField = T
			 * If IsReadOnly = T then All of isEntryField, isInsertField, isDoubleEntryField must be F
			 * If any of isEntryField, isInsertField, isDoubleEntryField is T then IsReadOnly must be F
			 * 
			 */

			CheckBox cbox = (CheckBox)sender;
			// identify the check box that's changing and apply consistency rules
			if (cbox.Name == "chkIsInsertField") 
			{
				if (cbox.Checked == false && chkIsInsertValueRequired.Checked == true)
					chkIsInsertValueRequired.Checked = false;

				if (cbox.Checked == true) chkIsReadOnly.Checked = false;

			}
			else if (cbox.Name == "chkIsInsertValueRequired")
			{
				if (cbox.Checked == true && chkIsInsertField.Checked == false)
					chkIsInsertField.Checked = true;
			
			}
			else if (cbox.Name == "chkIsEntryField")
			{
				if (cbox.Checked == false && chkIsEntryValueRequired.Checked == true)
					chkIsEntryValueRequired.Checked = false;

				if (cbox.Checked == false && chkIsDoubleEntryField.Checked == true)
					chkIsDoubleEntryField.Checked = false;

				if (cbox.Checked == true) chkIsReadOnly.Checked = false;

			}
			else if (cbox.Name == "chkIsEntryValueRequired")
			{
				if (cbox.Checked == true && chkIsEntryField.Checked == false)
					chkIsEntryField.Checked = true;

			}
			else if (cbox.Name == "chkIsReadOnly")
			{
				if (cbox.Checked == true)
				{
					chkIsInsertField.Checked = false;
					chkIsEntryField.Checked = false;
					chkIsDoubleEntryField.Checked = false;
				}
			}
			else if (cbox.Name == "chkIsDoubleEntryField")
			{
				if (cbox.Checked == true && chkIsEntryField.Checked == false)
					chkIsEntryField.Checked = true;

				if (cbox.Checked == true) chkIsReadOnly.Checked = false;
			}

		}

		private void okButton_Click(object sender, System.EventArgs e)
		{
		
			DialogResult = DialogResult.OK;
			Close();
		}



		private void GetColumns()
		{
			try 
			{


				//throw an error if any required controller property ismissing
				if (_primaryKeyColumnName == string.Empty || _verifiedFieldColumnName == string.Empty
					|| _databaseTable == string.Empty || _lookupField1 == string.Empty)
					throw new Exception("The controller is missing some required properties: PrimaryKeyField, VerifiedField, DatabaseTable, and LookupField1 are required.");

			
				//SqlConnection conn = new SqlConnection(txtConnectString.Text);
				SqlConnection conn = GetSqlConnection(Settings.SQL_CONNECTION_COMPONENTNAME);
				if (conn == null)
					throw new Exception(string.Format("Add a SqlConnection component to the form called {0}.",Settings.SQL_CONNECTION_COMPONENTNAME));


				SqlDataAdapter adapter = new SqlDataAdapter("select * from " + _databaseTable, conn);
				DataTable dt = new DataTable(_databaseTable);
				adapter.FillSchema(dt, SchemaType.Source);


				// throw an error if table doesn't contain a single field
				// primary key thats an identity field.
				string errMessage = string.Empty;
				if (dt.PrimaryKey.GetLength(0) != 1) 
					errMessage = "Table must have a single field primary key.";
				else if(dt.PrimaryKey[0].AutoIncrement != true)
					errMessage = "Table must have a single field primary key that is an Identity column.";
				else if(dt.PrimaryKey[0].ColumnName.ToUpper() != _primaryKeyColumnName.ToUpper())
					errMessage = string.Format("The supplied primary key field is incorrect: {0} is the primary key not {1}.",dt.PrimaryKey[0].ColumnName,_primaryKeyColumnName);
 
				
				if (errMessage != string.Empty)
					throw new Exception(errMessage);

				_dataFieldColumns.Clear();



				int tableColumnOrder = 1;
				bool bVerifiedFound = false;
				foreach (DataColumn c in dt.Columns)
				{
					DataFieldColumn df = new DataFieldColumn(c);

					//set table column order and tab index
					df.TabIndex = (short)tableColumnOrder;
					df.TableColumnOrder = tableColumnOrder++;

					//set primary key flag
					if (c.ColumnName.ToUpper() == _primaryKeyColumnName.ToUpper())
						df.PrimaryKey = true;


						//attempt to find verified column
					else if (c.ColumnName.ToUpper() == _verifiedFieldColumnName.ToUpper())
					{
						df.VerifiedField = true;
						bVerifiedFound = true;
	
					}

						//default created, createdby, updated, updatedby to read-only
					else if (c.ColumnName.ToLower() == "created" || c.ColumnName.ToLower() == "createdby"
						|| c.ColumnName.ToLower() == "updated" || c.ColumnName.ToLower() == "updatedby")
						df.IsReadOnly = true;
					
					else
					{
						// make all other columns double entry, entry value required
						df.IsEntryField = true;
						df.IsEntryValueRequired = true;
						df.IsDoubleEntryField = true;
					}	


					_dataFieldColumns.Add(df);

				}



				//throw an error if verified column wasn't found
				if (bVerifiedFound == false) 
					throw new Exception(string.Format("Couldn't find verified field: {0}",_verifiedFieldColumnName));

				FillListView();



			}
			catch(Exception ex)
			{
				//if any errors happen display them then close form
				// since user has to go back to form to correct.
				MessageBox.Show(ex.Message);
				DialogResult = DialogResult.Cancel;
				Close();

			}

		}

		private void btnGetColumns_Click(object sender, System.EventArgs e)
		{
		
		}

		private void FillListView()
		{

			//Set listviewitemsorter to null saving current ListViewItemSorter, if any
			//Sorting isn't valid until subitems exist
			IComparer currentListViewItemSorter = lvwColumns.ListViewItemSorter;
			lvwColumns.ListViewItemSorter = null;


			lvwColumns.Items.Clear();

			lvwColumns.BeginUpdate();
			foreach (object o in _dataFieldColumns)
			{
				DataFieldColumn d = (DataFieldColumn)o;

				string colname = d.ColumnName + ((d.PrimaryKey)?"-[PK]":"") + ((d.VerifiedField)?"-[VERIFIED]":"") + ((d.Excluded)?"-[EXCLUDED]":"");
				ListViewItem lvi = lvwColumns.Items.Add(colname);
				lvi.SubItems.Add(d.FieldSetupString());
				lvi.SubItems.Add(d.FieldDataTypeString());
				lvi.SubItems.Add(d.TabIndex.ToString());
				lvi.Tag = d;


			}
			lvwColumns.EndUpdate();


			// restore sorting
			lvwColumns.ListViewItemSorter = currentListViewItemSorter;
		}

		private void btnUpdateSelected_Click(object sender, System.EventArgs e)
		{
		
			// save a list of the selected fields
			ArrayList selected = new ArrayList();
			foreach (ListViewItem i in lvwColumns.SelectedItems)
			{
				selected.Add(i.Tag);
			}

			foreach(object o in lvwColumns.SelectedItems) 
			{
				DataFieldColumn dc = (DataFieldColumn)((ListViewItem)o).Tag;

				dc.IsInsertField = chkIsInsertField.Checked;
				dc.IsInsertValueRequired = chkIsInsertValueRequired.Checked;
				dc.IsEntryField = chkIsEntryField.Checked;
				dc.IsEntryValueRequired = chkIsEntryValueRequired.Checked;
				dc.IsReadOnly = chkIsReadOnly.Checked;
				dc.IsDoubleEntryField = chkIsDoubleEntryField.Checked;

			}
			FillListView();

			// reselect items that were moved
			foreach(ListViewItem i in lvwColumns.Items)
			{
				if (selected.Contains(i.Tag))
					i.Selected = true;
			}


			// set focus back to list
			lvwColumns.Focus();
		}

		private void lvwColumns_ColumnClick(object sender, System.Windows.Forms.ColumnClickEventArgs e)
		{
			// Set the ListViewItemSorter property to a new ListViewItemComparer object.
			this.lvwColumns.ListViewItemSorter = new ListViewItemComparer(e.Column);
			// Call the sort method to manually sort the column based on the ListViewItemComparer implementation.
			//lvwColumns.Sort();

			// disable up down buttons if not sorting on tab order
			btnDown.Enabled = (e.Column == LIST_TAB_ORDER_COL);
			btnUp.Enabled =  (e.Column == LIST_TAB_ORDER_COL);
		}



		private void btnExclude2_Click(object sender, System.EventArgs e)
		{

			// save a list of the selected fields
			ArrayList selected = new ArrayList();
			foreach (ListViewItem i in lvwColumns.SelectedItems)
			{
				selected.Add(i.Tag);
			}


			foreach(object o in lvwColumns.SelectedItems) 
			{
				DataFieldColumn dc = (DataFieldColumn)((ListViewItem)o).Tag;
				dc.Excluded = true;
			}
			FillListView();

			// reselect items that were moved
			foreach(ListViewItem i in lvwColumns.Items)
			{
				if (selected.Contains(i.Tag))
					i.Selected = true;
			}


			// set focus back to list
			lvwColumns.Focus();
		
		}

		private void btnInclude2_Click(object sender, System.EventArgs e)
		{

			// save a list of the selected fields
			ArrayList selected = new ArrayList();
			foreach (ListViewItem i in lvwColumns.SelectedItems)
			{
				selected.Add(i.Tag);
			}


			foreach(object o in lvwColumns.SelectedItems) 
			{
				DataFieldColumn dc = (DataFieldColumn)((ListViewItem)o).Tag;
				dc.Excluded = false;
			}
			FillListView();

			// reselect items that were moved
			foreach(ListViewItem i in lvwColumns.Items)
			{
				if (selected.Contains(i.Tag))
					i.Selected = true;
			}


			// set focus back to list
			lvwColumns.Focus();
		}



		private SqlConnection GetSqlConnection(string componentName)
		{
			IDesignerHost idh = null;
			idh = (IDesignerHost)_dec.Page.Site.GetService(typeof(IDesignerHost));

			SqlConnection sc = null;
			if (idh != null) 
			{
				foreach (Object c in idh.Container.Components)
				{
					sc = c as SqlConnection;
					if(sc != null)
					{
						if (sc.Site.Name == componentName)
							break;
						else
							sc = null;
					}
				}
			}
			return sc;
		}


		private void button1_Click(object sender, System.EventArgs e)
		{


			IDesignerHost idh = null;
			idh = (IDesignerHost)_dec.Page.Site.GetService(typeof(IDesignerHost));

			SqlCommand sq = null;

			if (idh != null) 
			{
				//DataFieldControl dfc = null;
				foreach (Object c in idh.Container.Components)
				{
					
					sq = c as SqlCommand;
					
					if(sq != null)
					{
						break;
					}
				}
			}

			sq.CommandText = "select * from edst3_ppvt where ppvt_key=@ppvt_key";


		














//			IDesignerHost idh = null;
//
//			EnvDTE.DTE myDTE;
//			myDTE = (EnvDTE.DTE)Microsoft.VisualBasic.Interaction.CreateObject("VisualStudio.DTE.7.1", "");
//
//			string s1 = string.Empty;
//			foreach (Window w in myDTE.Windows)
//			{
//				s1 += w.Caption;
//
//				if (w.Object is HTMLWindow)
//					s1 += "found!";
//			}
//			
//			textBox2.Text = s1;


//			s1 +=  "Activewindow: " + myDTE.ActiveWindow.Caption;
//			s1 += "foo: " + ((myDTE.ActiveDocument == null)? "null": myDTE.ActiveDocument.Name);

			

//			string s2 = string.Empty;
//			foreach (Document d in myDTE.Documents)
//			{
//				s2 += d.Name;
//			}

		
			
			


//			idh = (IDesignerHost) myDTE.ActiveWindow.Object;
//			
//		
//			if (idh == null)
//				textBox2.Text = (idh == null)?"idh is null": "idh is not null";




			// can I add code to the html window???
		}


		
		
		class DataFieldColumnComparer : IComparer 
		{

			public int Compare(object x, object y) 
			{
				return  ((DataFieldColumn)x).TabIndex.CompareTo( ((DataFieldColumn)y).TabIndex  );
			}
		}
		
		

		private string InsertTable(ArrayList insert_fields, int cols)
		{
			string insertTable = string.Empty;
			if (insert_fields.Count > 0)
			{

				if (cols == 0)
				{  
					//no table
					foreach(object o in insert_fields)
					{
						insertTable += ((DataFieldColumn)o).GetTag();
					}

				}
				else
				{
				
					// how many rows are needed
					int rows, remainder;
					rows = Math.DivRem(insert_fields.Count, cols, out remainder);
					if (remainder > 0) ++rows;

					insertTable = "<table id=\"table_insert\" class=\"tblinsert\" > ";
					int idx = 0;
					for(int r = 1; r <= rows; ++r)
					{ 
						insertTable += "<tr>";
						for (int c = 1; c <= cols; ++c)
						{
							insertTable += "<td>";
							insertTable += (idx <= insert_fields.Count - 1)?((DataFieldColumn)insert_fields[idx]).GetTag():"";
							insertTable += "</td>";
							++idx;
						}
						insertTable += "</tr>";
					}

					insertTable += "</table>";
				}
			}
			return insertTable;
		}


		private string EntryTable(ArrayList entry_fields, int cols)
		{
			string entryTable = string.Empty;
			// if cols == 0 return all tags without putting them in table
			if (cols == 0 )
			{
				foreach(object o in entry_fields)
				{
					entryTable += ((DataFieldColumn)o).GetTag();
				}
			}
			else 
			{
				// how many rows are needed
				int rows, remainder;
				rows = Math.DivRem(entry_fields.Count, cols, out remainder);
				if (remainder > 0) ++rows;

				entryTable = "<table id=\"table_entry\" class=\"tblentry\" > ";
				int idx;
				for(int r = 1; r <= rows; ++r)
				{ 
					entryTable += "<tr>";
					for (int c = 1; c <= cols; ++c)
					{
						entryTable += "<td>";
						idx = (r + (rows * (c - 1))) - 1;
						entryTable += (idx <= entry_fields.Count - 1)?((DataFieldColumn)entry_fields[idx]).GetTag():"";
						entryTable += "</td>";
					}
					entryTable += "</tr>";
				}

				entryTable += "</table>";
			}

			return entryTable;
		}


		private string ReadOnlyTable(ArrayList readonly_fields, int cols)
		{
			string readOnlyTable = string.Empty;
			if (readonly_fields.Count > 0)
			{

				if (cols == 0)
				{
					// no table
					foreach(object o in readonly_fields)
					{
						readOnlyTable += ((DataFieldColumn)o).GetTag();
					}
				}
				else
				{
					// how many rows are needed
					int rows, remainder;
					rows = Math.DivRem(readonly_fields.Count, cols, out remainder);
					if (remainder > 0) ++rows;

					readOnlyTable = "<table id=\"table_readonly\" class=\"tblreadonly\" > ";
					int idx = 0;
					for(int r = 1; r <= rows; ++r)
					{ 
						readOnlyTable += "<tr>";
						for (int c = 1; c <= cols; ++c)
						{
							readOnlyTable += "<td>";
							readOnlyTable += (idx <= readonly_fields.Count - 1)?((DataFieldColumn)readonly_fields[idx]).GetTag():"";
							readOnlyTable += "</td>";
							++idx;
						}
						readOnlyTable += "</tr>";
					}

					readOnlyTable += "</table>";
				}
			}
			return readOnlyTable;
		}


		private void btnCreateFields_Click(object sender, System.EventArgs e)
		{

			/*
			* Each field goes into one of 3 tables:
			* All insert fields go into a table.  All 
			* entry fields that aren't also insert fields
			*  go into another table (unless cbDataColumns = 0)
			* and all read-only fields go into a third table.
			* 
			*/


			// sort array list on tabindex
			_dataFieldColumns.Sort(new DataFieldColumnComparer() );


			// get all insert fields
			ArrayList insert_fields = new ArrayList();
			foreach (object o in _dataFieldColumns)
			{
				DataFieldColumn d = (DataFieldColumn)o;
				if (d.IsInsertField && d.Excluded == false)
				{
					insert_fields.Add(d);
				}
			}

			// get all entry fields
			ArrayList entry_fields = new ArrayList();
			foreach (object o in _dataFieldColumns)
			{
				DataFieldColumn d = (DataFieldColumn)o;
				if (d.IsInsertField == false && d.IsEntryField == true && d.Excluded == false)
				{
					entry_fields.Add(d);
				}
			}

			// get all read-only fields
			ArrayList readonly_fields = new ArrayList();
			foreach (object o in _dataFieldColumns)
			{
				DataFieldColumn d = (DataFieldColumn)o;
				if (d.IsReadOnly && d.Excluded == false)
				{
					readonly_fields.Add(d);
				}
			}


			// create insert table
			string insertTable = InsertTable(insert_fields, cbInsertDataColumns.SelectedIndex);

			// create entry table
			string entryTable = EntryTable(entry_fields,  cbDataColumns.SelectedIndex);

			// create read-only table
			string readOnlyTable = ReadOnlyTable(readonly_fields, cbReadOnlyDataColumns.SelectedIndex);


			string s = string.Empty;

			s += insertTable;
			s += entryTable;
			s += readOnlyTable;



			
//			string s = string.Empty;
//			foreach (object o in _dataFieldColumns)
//			{
//
//
//
//				DataFieldColumn d = (DataFieldColumn)o;
//				s += d.GetTag();
//
//			}

			BuildSQL();
			s += CrLf + CrLf;
			
			s += "****sqlUpdateVerified****" + CrLf;
			s += _sqlUpdateVerified + CrLf + CrLf;
			s += "****_sqlLookup****" + CrLf;
			s += _sqlLookup + CrLf + CrLf;
			s += "****_sqlInsert****" + CrLf;
			s += _sqlInsert + CrLf + CrLf;
			s += "****_sqlSelect****" + CrLf;
			s += _sqlSelect + CrLf + CrLf;
			s += "****_sqlUpdate****" + CrLf;
			s += _sqlUpdate + CrLf + CrLf;


			textBox2.Text = s;

			textBox2.SelectAll();
			textBox2.Copy();

			MessageBox.Show("Field definitions and SQL have been copied to the clipboard.");

		}
	
		// Implements the manual sorting of items by columns.
		class ListViewItemComparer : IComparer 
		{
			private int col;
			public ListViewItemComparer() 
			{
				col=0;
			}
			public ListViewItemComparer(int column) 
			{
				col=column;
			}
			public int Compare(object x, object y) 
			{
				if (col == LIST_TAB_ORDER_COL)
					// use a numeric comparison
					return (  Int32.Parse(((ListViewItem)x).SubItems[col].Text).CompareTo(Int32.Parse( ((ListViewItem)y).SubItems[col].Text))   );
				else
					return String.Compare(((ListViewItem)x).SubItems[col].Text, ((ListViewItem)y).SubItems[col].Text);
			}
		}

	
	
	} //DataEntryControllerComponentEditorForm



	public class DataFieldColumn
	{

		public string GetTag()
		{
			string tag = string.Empty;
			tag = "<def:datafieldcontrol id=\"" + ColumnName + "\" runat=\"server\" ";
			tag += "FieldDataType=\"" + FieldDataTypeString() + "\" ";
			tag += "IsInsertField=\"" + IsInsertField + "\" ";
			tag += "IsInsertValueRequired=\"" + IsInsertValueRequired + "\" ";
			tag += "IsEntryField=\"" + IsEntryField + "\" ";
			tag += "IsEntryValueRequired=\"" + IsEntryValueRequired + "\" ";
			tag += "IsReadOnly=\"" + IsReadOnly + "\" ";
			tag += "IsDoubleEntryField=\"" + IsDoubleEntryField + "\" ";
			tag += "FieldLabelText=\"" + ColumnName + "\" ";
			tag += "FieldTextBoxTabIndex=\"" + TabIndex + "\" ";
			tag += "DatabaseField=\"" + ColumnName + "\">";
			tag += "</def:datafieldcontrol>" + Convert.ToChar(13) + Convert.ToChar(10);

			return tag;

		}


		public DataFieldColumn(DataFieldControl dfc)
		{
			
			IsDoubleEntryField = dfc.IsDoubleEntryField;
			IsEntryField = dfc.IsEntryField;
			IsEntryValueRequired = dfc.IsEntryValueRequired;
			IsInsertField = dfc.IsInsertField;
			IsInsertValueRequired = dfc.IsInsertValueRequired;
			IsReadOnly = dfc.IsReadOnly;
			TabIndex = dfc.FieldTextBoxTabIndex;
			ColumnName = dfc.DatabaseField;
			FieldDataType = dfc.FieldDataType;
			FieldLabel = dfc.FieldLabelText;

			DataFieldControl = dfc;

		}

		public DataFieldColumn( DataColumn c )
		{
		
			//set field type based on column data type

			// INT: Byte, Int16, Int32, Int64, SByte, UInt16, UInt32, UInt64
			if (typeof(Int32).Equals(c.DataType ) ||
				typeof(Int16).Equals(c.DataType ) ||
				typeof(Int64).Equals(c.DataType ) ||
				typeof(Byte).Equals(c.DataType) ||
				typeof(SByte).Equals(c.DataType) ||
				typeof(UInt16).Equals(c.DataType) ||
				typeof(UInt32).Equals(c.DataType) ||
				typeof(UInt64).Equals(c.DataType))

				FieldDataType = FieldDataType.INT;
			
				// FLOAT: Decimal, Double, Single
			else if ( typeof(Decimal).Equals(c.DataType) ||
				typeof(Double).Equals(c.DataType) ||
				typeof(Single).Equals(c.DataType) )

				FieldDataType = FieldDataType.FLOAT;
			
				// TEXT:
			else if (typeof(String).Equals(c.DataType))
				FieldDataType = FieldDataType.TEXT;

				// DATE: DateTime
			else if (typeof(DateTime).Equals(c.DataType))
				FieldDataType = FieldDataType.DATE;

				// error: Boolean, Char, TimeSpan
			else
			{
				//throw an error if unmappable data type found
				throw new Exception(string.Format("Field {0} has an invalid type: {1}",c.ColumnName,c.DataType.Name));
			}

			//column name
			ColumnName = c.ColumnName;

		}

		
		
		public string FieldSetupString()
		{

			//Make a string to indicate the current settings
			string settings = string.Empty;
			if (IsInsertField == true)
			{
				if(IsInsertValueRequired == true)
					settings += "[Ir]";
				else
					settings += "[I]";
			}
			if (IsEntryField == true)
			{	
				if (IsEntryValueRequired)
					settings += (settings == string.Empty)? "[Er]" : ",[Er]";
				else
					settings += (settings == string.Empty)? "[E]" : ",[E]";

			}
			if (IsDoubleEntryField == true) settings += (settings == string.Empty)? "[D]" : ",[D]";
			if (IsReadOnly == true) settings += (settings == string.Empty)? "[R]" : ",[R]";

			return settings;
		}

		public string FieldDataTypeString()
		{
			string ftype = string.Empty;
			switch (FieldDataType)
			{	
				case FieldDataType.INT:
					ftype = "INT";
					break;
				case FieldDataType.FLOAT:
					ftype = "FLOAT";
					break;
				case FieldDataType.DATE:
					ftype = "DATE";
					break;
				case FieldDataType.TEXT:
					ftype = "TEXT";
					break;
			}
			return ftype;
		}



		public override string ToString()
		{
			//Make a string to indicate the current settings
			string settings = FieldSetupString();
			string ftype = FieldDataTypeString();
			return ((PrimaryKey)?"[PK]":"") + ColumnName + " - " + ((settings != string.Empty)? "[" + settings + "] " : "") + ftype ;

		}



		private DataFieldControl _dfc;
		public DataFieldControl DataFieldControl 
		{
			get {return _dfc;}
			set {_dfc = value;}
		}




		FieldDataType FieldDataType;
		
		private bool _isInsertField = false;
		public bool IsInsertField 
		{
			get { return _isInsertField; }
			set 
			{
				
				// can't change value if key field
				if (Locked == false) _isInsertField = value; }
		}
		

		private string _fieldLabel;
		public string FieldLabel
		{
			get {return _fieldLabel;}
			set {_fieldLabel = value;}
		}

		private short _tabIndex;
		public short TabIndex
		{
			get {return _tabIndex;}
			set {_tabIndex = value;}
		}

		private bool _isInsertValueRequired = false;
		public bool IsInsertValueRequired
		{
			get {return _isInsertValueRequired;}
			set {if (Locked == false) _isInsertValueRequired = value; }
		}
		
		private bool _isEntryField = false;
		public bool IsEntryField
		{
			get {return _isEntryField;}
			set {if (Locked == false) _isEntryField = value; }
		}

		private bool _isEntryValueRequired = false;
		public bool IsEntryValueRequired
		{
			get {return _isEntryValueRequired;}
			set {if (Locked == false)  _isEntryValueRequired= value; }
		}

		private bool _isReadOnly = false;
		public bool IsReadOnly
		{
			get {return _isReadOnly;}
			set {if (Locked == false) _isReadOnly = value; }
		}

		private bool _isDoubleEntryField = false;
		public bool IsDoubleEntryField
		{
			get {return _isDoubleEntryField;}
			set {if (Locked == false) _isDoubleEntryField = value; }
		}


		public string ColumnName = string.Empty;
		
		private bool _excluded = false;
		public bool Excluded
		{
			get {return _excluded;}
			set 
			{
				// can't change exclusion status of primary key
				if (PrimaryKey != true) _excluded = value;
			}
		}

		private bool _verifiedField = false;
		public bool VerifiedField
		{
			get {return _verifiedField;}
			set 
			{ 


				// if setting to true, don't do anything if field
				// isn't type INT or if is primarykey
				if (value == true)
				{ 
					if (FieldDataType == FieldDataType.INT && PrimaryKey == false)
					{
						_isReadOnly = true;
						_isInsertField = false;
						_isInsertValueRequired = false;
						_isEntryField = false;
						_isEntryValueRequired = false;
						_isDoubleEntryField = false;
					
						_locked = true;

						_verifiedField = true;
					}
					
				}
				else
				{
					// clear locked status if setting from true to false
					if (value == false && _verifiedField == true) Locked = false;

					_verifiedField = false;
				}

			}
		}

		private bool _locked = false;// if locked == true can't edit field setup properties
		public bool Locked 
		{
			get { return _locked;}
			set {_locked = value;}
		}

		private bool _primaryKey = false;
		public bool PrimaryKey 
		{
			get { return _primaryKey; }
			set 
			{
				_primaryKey = value;

				// primary key columns must be read only columns
				if (_primaryKey == true)
				{
					_isReadOnly = true;
					_isInsertField = false;
					_isInsertValueRequired = false;
					_isEntryField = false;
					_isEntryValueRequired = false;
					_isDoubleEntryField = false;
					_excluded = false;
					
					// no changes allowed
					_locked = true;

				}
			}
		}
		
		public int TableColumnOrder;

	} //DataFieldColumn

}// namespace
