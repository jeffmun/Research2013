using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using System.Collections;
using System.Drawing;
using System.Data.SqlClient;
using System.Data;
using System.Text;

namespace DataEntryFramework
{



	public enum LookupFieldDataType 
	{
			INT, TEXT
	}
	
	// verified values
	public enum Verified 
	{
		CREATED = -1,
		ENTERED = 0,
		DOUBLE_ENTERED = 1,
		NO_DATA = 4
	}
	
	// current form state
	public enum FormStates 
	{
		INSERTING, ENTERING, SINGLE_ENTERED, DOUBLE_ENTERING, 
		DOUBLE_ENTERING_CORRECTING, DOUBLE_ENTERED, NO_DATA};

	
	[
	Designer(typeof(DataEntryFramework.Design.DataEntryControllerDesigner)),
	ToolboxData("<{0}:DataEntryController runat=\"server\"/>")
	] 
	public class DataEntryController : WebControl, INamingContainer
	{

		/*
		 * DataEntryController.OnLoad subscribes Page_PreRender to the
		 * page's PreRender event.
		 * 
		 * Page_PreRender examines the query string and attempts to load
		 * the requested Study Measure.
		 */
		public void Page_PreRender(Object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				//eat any unexpected errors
				try
				{
					if (Page.Request.QueryString["id"] != null && 
						Page.Request.QueryString["studymeasid"] != null &&
						Page.Request.QueryString["indexnum"] != null)
					{
						this.LookupTextBox1Text = Page.Request.QueryString["id"];
						this.LookupTextBox2Text = Page.Request.QueryString["indexnum"];
						this.LookupStudyMeasID = int.Parse(Page.Request.QueryString["studymeasid"]);
						this.ParameterLookup();
					}
					else if (Page.Request.QueryString["pk"] != null)
					{
						LookupPKVal = Page.Request.QueryString["pk"];
						ParameterLookup();
					}
				}
				catch {}
			}

		}





		#region Formatter, Validator, Form event handler


		private IFormEventHandler _formEventHandler = null;
		[Browsable(false)]
		public IFormEventHandler FormEventHandler 
		{
			// if no handler has been set use default
			get 
			{
				if (_formEventHandler == null)
				{
					_formEventHandler = new DefaultFormEventHandler();
					return _formEventHandler;
				}
				else
					return _formEventHandler;
			}
			
			set { _formEventHandler = value;}

		}



		private IFormatter _formatter = null;

		[Browsable(false)]
		public IFormatter Formatter 
		{
			get 
			{
				if (_formatter == null) 
				{
					// if no formatter has been set use the default
					_formatter = new DefaultFormatter();
					return _formatter;
				}
				else
				{
					return _formatter;
				}
			}

			set 
			{
				_formatter = value;
			}
		}

		private IFieldValidator _validator = null;
		
		[Browsable(false)]
		public IFieldValidator Validator 
		{
			get 
			{
				// use default if not already set
				if (_validator == null)
				{
					_validator = new DefaultValidator();

					// set which dataentrycontroller uses validator
					_validator.DataEntryController = this;
					return _validator;
				}
				else
				{
					return _validator;
				}
			}

			set 
			{
				_validator = value;

				// set which dataentrycontroller uses validator
				_validator.DataEntryController = this;
			}
		}
		#endregion
		

		#region private variables for child controls
		private Button _createNewButton;
		private Button _insertButton;
		private Button _saveButton;
		private Button _doubleEnterButton;
		private Button _verifyButton;
		private Button _lookupButton;
		private Button _noDataButton;
		private Label _stateLabel;
		private TextBox _lookupTextBox1;
		private TextBox _lookupTextBox2;
		private Label _lookupTextBox1Label;
		private Label _lookupTextBox2Label;
		private Label _notificationsLabel;
		private Button _scoreButton;
		private DropDownList _studyMeasureDDL;
		private DropDownList _createNewStudyMeasureDDL;
		private Label _newStudyMeasureLabel;
		private LiteralControl _lookupResultsTable;
		private Label _lblNeedsScoring;

		//**new
		private CustomRepeater _dataIssuesRepeater;
		#endregion

		#region Index objects for event list
		// These objects are used as indexes into the Events list
		private static readonly object EventInsert = new object();
		private static readonly object EventSaveEntering = new object();
		private static readonly object EventSaveSingleEntered = new object();
		private static readonly object EventDoubleEnter = new object();
		private static readonly object EventVerify = new object();
		private static readonly object EventVerifyCorrecting = new object();
		private static readonly object EventSaveDoubleEntered = new object();
		private static readonly object EventCreateNew = new object();
		private static readonly object EventLookup = new object();
		private static readonly object EventNoData = new object();
		private static readonly object EventScore = new object();
		private static readonly object EventParameterLookup = new object();
	
		#endregion

		#region data field control collections and their accessors
		// data field control collections and their accessors
		private ArrayList _allDataFields = new ArrayList();
		private ArrayList _insertDataFields = new ArrayList();
		private ArrayList _entryDataFields = new ArrayList();
		private ArrayList _doubleEntryDataFields = new ArrayList();


		[Browsable(false)]
		public ArrayList AllDataFields 
		{get {return _allDataFields;}}

		[Browsable(false)]
		public ArrayList InsertDataFields
		{get {return _insertDataFields;}}

		[Browsable(false)]
		public ArrayList EntryDataFields
		{get{return _entryDataFields;}}

		[Browsable(false)]
		public ArrayList DoubleEntryDataFields
		{get {return _doubleEntryDataFields;}}

		#endregion


		[Browsable(false)]
		public string FrameworkVersion
		{
			get {return "1.6.1.0"; }
		}

		//holds value of pk querystring parameter
		private string _lookupPKVal = string.Empty;
		[Browsable(false)]
		public string LookupPKVal
		{
			get	{return _lookupPKVal; }
			set {_lookupPKVal = value; }
		}


		//holds result of lookup
		//
		//Used to display a set of links so user can pick which one to open
		private DataSet _lookupDataSet = null;
		[Browsable(false)]
		public DataSet LookupDataSet
		{
			get {return _lookupDataSet;}
			set {_lookupDataSet = value;}

		}




		[Browsable(false)]
		private DateTime _lastUpdatedDate = DateTime.MinValue;
		public DateTime	LastUpdatedDate
		{
			get
			{
				return _lastUpdatedDate;
			}
			set
			{
				_lastUpdatedDate = value;
			}
		}

		[Browsable(false)]
		private DateTime _lastScoredDate = DateTime.MinValue;
		public DateTime	LastScoredDate
		{
			get
			{
				return _lastScoredDate;
			}
			set
			{
				_lastScoredDate = value;
			}
		}



		[Browsable(false)]
		public string StudyMeasName
		{
			get
			{
				return ViewState["_StudyMeasName"] == null ? string.Empty: (string)ViewState["_StudyMeasName"];
			}
			set
			{
				ViewState["_StudyMeasName"] = value;
			}

		}

		[Browsable(false)]
		public int StudyMeasID 
		{
			get 
			{
				return ViewState["_StudyMeasID"] == null ? -1: (int)ViewState["_StudyMeasID"];
			}

			set 
			{
				ViewState["_StudyMeasID"] = value;
			}
		}

		[Browsable(false)]
		public int PrimaryKeyVal
		{
			get 
			{
				return ViewState["_PrimaryKeyVal"] == null ? -1: (int)ViewState["_PrimaryKeyVal"];
			}

			set 
			{
				ViewState["_PrimaryKeyVal"] = value;
			}
		}

		[Browsable(false)]
		public string StudySubjectIDString
		{
			get 
			{
				return ViewState["_StudySubjectIDString"] == null ? string.Empty: (string)ViewState["_StudySubjectIDString"];
			}

			set 
			{
				ViewState["_StudySubjectIDString"] = value;
			}
		}

		[Browsable(false)]
		public int StudyMeasureIndexnum
		{
			get 
			{
				//default value is 1
				return ViewState["_StudyMeasureIndexnum"] == null ? 1: (int)ViewState["_StudyMeasureIndexnum"];
			}

			set 
			{
				ViewState["_StudyMeasureIndexnum"] = value;
			}
		}

		#region Private variables and accessors for Form state, FormError, VerifyError, NextState
		
