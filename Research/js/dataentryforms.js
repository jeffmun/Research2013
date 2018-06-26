//Called by link in ADI data entry forms to display ADI scoring report
var FORM_FIELD_PREFIX = "ctl00_oBodyPlaceHolder_";

function showADIReport(sIDField, sADIForm)
{
	var oIDField = document.getElementById(sIDField);
	var sID = oIDField.value;

	if (sID == "")
		alert("Lookup an existing ADI or enter and score a new one first.");
	else
		open("/DataSummary/SingleSubject/" + sADIForm + "?selSubjectID=" + sID);
}



// Default event handler for all data entry field text box onFocus events
function selectField()
{
	event.srcElement.className='selectedfieldtextbox';
}


// Default event handler for all data entry field text box onBlue events
function unselectField()
{
	event.srcElement.className='fieldtextbox';
}



//get/set data entry field textbox values
function setFieldValueIfBlank(sFieldID, sValue)
{
	var fieldTextBox = document.getElementById(sFieldID + "_fieldTextBox");
	if (isBlank(fieldTextBox.value) == true)
	{
		fieldTextBox.value = sValue;
	}
}

function setFieldValue(sFieldID, sValue)
{
	var fieldTextBox = document.getElementById(sFieldID + "_fieldTextBox");
	fieldTextBox.value = sValue;
}

function getFieldValue(sFieldID)
{
	var fieldTextBox = document.getElementById(sFieldID + "_fieldTextBox");
	return fieldTextBox.value;
}


function giveFieldFocus(sFieldID)
{
	var fieldTextBox = document.getElementById(sFieldID + "_fieldTextBox");
	fieldTextBox.focus();
}


/*
 *
 *
 */
 /* Not Used
function edst3_evt_onBlur(sFieldID)
{
	unselectField();
	
	//alert(getFieldValue(sFieldID));

	if (isBlank(getFieldValue("evtstd")) == true)
		setFieldValue("evtstd", "66");
}
*/



/*
 * OnBlur event handler for special edst3_adi.aspx fields
 *
 */
 /* Not Used
function edst3_adi_onBlur(sFieldID)
{
	unselectField();
			

	switch (sFieldID) {
	
		case "AD019":
			if (getFieldValue(sFieldID) == 1 || getFieldValue(sFieldID) == 2)
			{
				setFieldValueIfBlank("AD020cu", "8");
				setFieldValueIfBlank("AD020mo", "8");
				setFieldValueIfBlank("AD022cu", "8");
				setFieldValueIfBlank("AD022ev", "8");
				setFieldValueIfBlank("AD023cu", "8");
				setFieldValueIfBlank("AD023ev", "8");
				setFieldValueIfBlank("AD024cu", "8");
				setFieldValueIfBlank("AD024ev", "8");
				setFieldValueIfBlank("AD025cu", "8");
				setFieldValueIfBlank("AD025ev", "8");
			}
			break;

	}
}
*/


/*
 * OnBlur event handler for special gen_adi.aspx fields
 *
 */
 /* Not Used
function gen_adi_onBlur(sFieldID)
{
	unselectField();
			

	switch (sFieldID) {
	
		case  FORM_FIELD_PREFIX + "AD019":
			if (getFieldValue(sFieldID) == 1 || getFieldValue(sFieldID) == 2)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD020cu", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD020mo", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD022cu", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD022ev", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD023cu", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD023ev", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD024cu", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD024ev", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD025cu", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD025ev", "8");
			}
			break;

	}
}

*/

/*
 * OnBlur event handler for special SeizureScreen.aspx fields
 *
 */
function SeizureScreen_onBlur(sFieldID)
{
	unselectField();

	switch (sFieldID) {

		case FORM_FIELD_PREFIX + "SS2Choice":
			if (getFieldValue(sFieldID) == "1")
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "SS3aChoice", "4");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "SS3bChoice", "4");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "SS3cChoice", "4");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "SS3dChoice", "4");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "SS3eChoice", "4");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "SS3fChoice", "4");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "SS3gChoice", "4");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "SS4Choice", "4");
			}
			break;
	}
}


/*
 * OnBlur event handler for special adi_wps.aspx fields
 *
 */
