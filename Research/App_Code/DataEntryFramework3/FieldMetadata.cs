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


namespace DataEntryFramework3
{

    /*
     * A dictionary of FieldMetadata objects is created by MetadataManager.  The dictionary
     * is keyed by databaseField.
     *
     * Each DataFieldControl contains a reference to its corresponding FieldMetadata object. 
     * This reference is set by the DataFieldControl the first time it's needed.
     * 
     * Note that An instance of FieldMetadata may not exist for each DataFieldControl.
     */
    public class FieldMetadata : IFieldMetadata
    {
        #region Constructor

        //Pass in all initial values as strings.  They'll
        //be converted to the required types.  An exception
        //is thrown if any required fields are missing or can't
        //be converted.
        public FieldMetadata(
                string databaseField,
                string fieldDataType,
                string fieldLabelText,
                string valueRequired,
                string maxVal,
                string minVal,
                string regEx,
                string regExDescription,
                string validList,
                string missVal
            )
        {

            //databaseField Required. 
            if (String.IsNullOrEmpty(databaseField))
            {
                throw new ArgumentException("FieldMetadata error: DatabaseField is missing and is required.");
            }
            else
            {
                _databaseField = databaseField;
            }

            //fieldDataType is required. fieldDataType string must be convertable to a FieldDataType enum value.
            try
            {
                _fieldDataType = (FieldDataType)Enum.Parse(typeof(FieldDataType), fieldDataType.ToUpper());
            }
            catch
            {
                throw new ArgumentException(string.Format("FieldMetadata error for field {0}: The value of '{1}' " +
                                                            "for the fieldDataType argument is invalid. " +
                                                            "A value is required and must be INT, FLOAT," +
                                                            "DATE or TEXT", databaseField, fieldDataType));
            }

            //fieldLabelText is optional.
            _fieldLabelText = fieldLabelText;

            //isValueRequired is optional defaults to false. If specified must be convertable to boolean.
            if (!string.IsNullOrEmpty(valueRequired))
            {
                //Save the passed in value.  I'll check this later to see
                //if a value for IsEntryValueRequired was passed in metadata or is false
                //because that's the default for booleans
                IsValueRequiredParam = valueRequired;

                try
                {
                    _isValueRequired = bool.Parse(valueRequired);
                }
                catch
                {
                    throw new ArgumentException(string.Format("FieldMetadata error for field {0}: The value of '{1}' " +
                                                                "for the isValueRequired argument is invalid. " +
                                                                "If specified the value must be true or false.", databaseField, valueRequired));
                }
            }


            //maxVal optional. If specified must be convertable to a value corresponding to FieldDataType.
            if (!string.IsNullOrEmpty(maxVal))
            {
                try
                {
                    //CheckType throws an exception if value can't be converted.
                    CheckType(maxVal, _fieldDataType);
                    _maxVal = maxVal;
                }
                catch
                {
                    throw new ArgumentException(string.Format("FieldMetadata error for field {0}: The value of '{1}' " +
                                                                "for the maxVal argument is invalid. " +
                                                                "If specified the value must be convertable to {2}.", databaseField, maxVal, _fieldDataType));
                }
            }


            //minVal optional. If specified must be convertable to a value corresponding to FieldDataType.
            if (!string.IsNullOrEmpty(minVal))
            {
                try
                {
                    //CheckType throws an exception if value can't be converted.
                    CheckType(minVal, _fieldDataType);
                    _minVal = minVal;
                }
                catch
                {
                    throw new ArgumentException(string.Format("FieldMetadata error for field {0}: The value of '{1}' " +
                                                                "for the minVal argument is invalid. " +
                                                                "If specified the value must be convertable to {2}.", databaseField, minVal, _fieldDataType));
                }
            }

            //regEx optional.  If specified must be a valid regex expression.
            if (!string.IsNullOrEmpty(regEx))
            {
                try
                {
                    //throw exception if not valid regex.
                    Regex r = new Regex(regEx);
                    _regEx = regEx;
                }
                catch
                {
                    throw new ArgumentException(string.Format("FieldMetadata error for field {0}: '{1}' " +
                                                                "is not a valid Regular Expression.", databaseField, regEx));
                }
            }

            //regExDescription is optional.
            _regExDescription = regExDescription;

            //validList optional.  If specified must be a comma delimited list of values convertable to FieldDataType.
            if (!string.IsNullOrEmpty(validList))
            {
                try
                {
                    //CheckValidList throws an exception if list is invalid.
                    CheckValidList(validList, _fieldDataType);
                    _validList = validList;
                }
                catch
                {
                    throw new ArgumentException(string.Format("FieldMetadata error for field {0}: The value of '{1}' " +
                                                                "for the validList argument is invalid. " +
                                                                "If specified validList must be a comma delimited list " +
                                                                "of items convertable to {2} or items in format x thru y with x<=y.", databaseField, validList, _fieldDataType));
                }
            }

            //missVal is optional.    If specified must be a comma delimited list of values convertable to FieldDataType.
            //An item in the list might possibly be in format "x thru y" where x and y must be convertable
            //with x <= y. 
            if (!string.IsNullOrEmpty(missVal))
            {
                try
                {
                    //CheckMissVal throws an exception if list is invalid.
                    CheckMissVal(missVal, _fieldDataType);
                    _missVal = missVal;
                }
                catch
                {
                    throw new ArgumentException(string.Format("FieldMetadata error for field {0}: The value of '{1}' " +
                                                                "for the missVal argument is invalid. " +
                                                                "If specified missVal must be a comma delimited list " +
                                                                "of items convertable to {2} or items in format x thru y with x<=y.", databaseField, missVal, _fieldDataType));
                }
            }

        }
        #endregion Constructor

