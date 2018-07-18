using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace DataEntryFramework4
{

    public class FieldTypeUtil
    {

        //return true if value can be converted to FieldDataType
        public static bool CheckType(string value, FieldDataType fdt)
        {
            bool result = true;

            try
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
            catch
            {
                result = false;
            }

            return result;
        }

        //Do a type specific comparison:
        //Return 0 if equal -1 if val1 < val2 1 if val1 > val2
        //Throws an ArgumentException if val1 or val2 can't be converted
        //to FieldDataType fdt
        public static int Compare(string val1, string val2, FieldDataType fdt)
        {
            //check types
            if (FieldTypeUtil.CheckType(val1, fdt) == false || FieldTypeUtil.CheckType(val2, fdt) == false)
            {
                throw new ArgumentException(string.Format("Values must be convertable to type {0}.", fdt));
            }

            int result = 0;

            switch (fdt)
            {
                case FieldDataType.DATE:
                    DateTime dtVal1 = DateTime.Parse(val1);
                    DateTime dtVal2 = DateTime.Parse(val2);
                    result = dtVal1.CompareTo(dtVal2);
                    break;

                case FieldDataType.FLOAT:
                    float fVal1 = float.Parse(val1);
                    float fVal2 = float.Parse(val2);
                    result = fVal1.CompareTo(fVal2);
                    break;

                case FieldDataType.INT:
                    int iVal1 = int.Parse(val1);
                    int iVal2 = int.Parse(val2);
                    result = iVal1.CompareTo(iVal2);
                    break;

                case FieldDataType.TEXT:
                    result = val1.CompareTo(val2);
                    break;

                default:
                    throw new Exception("FieldDataType invalid.");
            }

            return result;
        }


    }
}