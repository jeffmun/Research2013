using System;
using System.ComponentModel;
using System.ComponentModel.Design;
using System.Web.UI;
using System.Web.UI.Design;

namespace DataEntryFramework.Old.Design
{
	public class DataFieldControlDesigner : ControlDesigner 
	{
		public override string GetDesignTimeHtml() 
		{
		/*	// Retrieve the controls to ensure they are created.
			ControlCollection controls = ((Control)Component).Controls;
			return base.GetDesignTimeHtml(); */

			// Retrieve the controls to ensure they are created.
			ControlCollection controls = ((Control)Component).Controls;
			DataFieldControl dfc = (DataFieldControl)Component;
			
			string designTimeHtml = null;
			string originalText = string.Empty;
			string originalFormatString = string.Empty;
			try
			{


				//Make a string to indicate the current settings
				// for field and set it as the field text
				string settings = string.Empty;
				if (dfc.IsInsertField == true)
				{
						if(dfc.IsInsertValueRequired == true)
							settings += "Ir";
						else
							settings += "I";
				}
				if (dfc.IsEntryField == true)
				{	
					if (dfc.IsEntryValueRequired)
						settings += (settings == string.Empty)? "Er" : ",Er";
					else
						settings += (settings == string.Empty)? "E" : ",E";

				}
				if (dfc.IsDoubleEntryField == true) settings += (settings == string.Empty)? "D" : ",D";
				if (dfc.IsReadOnly == true) settings += (settings == string.Empty)? "R" : ",R";

				string ftype = string.Empty;
				switch (dfc.FieldDataType)
				{	
					case FieldDataType.INT:
						ftype = "[INT]";
						break;
					case FieldDataType.FLOAT:
						ftype = "[FLOAT]";
						break;
					case FieldDataType.DATE:
						ftype = "[DATE]";
						break;
					case FieldDataType.TEXT:
						ftype = "[TEXT]";
						break;
				}


				// save any existing text and format string
				originalText = dfc.FieldTextBoxText;
				originalFormatString = dfc.FormatString;

				//Clear the format.  This is needed to allow setting
				//of fieldtextboxtext without causing an attempt to format
				//an invalid value
				dfc.FormatString = string.Empty;
				dfc.FieldTextBoxText = ((settings != string.Empty)? "[" + settings + "] " : "") + ftype + originalText;

				if (dfc.ShowAllForLayout)
				{
					//set some fake errors
					dfc.AddError("Sample Error 1");
					dfc.AddError("Sample Error 2");
					dfc.AddError("Sample Error 3");

					//show override check box
					dfc.VerifyError = true;

				}

				// return the html
				designTimeHtml =  base.GetDesignTimeHtml();
				
			}
			catch (Exception ex)
			{
				designTimeHtml = GetErrorDesignTimeHtml(ex);
			}
			finally 
			{
				// restore original control settings
				dfc.FormatString = originalFormatString;
				dfc.FieldTextBoxText = originalText;

				//clear errors
				dfc.ClearErrors();

				//turn off override check box
				dfc.VerifyError = false;
			}

			if ((designTimeHtml == null) || (designTimeHtml.Length == 0))
			{
				designTimeHtml = GetEmptyDesignTimeHtml();
			}

			//return
			return designTimeHtml;

		}


		public override void Initialize(IComponent component) 
		{
			if (!(component is Control) &&
				!(component is INamingContainer)) 
			{
				throw new ArgumentException(
					"Component must be a container control.", "component");
			}
			base.Initialize(component);
		}
	}
}
