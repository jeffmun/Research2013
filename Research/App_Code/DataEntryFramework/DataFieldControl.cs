using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using System.Collections;
using System.Text.RegularExpressions;

namespace DataEntryFramework
{

	public enum FieldDataType 
	{ INT, FLOAT, DATE, TEXT
	}

	[
	DefaultProperty("FieldLabelText"),
	Designer(typeof(DataEntryFramework.Design.DataFieldControlDesigner)),
	ToolboxData("<{0}:DataFieldControl runat=\"server\"></{0}:DataFieldControl>")
	] 
	public class DataFieldControl : System.Web.UI.WebControls.WebControl, INamingContainer
	{
	
		// child controls
		private Label _fieldLabel;
		private TextBox _fieldTextBox;
		private ErrorLabel _fieldErrorLabel;
		private CheckBox _overrideCheckBox;

		// Other properties
		private string _databaseField = string.Empty;
		private bool _isInsertField;
		private bool _isInsertValueRequired;
		private string _RegEx = string.Empty;
		private string _RegExDescription = string.Empty;
		private bool _isEntryField;
		private bool _isEntryValueRequired;
		private bool _isDoubleEntryField;
		private bool _isReadOnly;
		//private bool _verifyError;
		private FieldDataType _fieldDataType;
		private string _validList = string.Empty;
		private string _minVal = string.Empty;
		private string _maxVal = string.Empty;
		private string _formatString = string.Empty;
		private bool _showAllForLayout = false;
		private bool _showFieldLabel = true;
		private string _fieldTextBoxTextDefault = string.Empty;
		private string _callOnBlur = "unselectField";
		private string _callOnFocus = "selectField";
		private bool _renderReadOnlyAsDiv = false;
		private string _fieldDivCssClass = "dataentryfield";



		// holds a list of errors that are shown as a unordered list by the error label
		//private ArrayList _errorList = new ArrayList();

		public void AddError (string error)
		{
			EnsureChildControls();
			_fieldErrorLabel.AddError(error);
		}
		public void ClearErrors() 
		{
			EnsureChildControls();
			_fieldErrorLabel.ClearErrors();
		}

		public bool HasError()
		{
			EnsureChildControls();
			return _fieldErrorLabel.HasError();
		}

		// return first error in list
		public string GetErrorText()
		{
			EnsureChildControls();
			return _fieldErrorLabel.GetFirstError();
		}


		#region Other Properties



		[Category("Field-Setup")]
		public bool RenderReadOnlyAsDiv
		{
			get {return _renderReadOnlyAsDiv;}
			set {_renderReadOnlyAsDiv = value;}

		}

		[Category("Field-Setup")]
		public string FieldDivCssClass
		{
			get {return _fieldDivCssClass;}
			set {_fieldDivCssClass = value;}

		}



		[Category("Field-Validation"),
		DesignerSerializationVisibility(DesignerSerializationVisibility.Visible)]
		public FieldDataType FieldDataType 
		{
			get {return _fieldDataType;}
			set {_fieldDataType = value;}
		}


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

		[Category("Field-Setup")]
		public string CallOnBlur
		{
			get {return _callOnBlur;}
			set {_callOnBlur = value.Trim();}
		}


		[Category("Field-Setup")]
		public string CallOnFocus
		{
			get {return _callOnFocus;}
			set {_callOnFocus = value.Trim();}
		}

		
		
		[Category("Field-Setup")]
		public bool ShowAllForLayout
		{
			get {return _showAllForLayout;}
			set {_showAllForLayout = value;}
		}

		[Category("Field-Setup")]
		public bool ShowFieldLabel
		{
			get {return _showFieldLabel;}
			set {_showFieldLabel = value;}
		}

		[Category("Field-Setup")]
		public string FormatString 
		{
			get {return _formatString;}
			set 
			{
				// make sure format string is valid by attempting
				// to apply it
				if (value.Trim() != string.Empty)
				{
					try 
					{
						string formatted = string.Empty;
						switch (FieldDataType) 
						{
							case FieldDataType.DATE:
								formatted = string.Format(value, DateTime.Parse("5/5/2004"));
								break;

							case FieldDataType.FLOAT:
								formatted = string.Format(value, float.Parse("4.235"));
								break;

							case FieldDataType.INT:
								formatted = string.Format(value, int.Parse("5"));
								break;

							case FieldDataType.TEXT:

								// throw an exception because formatstring isn't
								// allowed for text types
								throw new Exception("FormatString isn't allowed for text data type.");
						}
				
						_formatString = value;

					}
					catch (Exception e)
					{
						throw new Exception("Invalid format string: " + e.Message);
					}

				}
				else
					_formatString = value.Trim();

			}

		}

