using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;

namespace DataEntryFramework3
{

    /*
     * Manages a comma delimited list of ranges. 
     * 
     * Provides methods to test if a given value exists
     * in the list of ranges.
     * 
     * Input for creation of RangeList is a string of comma delimited items.  Items
     * call be individual items like x,y or ranges in the format i thru k. An example:
     * 
     * 1,2,3,5 thru 8,9
     * 
     * Each value must be convertable to the supplied FieldDataType.
     * 
     * Items in list can be supplied in any order.  Items that are ranges must be 
     * in the format i thru k with i <= k.
     * 
     * Throws an ArgumentException if any errors occur during construction of list
     */
    public class RangeList
    {
        /*
         * Throws ArgumentException if list isn't valid.
         */
        public RangeList(string rangeList, FieldDataType rangeListType)
        {

            //swap out semicolons to commas if there are any
            rangeList = rangeList.Replace(";", ",");

            try
            {
                _ranges = new List<Range>();
                _rangeListType = rangeListType;
                _rangeListRaw = rangeList;

                if (string.IsNullOrEmpty(rangeList) || rangeListType == FieldDataType.UNKNOWN)
                {
                    throw new ArgumentException("rangeList can't be empty or rangeListType invalid.");
                }

                string[] items = rangeList.Trim().Split(new char[] { ',' });

                foreach (string item in items)
                {
                    _ranges.Add(new Range(item, this));
                }
            }
            catch (Exception e)
            {
                _ranges = null;
                _rangeListType = FieldDataType.UNKNOWN;
                _rangeListRaw = null;
                throw new ArgumentException("An error ocurred while construction RangeList: " + e.Message);
            }
        }

        private List<RangeList.Range> _ranges = null;
       
        //Return true if value in list.
        //Throws ArgumentException if value cant be converted to list type.
        public bool InList(string value)
        {
            if (_ranges == null || RangeListType == FieldDataType.UNKNOWN)
            {
                throw new InvalidOperationException("RangeList hasn't been initialized.");
            }

            if (FieldTypeUtil.CheckType(value, RangeListType) == false)
            {
                throw new ArgumentException(string.Format("Value can't be converted to type {0}.", RangeListType));
            }

            bool found = false;

            foreach (Range r in _ranges)
            {
                if (r.InRange(value) == true)
                {
                    found = true;
                    break;
                }
            }

            return found;
        }

        //For getting the supplied valid list in raw form
        private string _rangeListRaw = null;
        public string RangeListRaw
        {
            get { return _rangeListRaw; }
        }

        //Get valid list type
        private FieldDataType _rangeListType = FieldDataType.UNKNOWN; 
        public FieldDataType RangeListType
        {
            get { return _rangeListType; }
        }

        private class Range
        {
            /*
             * Given a string that's an item in the list
             * first check to see if its an single item x 
             * or a range x thru y.
             * 
             * Throw an ArgumentException if items can't
             * be converted to itemType
             */
            public Range(string item, RangeList list)
            {
                _list = list;

                string[] sArr = item.Trim().Split(new string[] { "thru" }, StringSplitOptions.RemoveEmptyEntries);

                if (sArr.Length == 1)
                {
                    //single item. Check that it can be converted to list type and set min/max val
                    if (FieldTypeUtil.CheckType(sArr[0].Trim(), list.RangeListType) == false)
                    {
                        throw new ArgumentException(string.Format("Item not valid. Can't convert {0} to {1}", sArr[0], list.RangeListType));
                    }
                    else
                    {
                        MinVal = sArr[0];
                        MaxVal = sArr[0];
                    }
                }
                else if (sArr.Length == 2)
                {
                    //range
                    if (FieldTypeUtil.CheckType(sArr[0].Trim(), list.RangeListType) == false)
                    {
                        throw new ArgumentException(string.Format("Item not valid. Can't convert {0} to {1}", sArr[0], list.RangeListType));
                    }
                    else if (FieldTypeUtil.CheckType(sArr[1].Trim(), list.RangeListType) == false)
                    {
                        throw new ArgumentException(string.Format("Item not valid. Can't convert {0} to {1}", sArr[1], list.RangeListType));
                    }
                    else if (FieldTypeUtil.Compare(sArr[0], sArr[1], list.RangeListType) > 0)
                    {
                        throw new ArgumentException("Item not valid. In a range x thru y, x must be less than or equal to y.");
                    }
                    else
                    {
                        MinVal = sArr[0];
                        MaxVal = sArr[1];
                    }
                }
                else
                {
                    //must have 1 or 2 items
                    throw new ArgumentException("Item not valid.");
                }

            }

            private RangeList _list = null;


            public string MinVal = null;
            public string MaxVal = null;

            //Perform a type specific check
            //Return true if value is in range
            public bool InRange(string value)
            {
                if (FieldTypeUtil.Compare(value, MinVal, _list.RangeListType) >= 0 && FieldTypeUtil.Compare(value, MaxVal, _list.RangeListType) <= 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }

        }

    }
}