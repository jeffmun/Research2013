using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.ComponentModel.Design;

namespace DataEntryFramework4.Design
{


	public class DataEntryControllerFieldEditorForm : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Button btnSave;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;


		private ArrayList _fields = new ArrayList();
		private System.Windows.Forms.ColumnHeader fieldLabel;
		private System.Windows.Forms.ColumnHeader taborder;
		private System.Windows.Forms.ColumnHeader fieldname;
		private System.Windows.Forms.ColumnHeader fieldsetup;
		private System.Windows.Forms.ColumnHeader fielddatatype;
		private System.Windows.Forms.ListView lvwFields;
		private System.Windows.Forms.ColumnHeader fname;
		private System.Windows.Forms.ColumnHeader fsetup;
		private System.Windows.Forms.ColumnHeader ftype;
		private System.Windows.Forms.ColumnHeader flabel;
		private System.Windows.Forms.ColumnHeader ftabindex;
		private System.Windows.Forms.Button btnFirst;
		private System.Windows.Forms.Button btnUp;
		private System.Windows.Forms.Button btnDown;
		private System.Windows.Forms.Button btnLast;
		private System.Windows.Forms.Button btnCancel;
		private DataEntryController _dec = null;

		
		
		public DataEntryControllerFieldEditorForm(DataEntryController dec)
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();


			// wire up tab index reorder button handlers
			this.btnFirst.Click += new System.EventHandler(this.btnReorder_Click);
			this.btnUp.Click += new System.EventHandler(this.btnReorder_Click);
			this.btnDown.Click += new System.EventHandler(this.btnReorder_Click);
			this.btnLast.Click += new System.EventHandler(this.btnReorder_Click);


			_dec = dec;

			GetFields(dec);

