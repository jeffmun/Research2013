using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.ComponentModel.Design;
using System.Data.SqlClient;
using System.Data;
using System.Data.Common;
using System.Web.UI;
using System.Web.UI.Design;
using DataEntryFramework;

//using Microsoft.VisualBasic;

namespace DataEntryFramework3.Design
{

	public class DataEntryControllerComponentEditorFormX : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Button okButton;

		private System.ComponentModel.Container components = null;

		private DataEntryController _dec;
		private System.Windows.Forms.ListBox listboxColumns;
		private System.Windows.Forms.TextBox txtConnectString;
		private System.Windows.Forms.TextBox txtSqlTable;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Button btnGetColumns;
		private System.Windows.Forms.Button btnExclude;
		private System.Windows.Forms.Button btnInclude;
		private System.Windows.Forms.ListBox listboxExcluded;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.CheckBox chkIsInsertField;
		private System.Windows.Forms.CheckBox chkIsInsertValueRequired;
		private System.Windows.Forms.CheckBox chkIsEntryField;
		private System.Windows.Forms.CheckBox chkIsEntryValueRequired;
		private System.Windows.Forms.CheckBox chkIsReadOnly;
		private System.Windows.Forms.CheckBox chkIsDoubleEntryField;
		private System.Windows.Forms.Button btnUpdateSelected;
		private System.Windows.Forms.TextBox txtTest;
		private System.Windows.Forms.ListView lvwColumns;
		private System.Windows.Forms.ColumnHeader FieldName;
		private System.Windows.Forms.ColumnHeader FieldSetup;
		private System.Windows.Forms.Button btnExclude2;
		private System.Windows.Forms.Button btnInclude2;
		private System.Windows.Forms.Button btnSetVerified;
		private System.Windows.Forms.ColumnHeader FieldDataType;
		private System.Windows.Forms.ColumnHeader TableColumnOrder;
		private ControlDesigner _designer = null;

		public DataEntryControllerComponentEditorFormX(DataEntryController component, System.Web.UI.Design.ControlDesigner designer)
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

//			_dec = component;
//			_designer = designer;
//
//			label1.Text = "Editing: " + _dec.ID.ToString();
//			textBox1.Text = _dec.PrimaryKeyField;

			txtConnectString.Text = "packet size=4096;integrated security=SSPI;data source=\"autism-SQL\";persist security info=False;initial catalog=uwautism_research_data";
			txtSqlTable.Text = "edst3_ppvt";
			
