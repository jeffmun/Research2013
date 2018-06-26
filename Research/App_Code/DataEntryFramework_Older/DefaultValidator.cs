using System;
using System.Collections;
using System.Text.RegularExpressions;
using System.Data.SqlClient;


namespace DataEntryFramework.Old
{

	public enum FieldValidation 
	{	INSERT_REQUIRED, 
		ENTRY_REQUIRED, 
		FIELD_TYPE,
		REGEX,
		VALID_LIST,
		MIN_MAX_BETWEEN
	}


	public interface IFieldValidator 
	{
		bool Verify(SqlCommand sqlcommand, ArrayList fields, ArrayList notifications);
		bool ValidateForInsert(ArrayList dataEntryFields, ArrayList notifications);
		bool ValidateForSaveEntering(ArrayList dataEntryFields, ArrayList notifications);
		bool ValidateForVerify(ArrayList dataEntryFields, ArrayList notifications);
		bool ValidateForVerifyCorrection(ArrayList dataEntryFields, ArrayList notifications);
		bool ValidateForSaveSingleEntered(ArrayList dataEntryFields, ArrayList notifications);
		bool ValidateForSaveDoubleEntered(ArrayList dataEntryFields, ArrayList notifications);
		bool ValidateForNoData(ArrayList dataEntryFields, ArrayList notifications);
		bool ValidateForScore(ArrayList dataEntryFields, ArrayList notifications);
		DataEntryController DataEntryController
		{
			get;
			set;
		}
	}




	public class DefaultValidator : IFieldValidator
	{
	
		//Holds reference to the DataEntryController that's using this 
		//validator instance
		private DataEntryController _dataEntryController;
		public DataEntryController DataEntryController
		{
			get 
			{
				return _dataEntryController;
			}
			set
			{
				_dataEntryController = value;
			}
		}


		/*
		 * Open an SqlDataReader on sqlcommand. sqlcommand should have all required 
		 * parameters already set and be assigned a connection object.
		 * 
		 * Iterate over fields in dataEntryFields and verify that user entered values match
		 * its corresponding database value.
		 * 
		 * If sqlcommand.connection is already open it is left open. If not, it is openned
		 * and then closed when done.
		 * 
		 * The user entered values must already have been checked against the field type.
		 * 
		 */
		public virtual bool Verify(SqlCommand sqlcommand, ArrayList fields, ArrayList notifications)
		{
			//track whether connection was already open. and Open if needed.
			bool alreadyOpen;
			if (sqlcommand.Connection.State == System.Data.ConnectionState.Closed)
			{
				alreadyOpen = false; 
				sqlcommand.Connection.Open();
			}
			else
				alreadyOpen = true;

			SqlDataReader r = sqlcommand.ExecuteReader();
			r.Read();

			// loop and compare entered values to values in database

			bool verifyerrors = false; //used to track whether any verify errors occured

			// compare entered values to saved values
			bool match = false;
			foreach(DataFieldControl dfc in fields)
			{


				/*
				 * Possible combinations:
				 * 1. Database field is NULL. User might have supplied a value or not.
				 * 2. User enter valued is missing. DB field might be null or not
				 * 3. Both values exist.
				 * 
				 */

				// if field is null the user must have entered nothing for a match to occur
				if (r[dfc.DatabaseField] == DBNull.Value)
				{
					match = (dfc.FieldTextBoxText.Trim() == string.Empty);
				}
				else if (dfc.FieldTextBoxText.Trim() == string.Empty) // db field must be null to match
				{
					match = (r[dfc.DatabaseField] == DBNull.Value);
				}
				else // Both values exist so it's OK to parse and compare
				{
					// convert the user entered value to the correct
					// data type and compare its value to what's in the 
					// database
					switch (dfc.FieldDataType)
					{
						case (FieldDataType.INT):
							match = (int.Parse(r[dfc.DatabaseField].ToString()) == int.Parse(dfc.FieldTextBoxText) );
							break;
						case (FieldDataType.FLOAT):
							match = (float.Parse(r[dfc.DatabaseField].ToString()) == float.Parse(dfc.FieldTextBoxText) );
							break;
						case (FieldDataType.DATE):
							match = (DateTime.Parse(r[dfc.DatabaseField].ToString()) == DateTime.Parse(dfc.FieldTextBoxText));
							break;
						case (FieldDataType.TEXT):
							match = (r[dfc.DatabaseField].ToString() == dfc.FieldTextBoxText.Trim() );
							break;					
					}
				}

				if ( match == false)
				{
					// Set verifyerror.  This causes display of override check box
					// and makes field editable.
					dfc.VerifyError = true;

					// if field has a format string, apply it to saved value
					// for incorporation into error message
					string sSavedVal = string.Empty;
					if (r[dfc.DatabaseField] == DBNull.Value)
						sSavedVal = "NULL";
					else if (dfc.FormatString != string.Empty)
						sSavedVal = string.Format(dfc.FormatString, r[dfc.DatabaseField]);
					else
						sSavedVal = r[dfc.DatabaseField].ToString();


					// add error to field
					dfc.AddError(string.Format("Mismatch with saved value of {0}.", sSavedVal));

					// add notification 
					notifications.Add(string.Format("Error in field {0}. Mismatch with saved value of {1}.",Shorten(dfc.FieldLabelText), sSavedVal));

					verifyerrors = true;
				}
				else
					// field value matches database
					dfc.VerifyError = false;


			} // end foreach loop

			r.Close();
			if (alreadyOpen == false) sqlcommand.Connection.Close();
			
			// return false if any verification errors occured
			return !verifyerrors;

		}




