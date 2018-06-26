using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;


namespace DataEntryFramework
{
	public interface IFormEventHandler
	{
		void DoInsert(DataEntryController controller);
		void DoSaveEnterering(DataEntryController controller);
		void DoSaveSingleEntered(DataEntryController controller);
		void DoDoubleEnter(DataEntryController controller);
		void DoVerify(DataEntryController controller);
		void DoVerifyCorrection(DataEntryController controller);
		void DoSaveDoubleEntered(DataEntryController controller);
		void DoCreateNew(DataEntryController controller);
		void DoLookup(DataEntryController controller);
		void DoNoData(DataEntryController controller);
		void DoScore(DataEntryController controller);
		void DoParameterLookup(DataEntryController controller);

		
	}

	
	public class DefaultFormEventHandler : IFormEventHandler
	{


		private string _insertSqlCommandText = string.Empty;
		private string _updateSqlCommandText = string.Empty;
		private string _selectSqlCommandText = string.Empty;
		private string _lookupSqlCommandText = string.Empty;
		private string _updateVerifiedSqlCommandText = string.Empty;

		public string InsertSqlCommandText 
		{
			get {return _insertSqlCommandText;}
			set {_insertSqlCommandText = value;	}
		}

		public string UpdateSqlCommandText 
		{
			get {return _updateSqlCommandText;}
			set {_updateSqlCommandText = value;}
		}

		public string SelectSqlCommandText 
		{
			get {return _selectSqlCommandText;}
			set {_selectSqlCommandText = value;}
		}

		public string LookupSqlCommandText 
		{
			get {return _lookupSqlCommandText;}
			set {_lookupSqlCommandText = value;}
		}

		public string UpdateVerifiedSqlCommandText 
		{
			get {return _updateVerifiedSqlCommandText;}
			set {_updateVerifiedSqlCommandText = value;}
		}



		/*
		 * The InsertSqlCommand must contain one parameter for each data entry control
		 * with IsInsertField == true.  It also should have a parameter for @verified.
		 * 
		 * It must also follow the insert command with a select command using
		 * @@IDENTITY to return the newly inserted row.
		 * 
		 * For Example:
		 * INSERT INTO EDS_CatC
         *             (edsid, indexnum, catcdate, catcclin, timepoint, verified)
		 * VALUES     (@edsid, @indexnum, @catcdate, @catcclin, @timepoint, @verified);
         *                 SELECT     *
         *                  FROM         eds_catc
         *                  WHERE     catckey = @@IDENTITY;
		 * 
		 */
		protected SqlCommand GetInsertSqlCommand(DataEntryController dec)
		{
			if (InsertSqlCommandText != string.Empty)
				return new SqlCommand(InsertSqlCommandText, DBConnection);
			else
			{
				//throw error if any required inputs are missing
				if (dec.PrimaryKeyField == string.Empty || dec.VerifiedField == string.Empty
					|| dec.DatabaseTable == string.Empty || dec.LookupField1 == string.Empty
					|| dec.SelectedNewStudyMeasID == -1)
					throw new Exception("PrimaryKeyField, VerifiedField, DatabaseTable, Study Measure and at least LookupField1 controller properties are required.");

				else
				{
					// build and return sqlInsert SqlCommand object
					string _sqlInsert = "INSERT INTO " + dec.DatabaseTable + " (";
					bool first = true;
					foreach (DataFieldControl d in dec.InsertDataFields)
					{
						_sqlInsert += ((!first)?",":"") + d.DatabaseField;
						first = false;
					}

					_sqlInsert += "," + dec.VerifiedField + ", studymeasid";
					_sqlInsert += ") VALUES (";
		
					first = true;
					foreach (DataFieldControl d in dec.InsertDataFields)
					{
						_sqlInsert += ((!first)?",":"") + "@" + d.DatabaseField;
						first = false;
					}
					_sqlInsert += ", @" + dec.VerifiedField + ",@studymeasid";
					_sqlInsert += ");";

					_sqlInsert += " SELECT t.*, st.studyname + ': ' + sm.studymeasname as studymeasname FROM " + dec.DatabaseTable +  " t join uwautism_research_backend..tblstudymeas sm ";
					_sqlInsert += " on t.studymeasid=sm.studymeasid ";
					_sqlInsert += " join uwautism_research_backend..tblstudy st on st.studyid=sm.studyid ";
					//_sqlInsert += " WHERE " + dec.PrimaryKeyField + " = @@IDENTITY;";
					_sqlInsert += " WHERE " + dec.PrimaryKeyField + " = scope_identity();";


					return new SqlCommand(_sqlInsert, DBConnection);
				}
			}

		}
			