			//wireup check box event handler
			chkIsInsertField.CheckedChanged += new EventHandler(this.FieldTypeCheckedHandler);
			chkIsInsertValueRequired.CheckedChanged += new EventHandler(this.FieldTypeCheckedHandler);
			chkIsEntryField.CheckedChanged += new EventHandler(this.FieldTypeCheckedHandler);
			chkIsEntryValueRequired.CheckedChanged += new EventHandler(this.FieldTypeCheckedHandler);
			chkIsReadOnly.CheckedChanged += new EventHandler(this.FieldTypeCheckedHandler);
			chkIsDoubleEntryField.CheckedChanged += new EventHandler(this.FieldTypeCheckedHandler);

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
			this.okButton = new System.Windows.Forms.Button();
			this.listboxColumns = new System.Windows.Forms.ListBox();
			this.txtConnectString = new System.Windows.Forms.TextBox();
			this.txtSqlTable = new System.Windows.Forms.TextBox();
			this.label1 = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.btnGetColumns = new System.Windows.Forms.Button();
			this.btnExclude = new System.Windows.Forms.Button();
			this.btnInclude = new System.Windows.Forms.Button();
			this.listboxExcluded = new System.Windows.Forms.ListBox();
			this.label3 = new System.Windows.Forms.Label();
			this.label4 = new System.Windows.Forms.Label();
			this.btnUpdateSelected = new System.Windows.Forms.Button();
			this.chkIsInsertField = new System.Windows.Forms.CheckBox();
			this.chkIsInsertValueRequired = new System.Windows.Forms.CheckBox();
			this.chkIsEntryField = new System.Windows.Forms.CheckBox();
			this.chkIsEntryValueRequired = new System.Windows.Forms.CheckBox();
			this.chkIsReadOnly = new System.Windows.Forms.CheckBox();
			this.chkIsDoubleEntryField = new System.Windows.Forms.CheckBox();
			this.txtTest = new System.Windows.Forms.TextBox();
			this.lvwColumns = new System.Windows.Forms.ListView();
			this.FieldName = new System.Windows.Forms.ColumnHeader();
			this.FieldSetup = new System.Windows.Forms.ColumnHeader();
			this.btnExclude2 = new System.Windows.Forms.Button();
			this.btnInclude2 = new System.Windows.Forms.Button();
			this.btnSetVerified = new System.Windows.Forms.Button();
			this.FieldDataType = new System.Windows.Forms.ColumnHeader();
			this.TableColumnOrder = new System.Windows.Forms.ColumnHeader();
			this.SuspendLayout();
			// 
			// okButton
			// 
			this.okButton.Location = new System.Drawing.Point(40, 728);
			this.okButton.Name = "okButton";
			this.okButton.TabIndex = 1;
			this.okButton.Text = "&Ok";
			this.okButton.Click += new System.EventHandler(this.okButton_Click);
			// 
			// listboxColumns
			// 
			this.listboxColumns.HorizontalScrollbar = true;
			this.listboxColumns.Location = new System.Drawing.Point(32, 184);
			this.listboxColumns.Name = "listboxColumns";
			this.listboxColumns.SelectionMode = System.Windows.Forms.SelectionMode.MultiExtended;
			this.listboxColumns.Size = new System.Drawing.Size(320, 173);
			this.listboxColumns.TabIndex = 7;
			// 
			// txtConnectString
			// 
			this.txtConnectString.Location = new System.Drawing.Point(32, 40);
			this.txtConnectString.Multiline = true;
			this.txtConnectString.Name = "txtConnectString";
			this.txtConnectString.Size = new System.Drawing.Size(344, 96);
			this.txtConnectString.TabIndex = 9;
			this.txtConnectString.Text = "";
			// 
			// txtSqlTable
			// 
			this.txtSqlTable.Location = new System.Drawing.Point(504, 40);
			this.txtSqlTable.Name = "txtSqlTable";
			this.txtSqlTable.Size = new System.Drawing.Size(184, 20);
			this.txtSqlTable.TabIndex = 10;
			this.txtSqlTable.Text = "";
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(32, 16);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(192, 23);
			this.label1.TabIndex = 11;
			this.label1.Text = "Database Connection String:";
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(408, 40);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(88, 23);
			this.label2.TabIndex = 12;
			this.label2.Text = "Database Table:";
			// 
			// btnGetColumns
			// 
			this.btnGetColumns.Location = new System.Drawing.Point(440, 112);
			this.btnGetColumns.Name = "btnGetColumns";
			this.btnGetColumns.Size = new System.Drawing.Size(120, 23);
			this.btnGetColumns.TabIndex = 13;
			this.btnGetColumns.Text = "Get Columns";
			this.btnGetColumns.Click += new System.EventHandler(this.btnGetColumns_Click);
			// 
			// btnExclude
			// 
			this.btnExclude.Location = new System.Drawing.Point(392, 264);
			this.btnExclude.Name = "btnExclude";
			this.btnExclude.Size = new System.Drawing.Size(80, 23);
			this.btnExclude.TabIndex = 14;
			this.btnExclude.Text = "Exclude";
			this.btnExclude.Click += new System.EventHandler(this.btnExclude_Click);
			// 
			// btnInclude
			// 
			this.btnInclude.Location = new System.Drawing.Point(392, 320);
			this.btnInclude.Name = "btnInclude";
			this.btnInclude.Size = new System.Drawing.Size(80, 23);
			this.btnInclude.TabIndex = 15;
			this.btnInclude.Text = "Include";
			this.btnInclude.Click += new System.EventHandler(this.btnInclude_Click);
			// 
			// listboxExcluded
			// 
			this.listboxExcluded.Location = new System.Drawing.Point(528, 184);
			this.listboxExcluded.Name = "listboxExcluded";
			this.listboxExcluded.SelectionMode = System.Windows.Forms.SelectionMode.MultiExtended;
			this.listboxExcluded.Size = new System.Drawing.Size(168, 199);
			this.listboxExcluded.TabIndex = 16;
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(40, 160);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(100, 16);
			this.label3.TabIndex = 17;
			this.label3.Text = "Included";
			// 
			// label4
			// 
			this.label4.Location = new System.Drawing.Point(528, 160);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(100, 16);
			this.label4.TabIndex = 18;
			this.label4.Text = "Excluded";
			// 
			// btnUpdateSelected
			// 
			this.btnUpdateSelected.Location = new System.Drawing.Point(16, 624);
			this.btnUpdateSelected.Name = "btnUpdateSelected";
			this.btnUpdateSelected.Size = new System.Drawing.Size(112, 23);
			this.btnUpdateSelected.TabIndex = 22;
			this.btnUpdateSelected.Text = "Update Selected";
			this.btnUpdateSelected.Click += new System.EventHandler(this.btnUpdateSelected_Click);
			// 
			// chkIsInsertField
			// 
			this.chkIsInsertField.Location = new System.Drawing.Point(168, 624);
			this.chkIsInsertField.Name = "chkIsInsertField";
			this.chkIsInsertField.Size = new System.Drawing.Size(72, 24);
			this.chkIsInsertField.TabIndex = 23;
			this.chkIsInsertField.Text = "Insert";
			// 
			// chkIsInsertValueRequired
			// 
			this.chkIsInsertValueRequired.Location = new System.Drawing.Point(168, 656);
			this.chkIsInsertValueRequired.Name = "chkIsInsertValueRequired";
			this.chkIsInsertValueRequired.Size = new System.Drawing.Size(160, 24);
			this.chkIsInsertValueRequired.TabIndex = 24;
			this.chkIsInsertValueRequired.Text = "Insert Value Required";
			// 
			// chkIsEntryField
			// 
			this.chkIsEntryField.Location = new System.Drawing.Point(256, 624);
			this.chkIsEntryField.Name = "chkIsEntryField";
			this.chkIsEntryField.TabIndex = 25;
			this.chkIsEntryField.Text = "Entry";
			// 
			// chkIsEntryValueRequired
			// 
			this.chkIsEntryValueRequired.Location = new System.Drawing.Point(304, 656);
			this.chkIsEntryValueRequired.Name = "chkIsEntryValueRequired";
			this.chkIsEntryValueRequired.Size = new System.Drawing.Size(152, 24);
			this.chkIsEntryValueRequired.TabIndex = 26;
			this.chkIsEntryValueRequired.Text = "Entry Value Required";
			// 
			// chkIsReadOnly
			// 
			this.chkIsReadOnly.Location = new System.Drawing.Point(168, 688);
			this.chkIsReadOnly.Name = "chkIsReadOnly";
			this.chkIsReadOnly.TabIndex = 27;
			this.chkIsReadOnly.Text = "Read-Only";
			// 
			// chkIsDoubleEntryField
			// 
			this.chkIsDoubleEntryField.Location = new System.Drawing.Point(288, 688);
			this.chkIsDoubleEntryField.Name = "chkIsDoubleEntryField";
			this.chkIsDoubleEntryField.TabIndex = 28;
			this.chkIsDoubleEntryField.Text = "Double Entry";
			// 
			// txtTest
			// 
			this.txtTest.Location = new System.Drawing.Point(520, 568);
			this.txtTest.Multiline = true;
			this.txtTest.Name = "txtTest";
			this.txtTest.Size = new System.Drawing.Size(216, 176);
			this.txtTest.TabIndex = 29;
			this.txtTest.Text = "";
			// 
			// lvwColumns
			// 
			this.lvwColumns.AllowColumnReorder = true;
			this.lvwColumns.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
																						 this.FieldName,
																						 this.FieldSetup,
																						 this.FieldDataType,
																						 this.TableColumnOrder});
			this.lvwColumns.GridLines = true;
			this.lvwColumns.Location = new System.Drawing.Point(32, 384);
			this.lvwColumns.Name = "lvwColumns";
			this.lvwColumns.Size = new System.Drawing.Size(624, 184);
			this.lvwColumns.TabIndex = 30;
			this.lvwColumns.View = System.Windows.Forms.View.Details;
			this.lvwColumns.ColumnClick += new System.Windows.Forms.ColumnClickEventHandler(this.lvwColumns_ColumnClick);
			// 
			// FieldName
			// 
			this.FieldName.Text = "Field Name";
			this.FieldName.Width = 127;
			// 
			// FieldSetup
			// 
			this.FieldSetup.Text = "Field Setup";
			this.FieldSetup.Width = 147;
			// 
			// btnExclude2
			// 
			this.btnExclude2.Location = new System.Drawing.Point(32, 584);
			this.btnExclude2.Name = "btnExclude2";
			this.btnExclude2.TabIndex = 31;
			this.btnExclude2.Text = "Exclude";
			// 
			// btnInclude2
			// 
			this.btnInclude2.Location = new System.Drawing.Point(112, 584);
			this.btnInclude2.Name = "btnInclude2";
			this.btnInclude2.TabIndex = 32;
			this.btnInclude2.Text = "Include";
			// 
			// btnSetVerified
			// 
			this.btnSetVerified.Location = new System.Drawing.Point(232, 584);
			this.btnSetVerified.Name = "btnSetVerified";
			this.btnSetVerified.TabIndex = 33;
			this.btnSetVerified.Text = "Set Verified";
			// 
			// FieldDataType
			// 
			this.FieldDataType.Text = "Field Data Type";
			this.FieldDataType.Width = 115;
			// 
			// TableColumnOrder
			// 
			this.TableColumnOrder.Text = "Table Order";
			this.TableColumnOrder.Width = 86;
			// 
			// DataEntryControllerComponentEditorForm
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(768, 757);
			this.Controls.Add(this.btnSetVerified);
			this.Controls.Add(this.btnInclude2);
			this.Controls.Add(this.btnExclude2);
			this.Controls.Add(this.lvwColumns);
			this.Controls.Add(this.txtTest);
			this.Controls.Add(this.txtSqlTable);
			this.Controls.Add(this.txtConnectString);
			this.Controls.Add(this.chkIsDoubleEntryField);
			this.Controls.Add(this.chkIsReadOnly);
			this.Controls.Add(this.chkIsEntryValueRequired);
			this.Controls.Add(this.chkIsEntryField);
			this.Controls.Add(this.chkIsInsertValueRequired);
			this.Controls.Add(this.chkIsInsertField);
			this.Controls.Add(this.btnUpdateSelected);
			this.Controls.Add(this.label4);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.listboxExcluded);
			this.Controls.Add(this.btnInclude);
			this.Controls.Add(this.btnExclude);
			this.Controls.Add(this.btnGetColumns);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.listboxColumns);
			this.Controls.Add(this.okButton);
			this.Name = "DataEntryControllerComponentEditorForm";
			this.Text = "DataEntryControllerComponentEditorForm";
			this.ResumeLayout(false);

		}
		#endregion

		private void okButton_Click(object sender, System.EventArgs e)
		{
//			try 
//			{
//				_dec.PrimaryKeyField = textBox1.Text.Trim();
//			}
//			catch {}
		

			DialogResult = DialogResult.OK;
			Close();
		}

		
		/*
		private void testButton_Click(object sender, System.EventArgs e)
		{


			textBox2.Text = "afasdfasdf";


//			IDesignerHost idh = (IDesignerHost)_dec.Page.Site.GetService(typeof(IDesignerHost));
//
//			string s = string.Empty;
//			DataFieldControl dfc = null;
//			foreach (Object c in idh.Container.Components)
//			{
//				dfc = c as DataFieldControl;
//				if (dfc != null)
//					s += dfc.ID.ToString();
//			}
//
//			textBox2.Text = s;
//

	
			// try adding a new dataentryfield

			System.Web.UI.Page page = _dec.Page;

			IServiceProvider site = page.Site;
			IComponentChangeService changeService = null;

			bool changed = false;

			changeService = (IComponentChangeService) site.GetService(typeof(IComponentChangeService));

			IDesignerHost designerHost= (IDesignerHost)site.GetService(typeof(IDesignerHost));

			IWebFormReferenceManager manager = site.GetService( typeof(IWebFormReferenceManager ) ) as IWebFormReferenceManager;


			// get the designerHost for the web form


			using (DesignerTransaction transaction = designerHost.CreateTransaction("Property Builder") )
			{

				textBox2.Text = "got here";

				changeService.OnComponentChanging(page, null);
				
				IComponent newComponent = null;
				newComponent = designerHost.CreateComponent(typeof(DataFieldControl));

				ToolboxDataAttribute attribute = TypeDescriptor.GetAttributes( typeof(
					DataFieldControl ) )[ typeof( ToolboxDataAttribute ) ] as ToolboxDataAttribute;

				textBox2.Text = "got here 2";
				

				
				textBox2.Text = designerHost.GetDesigner(page).Component.GetType().Name;

				ComponentDesigner cd = (ComponentDesigner)designerHost.GetDesigner(page);

				textBox2.Text = cd.GetType().FullName;
				
			
				//WebFormDesigner cd2 = (WebFormDesigner) cd;

				
				
				
//				if( attribute != null )
//					((IHTMLElement)cd2.Behavior.DesignTimeElement).insertAdjacentHTML(
//						"beforeEnd", String.Format( attribute.Data, "def" ) );
//				else
//					((IHTMLElement)cd2.Behavior.DesignTimeElement).insertAdjacentHTML(
//						"beforeEnd", String.Format( "<{0}:DataFieldControl runat=\"server\"></{0}:DataFieldControl>",
//						"def" ) );
//					
//				

				//textBox2.Text = String.Format( attribute.Data, manager.GetTagPrefix( typeof(
				//		DataFieldControl ) ) );


					
				//newComponent = designerHost.CreateComponent(typeof(SqlCommand));

				//if (newComponent == null)
			//		textBox2.Text = "newComponent is null";

//				System.Web.UI.Control newDef = newComponent as System.Web.UI.Control;

				//DataFieldControl newDef = newComponent as DataFieldControl;

				//if (newDef == null)
				//	textBox2.Text = "newdef is null";

				//page.Controls.Add(newDef);

				//textBox2.Text = newDef.ID;

				transaction.Commit();
				changeService.OnComponentChanged(page, null, null, null);
				changed = true;
			}



		}

		private void testButton2_Click(object sender, System.EventArgs e)
		{
			
			IDesignerHost idh = null;
			idh = (IDesignerHost)_dec.Page.Site.GetService(typeof(IDesignerHost));


			if (idh != null) 
			{
				string s = "Components: ";
				string s2 = "DataFieldControls: ";
				DataFieldControl dfc = null;
				Component comp = null;
				foreach (Object c in idh.Container.Components)
				{
					comp = c as Component;
					if (comp != null)
						s += comp.GetType().Name + " ";

					dfc = c as DataFieldControl;
					if (dfc != null)
						s2 += dfc.GetType().Name + " ";

				}
				
				textBox2.Text = s + " " + s2;
			}
			else 
				textBox2.Text = "idh is null";

		}

		private void testButton3_Click(object sender, System.EventArgs e)
		{
			IDesignerHost idh = null;

			EnvDTE.DTE myDTE;
			myDTE = (EnvDTE.DTE)Microsoft.VisualBasic.Interaction.CreateObject("VisualStudio.DTE.7.1", "");

			idh = (IDesignerHost) myDTE.ActiveWindow.Object;

			if (idh == null)
				textBox2.Text = (idh == null)?"idh is null": "idh is not null";

			textBox2.Text =  myDTE.ActiveWindow.Caption;


			// can I add code to the html window???




		}

*/


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


		private string _primaryKeyColumnName = string.Empty;
		private string _verifiedFieldColumnName = string.Empty;
		private ArrayList _dataFieldColumns = new ArrayList();
		private ArrayList _excludedDataFieldColumns = new ArrayList();

		private void btnGetColumns_Click(object sender, System.EventArgs e)
		{
			try 
			{

				if (txtConnectString.Text.Trim() == string.Empty || txtSqlTable.Text.Trim() == string.Empty)
				{
					MessageBox.Show("Both a connection string and database table are required.");
					return;
				}
			
				SqlConnection conn = new SqlConnection(txtConnectString.Text);
				SqlDataAdapter adapter = new SqlDataAdapter("select * from " + txtSqlTable.Text,conn);
				DataTable dt = new DataTable(txtSqlTable.Text);
				adapter.FillSchema(dt, SchemaType.Source);

				// throw an error if table doesn't contain a single field
				// primary key thats an identity field.
				_primaryKeyColumnName = string.Empty;
				string errMessage = string.Empty;
				if (dt.PrimaryKey.GetLength(0) != 1) 
					errMessage = "Table must have a single field primary key.";
				else if(dt.PrimaryKey[0].AutoIncrement != true)
					errMessage = "Table must have a single field primary key that is an Identity column.";

				
				if (errMessage != string.Empty)
					throw new Exception(errMessage);
				else
					// save primary key column name
					_primaryKeyColumnName = dt.PrimaryKey[0].ColumnName;




				_dataFieldColumns.Clear();
				_excludedDataFieldColumns.Clear();


				int tableColumnOrder = 0;
				foreach (DataColumn c in dt.Columns)
				{
					DataFieldColumn df = new DataFieldColumn(c);

					//set table column order
					df.TableColumnOrder = tableColumnOrder++;

					//set primary key flag
					if (c.ColumnName == _primaryKeyColumnName)
						df.PrimaryKey = true;


					//attempt to find verified column
					if (c.ColumnName == "verified")
					{
						df.VerifiedField = true;
						_verifiedFieldColumnName = c.ColumnName;
					}

					//default created, createdby, updated, updatedby to read-only
					if (c.ColumnName.ToLower() == "created" || c.ColumnName.ToLower() == "createdby"
						|| c.ColumnName.ToLower() == "updated" || c.ColumnName.ToLower() == "updatedby")
						df.IsReadOnly = true;



					_dataFieldColumns.Add(df);

				}

//				listboxColumns.DataSource = null;
//				listboxColumns.DataSource = _dataFieldColumns;
//				listboxExcluded.DataSource = null;
//				listboxExcluded.DataSource = _excludedDataFieldColumns;


				FillListView();



				
				//				listboxColumns.BeginUpdate();
//
//				// clear an existing contents
//				listboxColumns.Items.Clear();
//
//				foreach (DataColumn c in dt.Columns)
//				{
//					DataFieldColumn df = new DataFieldColumn(c);
//
//					//set primary key flag
//					if (c.ColumnName == _primaryKeyColumnName)
//						df.PrimaryKey = true;
//
//					listboxColumns.Items.Add(df);
//
//				}
//				listboxColumns.EndUpdate();



			}
			catch(Exception ex)
			{
				MessageBox.Show(ex.Message);
			}
		}



		private void FillListView()
		{

			lvwColumns.Items.Clear();

			lvwColumns.BeginUpdate();
			foreach (object o in _dataFieldColumns)
			{
				DataFieldColumn d = (DataFieldColumn)o;

				string colname = d.ColumnName + ((d.PrimaryKey)?"-[PK]":"") + ((d.VerifiedField)?"-[VERIFIED]":"");
				ListViewItem lvi = lvwColumns.Items.Add(colname);
				lvi.SubItems.Add(d.FieldSetupString());
				lvi.SubItems.Add(d.FieldDataTypeString());
				lvi.SubItems.Add(d.TableColumnOrder.ToString());
				lvi.Tag = d;


			}
			lvwColumns.EndUpdate();

		}
		private void btnUpdateSelected_Click(object sender, System.EventArgs e)
		{
			// iterate over selected columns and set field properties
//			foreach(object o in listboxColumns.SelectedItems)
//			{
//				DataFieldColumn dc = (DataFieldColumn)o;
//
//				dc.IsInsertField = chkIsInsertField.Checked;
//				dc.IsInsertValueRequired = chkIsInsertValueRequired.Checked;
//				dc.IsEntryField = chkIsEntryField.Checked;
//				dc.IsEntryValueRequired = chkIsEntryValueRequired.Checked;
//				dc.IsReadOnly = chkIsReadOnly.Checked;
//				dc.IsDoubleEntryField = chkIsDoubleEntryField.Checked;
//			}

//			string s = string.Empty;
//			foreach(Object oo in _dataFieldColumns)
//			{	DataFieldColumn dc = (DataFieldColumn)oo;
//				s += dc.ToString();
//
//			}
//			txtTest.Text = s;
//
//			listboxColumns.DataSource = null;
//			listboxColumns.DataSource = _dataFieldColumns;



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

		}

		private void btnExclude_Click(object sender, System.EventArgs e)
		{
			foreach(object o in listboxColumns.SelectedItems)
			{
				_dataFieldColumns.Remove(o);
				_excludedDataFieldColumns.Add(o);
			}

			listboxColumns.DataSource = null;
			listboxColumns.DataSource = _dataFieldColumns;

			listboxExcluded.DataSource = null;
			listboxExcluded.DataSource = _excludedDataFieldColumns;

		
		}

		private void btnInclude_Click(object sender, System.EventArgs e)
		{
			foreach(object o in listboxExcluded.SelectedItems)
			{
				_excludedDataFieldColumns.Remove(o);
				_dataFieldColumns.Add(o);
			}

			listboxColumns.DataSource = null;
			listboxColumns.DataSource = _dataFieldColumns;

			listboxExcluded.DataSource = null;
			listboxExcluded.DataSource = _excludedDataFieldColumns;
		
		}

		private void lvwColumns_ColumnClick(object sender, System.Windows.Forms.ColumnClickEventArgs e)
		{
			// Set the ListViewItemSorter property to a new ListViewItemComparer object.
			this.lvwColumns.ListViewItemSorter = new ListViewItemComparer(e.Column);
			// Call the sort method to manually sort the column based on the ListViewItemComparer implementation.
			lvwColumns.Sort();
		
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
				if (col == 3)
					// use a numeric comparison
					return (  Int32.Parse(((ListViewItem)x).SubItems[col].Text).CompareTo(Int32.Parse( ((ListViewItem)y).SubItems[col].Text))   );
				else
					return String.Compare(((ListViewItem)x).SubItems[col].Text, ((ListViewItem)y).SubItems[col].Text);
			}
		}

	}

