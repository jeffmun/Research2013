using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using System.Collections;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace DataEntryFramework4
{

	public enum FieldDataType 
	{ UNKNOWN, INT, FLOAT, DATE, TEXT
	}

	[
	DefaultProperty("FieldLabelText"),
	Designer(typeof(DataEntryFramework4.Design.DataFieldControlDesigner)),
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
		//private string _fldname = string.Empty;
		private string _fldname;
		private bool _isInsertField;
		private bool _isInsertValueRequired;
		private string _RegEx = string.Empty;
		private string _RegExDescription = string.Empty;
		private bool _isEntryField;
		private bool _isEntryValueRequired;
		private bool _isDoubleEntryField;
		private bool _isReadOnly;
		//private bool _verifyError;
		private FieldDataType _fieldDataType = FieldDataType.UNKNOWN;
		private string _validList = string.Empty;
		private string _missVal = string.Empty;
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
		private RangeList _validListRangeList = null;
		private RangeList _missValRangeList = null;

		private string _fieldnameandlabel = string.Empty;

		/*
		 * PreValidate() checks that necessary properties exist
		 * on page tag to fetch metadata.
		 * 
		 * Checks:
		 * 
		 * ID is required.
		 * fldname is Required.
		 * 
		 */
		public List<string> PreValidate()
		{
			List<string> errors = new List<string>();

			if (string.IsNullOrEmpty(this.FldName))
			{
				errors.Add("A value for the fldname property is required.");
			}

			if (string.IsNullOrEmpty(this.ID))
			{
				errors.Add("A value for the ID property is a required.");
			}

			return errors;
		}

		/*
		 * Returns a List<string> containing any errors.  If no errors the List.count ==0.
		 * 
		 * Checks:
		 * 
		 * ID is required.
		 * fldname is Required.
		 * 
		 * FieldDataType is required.
		 * 
		 * At least one of IsInsertField, IsEntryField, IsReadOnly must be true.
		 * 
		 * If IsReadOnly == true then 
		 *  IsEntryField == false
		 *  IsInsertField == false
		 *  IsDoubleEntryField == false
		 * 
		 * If IsEntryField == false then 
		 *  IsDoubleEntryField == false
		 *
		 * Validates any supplied value for FormatString, MinVal, MaxVal, ValidList, RegEx
		 * 
		 * Attempts to create RangeList objects for any supplied ValidList or MissVal.
		 * See RangeList Class for details.
		 */
		public List<string> ValidateAndInitializeProperties()
		{
			List<string> errors = new List<string>();

			#region fldname, ID, FieldDataType

			if (string.IsNullOrEmpty(this.FldName))
			{
				errors.Add("A value for the fldname property is required.");
			}

			if (string.IsNullOrEmpty(this.ID))
			{
				errors.Add("A value for the ID property is a required.");
			}

			if (this.FieldDataType == FieldDataType.UNKNOWN)
			{
				errors.Add("FieldDataType is required. A value must be set on the field tag if metadata is missing.");

			}

			#endregion

			#region FormatString, Min/MaxVal, ValidList

			//validation of FormatString, Min/MaxVal, ValidList depends on existence of FieldDataType
			//so return if it might be missing
			if (errors.Count != 0)
			{
				return errors;
			}

			// If supplied, make sure FormatString is valid by attempting
			// to apply it
			if (string.IsNullOrEmpty(FormatString) == false)
			{
				string fstr = FormatString;
				try 
				{
					//calls to string.Format() will fail if fstr invalid
					string formatted = string.Empty;
					switch (FieldDataType) 
					{
						case FieldDataType.DATE:
							formatted = string.Format(fstr, DateTime.Parse("5/5/2004"));
							break;

						case FieldDataType.FLOAT:
							formatted = string.Format(fstr, float.Parse("4.235"));
							break;

						case FieldDataType.INT:
							formatted = string.Format(fstr, int.Parse("5"));
							break;

						case FieldDataType.TEXT:

							// throw an exception because formatstring isn't
							// allowed for text types
							throw new Exception("FormatString isn't allowed for text data type.");
						default:
							throw new Exception("Value of FieldDataType can't be UNKNOWN if setting FormatString");

					}
				}
				catch (Exception e)
				{
					errors.Add("Invalid format string: " + e.Message);
				}
			}

			
			
			// If supplied, make sure MinVal value is appropriate for
			// data type
			if (string.IsNullOrEmpty(MinVal) == false)
			{
				try
				{
					switch (FieldDataType) 
					{
						case FieldDataType.DATE:
							DateTime.Parse(MinVal);
							break;

						case FieldDataType.FLOAT:
							float.Parse(MinVal);
							break;

						case FieldDataType.INT:
							int.Parse(MinVal);
							break;

						case FieldDataType.TEXT:
							// nothing to check
							break;

						default:
							throw new Exception("Invalid FieldDataType");
					}
				}
				catch
				{
					errors.Add(string.Format("MinVal invalid because it cannot be converted to {0}.", FieldDataType));
				}
			}

			// If supplied make sure MaxVal value is appropriate for
			// data type
			if (string.IsNullOrEmpty(MaxVal) == false)
			{
				try
				{
					switch (FieldDataType)
					{
						case FieldDataType.DATE:
							DateTime.Parse(MaxVal);
							break;

						case FieldDataType.FLOAT:
							float.Parse(MaxVal);
							break;

						case FieldDataType.INT:
							int.Parse(MaxVal);
							break;

						case FieldDataType.TEXT:
							// nothing to check
							break;

						default:
							throw new Exception("Invalid FieldDataType");
					}
				}
				catch
				{
					errors.Add(string.Format("MaxVal invalid because it cannot be converted to {0}.", FieldDataType));
				}
			}
			
			//Initialize ValidList RangeList
			if (string.IsNullOrEmpty(ValidList) == false)
			{
				try
				{
					_validListRangeList = new RangeList(ValidList, FieldDataType);
				}
				catch (Exception e)
				{
					errors.Add(string.Format("ValidList {0} invalid. " + e.Message, ValidList));
				}
			}

			//Initialize MissVal RangeList
			if (string.IsNullOrEmpty(MissVal) == false)
			{
				try
				{
					_missValRangeList = new RangeList(MissVal, FieldDataType);
				}
				catch (Exception e)
				{
					errors.Add(string.Format("MissVal {0} invalid. " + e.Message, MissVal));
				}
			}


			#endregion

			#region Others

			//At least one of IsInsertField, IsEntryField, IsReadOnly must be true.
			if ( (IsInsertField || IsEntryField || IsReadOnly) == false)
			{
				errors.Add("At least one of IsInsertField, IsEntryField, IsReadOnly must be true.");
			}

			// If IsReadOnly == true then 
			//  IsEntryField == false
			//  IsInsertField == false
			//  IsDoubleEntryField == false
			if (IsReadOnly == true && (IsEntryField || IsInsertField || IsDoubleEntryField))
			{
				errors.Add("A ReadOnly field can't also have IsEntryField, IsInsertField, or IsDoubleEntry set to true.");
			}

			// If IsEntryField == false then 
			//  IsDoubleEntryField == false
			if (IsEntryField == false && IsDoubleEntryField == true)
			{
				errors.Add("A setting of IsDoubleEntryField = true requires IsEntryField = true.");
			}


			// if RegEx supplied test the value
			if (string.IsNullOrEmpty(RegEx) == false)
			{
				try
				{
					Regex r = new Regex(RegEx);
				}
				catch (ArgumentException ae)
				{
					if(ae!=null)
					errors.Add("Invalid regular expression: " + RegEx);
				}
			}


			#endregion

			//return errors
			return errors;
		}



		public RangeList ValidListRangeList     
		{
			get { return _validListRangeList; }
		}

		public RangeList MissValRangeList
		{
			get { return _missValRangeList; }
		}
	




		//protected override void OnLoad(EventArgs e)
		//{
		//    Page.Trace.Write("DataFieldControl: " + this.fldname, "Begin Load");



		//    base.OnLoad(e);
		//    Page.Trace.Write("DataFieldControl: " + this.fldname, "End Load");
		//}


		private IFieldMetadata _fieldMetadata;

		public IFieldMetadata FieldMetadata
		{
			get { return _fieldMetadata; }
			set 
			{ 
				//Set any DataFieldControl properties  
				//to values supplied by metadata.
				//
				//Any specified metadata values take precedence over 
				//values specified on tag.
				//
				//The fldname property is not set because it must already exist.
				if (value != null)
				{
					//save reference
					_fieldMetadata = value;

					//FieldDataType
					if (value.FieldDataType != FieldDataType.UNKNOWN)
					{
						this.FieldDataType = value.FieldDataType;
					}

					//FieldLabelText
					if (string.IsNullOrEmpty(value.FieldLabelText) == false)
					{
						this.FieldLabelText = value.FieldLabelText;
					}

					//Set IsEntryValueRequired, IsInsertValueRequired to value supplied for ValueRequired metadata. 
					//First check to see if a value was supplied by metadata.
					if (string.IsNullOrEmpty(value.IsValueRequiredParam) == false)
					{
						this.IsEntryValueRequired = value.IsValueRequired;
						this.IsInsertValueRequired = value.IsValueRequired;
					}

					//MaxVal
					if (string.IsNullOrEmpty(value.MaxVal) == false)
					{
						this.MaxVal = value.MaxVal;
					}

					//MinVal
					if (string.IsNullOrEmpty(value.MinVal) == false)
					{
						this.MinVal = value.MinVal;
					}

					//RegEx
					if (string.IsNullOrEmpty(value.RegEx) == false)
					{
						this.RegEx = value.RegEx;
					}

					//RegExDescription
					if (string.IsNullOrEmpty(value.RegExDescription) == false)
					{
						this.RegExDescription = value.RegExDescription;
					}

					//ValidList
					if (string.IsNullOrEmpty(value.ValidList) == false)
					{
						this.ValidList = value.ValidList;
					}

					//MissVal
					if (string.IsNullOrEmpty(value.MissVal) == false)
					{
						this.MissVal = value.MissVal;
					}

					//ToolTip
					if(string.IsNullOrEmpty(value.FieldNameAndLabel) == false)
					{
						this.FieldNameAndLabel = value.FieldNameAndLabel;
					}
				}

			}
		}


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
			get 
			{
				//If not specified on tag, get value from metadata
				//or return FieldDataType.UNKNOWN of not in metadata either
				if (_fieldDataType == FieldDataType.UNKNOWN && FieldMetadata != null)
				{
					return FieldMetadata.FieldDataType;
				}
				else
				{
					return _fieldDataType;
				}
			}
			set {_fieldDataType = value;}
		}


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
				_formatString = value.Trim();
			}
		}

		[Category("Field-Setup")]
		public string FieldNameAndLabel
		{
			get { return _fieldnameandlabel; }
			set
			{
				_fieldnameandlabel = value.Trim();
			}
		}

		[Category("Field-Validation")]		
		public string MinVal 
		{
			get {return _minVal;}
			set 
			{
				_minVal = value.Trim();
			}
		}

		[Category("Field-Validation")]
		public string MaxVal
		{
			get {return _maxVal;}
			set {
					_maxVal = value.Trim();
			}
		}

		[Category("Field-Validation")]
		public string MissVal
		{
			get { return _missVal; }
			set
			{
				_missVal = value.Trim();
			}
		}

		[Category("Field-Validation")]
		public string ValidList
		{	get{return _validList;}
			set 
			{
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
		public string FldName 
		{
			get 
			{
				return _fldname;
			}
			set 
			{
				_fldname = value.Trim();
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
				_fieldLabel.Text = value.Trim();
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
							default:
								throw new Exception("FieldDataType can't be UNKNOWN");
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
			_fieldLabel.Text = this.ID; //initialize to ID value of field control

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


				_fieldTextBox.ToolTip = FieldNameAndLabel;

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
