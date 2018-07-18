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
    public class Utility
    {
        //Set ctlFound to the first instance of a control of type t in
        //any of c's descendants.
        //
        //If not found ctlFound == null
        public static void FindControlByTypeRecursive(
            Type t, //type to look for
            Control ctlSearchHere, //look in controls collection
            ref Control ctlFound //Set to found control
            )
        {
            int i = 0;
            while (i < ctlSearchHere.Controls.Count && ctlFound == null)
            {
                if (object.ReferenceEquals(ctlSearchHere.Controls[i].GetType(), t))
                {
                    ctlFound = ctlSearchHere.Controls[i];
                    break;
                }
                else
                {
                    FindControlByTypeRecursive(t, ctlSearchHere.Controls[i], ref ctlFound);
                }
                ++i;
            }
        }
    }
}