		/*
		* The UpdateSqlCommand must contain one parameter for every data entry field
		* with IsEntryField == true. It also should have a parameter for @verified.
		* 
		* AND must have an additional parameter that matches
		* the user supplied PrimaryKeyField controller setting.
		* 
		* The update SQL must be followed by a select statement that returns the contents of the updated row.
		* 
		* In the following example PrimaryKeyField = catckey:
		* 
		* UPDATE    EDS_CatC
		* SET              timepoint = @timepoint, catcdate = @catcdate, catcclin = @catcclin, catc01cu = @catc01cu, catc01ev = @catc01ev, catc02cu = @catc02cu, 
		*             catc02ev = @catc02ev, catc03cu = @catc03cu, catc03ev = @catc03ev, catc04cu = @catc04cu, catc04ev = @catc04ev, catc05cu = @catc05cu, 
		*             catc05ev = @catc05ev, catc06cu = @catc06cu, catc06ev = @catc06ev, catc07cu = @catc07cu, catc07ev = @catc07ev, catc08cu = @catc08cu, 
		*             catc08ev = @catc08ev, catc10 = @catc10, catc11 = @catc11, catc12 = @catc12, catc13 = @catc13, catccmt = @catccmt, verified = @verified
		*WHERE     (CatCkey = @CatCkey);
		*                 SELECT     *
		*                  FROM         eds_catc
		*                  WHERE     (CatCkey = @CatCkey);
		* 
		* 
		*/ 
		protected SqlCommand GetUpdateSqlCommand(DataEntryController dec)
		{
			if (UpdateSqlCommandText != string.Empty)
				return new SqlCommand(UpdateSqlCommandText, DBConnection);
			else
			{
				//throw error if any required inputs are missing
				if (dec.PrimaryKeyField == string.Empty || dec.VerifiedField == string.Empty
					|| dec.DatabaseTable == string.Empty || dec.LookupField1 == string.Empty)
					throw new Exception("PrimaryKeyField, VerifiedField, DatabaseTable and at least LookupField1 controller properties are required.");

				else
				{

					// make sqlUpdate SqlCommand
					string _sqlUpdate = "UPDATE " + dec.DatabaseTable + " SET ";
					bool first = true;
					foreach(DataFieldControl d in dec.EntryDataFields)
					{
						_sqlUpdate += ((!first)?",":"") + d.DatabaseField + "=@" + d.DatabaseField;
						first = false;
					}
		
					_sqlUpdate += "," + dec.VerifiedField + "=@" + dec.VerifiedField + " ";
					_sqlUpdate += " WHERE " + dec.PrimaryKeyField + "=@" + dec.PrimaryKeyField + "; ";
					_sqlUpdate += " SELECT t.*,  st.studyname + ': ' + sm.studymeasname as studymeasname FROM " + dec.DatabaseTable + " t join uwautism_research_backend..tblstudymeas sm ";
					_sqlUpdate +=  " on t.studymeasid=sm.studymeasid ";
					_sqlUpdate += " join uwautism_research_backend..tblstudy st on st.studyid=sm.studyid ";
					_sqlUpdate += " WHERE " + dec.PrimaryKeyField + " = @" + dec.PrimaryKeyField;

					return new SqlCommand(_sqlUpdate, DBConnection);
				}
			}
		}


		/*
		 * A select statement using PrimaryKeyField:
		 * 
		 * SELECT     EDS_CatC.*
		 * FROM         EDS_CatC
		 * WHERE     (CatCkey = @catckey)
		 * 
		 */
		protected SqlCommand GetSelectSqlCommand(DataEntryController dec)
		{
			if (SelectSqlCommandText != string.Empty)
				return new SqlCommand(SelectSqlCommandText, DBConnection);
			else
			{
				//throw error if any required inputs are missing
				if (dec.PrimaryKeyField == string.Empty || dec.VerifiedField == string.Empty
					|| dec.DatabaseTable == string.Empty || dec.LookupField1 == string.Empty)
					throw new Exception("PrimaryKeyField, VerifiedField, DatabaseTable and at least LookupField1 controller properties are required.");

				else
				{
					string _sqlSelect = "SELECT t.*, st.studyname + ': ' + sm.studymeasname as studymeasname  FROM " + dec.DatabaseTable + " t join uwautism_research_backend..tblstudymeas sm ";
					_sqlSelect +=  " on t.studymeasid=sm.studymeasid ";
					_sqlSelect += " join uwautism_research_backend..tblstudy st on st.studyid=sm.studyid ";
					_sqlSelect += " WHERE " + dec.PrimaryKeyField + " = @" + dec.PrimaryKeyField;

					return new SqlCommand(_sqlSelect, DBConnection);
				}
			}
		}