		[Browsable(false)]
		public FormStates FormState 
		{
			get 
			{

				//default to FormStates.INSERTING if FormState hasn't been set yet
				return ViewState["_formState"] == null ? FormStates.INSERTING: (FormStates)ViewState["_formState"];
			}

			set 
			{
				ViewState["_formState"] = value;
			}
		}

		// current form error state
		private bool _formError = false;
		
		[Browsable(false)]
		public bool FormError 
		{
			get { return _formError; }
			set {_formError = value; }
		}

		// verification error state. Used by double entry verification events
		// to notify controller of any verification errors
		private bool _verifyError = false;
		
		[Browsable(false)]
		public bool VerifyError
		{
			get {return _verifyError; }
			set {_verifyError = value; }
		}

		//Next state.  Used by lookup event to notify controller of the 
		// state to use for the found measure.
		private FormStates _nextState = FormStates.INSERTING;
		
		[Browsable(false)]
		public FormStates NextState
		{
			set {_nextState = value;}
		}

		#endregion

		#region Notifications
		// notifications
		private ArrayList _notifications = new ArrayList();
		public enum NotifyType {NOTIFICATION, ERROR};
		private NotifyType _notifyType = NotifyType.NOTIFICATION;
		
		
		
		[Browsable(false)]
		public NotifyType NotificationType 
		{
			get {return _notifyType;}
			set {_notifyType = value;}
		}
		
		public void AddNotification(string notification)
		{
			_notifications.Add(notification);
		}
		public void ClearNotifications()
		{	
			_notifications.Clear();
		}
		
		[Browsable(false)]
		public ArrayList Notifications
		{
			get {return _notifications;}
		}
		#endregion



		

		#region Other Controller Properties

		private string _createNewOnClick = string.Empty;
		[Category("Controller-Events")]
		public string CreateNewOnClick
		{
			get 
			{
				return _createNewOnClick;
			}
			set
			{
				EnsureChildControls();
				this._createNewButton.Attributes.Add("OnClick", value);
				_createNewOnClick = value;
			}
		}

		private string _insertOnClick = string.Empty;
		[Category("Controller-Events")]
		public string InsertOnClick
		{
			get 
			{
				return _insertOnClick;
			}
			set
			{
				EnsureChildControls();
				this._insertButton.Attributes.Add("OnClick", value);
				_insertOnClick = value;
			}
		}

		
		private string _saveOnClick = string.Empty;
		[Category("Controller-Events")]
		public string SaveOnClick
		{
			get
			{
				return _saveOnClick;
			}
			set
			{
				EnsureChildControls();
				this._saveButton.Attributes.Add("OnClick", value);
				_saveOnClick = value;
			}
		}


		private string _doubleEnterOnClick = string.Empty;
		[Category("Controller-Events")]
		public string DoubleEnterOnClick
		{
			get
			{
				return _doubleEnterOnClick;
			}
			set
			{
				EnsureChildControls();
				this._doubleEnterButton.Attributes.Add("OnClick", value);
				_doubleEnterOnClick = value;
			}
		}


		private string _verifyOnClick = string.Empty;
		[Category("Controller-Events")]
		public string VerifyOnClick
		{
			get
			{
				return _verifyOnClick;
			}
			set
			{
				EnsureChildControls();
				this._verifyButton.Attributes.Add("OnClick", value);
				_verifyOnClick = value;
			}
		}

		private string _noDataOnClick = string.Empty;
		[Category("Controller-Events")]
		public string NoDataOnClick
		{
			get
			{
				return _noDataOnClick;
			}
			set
			{
				EnsureChildControls();
				this._noDataButton.Attributes.Add("OnClick", value);
				_noDataOnClick = value;
			}
		}

		private string _lookupOnClick = string.Empty;
		[Category("Controller-Events")]
		public string LookupOnClick
		{
			get
			{
				return _lookupOnClick;
			}
			set
			{
				EnsureChildControls();
				this._lookupButton.Attributes.Add("OnClick", value);
				_lookupOnClick = value;
			}
		}



		private string _lastUpdatedDateField = string.Empty;
		[Category("Controller-Setup")]
		public string LastUpdatedDateField
		{
			get{return _lastUpdatedDateField;}
			set{_lastUpdatedDateField = value;}
		}

		private string _lastScoredDateField = string.Empty;
		[Category("Controller-Setup")]
		public string LastScoredDateField
		{
			get{return _lastScoredDateField;}
			set{_lastScoredDateField = value;}
		}

		private string _allowedStudyMeasIDs = string.Empty;
		[Category("Controller-Setup")]
		public string AllowedStudyMeasures
		{
			get {return _allowedStudyMeasIDs;}
			set
			{

				if (value.Trim() != string.Empty)
				{
					// throw an exception if value isn't a comma delimited list of integers
					string[] studymeasures = value.Split(new Char[] {','});
					foreach(string s in studymeasures)
					{
						int i = -1;
						try
						{
							i = int.Parse(s);
						}
						catch {}
						if (i == -1)
							throw new Exception("Property must be a comma delimited list of integers.");
					}
				}

				_allowedStudyMeasIDs = value.Trim();
				
			}
		}



		private bool _showLookup = true;
		[Category("Controller-Setup")]
		public bool ShowLookup
		{
			get {return _showLookup;}
			set {_showLookup = value;}
		}


		private bool _showScoreButton = false;
		[Category("Controller-Setup")]
		public bool ShowScoreButton 
		{
			get {return _showScoreButton;}
			set {_showScoreButton = value;}
		}


		private string _measureName = string.Empty;
		[Category("Controller-Setup")]
		public string MeasureName
		{
			get {return _measureName;}
			set {_measureName = value.Trim();}
		}


		private string _databaseTable = string.Empty;
		[Category("Controller-Setup")]
		public string DatabaseTable
		{
			get {return _databaseTable;}
			set {_databaseTable = value;}
		}

		private string _verifiedField = string.Empty;
		
		[Category("Controller-Setup")]
		public string VerifiedField
		{
			get {return _verifiedField;}
			set {_verifiedField = value.Trim();}
		}

		private bool _lookupTextBox2Visible = true;

		[Category("Controller-Setup")]
		public bool LookupTextBox2Visible 
		{
			get {return _lookupTextBox2Visible;}
			set {_lookupTextBox2Visible = value;}
		}

		private LookupFieldDataType _lookupField1DataType;
		private LookupFieldDataType _lookupField2DataType;

		[Category("Controller-Setup")]
		public LookupFieldDataType LookupField1DataType
		{
			get {return _lookupField1DataType;}
			set {_lookupField1DataType = value;}
		}

		[Category("Controller-Setup")]
		public LookupFieldDataType LookupField2DataType
		{
			get {return _lookupField2DataType;}
			set {_lookupField2DataType = value;}
		}

		private string _lookupField1 = string.Empty;
		[Category("Controller-Setup")]
		public string LookupField1 
		{
			get {return _lookupField1;}
			set {_lookupField1 = value.Trim();}
		}

		private string _lookupField2 = string.Empty;
		[Category("Controller-Setup")]
		public string LookupField2 
		{
			get {return _lookupField2;}
			set {_lookupField2 = value.Trim();}
		}

		private string _primaryKeyField = string.Empty;
		[Category("Controller-Setup")]
		public string PrimaryKeyField 
		{
			get {return _primaryKeyField;}
			set {_primaryKeyField = value.Trim();}
		}

		// Comma delimited list of column headers for
		// multiple lookup result table
		private string _lookupColumnHeaders = string.Empty;
		[Category("Controller-Setup")]
		public string LookupColumnHeaders
		{
			get {return _lookupColumnHeaders;}
			set {_lookupColumnHeaders = value;}
		}

		// Comma delimited list of columms to include in 
		// multiple lookup result table
		private string _lookupColumns = string.Empty;
		[Category("Controller-Setup")]
		public string LookupColumns
		{
			get {return _lookupColumns;}
			set {_lookupColumns = value;}
		}

		
		
		// used to surpress call to default form event handler
		private bool _formEventHandled = false;
		[Browsable(false)]
		public bool FormEventHandled 
		{
			get {return _formEventHandled;}
			set {_formEventHandled = value;}
		}