		[Category("Field-Validation")]		
		public string MinVal 
		{
			get {return _minVal;}
			set 
			{
				// make sure value is appropriate for
				// data type
				if (value.Trim() != string.Empty)
				{
					string t = string.Empty;
					try
					{
						switch (FieldDataType) 
						{
							case FieldDataType.DATE:
								t = "DATE";
								DateTime.Parse(value);
								break;

							case FieldDataType.FLOAT:
								t = "FLOAT";
								float.Parse(value);
								break;

							case FieldDataType.INT:
								t = "INT";
								int.Parse(value);
								break;

							case FieldDataType.TEXT:
								// nothing to check
								t = "TEXT";
								break;
						}

						_minVal = value.Trim();

					}
					catch
					{
						throw new Exception(string.Format("Value not a {0}.",t));
					}

				}
				else
					_minVal = value.Trim();
			
			}
		}

		[Category("Field-Validation")]
		public string MaxVal
		{
			get {return _maxVal;}
			set {
				
				// make sure value is appropriate for
				// data type
				if (value.Trim() != string.Empty)
				{
					string t = string.Empty;
					try
					{
						switch (FieldDataType) 
						{
							case FieldDataType.DATE:
								t = "DATE";
								DateTime.Parse(value);
								break;

							case FieldDataType.FLOAT:
								t = "FLOAT";
								float.Parse(value);
								break;

							case FieldDataType.INT:
								t = "INT";
								int.Parse(value);
								break;

							case FieldDataType.TEXT:
								// nothing to check
								t = "TEXT";
								break;
						}

						_maxVal = value.Trim();

					}
					catch
					{
						throw new Exception(string.Format("Value not a {0}.",t));
					}

				}
				else
					_maxVal = value.Trim();
			
			
			
			}
		}






		[Category("Field-Validation")]
		public string ValidList
		{	get{return _validList;}
			set 
			{
				// elements of validlist must be correct type
				if (value.Trim() != string.Empty)
				{
					string t = string.Empty;
					try 
					{
						string [] listItems = value.Split(new char[] {','});
					
						//foreach(string s in listItems)
						//{
							 /* HACK: skip validation for now because
							  * I don't know how to control the order that tag properties
							  * are set in my custom control.  It appears that the ValidList
							  * property is being set before FieldDataType
							  */
					
							/*
							switch (FieldDataType) 
							{
								case FieldDataType.DATE:
									t = "DATE";
									DateTime.Parse(s.Trim());
									break;

								case FieldDataType.FLOAT:
									t = "FLOAT";
									float.Parse(s.Trim());
									break;

								case FieldDataType.INT:
									t = "INT";
									int.Parse(s.Trim());
									break;

								case FieldDataType.TEXT:
									// nothing to check
									t = "TEXT";
									break;
							}

							*/
						//}
						
						_validList = value;
					}
					catch 
					{
						throw new Exception(string.Format("Property must contain a comma separated list of {0} items.", t));
					}

					
				}
				else
					_validList = value.Trim();

				
			
			}
		}

		[Browsable(false)]
		public bool VerifyError 
		{
			get
			{
				
				return (ViewState["_verifyError"] == null)? false:(bool)ViewState["_verifyError"];

			}
			set 
			{
				ViewState["_verifyError"] = value;
				
				// hide override check box if set to false
				//**change
				//OverrideCheckBoxVisible = false
				OverrideCheckBoxVisible = value;
			
			}
		}

		[Browsable(false)]
		public bool OverrideCheckBoxVisible 
		{
			get
			{
				
				EnsureChildControls();
				return _overrideCheckBox.Visible;

			}
			set 
			{
				EnsureChildControls();
				_overrideCheckBox.Visible = value;
			}
		}
		