function adi_wps_onBlur(sFieldID)
{
	unselectField();

		
	switch (sFieldID) {
	
		case  FORM_FIELD_PREFIX + "ad011ev":
			if (getFieldValue(sFieldID) == "0")
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad012ev", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad013ev", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad014ev", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad015ev", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad016ev", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad017", "998");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad018ev", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad019", "998");
			}
			break;

		case  FORM_FIELD_PREFIX + "ad020ev":
			if (getFieldValue(sFieldID) == "0")
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad021ev", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad022ev", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad023ev", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad024ev", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad025ev", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad026", "998");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad027ev", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad028", "998");
			}		
			break;

		case  FORM_FIELD_PREFIX + "ad030cu":
			if (getFieldValue(sFieldID) == "1" || getFieldValue(sFieldID) == "2")
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD033cu", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD034cu", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD035cu", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD036cu", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD037cu", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD038cu", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD039cu", "8");
			
			}
			break;
	}
}

/*
 * OnBlur event handler for special adi_wps+loss.aspx fields
 *
 */
function adi_wps_loss_onBlur(sFieldID)
{
	unselectField();

		
	switch (sFieldID) {
	
		case  FORM_FIELD_PREFIX + "ad011ev":
		  setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad016la", getFieldValue(sFieldID));
			if (getFieldValue(sFieldID) == "0")
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad012ev", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad013ev", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad014ev", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad015ev", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad016ev", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad017", "998");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad018ev", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad019", "998");
		// ADI Loss Insert auto-fills for no loss.
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad011l2", "998");
				//setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad011l2a", "998");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad012la", "8");
				// Don't auto-fill the 12-b box.
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad012lc", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad012ld", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad012le", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad012lf", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad013la", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad014lb", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad015la", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad016la", "0");
				//setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad016lb1", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad016lb2", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad016lb3", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad017la", "998");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad018la", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad018lb1", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad018lb2", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad019la", "998");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad019lb1", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad019lb2", "8");
			}
			break;

	case  FORM_FIELD_PREFIX + "ad020la":
			if (getFieldValue(sFieldID) == "0")
			{
			  setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad021la", "0");
			  setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad022la", "0");
			  setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad023la", "0");
			  setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad024la", "0");
			  setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad025la", "0");
			  setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad025lb", "0");
			  setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad026la", "998");
			  setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad027la", "8");
			  setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad028la", "998");
			  setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad028lb1", "998");
			  setFieldValueIfBlank(FORM_FIELD_PREFIX + "ad028lb2", "998");		
			}		
			break;
	}
}


/*
 * OnBlur event handler for special tap_adi_todder.aspx fields
 *
 */