		/*
		 * A select command with parameters corresponding to
		 * LookupField1 and optionally LookupField2
		 * 
		 * In this Example LookupField1 = edsid and LookupField2 = indexnum (indexnum is optional):
		 * 
		 * SELECT     EDS_CatC.*
		 * FROM         EDS_CatC
		 * WHERE     (edsid = @edsid) AND (indexnum = @indexnum OR
         *             @indexnum IS NULL)
		 * 
		 * 
		 */
		protected SqlCommand GetLookupSqlCommand(DataEntryController dec)
		{
			if (LookupSqlCommandText != string.Empty)
				return new SqlCommand(LookupSqlCommandText, DBConnection);
			else
			{
				//throw error if any required inputs are missing
				if (dec.PrimaryKeyField == string.Empty || dec.VerifiedField == string.Empty
					|| dec.DatabaseTable == string.Empty || dec.LookupField1 == string.Empty)
					throw new Exception("PrimaryKeyField, VerifiedField, DatabaseTable and at least LookupField1 controller properties are required.");

				else
				{
					/*
					string _sqlLookup = "SELECT t.*, st.studyname + ': ' + sm.studymeasname as studymeasname  FROM " + dec.DatabaseTable + " t join uwautism_research_backend..tblstudymeas sm ";
					_sqlLookup +=  " on t.studymeasid=sm.studymeasid ";
					_sqlLookup += " join uwautism_research_backend..tblstudy st on st.studyid=sm.studyid ";
					_sqlLookup += " WHERE (" + dec.LookupField1 + " = @" + dec.LookupField1 + ") " +
						((dec.LookupField2 != string.Empty)? " AND (" + dec.LookupField2 + "= @" + dec.LookupField2 + 
						" OR @" + dec.LookupField2 + " IS NULL) ":" ");
					_sqlLookup += " AND t.studymeasid=@studymeasid ";
					_sqlLookup += " AND (" + dec.PrimaryKeyField + " = @pk OR @pk IS NULL) ";
					*/

					string _sqlLookup = "SELECT t.*, st.studyname + ': ' + sm.studymeasname as studymeasname  FROM " + dec.DatabaseTable + " t join uwautism_research_backend..tblstudymeas sm ";
					_sqlLookup +=  " on t.studymeasid=sm.studymeasid ";
					_sqlLookup += " join uwautism_research_backend..tblstudy st on st.studyid=sm.studyid ";
					_sqlLookup += " WHERE (" + dec.LookupField1 + " = @" + dec.LookupField1 + " OR @" + dec.LookupField1 + " IS NULL) ";
					_sqlLookup += ((dec.LookupField2 != string.Empty)? " AND (" + dec.LookupField2 + "= @" + dec.LookupField2 + 
						" OR @" + dec.LookupField2 + " IS NULL) ":" ");
					_sqlLookup += " AND (t.studymeasid=@studymeasid OR @studymeasid IS NULL) ";
					_sqlLookup += " AND (" + dec.PrimaryKeyField + " = @pk OR @pk IS NULL) ";

					
					
					return new SqlCommand(_sqlLookup, DBConnection);
				}
			}
		}

		/*
		 * A command used to update the verified field. Update should be followed by an select.
		 * 
		 * Has parameters that match PrimaryKeyField and a parameter called '@verified'
		 * 
		 * Example:
		 * 
		 * UPDATE    EDS_CatC
		 * SET              verified = @verified
		 * WHERE     (CatCkey = @catckey);
         *                 SELECT     *
         *                  FROM         eds_catc
         *                  WHERE     catckey = @catckey;
		 * 
		 */
		protected SqlCommand GetUpdateVerifiedSqlCommand(DataEntryController dec)
		{
			if (UpdateVerifiedSqlCommandText != string.Empty)
				return new SqlCommand(UpdateVerifiedSqlCommandText, DBConnection);
			else
			{
				//throw error if any required inputs are missing
				if (dec.PrimaryKeyField == string.Empty || dec.VerifiedField == string.Empty
					|| dec.DatabaseTable == string.Empty || dec.LookupField1 == string.Empty)
					throw new Exception("PrimaryKeyField, VerifiedField, DatabaseTable and at least LookupField1 controller properties are required.");

				else
				{
					string _sqlUpdateVerified = "UPDATE " + dec.DatabaseTable + " SET " + dec.VerifiedField + " = @" + 
						dec.VerifiedField + " WHERE (" + dec.PrimaryKeyField + " = @" + dec.PrimaryKeyField + "); ";
					
					_sqlUpdateVerified += "SELECT t.*,  st.studyname + ': ' + sm.studymeasname as studymeasname  FROM " + dec.DatabaseTable + " t join uwautism_research_backend..tblstudymeas sm ";
					_sqlUpdateVerified +=  " on t.studymeasid=sm.studymeasid ";
					_sqlUpdateVerified += " join uwautism_research_backend..tblstudy st on st.studyid=sm.studyid ";
					_sqlUpdateVerified += " WHERE " + dec.PrimaryKeyField + " = @" + dec.PrimaryKeyField;


					return new SqlCommand(_sqlUpdateVerified, DBConnection);
				}
			}
		}

		private SqlConnection _DBConnection = null;
		private SqlConnection DBConnection 
		{
			get
			{
				if (_DBConnection == null)
				{
					string connectString = ConfigurationManager.AppSettings["sqlDataConnection.ConnectionString"];
					_DBConnection = new SqlConnection(connectString);
				}
				return _DBConnection;
			}
		}

	
		protected void AddParameters(SqlParameterCollection pcol, ArrayList paramFields) 
		{
			//set parameters.  Parameter name is database fieldname with a prepended '@'
			foreach(DataFieldControl dfc in paramFields) 
			{
				AddParameter(pcol, dfc);
			}
		}