		public virtual bool ValidateForScore(ArrayList dataEntryFields, ArrayList notifications)
		{
			// default implementation does nothing
			return true;
		}



		/*
		 * Each test checks all fields. If any fields fail a test the rest of the 
		 * checks are aborted and the function returns FALSE. Tests are done
		 * in the following order:
		 * 
		 * 1) Are all user entered values appropriate for field data type?
		 * 2) Are all required values filled in?
		 * 3) Do supplied values match a validList?
		 * 4) Do supplied values fall within minVal and maxVal?
		 * 5) Do supplied values match a regular expression?
		 * 
		 */
		protected bool StandardFieldValidation(ArrayList dataEntryFields, ArrayList notifications)
		{
			if (Validate(FieldValidation.FIELD_TYPE, dataEntryFields, notifications) == false) 
			{
				return false;
			}
			else if (Validate(FieldValidation.ENTRY_REQUIRED, dataEntryFields, notifications) == false)
			{
				return false;
			}
			else if (Validate(FieldValidation.VALID_LIST, dataEntryFields, notifications) == false)
			{
				return false;
			}
			else if (Validate(FieldValidation.MIN_MAX_BETWEEN, dataEntryFields, notifications) == false) 
			{
				return false;
			}
			else if (Validate(FieldValidation.REGEX, dataEntryFields, notifications) == false) 
			{
				return false;
			}
			else 
			{  // all fields are valid
				return true;
			}
		}
		
		
		
		/*
		 * Perform all field validations in preperation of SQL insert of 
		 * new measure record.
		 * 
		 */
		public  virtual bool ValidateForInsert(ArrayList dataEntryFields, ArrayList notifications)
		{
			if (Validate(FieldValidation.FIELD_TYPE, dataEntryFields, notifications) == false) 
			{
				return false;
			}
			else if (Validate(FieldValidation.INSERT_REQUIRED, dataEntryFields, notifications) == false)
			{
				return false;
			}
			else if (Validate(FieldValidation.VALID_LIST, dataEntryFields, notifications) == false)
			{
				return false;
			}
			else if (Validate(FieldValidation.MIN_MAX_BETWEEN, dataEntryFields, notifications) == false) 
			{
				return false;
			}
			else if (Validate(FieldValidation.REGEX, dataEntryFields, notifications) == false) 
			{
				return false;
			}
			else 
			{  // all fields are valid
				return true;
			}		
		}
		