//	public class DataFieldColumn
//	{
//		public DataFieldColumn( DataColumn c )
//		{
//		
//			//set field type based on column data type
//
//			// INT: Byte, Int16, Int32, Int64, SByte, UInt16, UInt32, UInt64
//			if (typeof(Int32).Equals(c.DataType ) ||
//				typeof(Int16).Equals(c.DataType ) ||
//				typeof(Int64).Equals(c.DataType ) ||
//				typeof(Byte).Equals(c.DataType) ||
//				typeof(SByte).Equals(c.DataType) ||
//				typeof(UInt16).Equals(c.DataType) ||
//				typeof(UInt32).Equals(c.DataType) ||
//				typeof(UInt64).Equals(c.DataType))
//
//				FieldDataType = FieldDataType.INT;
//			
//			// FLOAT: Decimal, Double, Single
//			else if ( typeof(Decimal).Equals(c.DataType) ||
//				typeof(Double).Equals(c.DataType) ||
//				typeof(Single).Equals(c.DataType) )
//
//				FieldDataType = FieldDataType.FLOAT;
//			
//			// TEXT:
//			else if (typeof(String).Equals(c.DataType))
//				FieldDataType = FieldDataType.TEXT;
//
//			// DATE: DateTime
//			else if (typeof(DateTime).Equals(c.DataType))
//				FieldDataType = FieldDataType.DATE;
//
//			// error: Boolean, Char, TimeSpan
//			else
//			 {
//				//throw an error if unmappable data type found
//				throw new Exception(string.Format("Field {0} has an invalid type: {1}",c.ColumnName,c.DataType.Name));
//			 }
//
//			//column name
//			ColumnName = c.ColumnName;
//
//		}
//
//		
//		
//		public string FieldSetupString()
//		{
//
//			//Make a string to indicate the current settings
//			string settings = string.Empty;
//			if (IsInsertField == true)
//			{
//				if(IsInsertValueRequired == true)
//					settings += "Ir";
//				else
//					settings += "I";
//			}
//			if (IsEntryField == true)
//			{	
//				if (IsEntryValueRequired)
//					settings += (settings == string.Empty)? "Er" : ",Er";
//				else
//					settings += (settings == string.Empty)? "E" : ",E";
//
//			}
//			if (IsDoubleEntryField == true) settings += (settings == string.Empty)? "D" : ",D";
//			if (IsReadOnly == true) settings += (settings == string.Empty)? "R" : ",R";
//
//			return settings;
//		}
//
//		public string FieldDataTypeString()
//		{
//			string ftype = string.Empty;
//			switch (FieldDataType)
//			{	
//				case FieldDataType.INT:
//					ftype = "[INT]";
//					break;
//				case FieldDataType.FLOAT:
//					ftype = "[FLOAT]";
//					break;
//				case FieldDataType.DATE:
//					ftype = "[DATE]";
//					break;
//				case FieldDataType.TEXT:
//					ftype = "[TEXT]";
//					break;
//			}
//			return ftype;
//		}
//
//
//
//		public override string ToString()
//		{
//			//Make a string to indicate the current settings
//			string settings = FieldSetupString();
//			string ftype = FieldDataTypeString();
//			return ((PrimaryKey)?"[PK]":"") + ColumnName + " - " + ((settings != string.Empty)? "[" + settings + "] " : "") + ftype ;
//
//		}
//
//		FieldDataType FieldDataType;
//		
//		private bool _isInsertField = false;
//		public bool IsInsertField 
//		{
//			get { return _isInsertField; }
//			set {
//				
//				// can't change value if key field
//				if (Locked == false) _isInsertField = value; }
//		}
//		
//		private bool _isInsertValueRequired = false;
//		public bool IsInsertValueRequired
//		{
//			get {return _isInsertValueRequired;}
//			set {if (Locked == false) _isInsertValueRequired = value; }
//		}
//		
//		private bool _isEntryField = false;
//		public bool IsEntryField
//		{
//			get {return _isEntryField;}
//			set {if (Locked == false) _isEntryField = value; }
//		}
//
//		private bool _isEntryValueRequired = false;
//		public bool IsEntryValueRequired
//		{
//			get {return _isEntryValueRequired;}
//			set {if (Locked == false)  _isEntryValueRequired= value; }
//		}
//
//		private bool _isReadOnly = false;
//		public bool IsReadOnly
//		{
//			get {return _isReadOnly;}
//			set {if (Locked == false) _isReadOnly = value; }
//		}
//
//		private bool _isDoubleEntryField = false;
//		public bool IsDoubleEntryField
//		{
//			get {return _isDoubleEntryField;}
//			set {if (Locked == false) _isDoubleEntryField = value; }
//		}
//
//
//		public string ColumnName = string.Empty;
//		
//		private bool _excluded = false;
//		public bool Excluded
//		{
//			get {return _excluded;}
//			set 
//			{
//				// can't change exclusion status of primary key
//				if (PrimaryKey != true) _excluded = value;
//			}
//		}
//
//		private bool _verifiedField = false;
//		public bool VerifiedField
//		{
//			get {return _verifiedField;}
//			set 
//			{ 
//
//				// clear locked status if setting from true to false
//				if (value == false && _verifiedField == true) Locked = false;
//
//				
//				// verified field must be readonly and lock field setup properties
//				if (value == true)
//				{
//					_isReadOnly = true;
//					_isInsertField = false;
//					_isInsertValueRequired = false;
//					_isEntryField = false;
//					_isEntryValueRequired = false;
//					_isDoubleEntryField = false;
//					
//					_locked = true;
//				}
//
//				_verifiedField = value;	
//				
//			}
//		}
//
//		private bool _locked = false;// if locked == true can't edit field setup properties
//		public bool Locked 
//		{
//			get { return _locked;}
//			set {_locked = value;}
//		}
//
//		private bool _primaryKey = false;
//		public bool PrimaryKey 
//		{
//			get { return _primaryKey; }
//			set 
//			{
//				_primaryKey = value;
//
//				// primary key columns must be read only columns
//				if (_primaryKey == true)
//				{
//					_isReadOnly = true;
//					_isInsertField = false;
//					_isInsertValueRequired = false;
//					_isEntryField = false;
//					_isEntryValueRequired = false;
//					_isDoubleEntryField = false;
//					
//					// no changes allowed
//					_locked = true;
//
//				}
//			}
//		}
//		
//		public int TableColumnOrder;
//
//	}
}