		[Category("Field-Type")]
		public bool IsReadOnly 
		{
			get {return _isReadOnly;}
			set
			{
				_isReadOnly = value;

				// disable field text box
				if (value == true ) 
				{
					EnsureChildControls();
				 _fieldTextBox.Enabled = false;
				}
				
				//If IsReadOnly = T then All of isEntryField, isInsertField, isDoubleEntryField must be F
				if (value == true)
				{
					if (IsEntryField == true) IsEntryField = false;
					if (IsInsertField == true) IsInsertField = false;
					if (IsDoubleEntryField == true) IsDoubleEntryField = false;
				}


				UpdateCssStyles();

			}
		}


		[Category("Field-Validation")]
		public string RegExDescription 
		{
			get { return _RegExDescription; }
			set { _RegExDescription = value.Trim(); }
		}

		[Category("Field-Setup")]
		public string DatabaseField 
		{
			get 
			{
				return _databaseField;
			}
			set 
			{
				_databaseField = value.Trim();
			}

		}


		
		
		[Category("Field-Type")]
		public bool  IsInsertField
		{
			get 
			{
				return _isInsertField;
			}
			set 
			{
				_isInsertField = value;

				// if value = false set IsInsertValueRequired = false if not already
				if (value == false && IsInsertValueRequired == true) IsInsertValueRequired = false;

				// if setting to true IsReadOnly must be false
				if (value == true && IsReadOnly == true) IsReadOnly = false;

				UpdateCssStyles();

			}

		}

		[Category("Field-Validation")]
		public bool IsInsertValueRequired 
		{
			get 
			{
				return _isInsertValueRequired;
			}
			set 
			{
				_isInsertValueRequired = value;

				// if value = true set IsInsertField to true if not already
				if (IsInsertField == false && value == true) IsInsertField = true;
			}

		}

		[Category("Field-Validation")]
		public string RegEx 
		{
			get 
			{
				return _RegEx;
			}
			set 
			{
				// test the value and throw an exception if it 
				// can't be parsed as a regular expression
				if (value.Trim() != string.Empty)
				{
					try
					{
						Regex r = new Regex(value);
						_RegEx = value.Trim();
					}
					catch (ArgumentException ae)
					{
						throw new Exception("Invalid regular expression: " + ae.Message);
					}
				}
				else
					_RegEx = value.Trim();

				
			}

		}		
		
		[Category("Field-Type")]
		public bool IsEntryField 
		{
			get 
			{
				return _isEntryField;
			}
			set 
			{
				_isEntryField = value;

				// if value = false the set both IsEntryValueRequired and IsDoubleEntryField to false a
				// if not already.
				if (value == false)
				{
					if (IsEntryValueRequired == true) IsEntryValueRequired = false;
					if (IsDoubleEntryField == true) IsDoubleEntryField = false;
				}

				// if setting to true IsReadOnly must be false
				if (value == true && IsReadOnly == true) IsReadOnly = false;

				UpdateCssStyles();
			}

		}

		[Category("Field-Validation")]
		public bool IsEntryValueRequired 
		{
			get 
			{
				return _isEntryValueRequired;
			}
			set 
			{
				_isEntryValueRequired = value;

				// If value = true set isEntryField = true if not already
				if (IsEntryField == false && value == true)	IsEntryField = true;
			}

		}


		[Category("Field-Type")]
		public bool IsDoubleEntryField 
		{
			get 
			{
				return _isDoubleEntryField;
			}
			set 
			{
				_isDoubleEntryField = value;

				// if value = true IsEntryField must be true too
				if (value == true && IsEntryField == false) IsEntryField = true;

				// if setting to true IsReadOnly must be false
				if (value == true && IsReadOnly == true) IsReadOnly = false;

			}

		}
		#endregion




		#region Overidden properties
		public override ControlCollection Controls
		{
			get
			{
				EnsureChildControls();
				return base.Controls;
			}
		}

		public override bool Enabled
		{
			get
			{
				EnsureChildControls();
				return _fieldTextBox.Enabled;
			}
			set
			{
				EnsureChildControls();
				_fieldTextBox.Enabled = value;
			}
		}


		#endregion

		#region Properties delegated to child controls


		[Category("Field-Setup")]
		public string FieldLabelCssClass
		{
			get 
			{	EnsureChildControls();
				return _fieldLabel.CssClass;
			}
			set
			{	
				EnsureChildControls();
				_fieldLabel.CssClass = value;
			}

		}