		#endregion

		
		/*
		 * Called to implement a lookup that can be handled differently
		 * than a lookup triggered by pressing the lookup button.
		 * 
		 * Use to implement a lookup based on passed in querystring
		 * parameters when first requesting a form.  
		 * 
		 * To use:  parse the querystring and set the Lookuptextbox1text and
		 * lookuptextbox2text to the values that should be used then call
		 * this function.
		 */
		public void ParameterLookup()
		{
			Controller("_parameterLookup", null);
		}
		
		/*
		 * Maps user interaction to form events.
		 */
		private void Controller(string command, EventArgs eventArgs) 
		{
			//hold an instance of the class that manages data issue list
			DataEntryIssueManager dm;

			switch (command)
			{
				/*
				 * The _xxxIssue events don't modify form measure data.  Instead they
				 * add/edit/delete records in the data issue table
				 */
				case "_AddIssue":
					dm = new DataEntryIssueManager(this.StudyMeasID, this.StudySubjectIDString, this.StudyMeasureIndexnum);
					dm.Add();
					
					break;

				case "_DeleteIssue":
					dm = new DataEntryIssueManager(this.StudyMeasID, this.StudySubjectIDString, this.StudyMeasureIndexnum);
					dm.Delete( ((RepeaterCommandEventArgs)eventArgs).Item );
					
					
					break;

				case "_SaveIssue":
					dm = new DataEntryIssueManager(this.StudyMeasID, this.StudySubjectIDString, this.StudyMeasureIndexnum);
					dm.Save( ((RepeaterCommandEventArgs)eventArgs).Item );
					
					
					break;

					// user clicked create new
				case "_createNewButton":

					BeforeFormEvent();

					// Next state is always INSERTING regardless of any errors
					OnCreateNew(new EventArgs());

					// if not handled by form call default handler
					if (FormEventHandled == false) FormEventHandler.DoCreateNew(this);

					FormState = FormStates.INSERTING;
					
								
					AfterFormEvent();

					break;
					
					// user clicked insert button
				case "_insertButton":

					BeforeFormEvent();

					OnDoInsert(new EventArgs());

					// if not handled by form call default handler
					if (FormEventHandled == false) FormEventHandler.DoInsert(this);

					// if no errors then next state is ENTERING
					// otherwise stay in INSERTING
					if (!FormError)
					{
						FormState = FormStates.ENTERING;

						Logger.Log(this, LogEntryType.RECORD_SUCCESS_INSERT, false);

					} 
					else
					{
						FormState = FormStates.INSERTING;

						Logger.Log(this, LogEntryType.RECORD_ERROR_INSERT, true);

					}

								
					AfterFormEvent();

					break;

				// user clicked insert button
				case "_deleteButton":


					string dellink = String.Format("~/delete.aspx?tbl={0}&pkfld={1}&pkval={2}", this.DatabaseTable, this.PrimaryKeyField, this.PrimaryKeyVal);					

					break;


				// score
				case "_scoreButton":

					BeforeFormEvent();

					switch (FormState) 
					{
						case FormStates.SINGLE_ENTERED:

							// fire event
							OnScore(new EventArgs());
								
							// if not handled by form call default handler
							if (FormEventHandled == false) FormEventHandler.DoScore(this);

							// next state is always single_entered
							FormState = FormStates.SINGLE_ENTERED;

							// log
							if (FormError)
								Logger.Log(this, LogEntryType.RECORD_ERROR_SCORE, false);
							else
								Logger.Log(this, LogEntryType.RECORD_SUCCESS_SCORE, false);

							break;

						case FormStates.DOUBLE_ENTERED:
							OnScore(new EventArgs());


							// if not handled by form call default handler
							if (FormEventHandled == false) FormEventHandler.DoScore(this);
								
							// next state is always double_entered
							FormState = FormStates.DOUBLE_ENTERED;

							//log
							if (FormError)
								Logger.Log(this, LogEntryType.RECORD_ERROR_SCORE, false);
							else
								Logger.Log(this, LogEntryType.RECORD_SUCCESS_SCORE, false);

							break;
					}

					
								
					AfterFormEvent();

					break;




					// save
				case "_saveButton":

					BeforeFormEvent();

					//Meaning of save button click depends on current state
					switch (FormState) 
					{
						case FormStates.ENTERING:
							OnSaveEntering(new EventArgs());

							// if not handled by form call default handler
							if (FormEventHandled == false) FormEventHandler.DoSaveEnterering(this);

							if (!FormError) 
								FormState = FormStates.SINGLE_ENTERED;
							else
								FormState = FormStates.ENTERING;

							break;

						case FormStates.SINGLE_ENTERED:
							OnSaveSingleEntered(new EventArgs());
								
							// if not handled by form call default handler
							if (FormEventHandled == false) FormEventHandler.DoSaveSingleEntered(this);

							// next state is always single_entered
							FormState = FormStates.SINGLE_ENTERED;
							break;

						case FormStates.DOUBLE_ENTERED:
							OnSaveDoubleEntered(new EventArgs());


							// if not handled by form call default handler
							if (FormEventHandled == false) FormEventHandler.DoSaveDoubleEntered(this);
								
							// next state is always double_entered
							FormState = FormStates.DOUBLE_ENTERED;

							break;
					}

					//log
					if (!FormError) 
						Logger.Log(this, LogEntryType.RECORD_SUCCESS_SAVE, false);
					else
						Logger.Log(this, LogEntryType.RECORD_ERROR_SAVE, true);

					AfterFormEvent();

					break;

					// double enter
				case "_doubleEnterButton":

					BeforeFormEvent();

					OnDoubleEnter(new EventArgs());

					// if not handled by form call default handler
					if (FormEventHandled == false) FormEventHandler.DoDoubleEnter(this);

					if (!FormError)
					{
						FormState = FormStates.DOUBLE_ENTERING;
						Logger.Log(this, LogEntryType.RECORD_SUCCESS_STARTDOUBLEENTRY, false);
					}
					else
					{
						FormState = FormStates.SINGLE_ENTERED;
						Logger.Log(this, LogEntryType.RECORD_ERROR_STARTDOUBLEENTRY, true);
					}

					AfterFormEvent();

					break;

					// verify
				case "_verifyButton":

					BeforeFormEvent();

					// The verify button is available in both DOUBLE_ENTERING
					// and DOUBLE_ENTERING_CORRECTING formstates. 

					if (FormState == FormStates.DOUBLE_ENTERING) 
					{
						OnVerify(new EventArgs());


						// if not handled by form call default handler
						if (FormEventHandled == false) FormEventHandler.DoVerify(this);

						// if no form or double entry verification errors then
						// next state is DOUBLE_ENTERED.  If there are any form 
						// errors then stay in DOUBLE_ENTERING. If there are any
						// verification errors move to DOUBLE_ENTERING_CORRECTING
						if (FormError) 
							// there were validation errors
							FormState = FormStates.DOUBLE_ENTERING;
						else if (VerifyError)
							// there were verification errors
							FormState = FormStates.DOUBLE_ENTERING_CORRECTING;
						else
							// no errors
							FormState = FormStates.DOUBLE_ENTERED;

					}
					else  // DOUBLE_ENTERING_CORRECTING
					{
						OnVerifyCorrection(new EventArgs());


						// if not handled by form call default handler
						if (FormEventHandled == false) FormEventHandler.DoVerifyCorrection(this);

						if (FormError) 
							FormState = FormStates.DOUBLE_ENTERING_CORRECTING;
						else if (VerifyError)
							FormState = FormStates.DOUBLE_ENTERING_CORRECTING;
						else
							FormState = FormStates.DOUBLE_ENTERED;

					}


					//log
					if (FormError)
						Logger.Log(this, LogEntryType.RECORD_ERROR_VERIFY_VALIDATE, true);
					else if (VerifyError)
						Logger.Log(this, LogEntryType.RECORD_ERROR_VERIFY_VERIFY, true);
					else
						Logger.Log(this, LogEntryType.RECORD_SUCCESS_VERIFY, false);

					AfterFormEvent();

					break;


					
					
					
					//parameter lookup
				case "_parameterLookup":

					BeforeFormEvent();
					
					// clear all field controls
					ClearFieldControls();

					// fill event properties with lookup values
					LookupEventArgs e = new LookupEventArgs(_lookupTextBox1.Text, _lookupTextBox2.Text, LookupPKVal);

					//raise the event
					OnParameterLookup(e);

					// if not handled by form call default handler
					if (FormEventHandled == false) FormEventHandler.DoParameterLookup(this);


					// if any errors occur send user to INSERTING state. Otherwise
					// OnParameterLookup is supposed to set NextState property
					if (FormError)
					{
						FormState = FormStates.INSERTING;
						Logger.Log(this, LogEntryType.RECORD_ERROR_LOOKUP, false);
					}
					else
					{

						//Create a list that allows user to choose if lookup returned more that one record 
						SetupLookupTable();

						FormState = _nextState;
						Logger.Log(this, LogEntryType.RECORD_SUCCESS_LOOKUP, false);
					}

					AfterFormEvent();

					break;						
					
					
					//lookup
				case "_lookupButton":

					BeforeFormEvent();
					
					// clear all field controls
					ClearFieldControls();

					// fill event properties will lookup values
					LookupEventArgs e1 = new LookupEventArgs(_lookupTextBox1.Text, _lookupTextBox2.Text, LookupPKVal);

					//raise the event
					OnLookup(e1);

					// if not handled by form call default handler
					if (FormEventHandled == false) FormEventHandler.DoLookup(this);


					// if any errors occur send user to INSERTING state. Otherwise
					// OnLookup is supposed to set NextState property
					if (FormError)
					{
						FormState = FormStates.INSERTING;
						Logger.Log(this, LogEntryType.RECORD_ERROR_LOOKUP, false);
					}
					else
					{
						//Create a list that allows user to choose if lookup returned more that one record 
						SetupLookupTable();

						FormState = _nextState;
						Logger.Log(this, LogEntryType.RECORD_SUCCESS_LOOKUP, false);
					
					}

					AfterFormEvent();


					break;	
				case "_noDataButton":
					
					BeforeFormEvent();
					
					// raise event
					OnNoData(new EventArgs());

					// if not handled by form call default handler
					if (FormEventHandled == false) FormEventHandler.DoNoData(this);

					if (!FormError)
					{
						FormState = FormStates.NO_DATA;
						Logger.Log(this, LogEntryType.RECORD_SUCCESS_NODATA, false);
					}
					else
					{
						FormState = FormStates.ENTERING;
						Logger.Log(this, LogEntryType.RECORD_ERROR_NODATA, true);
					}

					AfterFormEvent();

					break;
			} // switch

			



			// Show data entry issues if form is in a state
			// that has necessary information: studymeasid, indexnum (if used), studysubjectid
			if (FormState != FormStates.INSERTING)
			{
				_dataIssuesRepeater.Visible = true;
				dm = new DataEntryIssueManager(this.StudyMeasID, this.StudySubjectIDString, this.StudyMeasureIndexnum);
				dm.Fetch(_dataIssuesRepeater);
			}
			else
				_dataIssuesRepeater.Visible = false;
					

		
		}

