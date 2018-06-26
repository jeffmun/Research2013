using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;
using System.Collections.Generic;


namespace DataEntryFramework4
{
	/*
	 * Contains methods to fetch and query field level metadata.
	 * 
	 * The DataEntryController class uses MetadataManager.  
	 * 
	 * DataEntryController.Controller() calls RefreshFieldMetadata()
	 * before handling each user generated form event.
	 * 
	 */
	public class MetadataManager
	{

		public MetadataManager(DataEntryController dec)
		{
			_databaseTable = dec.DatabaseTable;
			_dataEntryController = dec;
		}

		private string _databaseTable = null;
		public string DatabaseTable
		{
			get { return _databaseTable; }
		}

		private DataEntryController _dataEntryController = null;

	

		//Indexer used to access FieldMetadata.
		//
		//Return null if corresponding FieldMetadata object not found
		//or if _fieldMetadataCollection hasn't been populated yet.
		//
		//The entry for a given fldname might also be null if an error occured while
		//attempting to create the FieldMetadata object.  This could occur if metadata about
		//the field in def.Fld (was dat FieldInfo) is invalid.
		//
		//See the constructor of FieldMetadata class for more info.
		public IFieldMetadata this[string fldname]
		{
			get
			{
				if (_fieldMetadataCollection == null)
				{
					return null;
				}
				else
				{
					IFieldMetadata result = null;
					try
					{
						//Dictionary object throws a KeyNotFoundException if fldname is not
						//a valid key
						result = _fieldMetadataCollection[fldname.ToUpper()];
					}
					catch
					{
						result = null;
					}
					return result;
				}
			}

		}

		//the collection of IFieldMetadata objects
		private Dictionary<string, IFieldMetadata> _fieldMetadataCollection = null;

		/*
		 * Call this to populate FieldMetadata collection.  DatabaseTable must be set first.
		 * 
		 * Returns a List<string> containing any errors encounted.
		 * 
		 * If no errors then List.Count == 0.
		 * 
		 * Field Metadata is only added for fields passed in the formFields Dictionary.
		 * 
		 * 
		 */
		public List<string> RefreshFieldMetadata(Dictionary<string, DataFieldControl> formFields)
		{
			List<string> errors = new List<string>();

			try
			{
				using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["sqlDataConnection.ConnectionString"]))
				{
					_fieldMetadataCollection = new Dictionary<string, IFieldMetadata>();

					
					SqlCommand cmd = new SqlCommand();
					cmd.Connection = conn;
					cmd.CommandText = "def.spGetFieldMetadata_with_tooltip";
					cmd.CommandType = CommandType.StoredProcedure;
					cmd.Parameters.AddWithValue("@tblname", DatabaseTable);

					conn.Open();

					SqlDataReader r = cmd.ExecuteReader();



					//Create and add field metadata to collection if field in metadata is used in form.
					//Also set DataFieldControl's reference to its corresponding FieldMetadata object.
					//
					while (r.Read())
					{
						if (formFields.ContainsKey(r["FldName"].ToString().ToUpper()))
						{
							IFieldMetadata fm = null;
							try
							{
								fm = new FieldMetadata(r["FldName"].ToString(),
															   r["FieldDataType"].ToString(),
															   r["FieldLabel"].ToString(),
															   r["ValueRequired"].ToString(),
															   r["DoubleEntryRequired"].ToString(),
															   r["Read_Only"].ToString(),
															   r["MaxVal"].ToString(),
															   r["MinVal"].ToString(),
															   r["RegEx"].ToString(),
															   r["RegExDescription"].ToString(),
															   r["ValidList"].ToString(),
															   r["MissVal"].ToString(),
															   r["FieldNameAndLabel"].ToString()
															   );

							}
							catch (Exception e)
							{
								//An error occured while creating FieldMetadata object
								errors.Add(e.Message);
							}

							//add to collection.  Convert key value to all upper case
							//because dictionary is case sensitive.
							//
							//fm will be null if an error was thrown by FieldMetadata contructor.
							_fieldMetadataCollection.Add(r["FldName"].ToString().ToUpper(), fm);

							//set DataFieldControls's reference to field metadata
							formFields[r["FldName"].ToString().ToUpper()].FieldMetadata = fm;
						}
					}

					r.Close();

					//_fieldMetadataCollection now should contain a FieldMetadata object for each
					//field that exists in both the form and in the database metadata.
					//A field's FieldMetadata object might be null if database metadata was invalid.
					//
					//Add notifications for fields that exist in form but not in metadata or those
					//whose FieldMetadata object couldn't be created.
					//
					//if (_dataEntryController.CheckForMissingFieldMetadata)
					//{
					//    foreach (string fldname in formFields.Keys)
					//    {
					//        if (_fieldMetadataCollection.ContainsKey(fldname) == false || _fieldMetadataCollection[fldname] == null)
					//        {
					//            errors.Add(fldname + " form field metadata is missing or invalid.");
					//        }
					//    }
					//}

				}
			}
			catch (Exception e)
			{
				//some unanticipated error occured
				_fieldMetadataCollection = null;

				errors.Add(e.Message);
			}

			return errors;
		}

	}


}