		[Category("Field-Setup")]
		public string FieldTextBoxCssClass
		{
			get 
			{
					EnsureChildControls();
				return _fieldTextBox.CssClass;
			}
			set
			{	
				EnsureChildControls();
				_fieldTextBox.CssClass = value;
			}

		}

		[Category("Field-Setup")]
		public string FieldErrorLabelCssClass
		{
			get 
			{
					EnsureChildControls();
				return _fieldErrorLabel.CssClass;
			}
			set
			{	
				EnsureChildControls();
				_fieldErrorLabel.CssClass = value;
			}

		}
		
		[Category("Field-Setup")]
		public string OverrideCheckBoxCssClass
		{
			get 
			{
					EnsureChildControls();
				return _overrideCheckBox.CssClass;
			}
			set
			{	
				EnsureChildControls();
				_overrideCheckBox.CssClass = value;
			}

		}


		[Category("Field-Setup")]
		public TextBoxMode FieldTextBoxTextMode
		{
			get 
			{
				EnsureChildControls();
				return _fieldTextBox.TextMode;
			}
			set 
			{
				EnsureChildControls();
				_fieldTextBox.TextMode = value;
			}
		}

		[Browsable(false)]
		public bool OverrideCheckBoxChecked 
		{
			get 
			{
				EnsureChildControls();
				return _overrideCheckBox.Checked;
			}
			set 
			{
				EnsureChildControls();
				_overrideCheckBox.Checked = value;
			}
		}


		[Category("Field-Setup")]
		public string FieldLabelText 
		{
			get 
			{
				EnsureChildControls();

				// if no label is set use datafield control ID
				return (_fieldLabel.Text==string.Empty) ? this.ID:_fieldLabel.Text;
			}
			set 
			{
				EnsureChildControls();
				_fieldLabel.Text = value;
			}
		}

		[Category("Field-Setup")]
		public Unit FieldLabelWidth
		{
			get 
			{
				EnsureChildControls();
				return _fieldLabel.Width;
			}
			set 
			{
				EnsureChildControls();
				_fieldLabel.Width = value;
			}
		}
		
		[Category("Field-Setup")]
		public string FieldTextBoxTextDefault
		{
			get { return _fieldTextBoxTextDefault; }
			set { _fieldTextBoxTextDefault = value; }
		}

		
		[Browsable(false)]
		public string FieldTextBoxText
		{	
			get 
			{
				EnsureChildControls();
				return _fieldTextBox.Text;
			}
			set 
			{
				EnsureChildControls();

				// apply format string, if any, but trap any
				// exceptions that might result from user
				// entering values not appropriate to field's type
				//
				string formatted = string.Empty;
				try 
				{
					if ((FormatString != string.Empty) && (value.Trim() != string.Empty))
					{
						switch (FieldDataType) 
						{
							case FieldDataType.DATE:
								formatted = string.Format(FormatString, DateTime.Parse(value));
								break;

							case FieldDataType.FLOAT:
								formatted = string.Format(FormatString, float.Parse(value));
								break;

							case FieldDataType.INT:
								formatted = string.Format(FormatString, int.Parse(value));
								break;

							case FieldDataType.TEXT:
								formatted = string.Format(FormatString, value);
								break;
						}
					}
					else
						formatted = value;
				}
				catch
				{
					formatted = value;
				}

				_fieldTextBox.Text = formatted;
				
			}
		}


		
		[Category("Field-Setup")]
		public int FieldTextBoxMaxLength
		{
			get 
			{
				EnsureChildControls();
				return _fieldTextBox.MaxLength;
			}
			set 
			{
				EnsureChildControls();
				_fieldTextBox.MaxLength = value;
			}
		}

		
		
		[Category("Field-Setup")]
		public Unit FieldTextBoxWidth
		{
			get 
			{
				EnsureChildControls();
				return _fieldTextBox.Width;
			}
			set 
			{
				EnsureChildControls();
				_fieldTextBox.Width = value;
			}
		}