function tap_adi_toddler_onBlur(sFieldID)
{
	unselectField();
	
	// do field specific processing
		switch (sFieldID) {

		case FORM_FIELD_PREFIX + "AD021CU":
			if (getFieldValue(sFieldID) == 1 || getFieldValue(sFieldID) == 2)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD022cu", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD058cu", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD059cu", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD060cu", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD061cu", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD062cu", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD063cu", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD065cu", "8");
			}
			break;
			
		case  FORM_FIELD_PREFIX + "AD024ev":
			if (getFieldValue(sFieldID) == "0")
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD025ev", "8");
				
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD026", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD027", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD028", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD029", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD030", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD031", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD032", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD033", "0");
				
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD034", "998");
				
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD035EV", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD036EV", "9");
				
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD037", "998");
				
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD038", "9");
				
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD060cu", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD061cu", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD062cu", "8");
				
				
				
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD063cu", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD065cu", "8");
			}
			break;
	
		case  FORM_FIELD_PREFIX + "AD039EV":
			if (getFieldValue(sFieldID) == "0")
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD040EV", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD041EV", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD042EV", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD043EV", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD044EV", "0");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD045EV", "0");

				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD046mo", "998");
				
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_1A", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_2A", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_3A", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_4A", "8");
				
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_1B", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_2B", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_3B", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_4B", "8");

				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_1C", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_2C", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_3C", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_4C", "8");

				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_1D", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_2D", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_3D", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_4D", "8");

				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_1E", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_2E", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_3E", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_4E", "8");

				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_1F", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_2F", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_3F", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_4F", "8");

				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_1G", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_2G", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_3G", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_4G", "8");

				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_1H", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_2H", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_3H", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_4H", "8");

				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_1I", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_2I", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_3I", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_4I", "8");

				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_1J", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_2J", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_3J", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_4J", "8");

				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_1K", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_2K", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_3K", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_4K", "8");

				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_1L", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_2L", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_3L", "8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD047_4L", "8");

				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD048EV", "8");
				
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD049mo", "998");
				}
			break;
			
			
			case  FORM_FIELD_PREFIX + "AD093ev":
				if (getFieldValue(sFieldID) == "0" || getFieldValue(sFieldID) == 8 || getFieldValue(sFieldID) == 9)
				{
					setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD093mo", "999");
				}
				break;
				
			
			case  FORM_FIELD_PREFIX + "AD094ev":
				if (getFieldValue(sFieldID) == "0" || getFieldValue(sFieldID) == 8 || getFieldValue(sFieldID) == 9)
				{
					setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD094mo", "999");
				}
				break;

			case  FORM_FIELD_PREFIX + "AD095ev":
				if (getFieldValue(sFieldID) == "0" || getFieldValue(sFieldID) == 8 || getFieldValue(sFieldID) == 9)
				{
					setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD095mo", "999");
				}
				break;


			case  FORM_FIELD_PREFIX + "AD096ev":
				if (getFieldValue(sFieldID) == "0" || getFieldValue(sFieldID) == 8 || getFieldValue(sFieldID) == 9)
				{
					setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD096mo", "999");
				}
				break;


			case  FORM_FIELD_PREFIX + "AD097ev":
				if (getFieldValue(sFieldID) == "0" || getFieldValue(sFieldID) == 8 || getFieldValue(sFieldID) == 9)
				{
					setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD097mo", "999");
				}
				break;


			case  FORM_FIELD_PREFIX + "AD098ev":
				if (getFieldValue(sFieldID) == "0" || getFieldValue(sFieldID) == 8 || getFieldValue(sFieldID) == 9)
				{
					setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD098mo", "999");
				}
				break;


			case  FORM_FIELD_PREFIX + "AD099ev":
				if (getFieldValue(sFieldID) == "0" || getFieldValue(sFieldID) == 8 || getFieldValue(sFieldID) == 9)
				{
					setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD099mo", "999");
				}
				break;


			case  FORM_FIELD_PREFIX + "AD100ev":
				if (getFieldValue(sFieldID) == "0" || getFieldValue(sFieldID) == 8 || getFieldValue(sFieldID) == 9)
				{
					setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD100mo", "999");
				}
				break;
				
			case  FORM_FIELD_PREFIX + "AD101ev":
				if (getFieldValue(sFieldID) == "0" || getFieldValue(sFieldID) == 8 || getFieldValue(sFieldID) == 9)
				{
					setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD101mo", "999");
				}
				break;
				
				
			case  FORM_FIELD_PREFIX + "AD102ev":
				if (getFieldValue(sFieldID) == "0" || getFieldValue(sFieldID) == 8 || getFieldValue(sFieldID) == 9)
				{
					setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD102mo", "999");
				}
				break;


			case  FORM_FIELD_PREFIX + "AD103ev":
				if (getFieldValue(sFieldID) == "0" || getFieldValue(sFieldID) == 8 || getFieldValue(sFieldID) == 9)
				{
					setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD103mo", "999");
				}
				break;


			case  FORM_FIELD_PREFIX + "AD104ev":
				if (getFieldValue(sFieldID) == "0" || getFieldValue(sFieldID) == 8 || getFieldValue(sFieldID) == 9)
				{
					setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD104mo", "999");
				}
				break;


			case  FORM_FIELD_PREFIX + "AD105ev":
				if (getFieldValue(sFieldID) == "0" || getFieldValue(sFieldID) == 8 || getFieldValue(sFieldID) == 9)
				{
					setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD105mo", "999");
				}
				break;


			case  FORM_FIELD_PREFIX + "AD106ev":
				if (getFieldValue(sFieldID) == "0" || getFieldValue(sFieldID) == 8 || getFieldValue(sFieldID) == 9)
				{
					setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD106mo", "999");
				}
				break;


			case  FORM_FIELD_PREFIX + "AD107ev":
				if (getFieldValue(sFieldID) == "0" || getFieldValue(sFieldID) == 8 || getFieldValue(sFieldID) == 9)
				{
					setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD107mo", "999");
				}
				break;


			case  FORM_FIELD_PREFIX + "AD108ev":
				if (getFieldValue(sFieldID) == "0" || getFieldValue(sFieldID) == 8 || getFieldValue(sFieldID) == 9)
				{
					setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD108mo", "999");
				}
				break;


			case  FORM_FIELD_PREFIX + "AD109ev":
				if (getFieldValue(sFieldID) == "0" || getFieldValue(sFieldID) == 8 || getFieldValue(sFieldID) == 9)
				{
					setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD109mo", "999");
				}
				break;


			case FORM_FIELD_PREFIX +  "AD110ev":
				if (getFieldValue(sFieldID) == "0" || getFieldValue(sFieldID) == 8 || getFieldValue(sFieldID) == 9)
				{
					setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD110mo", "999");
				}
				break;
				
			case  FORM_FIELD_PREFIX + "AD111ev":
				if (getFieldValue(sFieldID) == "0" || getFieldValue(sFieldID) == 8 || getFieldValue(sFieldID) == 9)
				{
					setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD111mo", "999");
				}
				break;


			case  FORM_FIELD_PREFIX + "AD112ev":
				if (getFieldValue(sFieldID) == "0" || getFieldValue(sFieldID) == 8 || getFieldValue(sFieldID) == 9)
				{
					setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD112mo", "999");
				}
				break;


			case  FORM_FIELD_PREFIX + "AD113ev":
				if (getFieldValue(sFieldID) == "0" || getFieldValue(sFieldID) == 8 || getFieldValue(sFieldID) == 9)
				{
					setFieldValueIfBlank(FORM_FIELD_PREFIX + "AD113mo", "999");
				}
				break;

	
	}
}