			FillListView();

		}

		private void Sort()
		{
			this.lvwFields.ListViewItemSorter = new ListViewItemComparer(4);
		}


		private void FillListView()
		{
			
			
				lvwFields.Items.Clear();
				lvwFields.ListViewItemSorter = null;

				lvwFields.BeginUpdate();
				foreach (object o in _fields)
				{

					try {
					
					
					DataFieldColumn d = (DataFieldColumn)o;

					string colname = d.ColumnName + ((d.PrimaryKey)?"-[PK]":"") + ((d.VerifiedField)?"-[VERIFIED]":"") + ((d.Excluded)?"-[EXCLUDED]":"");
					ListViewItem lvi = lvwFields.Items.Add(colname);
					lvi.SubItems.Add(d.FieldSetupString());
					lvi.SubItems.Add(d.FieldDataTypeString());
					lvi.SubItems.Add(d.FieldLabel);
					lvi.SubItems.Add(d.TabIndex.ToString());
					lvi.Tag = d;
					
					}
					catch (Exception e)
					{
						string s = e.Message;
						string st = e.StackTrace;
					}
				}

				lvwFields.EndUpdate();

				//sort
				Sort();
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
				if (col == 4)
					// use a numeric comparison
					return (  Int32.Parse(((ListViewItem)x).SubItems[col].Text).CompareTo(Int32.Parse( ((ListViewItem)y).SubItems[col].Text))   );
				else
					return String.Compare(((ListViewItem)x).SubItems[col].Text, ((ListViewItem)y).SubItems[col].Text);
			}
		}

		private void GetFields(DataEntryController dec)
		{
			IDesignerHost idh = null;
			idh = (IDesignerHost)dec.Page.Site.GetService(typeof(IDesignerHost));

			if (idh != null) 
			{
				DataFieldControl dfc = null;
				foreach (Object c in idh.Container.Components)
				{
					
					dfc = c as DataFieldControl;
					
					if(dfc != null)
					{
						_fields.Add(new DataFieldColumn(dfc));
					}
				}
			}
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
			this.btnSave = new System.Windows.Forms.Button();
			this.fieldname = new System.Windows.Forms.ColumnHeader();
			this.fieldsetup = new System.Windows.Forms.ColumnHeader();
			this.fielddatatype = new System.Windows.Forms.ColumnHeader();
			this.fieldLabel = new System.Windows.Forms.ColumnHeader();
			this.taborder = new System.Windows.Forms.ColumnHeader();
			this.lvwFields = new System.Windows.Forms.ListView();
			this.fname = new System.Windows.Forms.ColumnHeader();
			this.fsetup = new System.Windows.Forms.ColumnHeader();
			this.ftype = new System.Windows.Forms.ColumnHeader();
			this.flabel = new System.Windows.Forms.ColumnHeader();
			this.ftabindex = new System.Windows.Forms.ColumnHeader();
			this.btnFirst = new System.Windows.Forms.Button();
			this.btnUp = new System.Windows.Forms.Button();
			this.btnDown = new System.Windows.Forms.Button();
			this.btnLast = new System.Windows.Forms.Button();
			this.btnCancel = new System.Windows.Forms.Button();
			this.SuspendLayout();
			// 
			// btnSave
			// 
			this.btnSave.Location = new System.Drawing.Point(560, 320);
			this.btnSave.Name = "btnSave";
			this.btnSave.TabIndex = 0;
			this.btnSave.Text = "&Save";
			this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
			// 
			// fieldname
			// 
			this.fieldname.Text = "Field Name";
			this.fieldname.Width = 119;
			// 
			// fieldLabel
			// 
			this.fieldLabel.Text = "Field Label";
			this.fieldLabel.Width = 129;
			// 
			// taborder
			// 
			this.taborder.Text = "Tab Order";
			this.taborder.Width = 121;
			// 
			// lvwFields
			// 
			this.lvwFields.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
																						this.fname,
																						this.fsetup,
																						this.ftype,
																						this.flabel,
																						this.ftabindex});
			this.lvwFields.FullRowSelect = true;
			this.lvwFields.GridLines = true;
			this.lvwFields.Location = new System.Drawing.Point(8, 8);
			this.lvwFields.Name = "lvwFields";
			this.lvwFields.Size = new System.Drawing.Size(544, 408);
			this.lvwFields.TabIndex = 1;
			this.lvwFields.View = System.Windows.Forms.View.Details;
			// 
			// fname
			// 
			this.fname.Text = "Field Name";
			this.fname.Width = 80;
			// 
			// fsetup
			// 
			this.fsetup.Text = "Field Setup";
			this.fsetup.Width = 100;
			// 
			// ftype
			// 
			this.ftype.Text = "Data Type";
			this.ftype.Width = 101;
			// 
			// flabel
			// 
			this.flabel.Text = "Label";
			this.flabel.Width = 113;
			// 
			// ftabindex
			// 
			this.ftabindex.Text = "Tab Index";
			this.ftabindex.Width = 125;
			// 
			// btnFirst
			// 
			this.btnFirst.Location = new System.Drawing.Point(568, 144);
			this.btnFirst.Name = "btnFirst";
			this.btnFirst.TabIndex = 2;
			this.btnFirst.Text = "First";
			this.btnFirst.Visible = false;
			// 
			// btnUp
			// 
			this.btnUp.Location = new System.Drawing.Point(560, 192);
			this.btnUp.Name = "btnUp";
			this.btnUp.TabIndex = 3;
			this.btnUp.Text = "Up";
			this.btnUp.Click += new System.EventHandler(this.btnUp_Click);
			// 
			// btnDown
			// 
			this.btnDown.Location = new System.Drawing.Point(560, 232);
			this.btnDown.Name = "btnDown";
			this.btnDown.TabIndex = 4;
			this.btnDown.Text = "Down";
			// 
			// btnLast
			// 
			this.btnLast.Location = new System.Drawing.Point(568, 112);
			this.btnLast.Name = "btnLast";
			this.btnLast.TabIndex = 5;
			this.btnLast.Text = "Last";
			this.btnLast.Visible = false;
			// 
			// btnCancel
			// 
			this.btnCancel.Location = new System.Drawing.Point(560, 360);
			this.btnCancel.Name = "btnCancel";
			this.btnCancel.TabIndex = 6;
			this.btnCancel.Text = "&Cancel";
			this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
			// 
			// DataEntryControllerFieldEditorForm
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(664, 493);
			this.Controls.Add(this.btnCancel);
			this.Controls.Add(this.btnLast);
			this.Controls.Add(this.btnDown);
			this.Controls.Add(this.btnUp);
			this.Controls.Add(this.btnFirst);
			this.Controls.Add(this.lvwFields);
			this.Controls.Add(this.btnSave);
			this.Name = "DataEntryControllerFieldEditorForm";
			this.Text = "DataEntryControllerFieldEditorForm";
			this.ResumeLayout(false);

		}
		#endregion

		private void btnSave_Click(object sender, System.EventArgs e)
		{
			DoSave();
					
			DialogResult = DialogResult.OK;
			Close();
		}

		private void DoSave()
		{
			// loop over fields setting tab index of
			// corresponding datafieldcontrol
			foreach(object o in _fields)
			{
				DataFieldColumn d = (DataFieldColumn)o;
				d.DataFieldControl.FieldTextBoxTabIndex = d.TabIndex;
			}
		}



		private void btnReorder_Click(object sender, System.EventArgs e)
		{


			//nothing to do if nothing is selected
			if (lvwFields.SelectedItems.Count > 0 ) 
			{
			
				// save a list of the selected fields
				ArrayList selected = new ArrayList();
				foreach (ListViewItem i in lvwFields.SelectedItems)
				{
					selected.Add(i.Tag);
				}
			

				int idxFirst = lvwFields.SelectedItems[0].Index;
				int idxLast =  lvwFields.SelectedItems[lvwFields.SelectedItems.Count-1].Index;
				short tabIdxFirst = ((DataFieldColumn)lvwFields.Items[idxFirst].Tag).TabIndex;
				short tabIdxLast= ((DataFieldColumn)lvwFields.Items[idxLast].Tag).TabIndex;
				
				if ( ((Button)sender).Text == "Up")
				{
					// make preceding field last (if it exists)
					if (idxFirst > 0)
					{	
						((DataFieldColumn)lvwFields.Items[idxFirst-1].Tag).TabIndex = tabIdxLast;

						// move selected up one
						for (int idx = idxFirst; idx <= idxLast; ++idx)
						{
							((DataFieldColumn)lvwFields.Items[idx].Tag).TabIndex--;
						}

					}
				}

				if ( ((Button)sender).Text == "Down")
				{

					// give the field after the last one selected
					// the same tabindex of the first (if it exists)
					if (idxLast < (lvwFields.Items.Count-1) )
					{	
						((DataFieldColumn)lvwFields.Items[idxLast + 1].Tag).TabIndex = tabIdxFirst;

						// move selected down one
						for (int idx = idxFirst; idx <= idxLast; ++idx)
						{
							((DataFieldColumn)lvwFields.Items[idx].Tag).TabIndex++;
						}

					}
				}


				//refresh
				FillListView();



				// reselect items that were moved
				foreach(ListViewItem i in lvwFields.Items)
				{
						if (selected.Contains(i.Tag))
						i.Selected = true;
				}


				// set focus back to list
				lvwFields.Focus();


			
			
			} //if (lvwFields.SelectedItems.Count > 0 )
					
	}

		private void btnCancel_Click(object sender, System.EventArgs e)
		{
			DialogResult = DialogResult.Cancel;
			Close();
		}

		private void btnUp_Click(object sender, System.EventArgs e)
		{
		
		}




	}
}