		public  virtual bool ValidateForSaveEntering(ArrayList dataEntryFields, ArrayList notifications)
		{
			return StandardFieldValidation(dataEntryFields, notifications);
		}
		
		public  virtual bool ValidateForVerify(ArrayList dataEntryFields, ArrayList notifications)
		{
			return StandardFieldValidation(dataEntryFields, notifications);
		}		
		

		public  virtual bool ValidateForVerifyCorrection(ArrayList dataEntryFields, ArrayList notifications)
		{
			return StandardFieldValidation(dataEntryFields, notifications);
		}	
		
		
		
		public virtual  bool ValidateForSaveSingleEntered(ArrayList dataEntryFields, ArrayList notifications)
		{
			return StandardFieldValidation(dataEntryFields, notifications);
		}	

		
		public virtual  bool ValidateForSaveDoubleEntered(ArrayList dataEntryFields, ArrayList notifications)
		{
			return StandardFieldValidation(dataEntryFields, notifications);
		}	
		

		public virtual  bool ValidateForNoData(ArrayList dataEntryFields, ArrayList notifications)
		{
			// nothing to validate so return true
			return true;

		}	


		/*
		 * Perform the requested validation against the data entry fields in dataEntryFields.
		 * Add any errors to notifications arraylist.
		 * 
		 * Return FALSE if validation errors occur.
		 * 
		 */
		protected bool Validate(FieldValidation validation, ArrayList dataEntryFields, ArrayList notifications)
		{
			bool valid = false;

			// trap any errors
			try 
			{
				switch (validation)
				{
					case FieldValidation.INSERT_REQUIRED:
						valid =  ValidateInsertRequired(dataEntryFields, notifications);
						break;

					case FieldValidation.ENTRY_REQUIRED:
						valid =  ValidateEntryRequired(dataEntryFields, notifications);
						break;

					case FieldValidation.FIELD_TYPE:
						valid =  ValidateFieldType(dataEntryFields, notifications);
						break;

					case FieldValidation.VALID_LIST:
						valid =  ValidateValidList(dataEntryFields, notifications);
						break;

					case FieldValidation.MIN_MAX_BETWEEN:
						valid =  ValidateMinMaxBetween(dataEntryFields, notifications);
						break;
			
					case FieldValidation.REGEX:
						valid =  ValidateRegEx(dataEntryFields, notifications);
						break;
				} //switch
			} // try
			catch (Exception ex)
			{
				notifications.Add(string.Format("Unexpected error in Validate(): {0}", ex.Message));
				valid = false;
			}
			return valid;
		}
		
		
		/*
		 * Verify that user supplied value is within the range specified by minVal and maxVal.
		 * 
		 * Only validate fields that have a user supplied value AND have a specified min or max val.
		 * 
		 * Validate the user supplied value against the fieldtype before calling.
		 * 
		 * Return FALSE if errors occur.
		 * 
		 */
		protected bool ValidateMinMaxBetween(ArrayList dataEntryFields, ArrayList notifications)
		{
			bool valid = true;
			foreach(DataFieldControl dfc in dataEntryFields)
			{
				// trap any errors
				try 
				{
					// only check if minval or maxval exist AND user supplied a value
					if (	(dfc.MaxVal != string.Empty || dfc.MinVal != string.Empty )
						&& dfc.FieldTextBoxText.Trim() != string.Empty) 
					{
						if (CheckMinMaxBetween(dfc) == false)
						{
							// construct the appropriate message
							string msg;
							if (dfc.MaxVal != string.Empty && dfc.MinVal != string.Empty) 
							{
								msg = string.Format("{0} value must between {1} and {2}.", Shorten(dfc.FieldLabelText), dfc.MinVal, dfc.MaxVal);
							}
							else if (dfc.MinVal != string.Empty) 
							{
								msg = string.Format("{0} value must be greater than or equal to {1}.", Shorten(dfc.FieldLabelText), dfc.MinVal);
							}
							else 
							{
								msg = string.Format("{0} value must be less than or equal to {1}.", Shorten(dfc.FieldLabelText), dfc.MaxVal);
							}
							dfc.AddError(msg);
							notifications.Add(msg);
							valid = false;
						}		
					} 
				}
				catch (Exception ex)
				{
					notifications.Add(string.Format("Unexpected error in ValidateMinMaxBetween() while validating {0}: {1}",Shorten(dfc.FieldLabelText), ex.Message));
					valid = false;

					// exit loop
					break;
				}
			}

			return valid;

		} //function