/*
 * OnBlur event handler for special SSRS_7to12_Teacher.aspx fields
 *
 */
function SSRS_7to12_Teacher_onBlur(sFieldID)
{
	unselectField();

	switch (sFieldID) {
	
		case  FORM_FIELD_PREFIX + "Handica":
			if (getFieldValue(sFieldID) == "0")
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "HaClass", "4");
			}
			break;
	}
}

/*
 * OnBlur event handler for special MedPsychHx.aspx fields
 *
 */
function MedPsychHx_onBlur(sFieldID)
{
	unselectField();
	
	// do field specific processing
	switch (sFieldID) {

		case FORM_FIELD_PREFIX + "hxcopy":
			if (getFieldValue(sFieldID) == 1) {
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx1a1", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx1c1", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx2", "1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3ahas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3bhas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3chas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3dhas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3ehas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3fhas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3ghas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3hhas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3ihas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3jhas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3khas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3lhas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3mhas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3nhas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3ohas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3phas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3qhas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3rhas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3shas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3thas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3uhas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3vhas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3whas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3xhas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx3yhas", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4a", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4b", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4c", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4d", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4e", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4f", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4g", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4h", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx5a", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx5b", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx5c", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx5d", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx5e", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx5f", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx5g", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx5h", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx5i", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx5j", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6a", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6awhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6b", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6bwhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6c", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6cwhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6d", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6dwhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6e", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6ewhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6f", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6fwhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6g", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6gwhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6h", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6hwhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6i", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6iwhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6j", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6jwhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6k", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6kwhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6l", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6lwhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6m", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6mwhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6n", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6nwhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6o", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6owhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6p", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6pwhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6q", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6qwhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6r", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6rwhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6s", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6swhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx7a", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx7b", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx7c", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx7d", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx8a", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx8awhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx8b", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx8bwhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9a", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9awhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9b", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9bwhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9c", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9cwhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9d", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9dwhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9e", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9ewhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9f", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9fwhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9g", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9gwhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9h", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9hwhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9i", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9iwhen", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx10", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx10b", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx12a", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx12b", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx12c", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx12d", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx12e", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx12f", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx12g", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx12h", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx12i", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx12j", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx12k", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx12l", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx12m", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx12n", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx13", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx15", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx15a", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx15b", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx15c", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx15d", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx16a", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx16b", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx16c", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx17a", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx17b", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx17c", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx17d", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx17ds", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx17e", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx17es", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx17f", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx17fs", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx18", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hxrevw", "-9");
			}
			break;

		case FORM_FIELD_PREFIX + "hx4":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4a", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4b", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4c", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4d", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4e", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4f", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4g", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4h", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4a", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4b", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4c", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4d", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4e", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4f", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4g", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4h", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4a", "-7");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4b", "-7");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4c", "-7");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4d", "-7");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4e", "-7");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4f", "-7");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4g", "-7");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4h", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4a", "-8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4b", "-8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4c", "-8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4d", "-8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4e", "-8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4f", "-8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4g", "-8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx4h", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx6a":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6awhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6awhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6awhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6awhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx6b":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6bwhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6bwhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6bwhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6bwhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx6c":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6cwhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6cwhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6cwhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6cwhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx6d":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6dwhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6dwhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6dwhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6dwhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx6e":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6ewhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6ewhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6ewhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6ewhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx6f":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6fwhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6fwhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6fwhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6fwhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx6g":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6gwhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6gwhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6gwhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6gwhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx6h":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6hwhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6hwhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6hwhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6hwhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx6i":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6iwhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6iwhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6iwhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6iwhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx6j":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6jwhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6jwhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6jwhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6jwhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx6k":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6kwhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6kwhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6kwhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6kwhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx6l":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6lwhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6lwhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6lwhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6lwhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx6m":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6mwhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6mwhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6mwhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6mwhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx6n":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6nwhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6nwhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6nwhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6nwhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx6o":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6owhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6owhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6owhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6owhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx6p":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6pwhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6pwhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6pwhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6pwhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx6q":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6qwhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6qwhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6qwhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6qwhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx6r":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6rwhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6rwhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6rwhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6rwhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx6s":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6swhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6swhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6swhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx6swhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx8a":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx8awhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx8awhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx8awhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx8awhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx8b":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx8bwhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx8bwhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx8bwhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx8bwhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx9a":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9awhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9awhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9awhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9awhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx9b":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9bwhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9bwhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9bwhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9bwhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx9c":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9cwhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9cwhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9cwhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9cwhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx9d":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9dwhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9dwhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9dwhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9dwhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx9e":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9ewhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9ewhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9ewhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9ewhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx9f":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9fwhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9fwhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9fwhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9fwhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx9g":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9gwhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9gwhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9gwhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9gwhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx9h":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9hwhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9hwhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9hwhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9hwhen", "-8");
			}
			break;

		case  FORM_FIELD_PREFIX + "hx9i":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9iwhen", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9iwhen", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9iwhen", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx9iwhen", "-8");
			}
			break;

		case FORM_FIELD_PREFIX + "hx15":
			if (getFieldValue(sFieldID) == 0 || getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx15a", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx15b", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx15c", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx15d", "-9");
			}
			else if (getFieldValue(sFieldID) == -1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx15a", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx15b", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx15c", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx15d", "-1");
			}
			else if (getFieldValue(sFieldID) == -7)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx15a", "-7");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx15b", "-7");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx15c", "-7");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx15d", "-7");
			}
			else if (getFieldValue(sFieldID) == -8)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx15a", "-8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx15b", "-8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx15c", "-8");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "hx15d", "-8");
			}
			break;

  } // switch close
} // function close

