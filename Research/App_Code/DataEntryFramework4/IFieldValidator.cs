using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Generic;

namespace DataEntryFramework4
{
    public enum FieldValidation
    {
        INSERT_REQUIRED,
        ENTRY_REQUIRED,
        FIELD_TYPE,
        REGEX,
        VALID_LIST,
        MIN_MAX_BETWEEN,
        MISS_VAL
    }


    public interface IFieldValidator
    {
        bool Verify(SqlCommand sqlcommand, Dictionary<string, DataFieldControl> fields, ArrayList notifications);
        bool ValidateForInsert(Dictionary<string, DataFieldControl> dataEntryFields, ArrayList notifications);
        bool ValidateForSaveEntering(Dictionary<string, DataFieldControl> dataEntryFields, ArrayList notifications);
        bool ValidateForVerify(Dictionary<string, DataFieldControl> dataEntryFields, ArrayList notifications);
        bool ValidateForVerifyCorrection(Dictionary<string, DataFieldControl> dataEntryFields, ArrayList notifications);
        bool ValidateForSaveSingleEntered(Dictionary<string, DataFieldControl> dataEntryFields, ArrayList notifications);
        bool ValidateForSaveDoubleEntered(Dictionary<string, DataFieldControl> dataEntryFields, ArrayList notifications);
        bool ValidateForNoData(Dictionary<string, DataFieldControl> dataEntryFields, ArrayList notifications);
        bool ValidateForScore(Dictionary<string, DataFieldControl> dataEntryFields, ArrayList notifications);
        DataEntryController DataEntryController
        {
            get;
            set;
        }
    }
}