		protected void AddParameter(SqlParameterCollection pcol, DataFieldControl dfc) 
		{

			object val = null;
			if (dfc.FieldTextBoxText.Trim() == string.Empty)
				val = DBNull.Value;
			else
			{
				switch (dfc.FieldDataType)
				{ 
					case FieldDataType.INT:
						val = int.Parse(dfc.FieldTextBoxText);
						break;

					case FieldDataType.FLOAT:
						val = double.Parse(dfc.FieldTextBoxText);

						break;

					case FieldDataType.TEXT:

						// limit input to maxlength, if necessary.
						// This is needed because maxLength doesn't apply to
						// multiline text boxes
						string sval = dfc.FieldTextBoxText.Trim();
						if (sval.Length > dfc.FieldTextBoxMaxLength)
						{
							sval = sval.Substring(0, dfc.FieldTextBoxMaxLength);
						}

						val = sval;
						break;

					case FieldDataType.DATE:
						val = DateTime.Parse(dfc.FieldTextBoxText);
						break;
				}
			}

			pcol.AddWithValue("@" + dfc.DatabaseField, val);

		}

		
		/*
		 * Execute sqlCommand.
		 * 
		 * Read values returned by command back into fields.
		 * 
		 */
		protected void DoCommand(	DataEntryController dec, 
									SqlCommand sqlCommand )
		{

			// execute the query
			if (DBConnection.State == ConnectionState.Closed) DBConnection.Open();
			SqlDataReader r = sqlCommand.ExecuteReader();
			r.Read();

			//loop over fields and fetch values from columns of resultset
			foreach(DataFieldControl dfc in dec.AllDataFields) 
			{
				dfc.FieldTextBoxText = r[dfc.DatabaseField].ToString();
			}


			// save value of primary key
			dec.PrimaryKeyVal = (int)r[dec.PrimaryKeyField];

			// save studymeasname
			dec.StudyMeasName = r["studymeasname"].ToString();

			// save studymeasid
			dec.StudyMeasID = (int)r["studymeasid"];

			// save value of study subject ID string.  It's the value
			// in the field whose name is stored in the LookupField1 controller property.
			dec.StudySubjectIDString = r[dec.LookupField1].ToString();

			// save the value of the indexnum.  If used indexnum is the
			// value in the field whose name is stored in LookupField2
			if (dec.LookupTextBox2Visible)
			{
				dec.StudyMeasureIndexnum = (int)r[dec.LookupField2];
			}

			//if last updated and last scored fields are specified get their values.
			//If the value for either in the table is NULL set to DateTime.MinValue
			if (dec.LastScoredDateField != string.Empty && dec.LastUpdatedDateField != string.Empty)
			{
				if (r[dec.LastUpdatedDateField] != DBNull.Value)
					dec.LastUpdatedDate = (DateTime)r[dec.LastUpdatedDateField];
				else
					dec.LastUpdatedDate = DateTime.MinValue;

				if (r[dec.LastScoredDateField] != DBNull.Value)
					dec.LastScoredDate = (DateTime)r[dec.LastScoredDateField];
				else
					dec.LastScoredDate = DateTime.MinValue;
			}

			r.Close();
			DBConnection.Close();			

		}

		/*
		 * Execute sqlCommand setting values passed in ArrayList and
		 * verified as parameters.
		 * 
		 * Read values returned by command back into fields.
		 * 
		 */
		protected void DoCommand(	DataEntryController dec, 
									SqlCommand sqlCommand, 
									ArrayList paramFields,
									Verified verified)
		{
			// add field parameters
			AddParameters(sqlCommand.Parameters, paramFields);
			
			// set verified parameter
			sqlCommand.Parameters.AddWithValue("@verified", verified);

			// execute
			DoCommand(dec, sqlCommand);
		}


		protected void DoCommand(	DataEntryController dec, 
			SqlCommand sqlCommand, 
			ArrayList paramFields,
			int studymeasid,
			Verified verified
			)
		{
			// add field parameters
			AddParameters(sqlCommand.Parameters, paramFields);
			
			// set verified parameter
			sqlCommand.Parameters.AddWithValue("@verified", verified);

			// set studymeasid parameter
			sqlCommand.Parameters.AddWithValue("@studymeasid", studymeasid);

			// execute
			DoCommand(dec, sqlCommand);
		}
		


		/*
		 * Execute sqlCommand setting values passed in ArrayList,
		 * verified, and primary key as parameters.
		 * 
		 * Read values returned by command back into fields.
		 * 
		 */
		protected void DoCommand(	DataEntryController dec, 
									SqlCommand sqlCommand, 
									ArrayList paramFields,
									Verified verified,
									int primaryKeyVal)
		{
			// add field parameters
			AddParameters(sqlCommand.Parameters, paramFields);
			
			// set verified parameter
			sqlCommand.Parameters.AddWithValue("@verified", verified);

			// set primary key parameter
			sqlCommand.Parameters.AddWithValue("@" + dec.PrimaryKeyField, primaryKeyVal);

			// execute
			DoCommand(dec, sqlCommand);
		}		
		