		/*
		 * Return true if the user supplied value is within the range
		 * specified by minVal and maxVal.
		 * 
		 */
		protected bool CheckMinMaxBetween(DataFieldControl dfc)
		{
			bool valid = false;
			if (dfc.MaxVal != string.Empty && dfc.MinVal != string.Empty) 
			{//between
				valid = CheckBetween(dfc);
			}
			else if (dfc.MinVal != string.Empty) 
			{ //check min
				valid = CheckMin(dfc);
			}
			else 
			{ // check max
				valid = CheckMax(dfc);
			}
			return valid;
		}


		protected  bool CheckBetween(DataFieldControl dfc) 
		{
			bool valid = false;
			string sUserVal = dfc.FieldTextBoxText;
			string sMinVal = dfc.MinVal;
			string sMaxVal = dfc.MaxVal;
			switch (dfc.FieldDataType)
			{	
				case FieldDataType.INT:
						
					valid = (	int.Parse(sUserVal) >= int.Parse(sMinVal)
						&& int.Parse(sUserVal) <= int.Parse(sMaxVal) );
					break;

				case FieldDataType.FLOAT:
					valid = (	float.Parse(sUserVal) >= float.Parse(sMinVal)
						&& float.Parse(sUserVal) <= float.Parse(sMaxVal) );
					break;

				case FieldDataType.DATE:
					valid = (	DateTime.Parse(sUserVal) >= DateTime.Parse(sMinVal)
						&& DateTime.Parse(sUserVal) <= DateTime.Parse(sMaxVal) );

					break;

				case FieldDataType.TEXT:
					valid = ((string.Compare(sUserVal, sMinVal) >= 0) //sUserVal >= sMinVal
						&& (string.Compare(sUserVal, sMaxVal) <= 0));   // sUserVal <= sMaxVal   );
					break;

			} // end switch

			return valid;

		}
			
		protected  bool CheckMin(DataFieldControl dfc) 
		{
			bool valid = false;
			string sUserVal = dfc.FieldTextBoxText;
			string sMinVal = dfc.MinVal;
			switch (dfc.FieldDataType)
			{	
				case FieldDataType.INT:
						
					valid = (	int.Parse(sUserVal) >= int.Parse(sMinVal) );
					break;

				case FieldDataType.FLOAT:
					valid = (	float.Parse(sUserVal) >= float.Parse(sMinVal));
					break;

				case FieldDataType.DATE:
					valid = (	DateTime.Parse(sUserVal) >= DateTime.Parse(sMinVal) );

					break;

				case FieldDataType.TEXT:
					valid = (	string.Compare(sUserVal, sMinVal) >= 0 );
					break;

			} // end switch

			return valid;

		}
		protected  bool CheckMax(DataFieldControl dfc) 
		{
			bool valid = false;
			string sUserVal = dfc.FieldTextBoxText;
			string sMaxVal = dfc.MaxVal;
			switch (dfc.FieldDataType)
			{	
				case FieldDataType.INT:
						
					valid = (int.Parse(sUserVal) <= int.Parse(sMaxVal) );
					break;

				case FieldDataType.FLOAT:
					valid = ( float.Parse(sUserVal) <= float.Parse(sMaxVal) );
					break;

				case FieldDataType.DATE:
					valid = (DateTime.Parse(sUserVal) <= DateTime.Parse(sMaxVal) );

					break;

				case FieldDataType.TEXT:
					valid = ( string.Compare(sUserVal, sMaxVal) <= 0 );
					break;

			} // end switch

			return valid;

		}

		
		/*
		 * Verify that the user supplied value in each field in dataEntryFields matches its 
		 * specified validList.  validLIst is a comma delimited string of values of
		 * type fieldDataType. Only validate fields that supply a value for validList
		 * AND where the user has supplied a value.
		 * 
		 * Validate user entered values against fielddatatype before calling this function.
		 * 
		 * Put any errors in notifications.
		 * 
		 * Return FALSE if any validation errors occur.
		 * 
		 */
		protected bool ValidateValidList(ArrayList dataEntryFields, ArrayList notifications)
		{
			bool valid = true;
			foreach(DataFieldControl dfc in dataEntryFields)
			{
				// trap any errors
				try 
				{
					if (dfc.ValidList != string.Empty && dfc.FieldTextBoxText.Trim() != string.Empty) 
					{
						if (CheckValidList(dfc) == false)
						{
							dfc.AddError(string.Format("{0} must be in {1}.",Shorten(dfc.FieldLabelText), dfc.ValidList));
							notifications.Add(string.Format("{0} must be in {1}.",Shorten(dfc.FieldLabelText), dfc.ValidList));
							valid = false;
						}		
					} 
				}
				catch (Exception ex)
				{
					notifications.Add(string.Format("Unexpected error in ValidateValidList() while validating {0}: {1}",Shorten(dfc.FieldLabelText), ex.Message));
					valid = false;

					// exit loop
					break;
				}
			}

			return valid;
		}