		// Things to do before any form controller event that might modify measure data
		private void BeforeFormEvent()
		{
			// clear any existing errors or notifications
			FormError = false;
			VerifyError = false;
			Notifications.Clear();
			ClearAllFieldControlErrors();
		}

		// Things to do after any form controller event that might modify measure data
		private void AfterFormEvent()
		{
			// update controller ui to reflect new state
			SetupUI();

			// setup field controls to reflect new state
			SetupFieldControls();

			/* 
			 * If LastUpdated and LastScored fields are defined on form then
			 * show warning if updated > scored or scored is missing (not scored yet)
			 */
			if (FormState != FormStates.INSERTING && FormState != FormStates.ENTERING && FormState != FormStates.NO_DATA
				&& this.LastScoredDateField != string.Empty && this.LastUpdatedDateField != string.Empty // fields defined
				&& this.LastUpdatedDate != DateTime.MinValue	//last updated non-null
				&& this.LastUpdatedDate > this.LastScoredDate)	//updated after last scored (also if lastscored = DateTime.Minvalue)
			{
				this._lblNeedsScoring.Visible = true;
			}
			else
			{
				this._lblNeedsScoring.Visible = false;
			}

		
		}


		/*
		 * If a lookup returned multiple records this function will create
		 * the necessary HTML to display a table with links that user
		 * can click to select one.
		 * 
		 * HTML is set as text property of _lookupResultsTable LiteralControl
		 */ 
		private void SetupLookupTable()
		{
			string outHTML = string.Empty;
			try
			{
				if (LookupDataSet != null)
				{
					if (LookupDataSet.Tables["results"].Rows.Count > 1)
					{
						string columns = LookupColumns;
						string columnHeaders = LookupColumnHeaders;
						
						string[] colArr = columns.Split(new Char[] {','});
						string[] colHeaderArr = columnHeaders.Split(new Char[] {','});

						//do some error checking
						if (columns == string.Empty || columnHeaders == string.Empty)
							throw new Exception("Missing LookupColumns and/or LookupColumnHeaders properties.");
						else if (colArr.Length != colHeaderArr.Length)
							throw new Exception("LookupColumns and LookupColumnHeaders must specify same number of items");

						StringBuilder t = new StringBuilder();
						t.Append("Lookup returned multiple matching records:<br>");
						t.Append("<table class='grid'>");

						//add table headers
						t.Append("<tr><th></th>");

						foreach(string hdr in colHeaderArr)
						{
							t.Append("<th>" + hdr.Trim() + "</th>");
						}
						t.Append("</tr>");

						//add data rows
						foreach(DataRow r in LookupDataSet.Tables["results"].Rows)
						{
							
							t.Append("<tr>");

							//add link
							t.Append("<td><a href='" + Page.Request.Url.GetLeftPart(UriPartial.Path) + "?pk=" + r[PrimaryKeyField].ToString() + "'>Open</a></td>");
							
							//add data columns
							foreach(string col in colArr)
							{
								//split into fieldname and format string
								string fieldname = col.Trim();
								string formatSpec = string.Empty;

								//locate the format specifier, if any. It's the part in col 
								//that starts and ends with '{' and '}'.
								int leftbrace = col.Trim().IndexOf('{');
								if (leftbrace != -1)
								{
									int rightbrace = col.Trim().IndexOf('}');
									if (rightbrace != -1)
									{	
										fieldname = col.Substring(0, leftbrace);
										formatSpec = col.Substring(leftbrace, rightbrace-leftbrace+1);
									}
									else	
										//error
										throw new Exception("Bad format specifier in LookupColumns property.");
								}

								if (formatSpec == string.Empty)
									t.Append("<td>" + r[fieldname] + "</td>");
								else
									t.Append(string.Format("<td>" + formatSpec + "</td>", r[fieldname]));
							}
							t.Append("</tr>");
						}
						t.Append("</table>");

						outHTML = t.ToString();
					}
				}
			}
			catch(Exception ex)
			{
				outHTML = "An error occurred: " + ex.Message;
			}
			finally
			{
				_lookupResultsTable.Text = outHTML;
			}
		}




		/*
		 * If there are any entries in the notifications collection, show them.
		 * If there is a form or verification error show them in red, otherwise
		 * use blue.
		 */
		private void ShowNotifications()
		{
			if (Notifications.Count > 0)
			{
				_notificationsLabel.Visible = true;
				_notificationsLabel.ForeColor = (FormError || VerifyError)? Color.Red:Color.Blue;
				string s = "<ul>";
				foreach (string n in Notifications)
				{
					s += "<li>" + n + "</li>";
				}
				s += "</ul>";

				_notificationsLabel.Text = s;
			}
			else
			{
				//no notifications so clear any label contents
				// that might have been restored from viewstate
				_notificationsLabel.Text = string.Empty;
			}
		}

		
		
	
		private void ClearFieldControls()
		{
			foreach (DataFieldControl c in AllDataFields)
			{
				// clear field controls
				c.FieldTextBoxText = "";
				c.OverrideCheckBoxChecked = false;
				c.VerifyError = false;
			}
		}