        #region Properties
        private string _databaseField;
        public string DatabaseField
        {
            get { return _databaseField; }
        }

        private FieldDataType _fieldDataType;
        public FieldDataType FieldDataType
        {
            get { return _fieldDataType; }
        }

        private string _fieldLabelText;
        public string FieldLabelText
        {
            get { return _fieldLabelText; }
        }


        //Check this value to see if a value was supplied by metatdata
        //or IsEntryValueRequired is false because false is a boolean's default value.
        private string _isValueRequiredParam;
        public string IsValueRequiredParam
        {
            get { return _isValueRequiredParam; }
            set { _isValueRequiredParam = value; }
        }


        private bool _isValueRequired;
        public bool IsValueRequired
        {
            get { return _isValueRequired; }
        }

        private string _maxVal;
        public string MaxVal
        {
            get { return _maxVal; }
        }

        private string _minVal;
        public string MinVal
        {
            get { return _minVal; }
        }

        private string _regEx;
        public string RegEx
        {
            get { return _regEx; }
        }

        private string _regExDescription;
        public string RegExDescription
        {
            get { return _regExDescription; }
        }

        private string _validList;
        public string ValidList
        {
            get { return _validList; }
        }

        private string _missVal;
        public string MissVal
        {
            get { return _missVal; }
        }
        #endregion Properties

        #region Private utility methods

        //Throws an error if value can't be parsed into specified FieldDataType
        private void CheckType(string value, FieldDataType fdt)
        {
            switch (fdt)
            {
                case FieldDataType.DATE:
                    DateTime.Parse(value);
                    break;

                case FieldDataType.FLOAT:
                    float.Parse(value);
                    break;

                case FieldDataType.INT:
                    int.Parse(value);
                    break;

                case FieldDataType.TEXT:
                    // nothing to check
                    break;

                default:
                    throw new Exception("FieldDataType invalid.");

            }
        }

        private void CheckValidList(string value, FieldDataType fdt)
        {
            //string[] listItems = value.Split(new char[] { ',' });
            //foreach (string s in listItems)
            //{
            //    CheckType(s, fdt);
            //}

            //Check ValidList by attempting to create a RangeList object.
            RangeList throwaway = new RangeList(value, fdt);

        }

        //Validate missVal. It must be a comma delimited list of values convertable to FieldDataType.
        //An item in the list might possibly be in format "x thru y" where x and y must be convertable
        //with x <= y. 
        private void CheckMissVal(string valueToCheck, FieldDataType fdt)
        {
            //Check MissVal by attempting to create a RangeList object.
            RangeList throwaway = new RangeList(valueToCheck, fdt);




            ////create a string array containing the comma delimited items
            //string[] listItems = valueToCheck.Split(new char[] { ',' });

            ////validate each item
            //foreach (string sItem in listItems)
            //{
            //    //create a string array by splitting each item on the string "thru"
            //    string[] splitItem = sItem.ToLower().Split(new string[] { "thru" }, StringSplitOptions.None);

            //    //throw an exception if splitting results in more that 2 elements
            //    if (splitItem.Length > 2)
            //    {
            //        throw new ArgumentException("missVal not valid.");
            //    }

            //    foreach (string s in splitItem)
            //    {
            //        CheckType(s, fdt);
            //    }

            //    //verify that x <= y
            //    if (splitItem.Length == 2)
            //    {
            //        switch (fdt)
            //        {
            //            case FieldDataType.DATE:
            //                if (!(DateTime.Parse(splitItem[0]) <= DateTime.Parse(splitItem[1])))
            //                {
            //                    throw new ArgumentException("missVal not valid.");
            //                }
            //                break;

            //            case FieldDataType.FLOAT:
            //                if (!(float.Parse(splitItem[0]) <= float.Parse(splitItem[1])))
            //                {
            //                    throw new ArgumentException("missVal not valid.");
            //                }
            //                break;

            //            case FieldDataType.INT:
            //                if (!(int.Parse(splitItem[0]) <= int.Parse(splitItem[1])))
            //                {
            //                    throw new ArgumentException("missVal not valid.");
            //                }
            //                break;

            //            case FieldDataType.TEXT:
            //                // nothing to check
            //                break;
                        
            //            default:
            //                throw new Exception("FieldDataType invalid.");

            //        }
            //    }
            //}
        }


        #endregion Private utility methods
    }

}