		[Category("Field-Setup")]
		public Unit FieldTextBoxHeight
		{
			get 
			{
				EnsureChildControls();
				return _fieldTextBox.Height;
			}
			set 
			{
				EnsureChildControls();
				_fieldTextBox.Height = value;
			}
		}		
		
		
		[Category("Field-Setup")]
		public short FieldTextBoxTabIndex
		{
			get 
			{
				EnsureChildControls();
				return _fieldTextBox.TabIndex;
			}
			set 
			{
				EnsureChildControls();
				_fieldTextBox.TabIndex = value;
			}
		}

		
		
		[Category("Field-Setup")]
		public Unit FieldErrorLabelWidth
		{
			get 
			{
				EnsureChildControls();
				return _fieldErrorLabel.Width;
			}
			set 
			{
				EnsureChildControls();
				_fieldErrorLabel.Width = value;
			}
		}
		#endregion
	
	
		#region Overidden methods
		protected override void CreateChildControls()
		{
			Controls.Clear();

			_fieldLabel = new Label();
			_fieldLabel.ID = "fieldLabel";
			_fieldLabel.CssClass = "fieldlabel";

			_fieldTextBox = new TextBox();
			_fieldTextBox.ID = "fieldTextBox";
			// add attribute to convert ENTER into TAB
			// preventing form submission and moving to next control instead
			_fieldTextBox.Attributes.Add("onKeyDown","if(event.keyCode==13) event.keyCode=9;");
			_fieldTextBox.CssClass = "fieldtextbox";
			_fieldTextBox.MaxLength = 50; // default maxlength to 50


			_fieldErrorLabel = new ErrorLabel();
			_fieldErrorLabel.ID = "fieldErrorLabel";
			_fieldErrorLabel.ForeColor = System.Drawing.Color.Red;
			_fieldErrorLabel.CssClass = "fielderrorlabel";

			_overrideCheckBox = new CheckBox();
			_overrideCheckBox.Text = "use&nbsp;new";
			_overrideCheckBox.Visible = false;
			_overrideCheckBox.Checked = false;
			_overrideCheckBox.ID = "overrideCheckBox";
			_overrideCheckBox.CssClass = "fieldoverridecheckbox";


			this.Controls.Add(_fieldLabel);
			this.Controls.Add(_fieldTextBox);
			this.Controls.Add(_fieldErrorLabel);
			this.Controls.Add(_overrideCheckBox);

		}

		protected override void Render(HtmlTextWriter writer)
		{
				//AddAttributesToRender(writer);

			// embed field controls in div tag
			writer.AddAttribute("class", FieldDivCssClass);
			writer.RenderBeginTag(HtmlTextWriterTag.Div);

			
			// if field is read-only and RenderReadOnlyAsDiv is true
			// then just render fieldtextbox.text in a <div> tag.
			// If label is to be displayed then render both in a table.
			if (this.IsReadOnly && this.RenderReadOnlyAsDiv)
			{
				if (_showFieldLabel)
				{
					// use table
					writer.RenderBeginTag(HtmlTextWriterTag.Table);
					writer.RenderBeginTag(HtmlTextWriterTag.Tr);
					writer.RenderBeginTag(HtmlTextWriterTag.Td);
					_fieldLabel.RenderControl(writer);
					writer.RenderEndTag();	// td
			
					writer.RenderBeginTag(HtmlTextWriterTag.Td);
					
					// field text in <div>
					writer.RenderBeginTag(HtmlTextWriterTag.Div);
					writer.Write(System.Web.HttpUtility.HtmlEncode(this.FieldTextBoxText));
					writer.RenderEndTag();
					
					writer.RenderEndTag();	// td

					writer.RenderEndTag();	// tr
					writer.RenderEndTag();	// table

				}
				else
				{
					// no table
					writer.RenderBeginTag(HtmlTextWriterTag.Div);
					writer.Write(this.FieldTextBoxText);
					writer.RenderEndTag();
				}
			}
			else
			{
				writer.RenderBeginTag(HtmlTextWriterTag.Table);
				writer.RenderBeginTag(HtmlTextWriterTag.Tr);
				writer.RenderBeginTag(HtmlTextWriterTag.Td);
				if (_showFieldLabel) _fieldLabel.RenderControl(writer);
				writer.RenderEndTag();	// td
			
				writer.RenderBeginTag(HtmlTextWriterTag.Td);
                //_fieldTextBox.Attributes.Add("onFocus", CallOnFocus + "('" + this.ID + "')" );
                //_fieldTextBox.Attributes.Add("onBlur", CallOnBlur + "('" + this.ID + "')");

                //DF: 5/10/07 Change to use ClientID instead of ID
                _fieldTextBox.Attributes.Add("onFocus", CallOnFocus + "('" + this.ClientID + "')");
                _fieldTextBox.Attributes.Add("onBlur", CallOnBlur + "('" + this.ClientID + "')");
                
                
                _fieldTextBox.RenderControl(writer);
				_overrideCheckBox.RenderControl(writer);
				writer.RenderEndTag();	// td

				writer.RenderBeginTag(HtmlTextWriterTag.Td);
			
				/* **change
				// only render if there are errors
				if (_errorList.Count > 0) 
					_fieldErrorLabel.RenderControl(writer);
				*/

				//always render error label
				_fieldErrorLabel.RenderControl(writer);

				writer.RenderEndTag();	// td

				writer.RenderEndTag();	// tr
				writer.RenderEndTag();	// table
			}

			writer.RenderEndTag();	// div

		}