		/*
		 * Compare the user entered value to the entries in validList.
		 * Return FALSE if no match is found.
		 * 
		 */
		protected bool CheckValidList(DataFieldControl dfc) 
		{

			// loop over values in validlist and perform a type
			// specific comparision
			string [] split = dfc.ValidList.Split(new Char [] {','});
			bool match = false;
			foreach (string sCheckVal in split) 
			{
				match = false;
				string sUserVal = dfc.FieldTextBoxText;
				switch (dfc.FieldDataType)
				{	
					case FieldDataType.INT:
						
						match = ( int.Parse(sUserVal) == int.Parse(sCheckVal));
						break;

					case FieldDataType.FLOAT:
						match = ( float.Parse(sUserVal) == float.Parse(sCheckVal));
						break;

					case FieldDataType.DATE:
						match = ( DateTime.Parse(sUserVal) == DateTime.Parse(sCheckVal));
						break;

					case FieldDataType.TEXT:
						match = ( sUserVal.Trim() == sCheckVal.Trim() );
						break;
				} // end switch

				// leave loop of match found
				if (match) break;

			} // for loop

			return match;

		} // function

		/*
		 * Verify that any user supplied value in dataEntryFields matches its 
		 * specified fielddatatype.  All fields must specify a fieldDataType.
		 * 
		 * Only validate if user supplies a value.
		 * 
		 * Put any errors in notifications.
		 * 
		 * Return FALSE if any validation errors occur.
		 * 
		 */
		protected bool ValidateFieldType(ArrayList dataEntryFields, ArrayList notifications)
		{
			bool valid = true;
			bool fieldValid = true;
			string s = "";
			foreach(DataFieldControl dfc in dataEntryFields)
			{
				// trap any errors
				try 
				{
					// only check if user supplies value
					if (dfc.FieldTextBoxText.Trim() != string.Empty) 
					{
						fieldValid = true;
						switch (dfc.FieldDataType)
						{	
							case FieldDataType.INT:
								fieldValid = CheckInt(dfc.FieldTextBoxText);
								s = "integer";
								break;

							case FieldDataType.FLOAT:
								fieldValid = CheckFloat(dfc.FieldTextBoxText);
								s = "float";
								break;

							case FieldDataType.DATE:
								fieldValid = CheckDate(dfc.FieldTextBoxText);
								s = "date";
								break;

							case FieldDataType.TEXT:

								// nothing to do here
								fieldValid = true;
								s = "text";
								break;
						}


						if (!fieldValid)
						{
							dfc.AddError(string.Format("{0} is not a valid {1} value.",Shorten(dfc.FieldLabelText), s));
							notifications.Add(string.Format("{0} is not a valid {1} value.",Shorten(dfc.FieldLabelText), s));
							valid = false;
						}
					} 
				} //try
				catch (Exception ex)
				{
					notifications.Add(string.Format("Unexpected error in ValidateFieldType() while validating {0}: {1}", Shorten(dfc.FieldLabelText), ex.Message));
					valid = false;

					// exit loop
					break;
				}
			} // loop

			return valid;

		}