		private void ClearAllFieldControlErrors()
		{
			foreach (DataFieldControl dfc in AllDataFields)
			{
				dfc.ClearErrors();
			
			}
		}

		
		private void SetupFieldControls()
		{
			switch (FormState)
			{	case FormStates.INSERTING:
					Formatter.FormatInserting(this);

					break;
				case FormStates.ENTERING:
					Formatter.FormatEntering(this);

					break;
				case FormStates.SINGLE_ENTERED:
					Formatter.FormatSingleEntered(this);

					break;
				case FormStates.DOUBLE_ENTERING:
					Formatter.FormatDoubleEntering(this);

					break;
				case FormStates.DOUBLE_ENTERING_CORRECTING:
					Formatter.FormatCorrectingDoubleEntering(this);

					break;
				case FormStates.DOUBLE_ENTERED:
					Formatter.FormatDoubleEntered(this);
					
					break;

				case FormStates.NO_DATA:
					Formatter.FormatNoData(this);

					break;
			}

		}


		private void SetButtonTabIndexes()
		{ 
			// set which controller button gets the focus after
			// last form field.  Do this by making sure that the
			// desired button has the lowest tabindex of those
			// that will be visible.
			switch (FormState)
			{
				case FormStates.INSERTING:
					_createNewButton.TabIndex = 1010;
					_insertButton.TabIndex = 1000;

					break;
				case FormStates.ENTERING:
					_createNewButton.TabIndex = 1002;
					_saveButton.TabIndex = 1000;
					_noDataButton.TabIndex = 1001;

					break;


				case FormStates.SINGLE_ENTERED:
					_createNewButton.TabIndex = 1010;
					_saveButton.TabIndex = 1000;
					_doubleEnterButton.TabIndex = 1001;
					_scoreButton.TabIndex = 1002;

					break;


				case FormStates.DOUBLE_ENTERING:
					_createNewButton.TabIndex = 1010;
					_verifyButton.TabIndex = 1000;

					break;

				case FormStates.DOUBLE_ENTERING_CORRECTING:
					_createNewButton.TabIndex = 1010;
					_verifyButton.TabIndex = 1000;

					break;

				case FormStates.DOUBLE_ENTERED:
					_createNewButton.TabIndex = 1010;
					_saveButton.TabIndex = 1000;
					_scoreButton.TabIndex = 1001;

					break;

				case FormStates.NO_DATA:
					_createNewButton.TabIndex = 1000;

					break;

			}


				
		}

		
		private void SetupStudyMeasureDDL(DropDownList ddl, DropDownList ddl2)
		{
			SqlConnection conn = null;
			SqlCommand cmd = null;

			try
			{
				conn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["sqlDataConnection.ConnectionString"]);
				cmd = new SqlCommand();
				string sql = "select studymeasid,studyname + ': ' + studymeasname as studymeasure ";
				sql += "from uwautism_research_backend..tblstudy s join uwautism_research_backend..tblstudymeas sm on s.studyid=sm.studyid ";
				sql += "where studymeasid in (" + AllowedStudyMeasures + ") ";
				sql += "union all ";
				sql += "select -1, '-Study Measures-' ";
				sql += "order by studymeasure";
				cmd.CommandText = sql;
				cmd.CommandType = System.Data.CommandType.Text;
				cmd.Connection = conn;
				
				ddl.DataTextField = "studymeasure";
				ddl.DataValueField = "studymeasid";
				ddl2.DataTextField = "studymeasure";
				ddl2.DataValueField = "studymeasid";
				conn.Open();
				SqlDataReader r = cmd.ExecuteReader();
				ddl.DataSource = r;
				ddl.DataBind();
				r.Close();
				r = cmd.ExecuteReader();
				ddl2.DataSource = r;
				ddl2.DataBind();


			}
			catch{}
			finally
			{
				if (conn != null) conn.Close();
			}
			
		}



		// setup the UI elements based on current form state
		private void SetupUI()
		{


			switch (FormState)
			{
				case FormStates.INSERTING:
					_stateLabel.Text = string.Format("Create New {0}", MeasureName);
					_createNewButton.Visible = false;
					_insertButton.Visible = true;
					_saveButton.Visible = false;
					_doubleEnterButton.Visible = false;
					_verifyButton.Visible = false;
					_noDataButton.Visible = false;
					_scoreButton.Visible = false;
					_createNewStudyMeasureDDL.Visible = true;
					_newStudyMeasureLabel.Visible = true;
					_lookupResultsTable.Visible = true;

					// clear lookup text boxes unless in an error state
					if (FormError == false)
					{
						_lookupTextBox1.Text = string.Empty;
						_lookupTextBox2.Text = string.Empty;
						_studyMeasureDDL.SelectedValue = "-1";
					}

					break;
				case FormStates.ENTERING:
					_stateLabel.Text = string.Format("Entering {0}", StudyMeasName);
					_createNewButton.Visible = true;
					_insertButton.Visible = false;
					_saveButton.Visible = true;
					_doubleEnterButton.Visible = false;
					_verifyButton.Visible = false;
					_noDataButton.Visible = true;
					_lookupTextBox1.Text = string.Empty;
					_lookupTextBox2.Text = string.Empty;
					_scoreButton.Visible = false;
					_createNewStudyMeasureDDL.Visible = false;
					_newStudyMeasureLabel.Visible = false;
					_studyMeasureDDL.SelectedValue = "-1";
					_lookupResultsTable.Visible = false;


					break;
				case FormStates.SINGLE_ENTERED:
					_stateLabel.Text = string.Format("Single Entered {0}", StudyMeasName);
					_createNewButton.Visible = true;
					_insertButton.Visible = false;
					_saveButton.Visible = true;
					_doubleEnterButton.Visible = true;
					_verifyButton.Visible = false;
					_noDataButton.Visible = false;
					_lookupTextBox1.Text = string.Empty;
					_lookupTextBox2.Text = string.Empty;
					_scoreButton.Visible = true;
					_createNewStudyMeasureDDL.Visible = false;
					_newStudyMeasureLabel.Visible = false;
					_studyMeasureDDL.SelectedValue = "-1";
					_lookupResultsTable.Visible = false;

					break;
				case FormStates.DOUBLE_ENTERING:
					_stateLabel.Text = string.Format("Double Entering {0}",StudyMeasName);
					_createNewButton.Visible = true;
					_insertButton.Visible = false;
					_saveButton.Visible = false;
					_doubleEnterButton.Visible = false;
					_verifyButton.Visible = true;
					_noDataButton.Visible = false;
					_lookupTextBox1.Text = string.Empty;
					_lookupTextBox2.Text = string.Empty;
					_scoreButton.Visible = false;
					_createNewStudyMeasureDDL.Visible = false;
					_newStudyMeasureLabel.Visible = false;
					_studyMeasureDDL.SelectedValue = "-1";
					_lookupResultsTable.Visible = false;

					break;
				case FormStates.DOUBLE_ENTERING_CORRECTING:
					_stateLabel.Text = string.Format("Correcting Double Entry {0}", StudyMeasName);
					_createNewButton.Visible = true;
					_insertButton.Visible = false;
					_saveButton.Visible = false;
					_doubleEnterButton.Visible = false;
					_verifyButton.Visible = true;
					_noDataButton.Visible = false;
					_lookupTextBox1.Text = string.Empty;
					_lookupTextBox2.Text = string.Empty;
					_scoreButton.Visible = false;
					_createNewStudyMeasureDDL.Visible = false;
					_newStudyMeasureLabel.Visible = false;
					_studyMeasureDDL.SelectedValue = "-1";
					_lookupResultsTable.Visible = false;

					break;
				case FormStates.DOUBLE_ENTERED:
					_stateLabel.Text = string.Format("Double Entered {0}", StudyMeasName);
					_createNewButton.Visible = true;
					_insertButton.Visible = false;
					_saveButton.Visible = true;
					_doubleEnterButton.Visible = false;
					_verifyButton.Visible = false;
					_noDataButton.Visible = false;
					_lookupTextBox1.Text = string.Empty;
					_lookupTextBox2.Text = string.Empty;
					_scoreButton.Visible = true;
					_createNewStudyMeasureDDL.Visible = false;
					_newStudyMeasureLabel.Visible = false;
					_studyMeasureDDL.SelectedValue = "-1";
					_lookupResultsTable.Visible = false;

					break;

				case FormStates.NO_DATA:
					_stateLabel.Text = string.Format("No Data {0}", StudyMeasName);
					_createNewButton.Visible = true;
					_insertButton.Visible = false;
					_saveButton.Visible = false;
					_doubleEnterButton.Visible = false;
					_verifyButton.Visible = false;
					_noDataButton.Visible = false;
					_lookupTextBox1.Text = string.Empty;
					_lookupTextBox2.Text = string.Empty;
					_scoreButton.Visible = false;
					_createNewStudyMeasureDDL.Visible = false;
					_newStudyMeasureLabel.Visible = false;
					_studyMeasureDDL.SelectedValue = "-1";
					_lookupResultsTable.Visible = false;

					break;
			}  // end switch

			// set which controller button gets the focus after
			// last form field.
			SetButtonTabIndexes();

			// Show any notifications/errors
			ShowNotifications();


		}


		#region Event bubbling

		// handle events bubbled up from child buttons
		protected override bool OnBubbleEvent(object source, EventArgs e)
		{
			bool handled = false;

			//handle event only if from a button
			if (e is CommandEventArgs) 
			{
				CommandEventArgs ce = (CommandEventArgs)e;

				// Decide what to do bases on event
				Controller(ce.CommandName, e);

				handled = true;
			}

			return handled;
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

		#endregion

		#region Properties delegated to child controls
		

		[Browsable(false)]
		public int LookupStudyMeasID
		{
			get
			{
				EnsureChildControls();
				string s = _studyMeasureDDL.SelectedValue;
				if (s == string.Empty) s = "-1";
				return int.Parse(s);
			}
			set
			{
				EnsureChildControls();
				_studyMeasureDDL.SelectedValue = value.ToString();
			}
		}


		[Browsable(false)]
		public int SelectedNewStudyMeasID
		{
			get
			{
				EnsureChildControls();
				string s = _createNewStudyMeasureDDL.SelectedValue;
				if (s == string.Empty) s = "-1";
				return int.Parse(s);
			}
		}
		
		[Browsable(false)]
		public string StateLabelText 
		{
			get 
			{
				EnsureChildControls();
				return _stateLabel.Text;
			}

			set 
			{
				EnsureChildControls();
				_stateLabel.Text = value;
			}

		}


		[Category("Controller-Appearance")]
		public string CreateNewButtonText 
		{
			get 
			{
				EnsureChildControls();
				return _createNewButton.Text;
			}
			set 
			{	
				EnsureChildControls();
				_createNewButton.Text = value.Trim();
			}
		}

		[Category("Controller-Appearance")]
		public string InsertButtonText 
		{
			get 
			{
				EnsureChildControls();
				return _insertButton.Text;
			}
			set 
			{	
				EnsureChildControls();
				_insertButton.Text = value.Trim();
			}
		}

		[Category("Controller-Appearance")]
		public string SaveButtonText 
		{
			get 
			{
				EnsureChildControls();
				return _saveButton.Text;
			}
			set 
			{	
				EnsureChildControls();
				_saveButton.Text = value.Trim();
			}
		}

		[Category("Controller-Appearance")]
		public string DoubleEnterButtonText 
		{
			get 
			{
				EnsureChildControls();
				return _doubleEnterButton.Text;
			}
			set 
			{	
				EnsureChildControls();
				_doubleEnterButton.Text = value.Trim();
			}
		}

		[Category("Controller-Appearance")]
		public string VerifyButtonText 
		{
			get 
			{
				EnsureChildControls();
				return _verifyButton.Text;
			}
			set 
			{	
				EnsureChildControls();
				_verifyButton.Text = value.Trim();
			}
		}


		[Category("Controller-Appearance")]
		public string NoDataButtonText 
		{
			get 
			{
				EnsureChildControls();
				return _noDataButton.Text;
			}
			set 
			{	
				EnsureChildControls();
				_noDataButton.Text = value.Trim();
			}
		}


		[Category("Controller-Appearance")]
		public string LookupButtonText 
		{
			get 
			{
				EnsureChildControls();
				return _lookupButton.Text;
			}
			set 
			{	
				EnsureChildControls();
				_lookupButton.Text = value.Trim();
			}
		}


		[Category("Controller-Appearance")]
		public string NotificationLabelCssClass 
		{
			get 
			{
					EnsureChildControls();
				return _notificationsLabel.CssClass;
			}
			set 
			{	
				EnsureChildControls();
				_notificationsLabel.CssClass = value.Trim();
			}
		}


		[Category("Controller-Appearance")]
		public string StateLabelCssClass 
		{
			get 
			{
				EnsureChildControls();
				return _stateLabel.CssClass;
			}
			set 
			{	
				EnsureChildControls();
				_stateLabel.CssClass = value.Trim();
			}
		}


		[Category("Controller-Appearance")]
		public string LookupTextBox1CssClass 
		{
			get 
			{
				EnsureChildControls();
				return _lookupTextBox1.CssClass;
			}
			set 
			{	
				EnsureChildControls();
				_lookupTextBox1.CssClass = value.Trim();
			}
		}


		[Category("Controller-Appearance")]
		public string LookupTextBox1LabelCssClass 
		{
			get 
			{
				EnsureChildControls();
				return _lookupTextBox1Label.CssClass;
			}
			set 
			{	
				EnsureChildControls();
				_lookupTextBox1Label.CssClass = value.Trim();
			}
		}
 
		[Category("Controller-Appearance")]
		public string LookupTextBox2CssClass 
		{
			get 
			{
				EnsureChildControls();
				return _lookupTextBox2.CssClass;
			}
			set 
			{	
				EnsureChildControls();
				_lookupTextBox2.CssClass = value.Trim();
			}
		}


		[Category("Controller-Appearance")]
		public string LookupTextBox2LabelCssClass 
		{
			get 
			{
				EnsureChildControls();
				return _lookupTextBox2Label.CssClass;
			}
			set 
			{	
				EnsureChildControls();
				_lookupTextBox2Label.CssClass = value.Trim();
			}
		}
		[Category("Controller-Setup")]
		public string LookupTextBox1Text 
		{
			get 
			{	EnsureChildControls();
				return _lookupTextBox1.Text;
			}
			set 
			{	
				EnsureChildControls();
				_lookupTextBox1.Text = value;
			}
		}

		[Category("Controller-Setup")]
		public string LookupTextBox2Text 
		{
			get 
			{
					EnsureChildControls();
				return _lookupTextBox2.Text;
			}
			set 
			{	
				EnsureChildControls();
				_lookupTextBox2.Text = value;
			}
		}

		[Category("Controller-Setup")]
		public string LookupTextBox1LabelText 
		{
			get 
			{ 
				EnsureChildControls();
				return _lookupTextBox1Label.Text;
			}
			set 
			{
				EnsureChildControls();
				_lookupTextBox1Label.Text = value;
			}
		}

		[Category("Controller-Setup")]
		public string LookupTextBox2LabelText 
		{
			get 
			{ 
				EnsureChildControls();
				return _lookupTextBox2Label.Text;
			}
			set 
			{
				EnsureChildControls();
				_lookupTextBox2Label.Text = value;
			}
		}
		#endregion



		#region Overidden methods
		protected override void CreateChildControls()
		{
			Controls.Clear();

			_notificationsLabel = new Label();
			_notificationsLabel.Visible = false;
			_notificationsLabel.CssClass = "ctrlnotificationlabel";


			_createNewButton = new Button();
			_createNewButton.Text = "Create New";
			_createNewButton.CommandName = "_createNewButton";

			_insertButton = new Button();
			_insertButton.Text = "Insert";
			_insertButton.CommandName = "_insertButton";

			_saveButton = new Button();
			_saveButton.Text = "Save";
			_saveButton.CommandName = "_saveButton";

			_doubleEnterButton = new Button();
			_doubleEnterButton.Text = "Double Enter";
			_doubleEnterButton.CommandName = "_doubleEnterButton";

			_verifyButton = new Button();
			_verifyButton.Text = "Verify";
			_verifyButton.CommandName = "_verifyButton";

			_noDataButton = new Button();
			_noDataButton.Text = "No Data";
			_noDataButton.CommandName = "_noDataButton";

			_lookupButton = new Button();
			_lookupButton.Text = "Lookup";
			_lookupButton.CommandName = "_lookupButton";

			_stateLabel = new Label();
			_stateLabel.Text = "[form state]";
			//_stateLabel.Font.Size = new FontUnit(FontSize.XLarge);
			_stateLabel.CssClass = "ctrlstatelabel";

			_lookupTextBox1 = new TextBox();
			_lookupTextBox1.CssClass = "ctrllookuptextbox";
			_lookupTextBox2 = new TextBox();
			_lookupTextBox2.CssClass = "ctrllookuptextbox";

			_lookupTextBox1Label = new Label();
			//_lookupTextBox1Label.CssClass = "ctrllookuptextboxlabel";
			_lookupTextBox2Label = new Label();
			//_lookupTextBox2Label.CssClass = "ctrllookuptextboxlabel";


			_scoreButton = new Button();
			_scoreButton.Text = "Score";
			_scoreButton.CommandName = "_scoreButton";


			_studyMeasureDDL = new DropDownList();
			_createNewStudyMeasureDDL = new DropDownList();
			

			_newStudyMeasureLabel = new Label();
			_newStudyMeasureLabel.Text = "New Study Measure:";

			_dataIssuesRepeater = SetupRepeater();

			_lookupResultsTable = new LiteralControl();
			_lookupResultsTable.Text = string.Empty;
			
			
			//label to hold warning that scoring is out-of-date.
			_lblNeedsScoring = new Label();
			_lblNeedsScoring.Text = "MEASURE HAS BEEN UPDATED AND NEEDS TO BE SCORED";
			//make red and big and initially invisible
			_lblNeedsScoring.ForeColor = Color.Red;
			_lblNeedsScoring.Font.Size = FontUnit.Parse("14pt");
			_lblNeedsScoring.Visible = false;



			this.Controls.Add(_createNewButton);
			this.Controls.Add(_insertButton);
			this.Controls.Add(_saveButton);
			this.Controls.Add(_doubleEnterButton);
			this.Controls.Add(_verifyButton);
			this.Controls.Add(_noDataButton);
			this.Controls.Add(_lookupButton);
			this.Controls.Add(_stateLabel);
			this.Controls.Add(_lookupTextBox1);
			this.Controls.Add(_lookupTextBox2);
			this.Controls.Add(_lookupTextBox1Label);
			this.Controls.Add(_lookupTextBox2Label);
			this.Controls.Add(_scoreButton);
			this.Controls.Add(_notificationsLabel);
			this.Controls.Add(_dataIssuesRepeater);
			this.Controls.Add(_studyMeasureDDL);
			this.Controls.Add(_createNewStudyMeasureDDL);
			this.Controls.Add(_newStudyMeasureLabel);
			this.Controls.Add(_lookupResultsTable);
			this.Controls.Add(_lblNeedsScoring);
			

		}


		




		/*
		 * See 'Creating Web Server Control Templates Dynamically' in .NET help files.
		 * ms-help://MS.VSCC.2003/MS.MSDNQTR.2003FEB.1033/vbcon/html/vbtskCreatingWebServerControlTemplatesDynamically.htm
		 */
		protected CustomRepeater SetupRepeater()
		{

			// subclassed repeater defined in DataEntrIssueManager.cs
			CustomRepeater r = new CustomRepeater();

			r.HeaderTemplate = new DataEntryIssueTemplate(ListItemType.Header);
			r.ItemTemplate = new DataEntryIssueTemplate(ListItemType.Item);
			r.AlternatingItemTemplate = 
				new DataEntryIssueTemplate(ListItemType.AlternatingItem);
			r.FooterTemplate = new DataEntryIssueTemplate(ListItemType.Footer);
			
			r.ItemCommand += new RepeaterCommandEventHandler(DataIssuesRepeater_ItemCommand);

			return r;
		}

		private void DataIssuesRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
		{
			// Simulate a bubbled event
			OnBubbleEvent(source, e);
		}



		protected override void Render(HtmlTextWriter writer)
		{
			AddAttributesToRender(writer);

			writer.AddAttribute(HtmlTextWriterAttribute.Cellpadding,"1", false);
			writer.AddAttribute("class", "tblController");
			writer.RenderBeginTag(HtmlTextWriterTag.Table);
			writer.RenderBeginTag(HtmlTextWriterTag.Tr);
			
			//state label
			writer.RenderBeginTag(HtmlTextWriterTag.Td);
			_stateLabel.RenderControl(writer);
			writer.RenderEndTag(); // td
			
			//lookup text box
			writer.AddAttribute("class","LookupTableCell");

			/*
			writer.AddAttribute("style", "TEXT-ALIGN: right");
			writer.AddAttribute("bgcolor", "#a1b5cf");
			*/
			writer.AddAttribute("rowspan", "2");
			writer.RenderBeginTag(HtmlTextWriterTag.Td);

			
			if (ShowLookup)
			{
				writer.Write("Study Measure:");
				_studyMeasureDDL.RenderControl(writer);
				writer.Write("<br>");
				_lookupTextBox1Label.RenderControl(writer);
				_lookupTextBox1.RenderControl(writer);	
				if (LookupTextBox2Visible == true) 
				{
					writer.Write("<br>");
					_lookupTextBox2Label.RenderControl(writer);
					_lookupTextBox2.RenderControl(writer);	
				}
				writer.Write("<br>");
				_lookupButton.RenderControl(writer);

			}
			writer.Write("<br><span style=\"FONT-SIZE: 5pt; COLOR: black\">" + this.FrameworkVersion + "</span>");
			writer.RenderEndTag(); // td

			writer.RenderEndTag(); // tr


			writer.RenderBeginTag(HtmlTextWriterTag.Tr);

			// buttons
			writer.RenderBeginTag(HtmlTextWriterTag.Td);


			_newStudyMeasureLabel.RenderControl(writer);
			_createNewStudyMeasureDDL.RenderControl(writer);

			_createNewButton.RenderControl(writer);
			writer.Write("&nbsp;");
			
			_insertButton.RenderControl(writer);
			writer.Write("&nbsp;");
			
			_saveButton.RenderControl(writer);
			writer.Write("&nbsp;");
			
			_doubleEnterButton.RenderControl(writer);
			writer.Write("&nbsp;");
			
			_verifyButton.RenderControl(writer);

			writer.Write("&nbsp;");
			_noDataButton.RenderControl(writer);


			if (_showScoreButton)
			{
				writer.Write("&nbsp;");
				_scoreButton.RenderControl(writer);
			}
			
			writer.RenderEndTag(); // td

			writer.RenderEndTag(); // tr

			writer.RenderBeginTag(HtmlTextWriterTag.Tr);
			writer.RenderBeginTag(HtmlTextWriterTag.Td);
			_notificationsLabel.RenderControl(writer);
			writer.RenderEndTag(); // td

			writer.RenderBeginTag(HtmlTextWriterTag.Td);
			writer.RenderEndTag(); // td

			writer.RenderEndTag(); // tr

			writer.RenderEndTag(); // table
			_lblNeedsScoring.RenderControl(writer);
			writer.Write("<br>");

			//render formstate in a hidden text field so javascript
			//can use it
			writer.Write("<input type=\"hidden\" id=\"_formstate\" value=\"" + FormStateText() + "\" />");

			_dataIssuesRepeater.RenderControl(writer);

			_lookupResultsTable.RenderControl(writer);

		}

		private string FormStateText()
		{
			string result = string.Empty;
			switch (FormState)
			{
				case FormStates.DOUBLE_ENTERED:
					result = "DOUBLE_ENTERED";
					break;
				case FormStates.DOUBLE_ENTERING:
					result = "DOUBLE_ENTERING";
					break;
				case FormStates.DOUBLE_ENTERING_CORRECTING:
					result = "DOUBLE_ENTERING_CORRECTING";
					break;
				case FormStates.ENTERING:
					result = "ENTERING";
					break;
				case FormStates.INSERTING:
					result = "INSERTING";
					break;
				case FormStates.NO_DATA:
					result = "NO_DATA";
					break;
				case FormStates.SINGLE_ENTERED:
					result = "SINGLE_ENTERED";
					break;
			}

			return result;

		}

		// called to recursively visit all page controls and add any
		// data field controls to their respective lists.
		private void BuildControlLists(Control  ctl)
		{
			if (ctl.HasControls())
			{
				foreach(Control c in ctl.Controls)
				{

					// recursion
					BuildControlLists(c);

					if (c is DataFieldControl)
					{
						DataFieldControl dfc = (DataFieldControl)c;

						// all 
						AllDataFields.Add(dfc);

						// insert fields
						if (dfc.IsInsertField) {InsertDataFields.Add(dfc);}

						// entry fields
						if (dfc.IsEntryField) {EntryDataFields.Add(dfc);}

						// double entry fields
						if (dfc.IsDoubleEntryField) {DoubleEntryDataFields.Add(dfc);}

					}
				}
			}
		}

		// construct the data field collections
		protected override void OnLoad(EventArgs e)
		{
			
			//subscribe to the page's PreRender event. Page_PreRenderHandler performs
			//query string lookups
			Page.PreRender +=new EventHandler(Page_PreRender);
			
			if (!this.Page.IsPostBack) SetupStudyMeasureDDL(_studyMeasureDDL, _createNewStudyMeasureDDL);

			BuildControlLists(Page);
			base.OnLoad (e);
		}


		protected override void OnPreRender(EventArgs e)
		{
			// if initial request setup default starting ui
			if (!Page.IsPostBack)
			{
				SetupUI();
				SetupFieldControls();



			}
			base.OnPreRender (e);
		}




		#endregion


		#region Events

		#region Insert Event
		// Insert event
		[ 
		Category("Action"),
		Description("Raised when user clicks the insert button.")
		]
		public event EventHandler DoInsert 
		{
			add 
			{
				Events.AddHandler(EventInsert, value);
			}
			remove 
			{
				Events.RemoveHandler(EventInsert, value);
			}
		}

		// called to raise the  event
		protected virtual void OnDoInsert(EventArgs e) 
		{
			EventHandler handler = (EventHandler)Events[EventInsert];
			if (handler != null) 
			{
				handler(this,e);
			}
		}
		#endregion
		
		#region SaveEntering Event
		// Save Entering event
		[ 
		Category("Action"),
		Description("Raised when user clicks the save button while entering new measure.")
		]
		public event EventHandler DoSaveEntering 
		{
			add 
			{
				Events.AddHandler(EventSaveEntering, value);
			}
			remove 
			{
				Events.RemoveHandler(EventSaveEntering, value);
			}
		}

		// called to raise the  event
		protected virtual void OnSaveEntering(EventArgs e) 
		{
			EventHandler handler = (EventHandler)Events[EventSaveEntering];
			if (handler != null) 
			{
				handler(this,e);
			}
		}
		#endregion		
		
		// Save single entered
		[ Category("Action"),
		Description("Raised when user clicks the save button after editing a single-entered measure.")]
		public event EventHandler DoSaveSingleEntered 
		{
			add {Events.AddHandler(EventSaveSingleEntered, value);}
			remove {Events.RemoveHandler(EventSaveSingleEntered, value);}
		}

		// called to raise the  event
		protected virtual void OnSaveSingleEntered(EventArgs e) 
		{
			EventHandler handler = (EventHandler)Events[EventSaveSingleEntered];
			if (handler != null) 
			{handler(this,e);}
		}

		// Double Enter
		[ Category("Action"),
		Description("Raised when user clicks the Double Enter button")]
		public event EventHandler DoDoubleEnter
		{
			add {Events.AddHandler(EventDoubleEnter, value);}
			remove {Events.RemoveHandler(EventDoubleEnter, value);}
		}

		// called to raise the  event
		protected virtual void OnDoubleEnter(EventArgs e) 
		{
			EventHandler handler = (EventHandler)Events[EventDoubleEnter];
			if (handler != null) 
			{handler(this,e);}
		}
		
		// verify
		[ Category("Action"),
		Description("Raised when user clicks the Verify button")]
		public event EventHandler DoVerify
		{
			add {Events.AddHandler(EventVerify, value);}
			remove {Events.RemoveHandler(EventVerify, value);}
		}

		// called to raise the  event
		protected virtual void OnVerify(EventArgs e) 
		{
			EventHandler handler = (EventHandler)Events[EventVerify];
			if (handler != null) 
			{handler(this,e);}
		}

		// Verify correction
		[ Category("Action"),
		Description("Raised when user clicks the Verify button after making a double entry correction.")]
		public event EventHandler DoVerifyCorrection
		{
			add {Events.AddHandler(EventVerifyCorrecting, value);}
			remove {Events.RemoveHandler(EventVerifyCorrecting, value);}
		}

		// called to raise the  event
		protected virtual void OnVerifyCorrection(EventArgs e) 
		{
			EventHandler handler = (EventHandler)Events[EventVerifyCorrecting];
			if (handler != null) 
			{handler(this,e);}
		}
		
		// Save Double Entered
		[ Category("Action"),
		Description("Raised when user clicks the Save button after editing a double entered measure.")]
		public event EventHandler DoSaveDoubleEntered
		{
			add {Events.AddHandler(EventSaveDoubleEntered, value);}
			remove {Events.RemoveHandler(EventSaveDoubleEntered, value);}
		}

		// called to raise the event
		protected virtual void OnSaveDoubleEntered(EventArgs e) 
		{
			EventHandler handler = (EventHandler)Events[EventSaveDoubleEntered];
			if (handler != null) 
			{handler(this,e);}
		}

		// create new
		[ Category("Action"),
		Description("Raised when user clicks the Create New button.")]
		public event EventHandler DoCreateNew
		{
			add {Events.AddHandler(EventCreateNew, value);}
			remove {Events.RemoveHandler(EventCreateNew, value);}
		}

		// called to raise the event
		protected virtual void OnCreateNew(EventArgs e) 
		{
			EventHandler handler = (EventHandler)Events[EventCreateNew];
			if (handler != null) 
			{handler(this,e);}
		}

		// lookup
		[ Category("Action"),
		Description("Raised when user clicks the Lookup button.")]
		public event LookupEventHandler DoLookup
		{
			add {Events.AddHandler(EventLookup, value);}
			remove {Events.RemoveHandler(EventLookup, value);}
		}

		// called to raise the event
		protected virtual void OnLookup(LookupEventArgs e) 
		{
			LookupEventHandler handler = (LookupEventHandler)Events[EventLookup];
			if (handler != null) 
			{handler(this,e);}
		}



		// parameter lookup
		[ Category("Action"),
		Description("Raised by call to ParameterLookup().")]
		public event LookupEventHandler DoParameterLookup
		{
			add {Events.AddHandler(EventParameterLookup, value);}
			remove {Events.RemoveHandler(EventParameterLookup, value);}
		}

		// called to raise the event
		protected virtual void OnParameterLookup(LookupEventArgs e) 
		{
			LookupEventHandler handler = (LookupEventHandler)Events[EventParameterLookup];
			if (handler != null) 
			{handler(this,e);}
		}




		// no data
		[ Category("Action"),
		Description("Raised when user clicks the Create No Data Button.")]
		public event EventHandler DoNoData
		{
			add {Events.AddHandler(EventNoData, value);}
			remove {Events.RemoveHandler(EventNoData, value);}
		}

		// called to raise the event
		protected virtual void OnNoData(EventArgs e) 
		{
			EventHandler handler = (EventHandler)Events[EventNoData];
			if (handler != null) 
			{handler(this,e);}
		}


		// no data
		[ Category("Action"),
		Description("Raised when user clicks the Score Button.")]
		public event EventHandler DoScore
		{
			add {Events.AddHandler(EventScore, value);}
			remove {Events.RemoveHandler(EventScore, value);}
		}

		// called to raise the event
		protected virtual void OnScore(EventArgs e) 
		{
			EventHandler handler = (EventHandler)Events[EventScore];
			if (handler != null) 
			{handler(this,e);}
		}
		
		
		
		#endregion
	}



	public class LookupEventArgs: EventArgs 
	{
		private string _lookupField1;
		private string _lookupField2;
		private string _pk;


		public LookupEventArgs(string field1, string field2, string pk)
		{
			_lookupField1 = field1;
			_lookupField2 = field2;	
			_pk = pk;
		}

		public string LookupField1 
		{
			get {return _lookupField1;}
			set {_lookupField1 = value;}
		}
		public string LookupField2 
		{
			get {return _lookupField2;}
			set {_lookupField2 = value;}
		}

		public string PK
		{
			get {return _pk;}
			set {_pk = value; }
		}

	}

	public delegate void LookupEventHandler( object sender, LookupEventArgs e);


}
