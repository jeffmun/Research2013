using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace DataEntryFramework3
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

}