		/*
		 * Execute sqlCommand after setting primary key as parameter.
		 * 
		 * Read values returned by command back into form fields.
		 * 
		 */
		protected void DoCommand(	DataEntryController dec, 
									SqlCommand sqlCommand, 
									int primaryKeyVal)
		{
			// set primary key parameter
			sqlCommand.Parameters.AddWithValue("@" + dec.PrimaryKeyField, primaryKeyVal);

			// execute
			DoCommand(dec, sqlCommand);
		}		

		
		/*
		 * Execute sqlCommand after setting verified, primaryKeyVal as parameter.
		 * 
		 * Read values returned by command back into fields.
		 * 
		 */
		protected void DoCommand(	DataEntryController dec, 
									SqlCommand sqlCommand, 
									Verified verified,
									int primaryKeyVal)
		{
			// set verified parameter
			sqlCommand.Parameters.AddWithValue("@verified", verified);

			// set primary key parameter
			sqlCommand.Parameters.AddWithValue("@" + dec.PrimaryKeyField, primaryKeyVal);

			// execute
			DoCommand(dec, sqlCommand);
		}
		
		
		public virtual void DoInsert(DataEntryController dec)
		{

			//trap any exceptions
			try 
			{	
				//user must select a studymeasure
				if (dec.SelectedNewStudyMeasID == -1)
				{
					dec.Notifications.Add("Select a study measure.");
					dec.FormError = true;

				}
				// do basic field validation first
				else if (dec.Validator.ValidateForInsert(dec.InsertDataFields, dec.Notifications) == false)
				{
					dec.FormError = true;
				}
				else
				{

					dec.FormError = false;

					// do insert
					SqlCommand insertSqlCommand = GetInsertSqlCommand(dec);
					DoCommand(dec, insertSqlCommand, dec.InsertDataFields, dec.SelectedNewStudyMeasID, Verified.CREATED);
				}
			}

			catch (SqlException sqlEx)
			{
				string sErrMsg = string.Empty;
				if (sqlEx.Number == 2601)
				{
					// Duplicate key violation
					sErrMsg = "A measure with the same ID already exists.";	
				}
				else if (sqlEx.Number == 2627)
				{
					// violation of unique index
					sErrMsg = "A measure with the same ID and indexnum already exists.";	
				}
				else
					sErrMsg = sqlEx.Message;

				//add error to notifications and let controller know
				//an error occured
				dec.Notifications.Add(string.Format("An error occurred: {0}", sErrMsg));
				dec.FormError = true;

			}
			catch (Exception ex)
			{
				//add error to notifications and let controller know
				//an error occured
				dec.Notifications.Add(string.Format("An error occurred: {0}",ex.Message));
				dec.FormError = true;
			}
		}

		public virtual void DoSaveEnterering(DataEntryController dec)
		{
			// trap any exceptions
			try 
			{
				if (dec.Validator.ValidateForSaveEntering(dec.EntryDataFields, dec.Notifications) == false) 
				{
					dec.FormError = true;
				}
				else
				{
					dec.FormError = false;

					// do update
					SqlCommand updateSqlCommand = GetUpdateSqlCommand(dec);
					DoCommand(dec, updateSqlCommand, dec.EntryDataFields, Verified.ENTERED, dec.PrimaryKeyVal);
				}
			}
			catch (Exception ex)
			{
				dec.Notifications.Add(string.Format("Unexpected error in DoSaveEntering() event handler: {0}",ex.Message));
				dec.FormError = true;
			}
		}

		public virtual void DoSaveSingleEntered(DataEntryController dec)
		{
			// trap any exceptions
			try 
			{
				if (dec.Validator.ValidateForSaveSingleEntered(dec.EntryDataFields, dec.Notifications) == false) 
				{
					dec.FormError = true;
				}
				else
				{
					dec.FormError = false;

					// do update
					SqlCommand updateSqlCommand = GetUpdateSqlCommand(dec);
					DoCommand(dec, updateSqlCommand, dec.EntryDataFields, Verified.ENTERED, dec.PrimaryKeyVal);
				}
			}
			catch (Exception ex)
			{
				dec.Notifications.Add(string.Format("Unexpected error in DoSaveSingleEntered() event handler: {0}",ex.Message));
				dec.FormError = true;
			}
		}