		protected bool ValidateInsertRequired(ArrayList dataEntryFields, ArrayList notifications)
		{
			bool valid = true;
			foreach(DataFieldControl dfc in dataEntryFields)
			{
				if (dfc.IsInsertValueRequired && (dfc.FieldTextBoxText.Trim() == string.Empty) )
				{
					dfc.AddError(string.Format("{0} is required.",Shorten(dfc.FieldLabelText)));
					notifications.Add(string.Format("{0} is required.",Shorten(dfc.FieldLabelText)));
					valid = false;
				}
			}
			return valid;
		}

		protected bool ValidateEntryRequired(ArrayList dataEntryFields, ArrayList notifications)
		{
			bool valid = true;
			foreach(DataFieldControl dfc in dataEntryFields)
			{
				if (dfc.IsEntryValueRequired && (dfc.FieldTextBoxText.Trim() == string.Empty) )
				{
					dfc.AddError(string.Format("{0} is required.",Shorten(dfc.FieldLabelText)));
					notifications.Add(string.Format("{0} is required.",Shorten(dfc.FieldLabelText)));
					valid = false;
				}
			}
			return valid;
		}
		
		
		/*
		 * Validate user supplied value against a regular expression.
		 * 
		 * Only validate if regex is supplied and user supplies a value.
		 * 
		 * Return false if validation fails for any field.
		 * 
		 */
		protected bool ValidateRegEx(ArrayList dataEntryFields, ArrayList notifications)
		{
			bool valid = true;

			foreach(DataFieldControl dfc in dataEntryFields)
			{
				// trap errors
				try
				{
					if ( (dfc.RegEx != string.Empty)  && dfc.FieldTextBoxText.Trim() != string.Empty)
					{
						if (Regex.IsMatch(dfc.FieldTextBoxText,dfc.RegEx) == false) 
						{
							string err = dfc.RegExDescription;

							// set a default value for error text if none specified
							if (err == string.Empty) { err = "Invalid value."; }

							dfc.AddError(err);
							notifications.Add( string.Format("Error in field {0}. ",Shorten(dfc.FieldLabelText)) + err);
							valid = false;
						}
					}

				} // try
				catch (Exception ex)
				{
					notifications.Add(string.Format("Unexpected error in ValidateRegEx() while validating {0}: {1}", Shorten(dfc.FieldLabelText), ex.Message));
					valid = false;

					//exit loop
					break;
				}
			}	
		
			return valid;
		}

		/*
		 * Return FALSE if testdate can't be parsed into a date type.
		 */
		protected bool CheckDate(string testdate) 
		{	
			bool valid = true;
			try 
			{
				DateTime d = DateTime.Parse(testdate);
			}
			catch
			{
				valid = false;
			}
			return valid;
		}

		/*
		 * Return false if testint can't be parsed as in int type
		 */
		protected bool CheckInt(string testint) 
		{ 
			bool valid = true;
			try 
			{
				int i = int.Parse(testint);
			}
			catch 
			{
				valid = false;
			}
			return valid;
		}

		/*
		 * Return false if testfloat can't be parsed as in int type
		 */
		protected bool CheckFloat(string testfloat) 
		{ 
			bool valid = true;
			try 
			{
				float f = float.Parse(testfloat);
			}
			catch 
			{
				valid = false;
			}
			return valid;
		}

		protected string Shorten(string sIn)
		{
			string result = string.Empty;
			if (sIn.Length <= 10)
				result = sIn;
			else
			{
				result = sIn.Substring(0, 10) + "...";
			}
			return result;
		}


	}
}