/*
 * OnBlur event handler for special GernsOM.aspx fields
 *
 */
function GernsOM_onBlur(sFieldID)
{
	unselectField();
	
	// do field specific processing
	switch (sFieldID) {

	case FORM_FIELD_PREFIX + "GOMMonth":
	  if (getFieldValue(sFieldID)< 0 || getFieldValue(sFieldID)> 12)
	  {
		setFieldValue(FORM_FIELD_PREFIX + "GOM6mo","-9");
	  }   
	  else if (getFieldValue(sFieldID) > 6)
	  {
		setFieldValue(FORM_FIELD_PREFIX + "GOM6mo",(Number(getFieldValue(sFieldID)) - 6));
	  }
	  else
	  {
		setFieldValue(FORM_FIELD_PREFIX + "GOM6mo",(6 + Number(getFieldValue(sFieldID))));
	  }
	  break;
	
		case FORM_FIELD_PREFIX + "GOM02":
			if (getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM03", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM04", "-9");
			}
			else if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM03", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM24", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM25", "-1");
			}
			else if (getFieldValue(sFieldID) == 1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM04", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM22", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM23", "-1");
			}
			break;

		case FORM_FIELD_PREFIX + "GOM06":
			if (getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM07", "-9");
			}
			else if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM07", "-1");
			}
			break;

		case FORM_FIELD_PREFIX + "GOM08":
			if (getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM09", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM10", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM11", "-9");
			}
			else if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM09", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM10", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM11", "-1");
			}
			break;

		case FORM_FIELD_PREFIX + "GOM12":
			if (getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM13", "-9");
			}
			else if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM13", "-1");
			}
			break;

		case FORM_FIELD_PREFIX + "GOM14":
			if (getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM15", "-9");
			}
			else if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM15", "-1");
			}
			break;

		case FORM_FIELD_PREFIX + "GOM16":
			if (getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM18", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM19", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM20", "-9");
			}
			else if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM18", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM19", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM20", "-1");
			}
			break;

		case FORM_FIELD_PREFIX + "GOM18":
			if (getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM19", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM20", "-9");
			}
			else if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM19", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM20", "-1");
			}
			break;

		case FORM_FIELD_PREFIX + "GOM19":
			if (getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM20", "-9");
			}
			else if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM20", "-1");
			}
			break;

		case FORM_FIELD_PREFIX + "GOM22":
			if (getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM23", "-9");
			}
			else if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM23", "-1");
			}
			break;

		case FORM_FIELD_PREFIX + "GOM24":
			if (getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM25", "-9");
			}
			else if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM25", "-1");
			}
			break;

		case FORM_FIELD_PREFIX + "GOM26":
			if (getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM27", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM28", "-9");
			}
			else if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM27", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM28", "-1");
			}
			break;

		case FORM_FIELD_PREFIX + "GOM29":
			if (getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM31", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM32", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM33", "-9");
			}
			else if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM31", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM32", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM33", "-1");
			}
			break;

		case FORM_FIELD_PREFIX + "GOM31":
	  if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM32", "-1");
			}
			break;

		case FORM_FIELD_PREFIX + "GOM34":
			if (getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM35", "-9");
			}
			else if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM35", "-1");
			}
			break;

		case FORM_FIELD_PREFIX + "GOM36":
			if (getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM37", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM38", "-9");
			}
			else if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM37", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM38", "-1");
			}
			break;

		case FORM_FIELD_PREFIX + "GOM40":
			if (getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM41", "-9");
			}
			else if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM41", "-1");
			}
			break;

		case FORM_FIELD_PREFIX + "GOM45":
			if (getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM46", "-9");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM47", "-9");
			}
			else if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM46", "-1");
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM47", "-1");
			}
			break;

		case FORM_FIELD_PREFIX + "GOM53":
			if (getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM54", "-9");
			}
			else if (getFieldValue(sFieldID) == 0)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM54", "-1");
			}
			break;

		case FORM_FIELD_PREFIX + "GOM55":
			if (getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM56", "-9");
			}
			else if (getFieldValue(sFieldID) == 1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM56", "-1");
			}
			break;

		case FORM_FIELD_PREFIX + "GOM59":
			if (getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM60", "-9");
			}
			else if (getFieldValue(sFieldID) == 1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM60", "-1");
			}
			break;

		case FORM_FIELD_PREFIX + "GOM61":
			if (getFieldValue(sFieldID) == -9)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM62", "-9");
			}
			else if (getFieldValue(sFieldID) == 1)
			{
				setFieldValueIfBlank(FORM_FIELD_PREFIX + "GOM62", "-1");
			}
			break;

  } // switch close
} // function close