		/*
		 * Default implementation just reloads fields from database
		 */
		public virtual void DoScore(DataEntryController dec)
		{
			// trap any exceptions
			try 
			{
				if (dec.Validator.ValidateForScore(dec.EntryDataFields, dec.Notifications) == false) 
				{
					dec.FormError = true;
				}
				else
				{
					dec.FormError = false;

					// default implementation just reads record back from database
					SqlCommand selectSqlCommand = GetSelectSqlCommand(dec);
					DoCommand(dec, selectSqlCommand, dec.PrimaryKeyVal);
				}
			}
			catch (Exception ex)
			{
				dec.Notifications.Add(string.Format("Unexpected error in DoScore() event handler: {0}",ex.Message));
				dec.FormError = true;
			}
		}


		public virtual void DoDoubleEnter(DataEntryController dec)
		{
			// nothing to do just set formerror to false
			dec.FormError = false;
		}


		public virtual void DoVerify(DataEntryController dec)
		{
			try 
			{
				if (dec.Validator.ValidateForVerify(dec.DoubleEntryDataFields, dec.Notifications) == false)
				{
					dec.FormError = true;
				}
				else
				{
					dec.FormError = false;

					// setup sqlcommand for call to Validator.Verify
					SqlCommand selectSqlCommand = GetSelectSqlCommand(dec);
					selectSqlCommand.Parameters.AddWithValue("@" + dec.PrimaryKeyField, dec.PrimaryKeyVal);

					if (dec.Validator.Verify(selectSqlCommand, dec.DoubleEntryDataFields, dec.Notifications) == false) 
					{	// There were verification errors
						dec.VerifyError = true;
					}				
					else
					{ 				
						// No verification errors
						dec.VerifyError = false;

						SqlCommand updateVerifiedSqlCommand = GetUpdateVerifiedSqlCommand(dec);
						DoCommand(dec, updateVerifiedSqlCommand, Verified.DOUBLE_ENTERED, dec.PrimaryKeyVal);
					}
				}
			}
			catch (Exception ex)
			{
				dec.FormError = true;
				dec.Notifications.Add(string.Format("Unexpected error in DoVerify() event handler: {0}",ex.Message));
			}
		}

		public virtual void DoVerifyCorrection(DataEntryController dec)
		{
			try 
			{
				if (dec.Validator.ValidateForVerifyCorrection(dec.DoubleEntryDataFields, dec.Notifications) == false)
				{
					// validation errors
					dec.FormError = true;
				}
				else
				{
					// no validation errors
					dec.FormError = false;

					// setup select command 
					SqlCommand selectSqlCommand = GetSelectSqlCommand(dec);
					selectSqlCommand.Parameters.AddWithValue("@" + dec.PrimaryKeyField, dec.PrimaryKeyVal);

					// check whether user checked any 'use new' check boxes
					bool anyUseNewChecked = false;
					foreach( DataFieldControl dfc in dec.DoubleEntryDataFields) 
					{
						if (dfc.OverrideCheckBoxChecked == true) anyUseNewChecked = true;					
					}

					if (anyUseNewChecked == true) 
					{
						// save any fields marked as 'use new', if any.  Do this by getting the existing saved values from db
						// and writing them back-- changing only fields with  'use new' checked. I'm doing
						// it this way so I don't have to deal with dynamically creating sql strings.

						DBConnection.Open();
						SqlDataReader rSaved = selectSqlCommand.ExecuteReader();
						rSaved.Read();  // contains all fields

						// get update sqlcommand
						SqlCommand updateSqlCommand = GetUpdateSqlCommand(dec);
						
						// set update sql parameters
						updateSqlCommand.Parameters.AddWithValue("@" + dec.PrimaryKeyField, dec.PrimaryKeyVal);
						updateSqlCommand.Parameters.AddWithValue("@verified", rSaved["verified"]);

						// set rest of parameters.  DoubleEntryDataFields is a subset of EntryDataFields.
						foreach (DataFieldControl dfc in dec.EntryDataFields)  
						{
							if (dfc.OverrideCheckBoxChecked == true)
							{
								AddParameter(updateSqlCommand.Parameters, dfc);
							}
							else
							{
								updateSqlCommand.Parameters.AddWithValue("@" + dfc.DatabaseField, rSaved[dfc.DatabaseField]);
							}
						}
						rSaved.Close();

						// save
						updateSqlCommand.ExecuteNonQuery();
					}

					if (dec.Validator.Verify(selectSqlCommand, dec.DoubleEntryDataFields, dec.Notifications) == false) 
					{	// There were verification errors
						dec.VerifyError = true;
					}				
					else
					{ 				
						// No verification errors
						dec.VerifyError = false;

						SqlCommand updateVerifiedSqlCommand = GetUpdateVerifiedSqlCommand(dec);
						DoCommand(dec, updateVerifiedSqlCommand, Verified.DOUBLE_ENTERED, dec.PrimaryKeyVal);
					}
				}
			}
			catch (Exception ex)
			{
				dec.FormError = true;
				dec.Notifications.Add(string.Format("Unexpected error in DoVerifyCorrection() event handler: {0}",ex.Message));

			}
		}

