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
    public interface IFormatter
    {
        void FormatInserting(DataEntryController dec);
        void FormatEntering(DataEntryController dec);
        void FormatSingleEntered(DataEntryController dec);
        void FormatDoubleEntering(DataEntryController dec);
        void FormatCorrectingDoubleEntering(DataEntryController dec);
        void FormatDoubleEntered(DataEntryController dec);
        void FormatNoData(DataEntryController dec);
    }
}