/*
 * OnBlur event handler for special OMInven.aspx fields
 *
 */
function OMInven_onBlur(sFieldID)
{
	unselectField();
	
	// do field specific processing
	switch (sFieldID) {

	case FORM_FIELD_PREFIX + "OM01Age":
	  setFieldValueIfBlank(FORM_FIELD_PREFIX + "OM02Age",getFieldValue(sFieldID));
	  setFieldValueIfBlank(FORM_FIELD_PREFIX + "OM03Age",getFieldValue(sFieldID));
	  setFieldValueIfBlank(FORM_FIELD_PREFIX + "OM04Age",getFieldValue(sFieldID));
	  setFieldValueIfBlank(FORM_FIELD_PREFIX + "OM05Age",getFieldValue(sFieldID));
	  setFieldValueIfBlank(FORM_FIELD_PREFIX + "OM06Age",getFieldValue(sFieldID));
	  setFieldValueIfBlank(FORM_FIELD_PREFIX + "OM07Age",getFieldValue(sFieldID));
	  setFieldValueIfBlank(FORM_FIELD_PREFIX + "OM08Age",getFieldValue(sFieldID));
	  setFieldValueIfBlank(FORM_FIELD_PREFIX + "OM09Age",getFieldValue(sFieldID));
	  setFieldValueIfBlank(FORM_FIELD_PREFIX + "OM10Age",getFieldValue(sFieldID));
	  setFieldValueIfBlank(FORM_FIELD_PREFIX + "OM11Age",getFieldValue(sFieldID));
	  setFieldValueIfBlank(FORM_FIELD_PREFIX + "OM12Age",getFieldValue(sFieldID));
	  setFieldValueIfBlank(FORM_FIELD_PREFIX + "OM13Age",getFieldValue(sFieldID));
	  setFieldValueIfBlank(FORM_FIELD_PREFIX + "OM14Age",getFieldValue(sFieldID));
	  setFieldValueIfBlank(FORM_FIELD_PREFIX + "OM15Age",getFieldValue(sFieldID));
	  setFieldValueIfBlank(FORM_FIELD_PREFIX + "OM16Age",getFieldValue(sFieldID));
	  break;
  } // switch close
} // function close