		private void UpdateCssStyles()
		{
			/* Do nothing for now becuase I get funky behavior because I 
			 * don't know how to control when dependent properties are set
			 * 
			 * 
			if (_isInsertField) // takes precedence over fields that are both insert and entry
			{
				this.FieldTextBoxCssClass = Constants.ENTRY_FIELDTEXTBOX_CSSCLASS;
				this.FieldLabelCssClass = Constants.ENTRY_FIELDLABEL_CSSCLASS;
				this.FieldErrorLabelCssClass = Constants.ENTRY_FIELDERRORLABEL_CSSCLASS;
				this.OverrideCheckBoxCssClass = Constants.ENTRY_FIELDOVERRIDECHECKBOX_CSSCLASS;
			}
			else if (_isEntryField)
			{
				this.FieldTextBoxCssClass = Constants.INSERT_FIELDTEXTBOX_CSSCLASS;
				this.FieldLabelCssClass = Constants.INSERT_FIELDLABEL_CSSCLASS;
				this.FieldErrorLabelCssClass = Constants.INSERT_FIELDERRORLABEL_CSSCLASS;
				this.OverrideCheckBoxCssClass = Constants.INSERT_FIELDOVERRIDECHECKBOX_CSSCLASS;
			}
			else if (_isReadOnly)
			{
				this.FieldTextBoxCssClass = Constants.READONLY_FIELDTEXTBOX_CSSCLASS;
				this.FieldLabelCssClass = Constants.READONLY_FIELDLABEL_CSSCLASS;
				this.FieldErrorLabelCssClass = Constants.READONLY_FIELDERRORLABEL_CSSCLASS;
				this.OverrideCheckBoxCssClass = Constants.READONLY_FIELDOVERRIDECHECKBOX_CSSCLASS;
			}
	*/


		}

		#endregion
	}


	class ErrorLabel: Label 
	{

		private ArrayList ErrorList
		{
			get
			{
				ArrayList al =  (ArrayList)ViewState["_theFieldErrorlist"];
				
				// if list hasn't already been saved in viewstate bag then return an empty one
				if (al == null) al = new ArrayList();
				return al;
			}

			set
			{
				ViewState["_theFieldErrorlist"] = value;
			}
		}

		public void AddError(string s)
		{
			ArrayList list = this.ErrorList;
			list.Add(s);
			this.ErrorList = list;
		}

		public void ClearErrors()
		{
			ArrayList list = this.ErrorList;
			list.Clear();
			this.ErrorList = list;
		}

		public bool HasError()
		{
			return (this.ErrorList.Count > 0);
		}

		public string GetFirstError()
		{
			if (this.HasError())
				return (string)this.ErrorList[0];
			else
				return string.Empty;
		}


		protected override void Render(HtmlTextWriter writer)
		{
			// don't render anything if no errors
			if (HasError())	base.Render (writer);

		}


		protected override void OnPreRender(EventArgs e)
		{

			string sText = string.Empty;
			ArrayList errorList = this.ErrorList;
			if (errorList.Count > 0) 
			{
				sText = "<ul>";
				foreach (string err in errorList)
				{
					sText += "<li>" + err + "</li>";
				}
				sText += "</ul>";
			}

			this.Text = sText;
		}



	}
}