		public virtual void DoSaveDoubleEntered(DataEntryController dec)
		{
			// trap any exceptions
			try 
			{
				if (dec.Validator.ValidateForSaveDoubleEntered(dec.EntryDataFields, dec.Notifications) == false) 
				{
					dec.FormError = true;
				}
				else
				{
					dec.FormError = false;

					// do update
					SqlCommand updateSqlCommand = GetUpdateSqlCommand(dec);
					DoCommand(dec, updateSqlCommand, dec.EntryDataFields, Verified.DOUBLE_ENTERED, dec.PrimaryKeyVal);
				}
			}
			catch (Exception ex)
			{
				dec.Notifications.Add(string.Format("Unexpected error in DoSaveDoubleEntered() event handler: {0}",ex.Message));
				dec.FormError = true;
			}
		}

		public virtual void DoCreateNew(DataEntryController dec)
		{
			// nothing to do
			dec.FormError = false;
		}




		public virtual void DoParameterLookup(DataEntryController dec)
		{
			// forward to DoLookup
			DoLookup(dec);
		}


		public virtual void DoLookup(DataEntryController dec)
		{

			/*
			 * LookupTextBox1Text contains the first user entered lookup value.
			 * LookupTextBox2Text contains the first user entered lookup value.
			 * 
			 * LookupField1 contains the name of the database column to be matched
			 * to LookupTextBox1Text.  
			 * 
			 * LookupField2 contains the name of the database column to be matched
			 * to LookupTextBox2Text.  
			 * 
			 */




			// validate user supplied lookup values.
			bool errors = false;


			/*
			 * LookupPKVal is all that's required.
			 * 
			 * If there is no LookupPKVal then both studymeasid and LookupFieldTextBox1 values
			 * are required.
			 * 
			 */
	
			if (dec.LookupPKVal.Trim() == string.Empty)
			{
				if (dec.LookupStudyMeasID == -1)
				{
					dec.Notifications.Add("Select a Study Measure.");
					dec.FormError = true;
					errors = true;
				}
				// LookupFieldTextBox1 is required, LookupFieldTextBox2 is optional
				else if (dec.LookupTextBox1Text.Trim() == string.Empty) 
				{
					dec.Notifications.Add("A lookup value is required.");
					dec.FormError = true;
					errors = true;
				}
				else 
				{
					//validate that user entered values can be converted to required type
					switch (dec.LookupField1DataType)
					{
						case LookupFieldDataType.INT:
							int lookup1;
							try 
							{
								lookup1 = int.Parse(dec.LookupTextBox1Text);
							}
							catch 
							{
								dec.Notifications.Add("Lookup value must be an integer.");
								errors = true;
							}
							break;
						case LookupFieldDataType.TEXT:
							// nothing to do
							break;
					}

					// if second value is supplied, check it's type too
					if (dec.LookupTextBox2Text.Trim() != string.Empty) 
					{

						switch (dec.LookupField2DataType)
						{
							case LookupFieldDataType.INT:
								int lookup2;
								try 
								{
									lookup2 = int.Parse(dec.LookupTextBox2Text);
								}
								catch 
								{
									dec.Notifications.Add("Lookup value must be an integer.");
									errors = true;
								}
								break;

							case LookupFieldDataType.TEXT:
								// nothing to do
								break;
						}

					}

					dec.FormError = errors;
		
				}
			}



			// if no errors then proceed with lookup
			if (errors == false)
			{

				SqlCommand lookupSqlCommand = GetLookupSqlCommand(dec);

				// trap errors
				//SqlDataReader r = null;
				string fieldid = string.Empty;
				try 
				{

					//set parameters:  If LookupPKVal is supplied then add @pk parameter
					//and add and set rest to DBNULL.Value
					if (dec.LookupPKVal.Trim() != string.Empty)
					{
						lookupSqlCommand.Parameters.AddWithValue("@pk", dec.LookupPKVal);
						lookupSqlCommand.Parameters.AddWithValue("@" + dec.LookupField1, DBNull.Value);
						if (dec.LookupField2 != string.Empty) 
						{
							lookupSqlCommand.Parameters.AddWithValue("@" + dec.LookupField2, DBNull.Value);
						}
						lookupSqlCommand.Parameters.AddWithValue("@studymeasid", DBNull.Value);
					}
					else
					{

						lookupSqlCommand.Parameters.AddWithValue("@pk", DBNull.Value);

						/*
						 * LookupSqlCommand disregards lookupfield2 if it's NULL.
						 * 
						 * Throw an error if LookupSqlCommand returns more than one record.
						 */
						switch (dec.LookupField1DataType)
						{
							case LookupFieldDataType.INT:
								lookupSqlCommand.Parameters.AddWithValue("@" + dec.LookupField1, int.Parse(dec.LookupTextBox1Text));
								break;

							case LookupFieldDataType.TEXT:
								lookupSqlCommand.Parameters.AddWithValue("@" + dec.LookupField1, dec.LookupTextBox1Text.Trim());
								break;
						}
					
						// set lookup field 2 parameter only if a lookup field is specified
						if (dec.LookupField2 != string.Empty)
						{
							object val = null;
							if (dec.LookupTextBox2Text.Trim() == string.Empty)
								val = DBNull.Value;
							else
							{
								switch (dec.LookupField2DataType)
								{
									case LookupFieldDataType.INT:
										val = int.Parse(dec.LookupTextBox2Text);
										break;

									case LookupFieldDataType.TEXT:
										val = dec.LookupTextBox2Text.Trim();
										break;
								}
							}

							lookupSqlCommand.Parameters.AddWithValue("@" + dec.LookupField2, val);
						}

						//add studymeasure parameter
						lookupSqlCommand.Parameters.AddWithValue("@studymeasid", dec.LookupStudyMeasID);
					}

					SqlDataAdapter adp = new SqlDataAdapter(lookupSqlCommand);
					DataSet ds = new DataSet();
					int rowsAdded = adp.Fill(ds, "results");

					if (rowsAdded == 1)
					{

						dec.LookupDataSet = ds;

						DataRow r = ds.Tables["results"].Rows[0];

						//loop over fields and fetch values from columns of resultset
						foreach(DataFieldControl dfc in dec.AllDataFields) 
						{
							fieldid = dfc.ID;
							dfc.FieldTextBoxText = r[dfc.DatabaseField].ToString();
						}


						// save value of primary key
						dec.PrimaryKeyVal = (int)r[dec.PrimaryKeyField];

						// save studymeasname
						dec.StudyMeasName = r["studymeasname"].ToString();

						// save value of study subject ID string.  It's the value
						// in the field whose name is stored in the LookupField1 controller property.
						dec.StudySubjectIDString = r[dec.LookupField1].ToString();

						// save studymeasid
						dec.StudyMeasID = (int)r["studymeasid"];

						// save the value of the indexnum.  If used indexnum is the
						// value in the field whose name is stored in LookupField2
						if (dec.LookupTextBox2Visible)
						{
							dec.StudyMeasureIndexnum = (int)r[dec.LookupField2];
						}

						//if last updated and last scored fields are specified get their values.
						//If the value for either in the table is NULL set to DateTime.MinValue
						if (dec.LastScoredDateField != string.Empty && dec.LastUpdatedDateField != string.Empty)
						{
							if (r[dec.LastUpdatedDateField] != DBNull.Value)
								dec.LastUpdatedDate = (DateTime)r[dec.LastUpdatedDateField];
							else
								dec.LastUpdatedDate = DateTime.MinValue;

							if (r[dec.LastScoredDateField] != DBNull.Value)
								dec.LastScoredDate = (DateTime)r[dec.LastScoredDateField];
							else
								dec.LastScoredDate = DateTime.MinValue;
						}


						// map verified field to next state.  Verified field can't be null
						if (r["verified"] == DBNull.Value) 
						{
							throw new Exception("Verified can't be null.");
						}
						else 
						{
							// set next state based on value of verified
							switch ((Verified)r["verified"]) 
							{
								case Verified.CREATED:
									dec.NextState = FormStates.ENTERING;
									break;

								case Verified.DOUBLE_ENTERED:
									dec.NextState = FormStates.DOUBLE_ENTERED;
									break;

								case Verified.ENTERED:
									dec.NextState = FormStates.SINGLE_ENTERED;
									break;

								case Verified.NO_DATA:
									dec.NextState = FormStates.NO_DATA;
									break;
								default:
									throw new Exception(string.Format("Unknown verified value: {0}",r["verified"]));

							}
						}
					}
					else if (rowsAdded > 1)
					{

						//if more than one row then set next state to INSERTED
						//User will be show a list of matches to pick from
						dec.NextState = FormStates.INSERTING;
						dec.LookupDataSet = ds;

						// throw an exception because there is more than one
						// records with the given edsid. 
						//throw new Exception("More than one measure matching measure was found.");

					}
					else
					{
						// no matching record
						throw new Exception("Measure not found.");
					}

				}
				catch (IndexOutOfRangeException)
				{
					// a field on the form is missing from the database
					dec.Notifications.Add(string.Format("Field {0} on the form is not in the database.", fieldid));
					dec.FormError = true;
				}
				catch (Exception ex)
				{
					dec.Notifications.Add(ex.Message);
					dec.FormError = true;
				}

				finally 
				{
					DBConnection.Close();
				}
			}


		}

		public virtual void DoNoData(DataEntryController dec)
		{
			try 
			{
				if (dec.Validator.ValidateForNoData(dec.AllDataFields, dec.Notifications) == false)
				{
					dec.FormError = true;
				}
				else
				{
					dec.FormError = false;
				
					SqlCommand updateVerifiedSqlCommand = GetUpdateVerifiedSqlCommand(dec);
					DoCommand(dec, updateVerifiedSqlCommand, Verified.NO_DATA, dec.PrimaryKeyVal);
				}
			}
			catch (Exception ex)
			{
				dec.Notifications.Add(ex.Message);
				dec.FormError = true;
			}
		}

	}
}
