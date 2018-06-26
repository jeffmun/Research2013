using System;

namespace DataEntryFramework4
{
	public class DefaultFormatter : IFormatter
	{

		public virtual void FormatInserting(DataEntryController dec) 
		{
			/*
			* Show only controls that are insert fields or are read-only. Insert fields
			* should be enabled.  Read-only fields should be disabled. Clear all fields.
			* Set all fields to default value, if any.
			*/
			foreach (DataFieldControl c in dec.AllDataFields.Values)
			{
				/* 
				 * clear field controls if not re-entering 
				 * state because of an error. This is needed
				 * to reset all form fields when arriving in the INSERTING
				 * state after a lookup or create new.
				 */
				if (dec.FormError == false) 
				{
					c.OverrideCheckBoxChecked = false;
					c.OverrideCheckBoxVisible = false;
					c.VerifyError = false;

					// initialize insert/read-only fields
					if (c.IsInsertField == true || c.IsReadOnly == true)
						c.FieldTextBoxText = c.FieldTextBoxTextDefault;
				}
						
				c.Visible = false;
				c.Enabled = false;
				if (c.IsReadOnly == true || c.IsInsertField == true) c.Visible = true;
				if (c.IsInsertField == true) c.Enabled = true;
			}

			// hide mainPanel, if it exists
			System.Web.UI.WebControls.Panel mainPanel = dec.Parent.FindControl("mainPanel") as System.Web.UI.WebControls.Panel;
			if (mainPanel != null) mainPanel.Visible = false;



		}

		public virtual void FormatEntering(DataEntryController dec)
		{
			/*
			* Show Insert, Entry, and Read-only fields.  Only Entry fields should
			* be enabled.
			*
			* Initialize fields with default values if not entering as result of error. 
			* Only initialize fields that are entry fields.
			*/
			foreach (DataFieldControl c in dec.AllDataFields.Values)
			{

				c.Visible = false;
				c.Enabled = false;
				if (c.IsReadOnly == true || c.IsInsertField == true || c.IsEntryField == true) c.Visible = true;
				if (c.IsEntryField == true) c.Enabled = true;

				if (dec.FormError == false) 
				{
					// initialize entry fields, leave fields that are also insert fields alone
					if (c.IsEntryField == true && c.IsInsertField == false)
						c.FieldTextBoxText = c.FieldTextBoxTextDefault;
				}
			}

			// show mainPanel, if it exists
			System.Web.UI.WebControls.Panel mainPanel = dec.Parent.FindControl("mainPanel") as System.Web.UI.WebControls.Panel;
			if (mainPanel != null) mainPanel.Visible = true;

		}

		public virtual void FormatSingleEntered(DataEntryController dec) 
		{
			/*
			* Show Insert, Entry, and Read-only fields.  Only Entry fields should
			* be enabled.
			*/
			foreach (DataFieldControl c in dec.AllDataFields.Values)
			{
				c.Visible = false;
				c.Enabled = false;
				if (c.IsReadOnly == true || c.IsInsertField == true || c.IsEntryField == true) c.Visible = true;
				if (c.IsEntryField == true) c.Enabled = true;
			}

			// show mainPanel, if it exists
			System.Web.UI.WebControls.Panel mainPanel = dec.Parent.FindControl("mainPanel") as System.Web.UI.WebControls.Panel;
			if (mainPanel != null) mainPanel.Visible = true;
		}


		public virtual void FormatDoubleEntering(DataEntryController dec) 
		{
			/*
			* Show Insert, Entry, and Read-only fields.  Only Double-Entry fields should
			* be enabled.  
			* 
			* Double-Entry fields must be a subset of entry fields. Clear any
			* existing contents of double entry fields  (or set them to default if any) 
			* unless re-entering state because of an error. 
			*/
			foreach (DataFieldControl c in dec.AllDataFields.Values)
			{
				c.Visible = false;
				c.Enabled = false;
				if (c.IsReadOnly == true || c.IsInsertField == true || c.IsEntryField == true) c.Visible = true;
				if (c.IsDoubleEntryField == true) 
				{
					c.Enabled = true;
					if (dec.FormError == false)
					{
						c.FieldTextBoxText = string.Empty;
						c.FieldTextBoxText = c.FieldTextBoxTextDefault;
					}
				}
			}
		
			// show mainPanel, if it exists
			System.Web.UI.WebControls.Panel mainPanel = dec.Parent.FindControl("mainPanel") as System.Web.UI.WebControls.Panel;
			if (mainPanel != null) mainPanel.Visible = true;

		}


		public virtual void FormatCorrectingDoubleEntering(DataEntryController dec) 
		{
			/*
			* Show Insert, Entry, and Read-only fields.  Only Double-Entry fields with
			* verification errors are enabled.
			* If there were validation errors (FormError == true) then don't show 
			* override check boxes.
			*/
			foreach (DataFieldControl c in dec.AllDataFields.Values)
			{
				c.Visible = false;
				c.Enabled = false;
				c.OverrideCheckBoxVisible = false;
				if (c.IsReadOnly == true || c.IsInsertField == true || c.IsEntryField == true) c.Visible = true;
				if (c.IsDoubleEntryField == true && c.VerifyError == true) c.Enabled = true;
				if (c.IsDoubleEntryField == true && c.VerifyError == true && dec.FormError == false) c.OverrideCheckBoxVisible = true;
			}

		
			// show mainPanel, if it exists
			System.Web.UI.WebControls.Panel mainPanel = dec.Parent.FindControl("mainPanel") as System.Web.UI.WebControls.Panel;
			if (mainPanel != null) mainPanel.Visible = true;

		}


		public virtual void FormatDoubleEntered(DataEntryController dec) 
		{

			/*
			* Show Insert, Entry, and Read-only fields.  Only Entry fields should
			* be enabled.
			*/
			foreach (DataFieldControl c in dec.AllDataFields.Values)
			{
				// clear any verification errors left
				// over from verification state
				c.VerifyError = false;

				c.Visible = false;
				c.Enabled = false;
				if (c.IsReadOnly == true || c.IsInsertField == true || c.IsEntryField == true) c.Visible = true;
				if (c.IsEntryField == true) c.Enabled = true;
			}

			// show mainPanel, if it exists
			System.Web.UI.WebControls.Panel mainPanel = dec.Parent.FindControl("mainPanel") as System.Web.UI.WebControls.Panel;
			if (mainPanel != null) mainPanel.Visible = true;
		}

		public virtual void FormatNoData(DataEntryController dec)
		{
			/*
			* Show only controls that are insert fields or are read-only. All fields 
			* are disabled.
			*/
			foreach (DataFieldControl c in dec.AllDataFields.Values)
			{
				c.Visible = false;
				c.Enabled = false;
				if (c.IsReadOnly == true || c.IsInsertField == true) c.Visible = true;
			}
		
			// show mainPanel, if it exists
			System.Web.UI.WebControls.Panel mainPanel = dec.Parent.FindControl("mainPanel") as System.Web.UI.WebControls.Panel;
			if (mainPanel != null) mainPanel.Visible = true;
		}

	}
}
