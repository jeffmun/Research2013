using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Linq;
using System.Web.Services;
using DevExpress.Web;

/// <summary>
/// Summary description for popupform
/// </summary>




namespace uwac.trk
{


	/// <summary>
	/// Summary description for popupform
	/// </summary>
	public static class popupdata 
	{

		

		public static void AddField(OrderedDictionary newvals, ASPxGridView gv, string fldname, string ctlname, DevExpress.Web.ControlType ctype)
		{

			//Check to see if there is a checkbox "DoNotUpdate" and do not process if checked
			ASPxCheckBox chk = (ASPxCheckBox)gv.FindEditFormLayoutItemTemplateControl(ctlname + "_DoNotUpdate");

			bool processThisControl = true;
			if(chk !=null) {
				if (chk.Checked == true) processThisControl = false;
			}


			if (processThisControl)
			{
				switch (ctype)
				{
					case DevExpress.Web.ControlType.ASPxComboBox:
						ASPxComboBox cbo = (ASPxComboBox)gv.FindEditFormLayoutItemTemplateControl(ctlname);
						newvals[fldname] = cbo.Value;
						break;
					case DevExpress.Web.ControlType.ASPxTextBox:
						ASPxTextBox txt = (ASPxTextBox)gv.FindEditFormLayoutItemTemplateControl(ctlname);
						newvals[fldname] = txt.Value;
						break;
					case DevExpress.Web.ControlType.ASPxMemo:
						ASPxMemo mem = (ASPxMemo)gv.FindEditFormLayoutItemTemplateControl(ctlname);
						newvals[fldname] = mem.Value;
						break;
					case DevExpress.Web.ControlType.ASPxCalendar:
						ASPxCalendar cal = (ASPxCalendar)gv.FindEditFormLayoutItemTemplateControl(ctlname);
						newvals[fldname] = cal.Value;
						break;
					case DevExpress.Web.ControlType.ASPxDateEdit:
						ASPxDateEdit dateedit = (ASPxDateEdit)gv.FindEditFormLayoutItemTemplateControl(ctlname);
						newvals[fldname] = dateedit.Value;
						break;

				}

			}
			else
			{
				//remove the field from the update as it is not to be updated
				newvals.Remove(fldname);
			}

		}

	}
}