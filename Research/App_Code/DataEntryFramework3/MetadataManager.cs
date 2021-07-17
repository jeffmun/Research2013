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
using uwac;


namespace DataEntryFramework3
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
		//The entry for a given databaseField might also be null if an error occured while
		//attempting to create the FieldMetadata object.  This could occur if metadata about
		//the field in def.Fld (was dat FieldInfo) is invalid.
		//
		//See the constructor of FieldMetadata class for more info.
		public IFieldMetadata this[string databaseField]
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
						//Dictionary object throws a KeyNotFoundException if databaseField is not
						//a valid key
						result = _fieldMetadataCollection[databaseField.ToUpper()];
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
				_fieldMetadataCollection = new Dictionary<string, IFieldMetadata>();

				//Updated June 2018, now need to set user context
				SQL_utils sqlx = new SQL_utils("data");
				string user = sqlx.GetUserNameFromIdentity();
                string sqlcode = String.Format("EXEC sec.spSetUserContext 'jeffmun'; exec spDEF_GetFieldMetadata '{0}'",  DatabaseTable);
                //string sqlcode = String.Format("exec spDEF_GetFieldMetadata '{0}'", DatabaseTable);

                DataTable dt_flds = sqlx.DataTable_from_SQLstring(sqlcode);
				//Here to fix Feb2021!!

				sqlx.Close();

				foreach (DataRow row in dt_flds.Rows)
				{

					if (formFields.ContainsKey(row["databasefield"].ToString().ToUpper()))
					{
						IFieldMetadata fm = null;
						try
						{

							fm = new FieldMetadata(row["databasefield"].ToString(),
							   row["fielddatatype"].ToString(),
							   row["fieldlabel"].ToString(),
							   row["valuerequired"].ToString(),
							   row["maxval"].ToString(),
							   row["minval"].ToString(),
							   row["regex"].ToString(),
							   row["regexdescription"].ToString(),
							   row["validlist"].ToString(),
							   row["missval"].ToString());

							//add to collection.  Convert key value to all upper case
							//because dictionary is case sensitive.
							//
							//fm will be null if an error was thrown by FieldMetadata contructor.

							string fldname = row["databasefield"].ToString().ToUpper();

							if(fm != null)  _fieldMetadataCollection.Add(fldname, fm);

							//set DataFieldControls's reference to field metadata
							formFields[row["DatabaseField"].ToString().ToUpper()].FieldMetadata = fm;

						}
						catch (Exception e)
						{
							//An error occured while creating FieldMetadata object
							errors.Add(e.Message);
						}

				
					}

				}


				//using (SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["sqlDataConnection.ConnectionString"]))
				//{
				//	_fieldMetadataCollection = new Dictionary<string, IFieldMetadata>();

				//	SqlCommand cmd = new SqlCommand();
				//	cmd.Connection = conn;
				//	//cmd.CommandText = "spDEF_GetFieldMetadata";
				//	//cmd.CommandType = CommandType.StoredProcedure;
				//	//cmd.Parameters.AddWithValue("@DatabaseTable", DatabaseTable);

				//		//cmd.CommandText = sqlcode;
				//		//cmd.CommandType = CommandType.Text;


				//		//conn.Open();

				//		//SqlDataReader r = cmd.ExecuteReader();



				//		////Create and add field metadata to collection if field in metadata is used in form.
				//		////Also set DataFieldControl's reference to its corresponding FieldMetadata object.
				//		////
				//		//while (r.Read())
				//		//{
				//		//	if (formFields.ContainsKey(r["DatabaseField"].ToString().ToUpper()))
				//		//	{
				//		//		IFieldMetadata fm = null;
				//		//		try
				//		//		{
				//		//			fm = new FieldMetadata(r["DatabaseField"].ToString(),
				//		//										   r["FieldDataType"].ToString(),
				//		//										   r["FieldLabel"].ToString(),
				//		//										   r["ValueRequired"].ToString(),
				//		//										   r["MaxVal"].ToString(),
				//		//										   r["MinVal"].ToString(),
				//		//										   r["RegEx"].ToString(),
				//		//										   r["RegExDescription"].ToString(),
				//		//										   r["ValidList"].ToString(),
				//		//										   r["MissVal"].ToString());

				//		//		}
				//		//		catch (Exception e)
				//		//		{
				//		//			//An error occured while creating FieldMetadata object
				//		//			errors.Add(e.Message);
				//		//		}

				//		//		//add to collection.  Convert key value to all upper case
				//		//		//because dictionary is case sensitive.
				//		//		//
				//		//		//fm will be null if an error was thrown by FieldMetadata contructor.
				//		//		_fieldMetadataCollection.Add(r["databasefield"].ToString().ToUpper(), fm);

				//		//		//set DataFieldControls's reference to field metadata
				//		//		formFields[r["DatabaseField"].ToString().ToUpper()].FieldMetadata = fm;
				//		//	}
				//		//}

				//		//r.Close();

				//		////_fieldMetadataCollection now should contain a FieldMetadata object for each
				//		////field that exists in both the form and in the database metadata.
				//		////A field's FieldMetadata object might be null if database metadata was invalid.
				//		////
				//		////Add notifications for fields that exist in form but not in metadata or those
				//		////whose FieldMetadata object couldn't be created.
				//		////
				//		////if (_dataEntryController.CheckForMissingFieldMetadata)
				//		////{
				//		////    foreach (string databaseField in formFields.Keys)
				//		////    {
				//		////        if (_fieldMetadataCollection.ContainsKey(databaseField) == false || _fieldMetadataCollection[databaseField] == null)
				//		////        {
				//		////            errors.Add(databaseField + " form field metadata is missing or invalid.");
				//		////        }
				//		////    }
				//		////}

					

				//}
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