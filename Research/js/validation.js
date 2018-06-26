/***********************************************************************************************
BEGIN WEBCAL VALIDATION CODE
***********************************************************************************************/
function DoSubmitWebCal()
{
	var sFromDate = GetReferenceToASPNETControl('txtStartDate').value;
	var sToDate = GetReferenceToASPNETControl('txtEndDate').value;
	var sErr = '';

	if (!IsValidDate(sFromDate))
		sErr += 'The Start Date you entered is invalid. Dates must be in the format: mm/dd/yyyy.\n';

	if (!IsValidDate(sToDate))
		sErr += 'The End Date you entered is invalid. Dates must be in the format: mm/dd/yyyy.\n';

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}
function DoSubmitSchedMiscItem()
{
	var txtApptDate = GetReferenceToASPNETControl('txtApptDate');
	var selStartTime = GetReferenceToASPNETControl('selStartTime');
	var selEndTime = GetReferenceToASPNETControl('selEndTime');
	var selActionID = GetReferenceToASPNETControl('selActionID');
	var selStaffID = GetReferenceToASPNETControl('selStaffID');
	var txtNotes = GetReferenceToASPNETControl('txtNotes');
	var selAdditionalStaffIDs = GetReferenceToASPNETControl('selAdditionalStaffIDs');
	var selAsstRole = GetReferenceToASPNETControl('selAsstRole');
	var dtStartDate = null;
	var dtEndDate = null;
	var nYear = null;
	var nMonth = null;
	var nDay = null;
	var nHour = null;
	var nMinute = null;
	var sErr = '';

	if (IsBlank(txtApptDate.value))
		sErr += 'You must enter and Appointment Date.\n';
	else if (!IsValidDate(txtApptDate.value))
		sErr += 'The Appointment Date you enter must be in the format: mm/dd/yyyy.\n';

	if (selStartTime.options[selStartTime.selectedIndex].value == -1)
		sErr += 'You must select a Start Time.\n';

	if (selEndTime.options[selEndTime.selectedIndex].value == -1)
		sErr += 'You must select an End Time.\n';

	if (IsBlank(sErr))
	{
		dtStartDate = new Date();
		dtEndDate = new Date();

		nYear = txtApptDate.value.slice(6);
		nMonth = txtApptDate.value.slice(0, 2);
		nDay = txtApptDate.value.slice(3, 5);

		dtStartDate.setFullYear(nYear, nMonth-1, nDay);
		dtEndDate.setFullYear(nYear, nMonth-1, nDay);

		nHour = selStartTime.options[selStartTime.selectedIndex].value.slice(0, 2);
		nMinute = selStartTime.options[selStartTime.selectedIndex].value.slice(3, 5);
		dtStartDate.setHours(nHour, nMinute, 0, 0);

		nHour = selEndTime.options[selEndTime.selectedIndex].value.slice(0, 2);
		nMinute = selEndTime.options[selEndTime.selectedIndex].value.slice(3, 5);
		dtEndDate.setHours(nHour, nMinute, 0, 0);

		if (dtEndDate < dtStartDate)
			sErr += 'The End Time must be after the Start Time.\n';
	}

	if (selActionID.options[selActionID.selectedIndex].value == -1)
		sErr += 'You must select an Action.\n';

	if (selStaffID.options[selStaffID.selectedIndex].value == -1)
		sErr += 'You must select a Staff Member.\n';

	if (HasAnItemSelected(selAdditionalStaffIDs))
	{
		if (selAsstRole.options[selAsstRole.selectedIndex].value == -1)
			sErr += 'If you are going to select Assistant Staff, you must select an Asst. Role.\n';
	}

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function DoSubmitScheduleAction()
{
	var txtDateDone = GetReferenceToASPNETControl('txtDateDone');
	var selStartTime = GetReferenceToASPNETControl('selStartTime');
	var selEndTime = GetReferenceToASPNETControl('selEndTime');
	var dtStartDate = null;
	var dtEndDate = null;
	var nYear = null;
	var nMonth = null;
	var nDay = null;
	var nHour = null;
	var nMinute = null;
	var sErr = '';

	if (IsBlank(txtDateDone.value))
		sErr += 'You must enter an Appointment Date.\n';
	else if (!IsValidDate(txtDateDone.value))
		sErr += 'The Appointment Date must be in the format: mm/dd/yyyy.\n';

	if (selStartTime.options[selStartTime.selectedIndex].value == -1)
		sErr += 'You must enter a Start Time.\n';

	if (selEndTime.options[selEndTime.selectedIndex].value == -1)
		sErr += 'You must enter an End Time.\n';

	if (IsBlank(sErr))
	{
		dtStartDate = new Date();
		dtEndDate = new Date();

		nYear = txtDateDone.value.slice(6);
		nMonth = txtDateDone.value.slice(0, 2);
		nDay = txtDateDone.value.slice(3, 5);

		dtStartDate.setFullYear(nYear, nMonth-1, nDay);
		dtEndDate.setFullYear(nYear, nMonth-1, nDay);

		nHour = selStartTime.options[selStartTime.selectedIndex].value.slice(0, 2);
		nMinute = selStartTime.options[selStartTime.selectedIndex].value.slice(3, 5);
		dtStartDate.setHours(nHour, nMinute, 0, 0);

		nHour = selEndTime.options[selEndTime.selectedIndex].value.slice(0, 2);
		nMinute = selEndTime.options[selEndTime.selectedIndex].value.slice(3, 5);
		dtEndDate.setHours(nHour, nMinute, 0, 0);

		if (dtEndDate < dtStartDate)
			sErr += 'The End Time must be after the Start Time.\n';
	}

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function DoSubmitAddAssistants()
{
	var oForm = document.forms[0].elements;
	var sRegExp = /,/;
	var bDeleteMsg = true;
	var sErr = '';
	var i = 0;

	for (i=0;i<oForm.length;i++)
	{
		if (oForm[i].name == 'selStaffID' && oForm[i].options[oForm[i].selectedIndex].value != -1)
		{
			bDeleteMsg = false;

			if (oForm[i+1].options[oForm[i+1].selectedIndex].value == -1)
			{
				sErr = 'For each Staff Member you select, you must select a Role.\n';
				break;
			}
		}
		else if (oForm[i].name == 'txtStaffNotes')
		{
			while (oForm[i].value.indexOf(',') >= 0)
				oForm[i].value = oForm[i].value.replace(sRegExp, '|');
		}
	}

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else if (bDeleteMsg)
	{
		if (window.confirm('All assistants assigned to this Action will be removed. Do you want to continue?'))
			return true;
		else
			return false;	
	}
	else
		return true;
}

/***********************************************************************************************
BEGIN HOUSEHOLD VALIDATION CODE
***********************************************************************************************/
function DoSubmitSearchHouseholds()
{
	var txtLastName = GetReferenceToASPNETControl('txtLastName');
	var txtFirstName = GetReferenceToASPNETControl('txtFirstName');
	var txtSubjectID = GetReferenceToASPNETControl('txtSubjectID');
	var selStudyID = GetReferenceToASPNETControl('selStudyID');
	var selState = GetReferenceToASPNETControl('selState');
	var txtCity = GetReferenceToASPNETControl('txtCity');
	var txtPhone = GetReferenceToASPNETControl('txtPhone');
	var sErr = '';

	if (IsBlank(txtLastName.value) && IsBlank(txtFirstName.value) &&
        selState.options[selState.selectedIndex].value == -1 && IsBlank(txtCity.value) &&
        IsBlank(txtSubjectID.value) && selStudyID.options[selStudyID.selectedIndex].value == -1 && IsBlank(txtPhone.value))
		sErr += 'You must enter one of the following:\n\n\t-Last Name\n\t-First Name\n\t-Study\n\t-Subject ID and Study\n\t-Locale\n\t-City\n\tPhone Number';

//	if (!IsBlank(txtSubjectID.value) && selStudyID.options[selStudyID.selectedIndex].value == -1)
//		sErr += 'If you search by Subject ID, you must select a Study.\n'; 

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}
function DoSubmitEditHousehold()
{
	var oForm = document.forms[0];
	var sRegExpDate = /(0[1-9]|1[012])\/(0[1-9]|[12][0-9]|3[01])\/(19|20)\d\d/;
	var sRegExpEmail = /^(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}$/;
	var oRegExpDate = new RegExp(sRegExpDate);
	var oRegExpEmail = new RegExp(sRegExpEmail);
	var hidMainContact = GetReferenceToASPNETControl('hidMainContact');
	var txtPersonNotes = GetReferenceToASPNETControl('txtPersonNotes');
	var hidIsDeceased = GetReferenceToASPNETControl('hidIsDeceased');
	var hidDoNotContact = GetReferenceToASPNETControl('hidDoNotContact');
	var sErr = '';
	var sMainContact = '';
	var i = 0;
	var j = 0;
	var sTmp = null;

	hidMainContact.value = '';
	hidIsDeceased.value = '';
	hidDoNotContact.value = '';

	for (i=0;i<oForm.elements.length;i++)
	{
		if (oForm.elements[i].name == 'radMainContact')
		{
			if (oForm.elements[i].checked)
				sMainContact += 'true,';
			else
				sMainContact += 'false,';
		}

		if (oForm.elements[i].name == 'txtFirstName' && IsBlank(oForm.elements[i].value))
		{
			sErr += 'First Name is a required field.\n';
			break;
		}	

		if (oForm.elements[i].name == 'txtLastName' && IsBlank(oForm.elements[i].value))
		{
			sErr += 'Last Name is a required field.\n';
			break;
		}	

		if (oForm.elements[i].name == 'txtDOB' && !IsBlank(oForm.elements[i].value))
		{
			if (oForm.elements[i].value.search(oRegExpDate) < 0)
			{
				sErr += 'The DOB must be in the format: mm/dd/yyyy.';
				break;
			}
		}

		if (oForm.elements[i].name == 'txtPhoneNumber' && IsBlank(oForm.elements[i].value))
		{
			sErr += 'Phone Number is a required field.\n';
			break;
		}	

		if (oForm.elements[i].name == 'txtEmailAddress')
		{
			if (!IsBlank(oForm.elements[i].value))
			{
				if (oForm.elements[i].value.search(oRegExpEmail) < 0)
				{
					sErr += 'The Email Address you entered is not valid.\n'
					break;
				}
			}
		}

		if (oForm.elements[i].name == 'txtPersonNotes')
		{
			if (document.all)
				sTmp = oForm.elements[i].innerText;
			else
				sTmp = oForm.elements[i].value;

			for (j=0;j<sTmp.length;j++)
			{
				if (sTmp.charAt(j) == ',')
					sTmp = sTmp.substr(0, j) + ';' + sTmp.substr(j+1);
			}

			if (document.all)
				oForm.elements[i].innerText = sTmp;
			else
				oForm.elements[i].value = sTmp;
		}

		if (oForm.elements[i].name == 'chkDeceased')
		{
			if (oForm.elements[i].checked)
				hidIsDeceased.value += ',True';
			else
				hidIsDeceased.value += ',False';
	
		}

    if (oForm.elements[i].name == 'chkDoNotContact') {
        if (oForm.elements[i].checked)
            hidDoNotContact.value += ',True';
        else
            hidDoNotContact.value += ',False';
    }
}

    hidIsDeceased.value = hidIsDeceased.value.substr(1);
    hidDoNotContact.value = hidDoNotContact.value.substr(1);
	hidMainContact.value = sMainContact;

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		//return false;
		//DF: 4/9 changed to return true
		return true;
}

function DoSubmitCreateHousehold()
{
	var txtHouseholdName = GetReferenceToASPNETControl('txtHouseholdName');
	var txtFirstName = GetReferenceToASPNETControl('txtHouseholdName');
	var txtLastName = GetReferenceToASPNETControl('txtLastName');
	var txtDOB = GetReferenceToASPNETControl('txtDOB');
	var txtPhoneNumber = GetReferenceToASPNETControl('txtPhoneNumber');
	var txtPhoneNumberType = GetReferenceToASPNETControl('txtPhoneNumberType');
	var txtPhoneNumberNotes = GetReferenceToASPNETControl('txtPhoneNumberNotes');
	var txtEmailAddress = GetReferenceToASPNETControl('txtEmailAddress');
	var txtEmailAddressType = GetReferenceToASPNETControl('txtEmailAddressType');
	var txtEmailAddressNotes = GetReferenceToASPNETControl('txtEmailAddressNotes');
	var txtEmerFirstName = GetReferenceToASPNETControl('txtEmerFirstName');
	var txtEmerLastName = GetReferenceToASPNETControl('txtEmerLastName');
	var txtRelationship = GetReferenceToASPNETControl('txtRelationship');
	var txtPhone1 = GetReferenceToASPNETControl('txtPhone1');
	var txtZip = GetReferenceToASPNETControl('txtZip');
	var sRegExpDate = /(0[1-9]|1[012])\/(0[1-9]|[12][0-9]|3[01])\/(19|20)\d\d/;
	var sRegExpEmail = /^(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}$/;
	var sRegExpZip = /\d\d\d\d\d/;
	var oRegExpDate = new RegExp(sRegExpDate);
	var oRegExpEmail = new RegExp(sRegExpEmail);
	var oRegExpZip = new RegExp(sRegExpZip);
	var sErr = '';

	if (IsBlank(txtHouseholdName.value))
		sErr += 'Household Name is required.\n';

	if (IsBlank(txtFirstName.value))
		sErr += 'First Name is required.\n';

	if (IsBlank(txtLastName.value))
		sErr += 'Last Name is required.\n';

	if (!IsBlank(txtZip.value))
	{
		if (txtZip.value.search(oRegExpZip) < 0)
			sErr += 'The Postal Code must be five digits.\n';
	}

	if (!IsBlank(txtDOB.value))
	{
		if (txtDOB.value.search(oRegExpDate) < 0)
			sErr += 'DOB must be in the format: "mm/dd/yyyy".\n';
	}

	if (IsBlank(txtPhoneNumber.value))
	{
		if (!IsBlank(txtPhoneNumberType.value) || !IsBlank(txtPhoneNumberNotes.value))
			sErr += 'You cannot enter Phone Type or Phone Notes without a Phone Number.\n';
	}

	if (!IsBlank(txtEmailAddress.value))
	{
		if (txtEmailAddress.value.search(sRegExpEmail) < 0)
			sErr += 'The Email address you entered is invalid.\n';
	}
	else if (!IsBlank(txtEmailAddressType.value) || !IsBlank(txtEmailAddressNotes.value))
		sErr += 'You cannot enter Email Type or Email Notes without an Email Address.\n';

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function DoSubmitEditAddress()
{
	var aElements = document.forms[0].elements;
	var nAddressID = 0;
	var sErr = '';
	var i = 0;

	for (i=0;i<aElements.length;i++)
	{
		if (aElements[i].name == 'hidAddressID')
			nAddressID = aElements[i].value;

		if (aElements[i].name == 'txtAddress1' && IsBlank(aElements[i].value))
			sErr += 'Address 1 is a required field.\n';

		if (aElements[i].name == 'txtCity' && IsBlank(aElements[i].value))
			sErr += 'City is a required field.\n';

		if (aElements[i].name == 'txtZip' && IsBlank(aElements[i].value))
			sErr += 'Postal/Zip Code is a required field.\n';

		if (aElements[i].name == 'txtNotes')
			aElements[i].value = aElements[i].value.replace(',', ';');
	}

	if (!IsBlank(sErr))
	{
		sErr += '\n\nClicking "Save Changes" saves all of the addresses, not just the address that is currently displayed.\nMake sure you scroll through all the addresses before you Save Changes.'
		alert(sErr);
		return false;
	}
	else
	{
		return true;
	}
}

function DoSubmitCreateSubject()
{
	var selStudyID = GetReferenceToASPNETControl('selStudyID');
	var selGroupID = GetReferenceToASPNETControl('selGroupID');
	var txtSubjectID = GetReferenceToASPNETControl('txtSubjectID');
	var sErr = '';

	if (selStudyID.options[selStudyID.selectedIndex].value == -1)
		sErr += 'You must select a Study.\n';

	if (selGroupID.options[selGroupID.selectedIndex].value == -1)
		sErr += 'You must select a Group.\n';

	if (IsBlank(txtSubjectID.value))
		sErr += 'You must enter a Subject ID.\n';


	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function DoSubmitAppendLog()
{
	var bIsContactLog = GetReferenceToASPNETControl('hidIsContactLog').value;
	var selContactType = GetReferenceToASPNETControl('selContactType');
	var selContactPurpose = GetReferenceToASPNETControl('selContactPurpose');
	var txtContactDate = GetReferenceToASPNETControl('txtContactDate');
	var selStudy = GetReferenceToASPNETControl('selStudy');
	var selContactStaff = GetReferenceToASPNETControl('selContactStaff');
	var txtaHouseholdNotes = GetReferenceToASPNETControl('txtaHouseholdNotes');
	var selCategory = GetReferenceToASPNETControl('selCategory');
	var selHouseholdInfoPriority = GetReferenceToASPNETControl('selHouseholdInfoPriority');
	var selHouseholdInfoStaff = GetReferenceToASPNETControl('selHouseholdInfoStaff');
	var sErr = '';

	if (bIsContactLog == 'true')
	{
		if (selContactType.options[selContactType.selectedIndex].value == -1)
			sErr += 'You must select a Contact Type.\n';

		if (selContactPurpose.options[selContactPurpose.selectedIndex].value == -1)
			sErr += 'You must select a Contact Purpose.\n';

		if (IsBlank(txtContactDate.value) || !IsValidDate(txtContactDate.value))
			sErr += 'The Contact Date you entered is invalid.\n';

		if (selStudy.options[selStudy.selectedIndex].value == -1)
			sErr += 'You must select a Study.\n';

		if (selContactStaff.options[selContactStaff.selectedIndex].value == -1)
			sErr += 'You must select the Staff member who made the contact.\n';
	}
	else
	{
		if (IsBlank(txtaHouseholdNotes.value))
			sErr += 'You must enter some notes about the contact you made.\n';

		if (selCategory.options[selCategory.selectedIndex].value == -1)
			sErr += 'You must select a Category.\n';

		if (selHouseholdInfoPriority.options[selHouseholdInfoPriority.selectedIndex].value == -1)
			sErr += 'You must select a Priority.\n';

		if (selHouseholdInfoStaff.options[selHouseholdInfoStaff.selectedIndex].value == -1)
			sErr += 'You must select the Staff member who made the contact.\n';
	}

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}
/***********************************************************************************************
BEGIN SUBJECTS/ACTIONS/MEASURES/CONSENT FORMS VALIDATION CODE
***********************************************************************************************/
function DoSubmitMeasSummaries()
{
	var selStudyID = GetReferenceToASPNETControl('selStudyID');
	var sErr = '';

	if (selStudyID.options[selStudyID.selectedIndex].value == -1)
		sErr += 'You must select an Study to continue.\n';

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function DoSubmitMoveMeasures()
{
	var selActionID = GetReferenceToASPNETControl('selActionID');
	var sErr = '';

	if (selActionID.options[selActionID.selectedIndex].value == -1)
		sErr += 'You must select an Action to continue.\n';

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function DoSubmitSubjectStatus()
{
	var selSubjStatusID = GetReferenceToASPNETControl('selSubjStatusID');
	var selSubjStatusDetailID = GetReferenceToASPNETControl('selSubjStatusDetailID');
	var sErr = '';

	if (selSubjStatusID.options[selSubjStatusID.selectedIndex].value == -1)
		sErr += 'You must select a Subject Status.\n';

	if (selSubjStatusID.options[selSubjStatusID.selectedIndex].value == 2 || selSubjStatusID.options[selSubjStatusID.selectedIndex].value == 3 || selSubjStatusID.options[selSubjStatusID.selectedIndex].value == 4 || selSubjStatusID.options[selSubjStatusID.selectedIndex].value == 5)
	{
		if (selSubjStatusDetailID.options[selSubjStatusDetailID.selectedIndex].value == -1)
			sErr += 'You must select a Subject Status Detail.\n';
	}

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function DoSubmitConsentForms()
{
	var selConsentFormVersionID = GetReferenceToASPNETControl('selConsentFormVersionID');
	var txtDateSigned = GetReferenceToASPNETControl('txtDateSigned');
	var sErr = '';

	if (IsBlank(txtDateSigned.value))
	{
		if (!window.confirm('Setting the Date Signed to blank will indicate that this Consent Form has not been recieved. Do you want to continue?\n'))
			return false;
	}
	else if (!IsValidDate(txtDateSigned.value))
		sErr += 'The Date Signed must be in the format: mm/dd/yyyy.\n';
	else if (selConsentFormVersionID.options[selConsentFormVersionID.selectedIndex].value == -1)
		sErr += 'You must select a Consent Form Version.';
	else
	{
		var oDate = new Date(txtDateSigned.value);

		if (oDate.getFullYear() < 1998)
			sErr += 'The Date Done must be after 01/01/1998.\n'
	}

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function DoSubmitMultipleConsentForms()
{
	var txtDateSigned = GetReferenceToASPNETControl('txtDateSigned');
	var selConsentFormVersionID = GetReferenceToASPNETControl('selConsentFormVersionID');
	var txtaNotes = GetReferenceToASPNETControl('txtaNotes');
	var sErr = '';

	if (IsBlank(txtDateSigned.value))
	{
		if (!window.confirm('Setting the Date Signed to blank will indicate that this Consent Form has not been recieved. Do you want to continue?\n'))
			return false;
	}
	else if (!IsValidDate(txtDateSigned.value))
		sErr += 'The Date Signed must be in the format: mm/dd/yyyy.\n';
	else
	{
		var oDate = new Date(txtDateSigned.value);

		if (oDate.getFullYear() < 1998)
			sErr += 'The Date Done must be after 01/01/1998.\n'
	}

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function DoSubmitMoveConsents()
{
	var selActionID = GetReferenceToASPNETControl('selActionID');
	var sErr = '';

	if (selActionID.options[selActionID.selectedIndex].value == -1)
		sErr += 'You must select an Action to continue.\n';

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function DoSubmitAddConsentForm()
{
	var selConsentFormVersionID = GetReferenceToASPNETControl('selConsentFormVersionID');
	var txtDateSigned = GetReferenceToASPNETControl('txtDateSigned');
	var sErr = '';

	if (selConsentFormVersionID.options[selConsentFormVersionID.selectedIndex].value == -1)
		sErr += 'You must select a Consent Form Version.\n';

	if (!IsBlank(txtDateSigned.value))
	{
		if (!IsValidDate(txtDateSigned.value))
			sErr += 'The Date Signed must be in the format: mm/dd/yyyy.\n';
	}

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true	;
}

function DoSubmitActionStatus()
{
	var nRespForID = GetReferenceToASPNETControl('selRespForID').options[GetReferenceToASPNETControl('selRespForID').selectedIndex].value;
	var nActionStatusID = GetReferenceToASPNETControl('selActionStatusID').options[GetReferenceToASPNETControl('selActionStatusID').selectedIndex].value;
	var nCompByID = GetReferenceToASPNETControl('selCompByID').options[GetReferenceToASPNETControl('selCompByID').selectedIndex].value;
	var dtDateDone = GetReferenceToASPNETControl('txtDateDone').value;
	var dtDueDateStart = GetReferenceToASPNETControl('txtDueDateStart').value;
	var dtDueDateEnd = GetReferenceToASPNETControl('txtDueDateEnd').value;
	var sNotes = GetReferenceToASPNETControl('txtNotes').value;
	var sErr = '';

	//if (nRespForID == -1)
	//	sErr += 'You must select the person who is responsible for this Action.\n';

	if (nActionStatusID == -1)
		sErr += 'You must select an Action Status.\n';
	else if (nActionStatusID == 1)
	{
		if (nCompByID == -1)
			sErr += 'You must select the person who completed this Action.\n';

		if (IsBlank(dtDateDone) || (!IsValidDate(dtDateDone)))
			sErr += 'The Date Done must be in the format: mm/dd/yyyy.\n';
		else
		{
			var oDate = new Date(dtDateDone);

			if (oDate.getFullYear() < 1998)
				sErr += 'The Date Done must be after 01/01/1998.\n'
		}
	}

	if (!IsBlank(dtDueDateStart))
	{
		if (!IsValidDate(dtDueDateStart))
			sErr += 'The Due Date Start must be in the format: mm/dd/yyyy.\n';
	}

	if (!IsBlank(dtDueDateEnd))
	{
		if (!IsValidDate(dtDueDateEnd))
			sErr += 'The Due Date End must be in the format: mm/dd/yyyy.\n';
	}

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function DoSubmitMeasureStatus()
{
	var nMeasureStatusID = GetReferenceToASPNETControl('selMeasStatusID').options[GetReferenceToASPNETControl('selMeasStatusID').selectedIndex].value;
	var nMeasureStatusDetailID = GetReferenceToASPNETControl('selMeasStatusDetailID').options[GetReferenceToASPNETControl('selMeasStatusDetailID').selectedIndex].value;
	var nMeasureStatusDetailCount = GetReferenceToASPNETControl('selMeasStatusDetailID').options.length;
	var nCompByID = GetReferenceToASPNETControl('selCompByID').options[GetReferenceToASPNETControl('selCompByID').selectedIndex].value;
	var dtDateDone = GetReferenceToASPNETControl('txtDateDone').value;
	var sNotes = GetReferenceToASPNETControl('txtNotes').value;
	var sErr = '';

	if (nMeasureStatusID == -1)
		sErr += 'You must enter a Measure Status item.\n';
	else
	{
		if (nMeasureStatusDetailID == -1 && nMeasureStatusDetailCount > 1)
			sErr += 'You must enter a Measure Status Detail item.\n';

		if (nMeasureStatusID < 5)
		{
			if (nCompByID == -1)
				sErr += 'You must select the person who completed this Action.\n';

			if (IsBlank(dtDateDone))
				sErr += 'You must enter a valid Date Done in the format: mm/dd/yyyy.\n';
			else if (!IsValidDate(dtDateDone))
				sErr += 'The Date Done must be in the format: mm/dd/yyyy.\n';
			else
			{
				var oDate = new Date(dtDateDone);

				if (oDate.getFullYear() < 1998)
					sErr += 'The Date Done must be after 01/01/1998.\n'
			}
		}
	}

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function DoSubmitMultipleMeasureStatus()
{
	var nMeasureStatusID = GetReferenceToASPNETControl('selStatus').options[GetReferenceToASPNETControl('selStatus').selectedIndex].value;
	var nMeasureStatusDetailID = GetReferenceToASPNETControl('selStatusDetail').options[GetReferenceToASPNETControl('selStatusDetail').selectedIndex].value;
	var nMeasureStatusDetailCount = GetReferenceToASPNETControl('selStatusDetail').options.length;
	var nCompByID = GetReferenceToASPNETControl('selCompBy').options[GetReferenceToASPNETControl('selCompBy').selectedIndex].value;
	var dtDateDone = GetReferenceToASPNETControl('txtDateDone').value;
	var sNotes = GetReferenceToASPNETControl('txtNotes').value;
	var sErr = '';

	if (nMeasureStatusID == -1)
		sErr += 'You must enter a Measure Status item.\n';
	else
	{
		if (nMeasureStatusDetailID == -1 && nMeasureStatusDetailCount > 1)
			sErr += 'You must enter a Measure Status Detail item.\n';

		if (nMeasureStatusID < 5)
		{
			if (nCompByID == -1)
				sErr += 'You must select the person who completed this Action.\n';

			if (IsBlank(dtDateDone))
				sErr += 'You must enter a valid date in the format: mm/dd/yyyy.\n';
			else if (!IsValidDate(dtDateDone))
				sErr += 'The Date Done must be in the format: mm/dd/yyyy.\n';
			else
			{
				var oDate = new Date(dtDateDone);

				if (oDate.getFullYear() < 1998)
					sErr += 'The Date Done must be after 01/01/1998.\n'
			}
		}
	}

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function DoSubmitMultipleActionStatus()
{
	var txtDateDone = GetReferenceToASPNETControl('txtDateDone');
	var selCompBy = GetReferenceToASPNETControl('selCompBy');
	var sErr = '';

	if (!IsValidDate(txtDateDone.value))
		sErr += 'The "Date Done" you entered is invalid. Please enter a valid date in the format: mm/dd/yyyy.\n';
	else
	{
		var oDate = new Date(txtDateDone.value);

		if (oDate.getFullYear() < 1998)
			sErr += 'The Date Done must be after 01/01/1998.\n'
	}

	if (selCompBy.options[selCompBy.selectedIndex].value == -1)
		sErr += 'You must select the person who completed these actions.\n';

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function DoSubmitSearch()
{
	var sSearchType = GetSearchType();
	var oLab = GetReferenceToASPNETControl('selLabID');
	var oStudy = GetReferenceToASPNETControl('selStudyID');
	var oSubjID = GetReferenceToASPNETControl('txtSubjID');
	var oStudyAction = GetReferenceToASPNETControl('selStudyActionID');
	var oStudyMeasure = GetReferenceToASPNETControl('selStudyMeasureID');
	var oConsentForm = GetReferenceToASPNETControl('selConsentFormID');
	var sErr = '';
	var bSubmit = true;

	if (sSearchType == null)
		sErr += 'You must select a Search Type.\n';

	if (oStudy.options[oStudy.selectedIndex].value == -1)
		sErr += 'You must select a Study.\n';

	if (IsBlank(oSubjID.value))
	{
		if (sSearchType == 'A' && oStudyAction.options[oStudyAction.selectedIndex].value == -1)
			sErr += 'You must enter a Subject ID or an Action.\n';
		else if (sSearchType == 'M' && oStudyMeasure.options[oStudyMeasure.selectedIndex].value == -1)
			sErr += 'You must enter a Subject ID or a Measure.\n';
		else if (sSearchType == 'C' && oConsentForm.options[oConsentForm.selectedIndex].value == -1)
			sErr += 'You must enter a Subject ID or a Consent Form.\n';
	}

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else if (bSubmit)
		return true;
	else
		return false;
}

function DoSubmitAdvancedSearch()
{
	var sSearchType = GetSearchType();
	var oLab = GetReferenceToASPNETControl('selLabID');
	var oStudy = GetReferenceToASPNETControl('selStudyID');
	var oSubjStatus = GetReferenceToASPNETControl('selSubjectStatusID');
	var oSubjID = GetReferenceToASPNETControl('txtSubjID');
	var oRespFor = GetReferenceToASPNETControl('selRespForID');
	var oCompBy = GetReferenceToASPNETControl('selCompByID');
	var oActionStatus = GetReferenceToASPNETControl('selActionStatusID');
	var oActionType = GetReferenceToASPNETControl('selActionType');
	var oMeasStatus = GetReferenceToASPNETControl('selMeasureStatusID');
	var oMeasures = GetReferenceToASPNETControl('selStudyMeasureID');
	var oActions = GetReferenceToASPNETControl('selStudyActionID');
	var oMeasStatusDetail = GetReferenceToASPNETControl('selMeasureStatusDetailID');
	var oStartDate = GetReferenceToASPNETControl('txtStartDate');
	var oEndDate = GetReferenceToASPNETControl('txtEndDate');
	var sErr = '';

	if (sSearchType == 'S')
	{
		if (oStudy.options[oStudy.selectedIndex].value == -1)
			sErr += 'You must select a study.\n';
	}
	else if (sSearchType == 'A')
	{
		if (oStudy.options[oStudy.selectedIndex].value != -1)
		{
			if (oLab.options[oLab.selectedIndex].value == -1 && oRespFor.options[oRespFor.selectedIndex].value == -1 && oCompBy.options[oCompBy.selectedIndex].value == -1 && oActionStatus.options[oActionStatus.selectedIndex].value == -1 && !HasAnItemSelected(oActions) && IsBlank(oSubjID.value) && oActionType.options[oActionType.selectedIndex].value == -1 && !HasAnItemSelected(oSubjStatus) && IsBlank(oStartDate.value) && IsBlank(oEndDate.value))
				sErr += 'You must enter some action criteria.\n';
		}
		else if (oLab.options[oLab.selectedIndex].value == -1)
			sErr += 'You must select a study or a lab.\n';
		else if (oLab.options[oLab.selectedIndex].value == 1)
			sErr += 'If you select the Dawson Lab, you must also select a study.\n';

		if (!IsBlank(oStartDate.value))
		{
			if (!IsValidDate(oStartDate.value))
				sErr += 'Start Date must be in the format: "mm/dd/yyyy".';
		}

		if (!IsBlank(oEndDate.value))
		{
			if (!IsValidDate(oEndDate.value))
				sErr += 'End Date must be in the format: "mm/dd/yyyy".';
		}
	}
	else if (sSearchType == 'M')
	{
		if (oStudy.options[oStudy.selectedIndex].value != -1)
		{
			if (oLab.options[oLab.selectedIndex].value == -1 && oMeasStatus.options[oMeasStatus.selectedIndex].value == -1 && oMeasStatusDetail.options[oMeasStatusDetail.selectedIndex].value == -1 && !HasAnItemSelected(oMeasures) && IsBlank(oSubjID.value) && !HasAnItemSelected(oSubjStatus) && oActionStatus.options[oActionStatus.selectedIndex].value == -1 && IsBlank(oStartDate.value) && IsBlank(oEndDate.value))
				sErr += 'You must enter some measure criteria.\n';
		}
		else if (oLab.options[oLab.selectedIndex].value == -1)
			sErr += 'You must select a study or a lab.\n';
		else if (oLab.options[oLab.selectedIndex].value == 1)
			sErr += 'If you select the Dawson Lab, you must also select a study.\n';

		if (!IsBlank(oStartDate.value))
		{
			if (!IsValidDate(oStartDate.value))
				sErr += 'Start Date must be in the format: "mm/dd/yyyy".';
		}

		if (!IsBlank(oEndDate.value))
		{
			if (!IsValidDate(oEndDate.value))
				sErr += 'End Date must be in the format: "mm/dd/yyyy".';
		}
	}
	else
		sErr = 'You must select the search type (Subjects, Actions, or Measures).\n';

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function DoSubmitActionsBySubject(e)
{
	var selStudyID = GetReferenceToASPNETControl('selStudyID');
	var txtID = GetReferenceToASPNETControl('txtID');
	var sErr = '';

	if (selStudyID.options[selStudyID.selectedIndex].value == -1)
		sErr += 'You must select a Study.\n';

	if (IsBlank(txtID.value))
		sErr += 'You must enter a Subject ID.\n';

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}
function DoSubmitMeasuresBySubject(e)
{
	var selStudyID = GetReferenceToASPNETControl('selStudyID');
	var txtID = GetReferenceToASPNETControl('txtID');
	var sErr = '';

	if (selStudyID.options[selStudyID.selectedIndex].value == -1)
		sErr += 'You must select a Study.\n';

	if (IsBlank(txtID.value))
		sErr += 'You must enter a Subject ID.\n';

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}
function DoSubmitConsentsBySubject(e)
{
	var selStudyID = GetReferenceToASPNETControl('selStudyID');
	var txtID = GetReferenceToASPNETControl('txtID');
	var sErr = '';

	if (selStudyID.options[selStudyID.selectedIndex].value == -1)
		sErr += 'You must select a Study.\n';

	if (IsBlank(txtID.value))
		sErr += 'You must enter a Subject ID.\n';

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}
/***********************************************************************************************
BEGIN DATA SUMMARY VALIDATION CODE
***********************************************************************************************/
function DoSubmitCreateSPSSFiles()
{
	var selDataTables = GetReferenceToASPNETControl('selDataTables');
	var sErr = '';

	if (!HasAnItemSelected(selDataTables))
		sErr += 'You must select at least one Data Table from the list.';

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function DoSubmitCreateSPSSDataFiles()
{
    var e = (e || window.event);

    if (e != null && e != 'undefined')
    {
		var bDoCheck = new Boolean(GetReferenceToASPNETControl('hidDoSubmit').value.toLowerCase());
		var sErr = '';

		if (bDoCheck)
		{
			if (!HasAnItemChecked('chkInclude'))
				sErr += 'You must select at least one Study Measure.';

			if (!IsBlank(sErr))
			{
				alert(sErr);
				return false;
			}
			else
			{
				alert('You will be prompted to save the SPSS Match File Syntax to your computer.\nWhen you save it, make sure you select "All Files" and change the file extension to "*.sps".\n');
				return true;
			}
		}
		else
			return true;
	}
	else
		return true;
}

function DoSubmitVariableInfo(e)
{
    var e = (e || window.event);

    if (e != null && e != 'undefined')
    {
		var txtFieldName = document.getElementsByName('txtFieldName');
		var txtLabel = document.getElementsByName('txtLabel');
		var txtValidList = document.getElementsByName('txtValidList');
		var txtMinValue = document.getElementsByName('txtMinValue');
		var txtMaxValue = document.getElementsByName('txtMaxValue');
		var txtValidList = document.getElementsByName('txtValidList');
		var txtMissingValue = document.getElementsByName('txtMissingValue');
		var txtScatterplot = document.getElementsByName('txtScatterplot');
		var txtBoxPlot = document.getElementsByName('txtBoxPlot');
		var oFocus = null;
		var sErr = '';

		for (var i=0;i<txtFieldName.length;i++)
		{
			if (IsBlank(txtFieldName[i].value))
			{
				sErr += 'You must enter a Field Name for each variable.\n';
				oFocus = txtFieldName[i];
				break;
			}
		}

		if (!IsBlank(sErr))
		{
			alert(sErr);

			if (oFocus != null)
				oFocus.focus();

			return false;
		}
		else
		{
			for (var i=0;i<txtFieldName.length;i++)
			{
				if (txtFieldName[i].value != null) {txtFieldName[i].value = ReplaceAll(txtFieldName[i].value, ',', '%44;');}
				if (txtLabel[i].value != null) {txtLabel[i].value = ReplaceAll(txtLabel[i].value, ',', '%44;');}
				if (txtValidList[i].value != null) {txtValidList[i].value = ReplaceAll(txtValidList[i].value, ',', '%44;');}
				if (txtMinValue[i].value != null) {txtMinValue[i].value = ReplaceAll(txtMinValue[i].value, ',', '%44;');}
				if (txtMaxValue[i].value != null) {txtMaxValue[i].value = ReplaceAll(txtMaxValue[i].value, ',', '%44;');}
				if (txtMissingValue[i].value != null) {txtMissingValue[i].value = ReplaceAll(txtMissingValue[i].value, ',', '%44;');}
				if (txtScatterplot[i].value != null) {txtScatterplot[i].value = ReplaceAll(txtScatterplot[i].value, ',', '%44;');}
				if (txtBoxPlot[i].value != null) {txtBoxPlot[i].value = ReplaceAll(txtBoxPlot[i].value, ',', '%44;');}
			}

			return true;
		}
	}
	else
		return true;
}

function DoSubmitEditSpecialFields(e)
{
    var e = (e || window.event);

    if (e != null && e != 'undefined')
    {
		var txtFieldName = GetReferenceToASPNETControl('txtFieldName');
		var selFieldCodeID = GetReferenceToASPNETControl('selFieldCodeID');
		var chkDelete = GetReferenceToASPNETControl('chkDelete');
		var sErr = '';

		if (!chkDelete.checked)
		{
			if (IsBlank(txtFieldName.value))
				sErr += 'You must enter a Field Name.\n';

			if (selFieldCodeID.options[selFieldCodeID.selectedIndex].value == -1)
				sErr += 'You must select a Field Code.\n';
		}

		if (!IsBlank(sErr))
		{
			alert(sErr);
			return false;
		}
		else
		{
			if (chkDelete.checked)
				return confirm('You are about to delete the special field "' + txtFieldName.value + '". This cannot be undone. Do you want to continue?\n');
			else
				return true;
		}
	}
	else
		return true;
}
/***********************************************************************************************
BEGIN DATA ENTRY/DATA STORAGE VALIDATION CODE
***********************************************************************************************/
function DoSubmitDataToEnter(e)
{
	
	var selStudyID = GetReferenceToASPNETControl('selStudyID');
	var txtSubjID = GetReferenceToASPNETControl('txtSubjID');
	var sErr = '';

	if (selStudyID.options[selStudyID.selectedIndex].value == -1)
		sErr += '    -Study\n';

	if (!IsBlank(sErr))
	{
		alert('You are missing:\n\n' + sErr);
		return false;
	}
	else
		return true;
		
}

function DoSubmitDataStorage()
{
	var selStudyID = GetReferenceToASPNETControl('selStudyID');
	var txtStorageUnitNumber = GetReferenceToASPNETControl('txtStorageUnitNumber');
	var selStorageLocationID = GetReferenceToASPNETControl('selStorageLocationID');
	var selStorageUnitTypeID = GetReferenceToASPNETControl('selStorageUnitTypeID');
	var selStorageContentID = GetReferenceToASPNETControl('selStorageContentID');
	var hidMaxStorageUnitNumber = GetReferenceToASPNETControl('hidMaxStorageUnitNumber');
	var sErr = '';

	if (selStudyID.options[selStudyID.selectedIndex].value == -1)
		sErr += 'You must select a Study.\n';

	if (IsBlank(txtStorageUnitNumber.value))
		sErr += 'You must enter a Storage Unit Number.\n';
	else if (isNaN(txtStorageUnitNumber.value))
		sErr += 'Storage Unit Numbers must be numeric.\n';
	else if (parseInt(hidMaxStorageUnitNumber.value) > parseInt(txtStorageUnitNumber.value))
		sErr += 'There are already ' + hidMaxStorageUnitNumber.value + ' Storage Units for this Study. The Storage Unit Number you selected must be greater than ' + hidMaxStorageUnitNumber.value + '.\n';

	if (selStorageLocationID.options[selStorageLocationID.selectedIndex].value == -1)
		sErr += 'You must select a Storage Location.\n';

	if (selStorageUnitTypeID.options[selStorageUnitTypeID.selectedIndex].value == -1)
		sErr += 'You must select a Storage Unit Type.\n';

	if (selStorageContentID.options[selStorageContentID.selectedIndex].value == -1)
		sErr += 'You must select a Storage Content Type.\n';

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function DoSubmitSearchStorageUnit()
{
	var selStudyID = GetReferenceToASPNETControl('selStudyID');
	var txtSubjID = GetReferenceToASPNETControl('txtSubjID');
	var sErr = '';

	if (selStudyID.options[selStudyID.selectedIndex].value == -1)
		sErr += 'You must select a Study.\n';

	if (IsBlank(txtSubjID.value))
		sErr += 'You must select a Subject.\n';

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}
/***********************************************************************************************
BEGIN DOCUMENTS VALIDATION CODE
***********************************************************************************************/
function DoSubmitDocument(e)
{
    var e = (e || window.event);

    if (e != null && e != 'undefined')
    {
		var txtDocTitle = document.getElementById('txtDocTitle');
		var oDocument = document.getElementById('oDocument');
		var selDocumentType = document.getElementById('selDocumentType');
		var selDocumentStatus = document.getElementById('selDocumentStatus');
		var selEntityType = document.getElementById('selEntityType');
		var selEntityValue = document.getElementById('selEntityValue');
		var sEntityType = selEntityType.options[selEntityType.selectedIndex].text;
		var sErr = '';

		if (IsBlank(txtDocTitle.value))
			sErr += 'You must enter a document title.\n';

		if (IsBlank(oDocument.value))
			sErr += 'You must enter the location of the document.\n';

		if (selDocumentType.options[selDocumentType.selectedIndex].value == -1)
			sErr += 'You must select a document type.\n';

		if (selEntityType.options[selEntityType.selectedIndex].value > 0)
		{
			if (selEntityValue != null)
			{
				if (selEntityValue.type == 'select-one')
				{
					if (selEntityValue.options[selEntityValue.selectedIndex].value == -1)
						sErr += 'If you choose to relate this document to a  ' + sEntityType + ', you must select a ' + sEntityType + '.';
				}
				else if (selEntityValue.type == 'text')
				{
					if (IsBlank(selEntityValue.value))
						sErr += 'If you choose to relate this document to a  ' + sEntityType + ', you must select a ' + sEntityType + '.';
				}
			}
		}

		if (!IsBlank(sErr))
		{
			alert(sErr);
			return false;
		}
		else
			return true;
	}
	else
		return true;
}
/***********************************************************************************************
BEGIN HELP VALIDATION CODE
***********************************************************************************************/
function DoSubmitOnlineAccess()
{
	var oForm = document.forms[0];
	var sErr = '';

	if (IsBlank(oForm.txtRequestor.value))
		sErr += 'You must enter your Name.\n';

	if (IsBlank(oForm.txtEmailAddress.value))
		sErr += 'You must enter your Email Address.\n';

	if (IsBlank(oForm.txtPhoneNumber.value))
		sErr += 'You must enter your Phone Number.\n';

	if (IsBlank(oForm.txtAccessFor.value))
		sErr += 'You must enter who this access is for.\n';

	if (IsBlank(oForm.txtDateRequired.value))
		sErr += 'You must enter a Date Required in the format: mm/dd/yyyy.\n';
	else if (!IsValidDate(oForm.txtDateRequired.value))
		sErr += 'You must enter a Date Required in the format: mm/dd/yyyy.\n';

	if (IsBlank(oForm.txtSupervisor.value))
		sErr += 'You must enter their supervisor.\n';

	if (IsBlank(oForm.txtTypeOfAccess.value))
		sErr += 'You must enter the type of access.\n';

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}
/***********************************************************************************************
BEGIN STUDY DESIGN VALIDATION CODE
***********************************************************************************************/
function DoSubmitMeasureInfo(e)
{
    var e = (e || window.event);

    if (e != null && e != 'undefined')
    {
		var selMeasureID = GetReferenceToASPNETControl('selMeasureID');
		var hidTab = GetReferenceToASPNETControl('hidTab');
		var txtMeasShortName = GetReferenceToASPNETControl('txtMeasShortName');
		var txtMeasFullName = GetReferenceToASPNETControl('txtMeasFullName');
		var selMeasCatID = GetReferenceToASPNETControl('selMeasCatID');
		var txtSource = GetReferenceToASPNETControl('txtSource');
		var txtStartDate = GetReferenceToASPNETControl('txtStartDate');
		var txtEndDate = GetReferenceToASPNETControl('txtEndDate');
		var selStaffID = GetReferenceToASPNETControl('selStaffID');
		var txtNotes = GetReferenceToASPNETControl('txtNotes');
		var selMeasRespondentID = GetReferenceToASPNETControl('selMeasRespondentID');
		var selFocusPerson = GetReferenceToASPNETControl('selFocusPerson');
		var selMethodID = GetReferenceToASPNETControl('selMethodID');
		var txtAdminTime = GetReferenceToASPNETControl('txtAdminTime');
		var txtMaterials = GetReferenceToASPNETControl('txtMaterials');
		var txtMaterialsLocation = GetReferenceToASPNETControl('txtMaterialsLocation');
		var txtDescription = GetReferenceToASPNETControl('txtDescription');
		var txtReference = GetReferenceToASPNETControl('txtReference');
		var txtCitation = GetReferenceToASPNETControl('txtCitation');
		var txtCopyright = GetReferenceToASPNETControl('txtCopyright');
		var txtOrdering = GetReferenceToASPNETControl('txtOrdering');
		var txtSQLTable = GetReferenceToASPNETControl('txtSQLTable');
		var txtDEFile = GetReferenceToASPNETControl('txtDEFile');
		var txtDEByWhom = GetReferenceToASPNETControl('txtDEByWhom');
		var txtDEEstTime = GetReferenceToASPNETControl('txtDEEstTime');
		var txtDEScoringInfo = GetReferenceToASPNETControl('txtDEScoringInfo');
		var sErr = '';
		var sTabName = '';

		if (IsBlank(txtMeasShortName.value))
			sErr += 'You must enter a Measure Short Name.\n';

		if (IsBlank(txtMeasFullName.value))
			sErr += 'You must enter a Measure Full Name.\n';

		if (selMeasCatID.options[selMeasCatID.selectedIndex].value == -1)
			sErr += 'You must select a Measure Category.\n';

		if (IsBlank(txtStartDate.value))
		{
	//		sErr += 'You must enter the Date Began Using.\n';
		}
		else if (!IsValidDate(txtStartDate.value))
			sErr += 'The value you entered for Date Began Using must be in the format: mm/dd/yyyy.\n';

		if (!IsBlank(txtEndDate.value))
		{
			if (!IsValidDate(txtEndDate.value))
				sErr += 'The value you entered for Date End Using must be in the format: mm/dd/yyyy.\n';
		}

		if (selStaffID.options[selStaffID.selectedIndex].value == -1)
			sErr += 'You must select a Staff Contact.\n';

		if (!IsBlank(sErr))
			sTabName = 'General';

		if (selMeasRespondentID.options[selMeasRespondentID.selectedIndex].value == -1)
			sErr += 'You must select a Resondent.\n';

		if (selFocusPerson.options[selFocusPerson.selectedIndex].value == -1)
			sErr += 'You must select a Focus Person.\n';

		if (selMethodID.options[selMethodID.selectedIndex].value == -1)
			sErr += 'You must select an Admin. Method.\n';

		if (IsBlank(txtAdminTime.value))
		{
	//		sErr += 'You must enter an Admin. Time.\n';
		}
		else if (isNaN(txtAdminTime.value))
			sErr += 'The Admin. Time must be numeric.\n';
		else if (txtAdminTime.value < 0 && txtAdminTime.value > 480)
			sErr += 'The Admin. Time must be a number between 1 and 480.\n';

		if (!IsBlank(sErr) && IsBlank(sTabName))
			sTabName = 'AdminInfo';

	//	if (IsBlank(txtDEByWhom.value))
	//		sErr += 'You must enter the "Data Entry By Whom?" info.\n';

		if (IsBlank(txtDEEstTime.value))
		{
	//		sErr += 'You must enter the Estimated Data Entry Time.\n';
		}
		else if (isNaN(txtDEEstTime.value))
			sErr += 'The Estimated Data Entry Time must be numeric.\n';
		else if (txtDEEstTime.value < 0 && txtDEEstTime.value > 480)
			sErr += 'The Estimated Data Entry Time must be a number between 1 and 120.\n';

		if (!IsBlank(sErr) && IsBlank(sTabName))
			sTabName = 'DataEntry';

		if (!IsBlank(sErr))
		{
			alert(sErr);
			Measures_ChangeTab('tbl' + sTabName, 'td' + sTabName);
			return false;
		}
		else
			return true;
	}
	else
		return true;
}

function DoSubmitEditStudyActions(e)
{
    var e = (e || window.event);

    if (e != null && e != 'undefined')
    {
        /* DF: 5/15/07 controls have the studymeasid appended to name so getElementsByName won't work
		var aActionText = document.getElementsByName('txtActionText');
		var aActionType = document.getElementsByName('selActionTypeID');
		var aLab = document.getElementsByName('selLabID');
		var aStaffPosition = document.getElementsByName('selStaffPosID');
		var aSortOrder = document.getElementsByName('txtSortOrder');
        */

		var aActionText = GetAllElementsContainingName('txtActionText');
		var aActionType = GetAllElementsContainingName('selActionTypeID');
		var aLab = GetAllElementsContainingName('selLabID');
		var aStaffPosition = GetAllElementsContainingName('selStaffPosID');
		var aSortOrder = GetAllElementsContainingName('txtSortOrder');

		var txtActionTextNEW = document.getElementById('txtActionTextNEW');
		var selActionTypeIDNEW = document.getElementById('selActionTypeIDNEW');
		var selLabIDNEW = document.getElementById('selLabIDNEW');
		var selStaffPosIDNEW = document.getElementById('selStaffPosIDNEW');
		var txtSortOrderNEW = document.getElementById('txtSortOrderNEW');
		var sErr = '';
		var oFocus = null;

		for (var i=0;i<aActionText.length;i++)
		{
			if (IsBlank(aSortOrder[i].value))
			{
				sErr += 'You must enter an Order for each Study Action (' + aActionText[i].value + ').\n';
				if (oFocus == null) {oFocus = aSortOrder[i];}
			}
			else if (isNaN(aSortOrder[i].value))
			{
				sErr += 'The values for Order must be numeric (' + aActionText[i].value + ').\n';
				if (oFocus == null) {oFocus = aSortOrder[i];}
			}

			if (IsBlank(aActionText[i].value))
			{
				sErr += 'You must enter Action Text for each Study Action.\n';
				if (oFocus == null) {oFocus = aActionText[i];}
			}

			if (aActionType[i].options[aActionType[i].selectedIndex].value == -1)
			{
				sErr += 'You must select an Action Type for each Study Action (' + aActionText[i].value + ').\n';
				if (oFocus == null) {oFocus = aActionType[i];}
			}

			if (aLab[i].options[aLab[i].selectedIndex].value == -1)
			{
				sErr += 'You must select a Lab for each Study Action (' + aActionText[i].value + ').\n';
				if (oFocus == null) {oFocus = aLab[i];}
			}

			if (aStaffPosition[i].options[aStaffPosition[i].selectedIndex].value == -1)
			{
				sErr += 'You must select a Staff Position for each Study Action (' + aActionText[i].value + ').\n';
				if (oFocus == null) {oFocus = aStaffPosition[i];}
			}

			if (!IsBlank(sErr))
				break;
		}

		if (txtActionTextNEW != null && IsBlank(sErr))
		{
		

			if (IsBlank(txtActionTextNEW.value))
			{
				sErr += 'You must enter Action Text for each Study Action.\n';
				if (oFocus == null) {oFocus = txtActionTextNEW;}
			}			
			else if (IsBlank(txtSortOrderNEW.value))
			{
				sErr += 'You must enter an Order for each Study Action (' + txtActionTextNEW.value + ').\n';
				if (oFocus == null) {oFocus = txtSortOrderNEW;}
			}
			else if (isNaN(txtSortOrderNEW.value))
			{
				sErr += 'The values for Order must be numeric (' + txtActionTextNEW.value + ').\n';
				if (oFocus == null) {oFocus = txtSortOrderNEW;}
			}
			else if (selActionTypeIDNEW.options[selActionTypeIDNEW.selectedIndex].value == -1)
			{
				sErr += 'You must select an Action Type for each Study Action (' + txtActionTextNEW.value + ').\n';
				if (oFocus == null) {oFocus = selActionTypeIDNEW;}
			}			
			else if (selLabIDNEW.options[selLabIDNEW.selectedIndex].value == -1)
			{
				sErr += 'You must select a Lab for each Study Action (' + txtActionTextNEW.value + ').\n';
				if (oFocus == null) {oFocus = selActionTypeIDNEW;}
			}			
			else if (selStaffPosIDNEW.options[selStaffPosIDNEW.selectedIndex].value == -1)
			{
				sErr += 'You must select a Staff Position for each Study Action (' + txtActionTextNEW.value + ').\n';
				if (oFocus == null) {oFocus = selActionTypeIDNEW;}
			}
		}

		if (!IsBlank(sErr))
		{
			alert(sErr);
			oFocus.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.style.display = 'inline';
			oFocus.focus();
			return false;
		}
		else
		{
			return true;
		}
	}
	else
		return true;
}

function DoSubmitEditStudyMeasures(e)
{
    var e = (e || window.event);

    if (e != null && e != 'undefined')
    {
        /* DF: 5/15/07 controls have the studymeasid appended to name so getElementsByName won't work
		var aStudyMeasName = document.getElementsByName('txtStudyMeasName');
		var aMeasureID = document.getElementsByName('selMeasureID');
		var aLabID = document.getElementsByName('selLabID');
		var aDateBegan = document.getElementsByName('txtDateBegan');
		var aDateEnd = document.getElementsByName('txtDateEnd');
		var aSortOrder = document.getElementsByName('txtSortOrder');
		var aCoreMeasure = document.getElementsByName('selCoreMeasure');
		*/

		var aStudyMeasName = GetAllElementsContainingName('txtStudyMeasName');
		var aMeasureID = GetAllElementsContainingName('selMeasureID');
		var aLabID = GetAllElementsContainingName('selLabID');
		var aDateBegan = GetAllElementsContainingName('txtDateBegan');
		var aDateEnd = GetAllElementsContainingName('txtDateEnd');
		var aSortOrder = GetAllElementsContainingName('txtSortOrder');
		var aCoreMeasure = GetAllElementsContainingName('selCoreMeasure');

		
		var txtStudyMeasNameNEW = document.getElementById('txtStudyMeasNameNEW');
		var selMeasureIDNEW = document.getElementById('selMeasureIDNEW');
		var selLabIDNEW = document.getElementById('selLabIDNEW');
		var txtDateBeganNEW = document.getElementById('txtDateBeganNEW');
		var txtDateEndNEW = document.getElementById('txtDateEndNEW');
		var txtSortOrderNEW = document.getElementById('txtSortOrderNEW');
		var selCoreMeasureNEW = document.getElementById('selCoreMeasureNEW');
		var sErr = '';
		var oFocus = null;

		for (var i=0;i<aStudyMeasName.length;i++)
		{

			if (IsBlank(aSortOrder[i].value))
			{
				sErr += 'You must enter an Order for each Study Measure (' + aStudyMeasName[i].value + ').\n';
				if (oFocus == null) {oFocus = aSortOrder[i];}
			}
			else if (isNaN(aSortOrder[i].value))
			{
				sErr += 'The values for Order must be numeric (' + aStudyMeasName[i].value + ').\n';
				if (oFocus == null) {oFocus = aSortOrder[i];}
			}

			if (IsBlank(aStudyMeasName[i].value))
			{
				sErr += 'You must enter a Study Measure Name for each Study Measure.\n';
				if (oFocus == null) {oFocus = aStudyMeasName[i];}
			}

			if (aMeasureID[i].options[aMeasureID[i].selectedIndex].value == -1)
			{
				sErr += 'You must select a Measure for each Study Measure (' + aStudyMeasName[i].value + ').\n';
				if (oFocus == null) {oFocus = aMeasureID[i];}
			}

			if (aLabID[i].options[aLabID[i].selectedIndex].value == -1)
			{
				sErr += 'You must select a Lab for each Study Measure (' + aStudyMeasName[i].value + ').\n';
				if (oFocus == null) {oFocus = aLabID[i];}
			}

			if (!IsBlank(aDateBegan[i].value))
			{
				if (!IsValidDate(aDateBegan[i].value))
				{
					sErr += 'You must enter a Begin Date in the format: mm/dd/yyyy (' + aStudyMeasName[i].value + ').\n';
					if (oFocus == null) {oFocus = aDateBegan[i];}
				}
			}

			if (!IsBlank(aDateEnd[i].value))
			{
				if (!IsValidDate(aDateEnd[i].value))
				{
					sErr += 'You must enter an End Date in the format: mm/dd/yyyy (' + aStudyMeasName[i].value + ').\n';
					if (oFocus == null) {oFocus = aDateEnd[i];}
				}
			}

			if (!IsBlank(sErr))
				break;
		}

		if (txtStudyMeasNameNEW != null && IsBlank(sErr))
		{
			if (IsBlank(txtSortOrderNEW.value))
			{
				sErr += 'You must enter an Order for each Study Measure (' + txtStudyMeasNameNEW.value + ').\n';
				if (oFocus == null) {oFocus = txtSortOrderNEW;}
			}
			else if (isNaN(txtSortOrderNEW.value))
			{
				sErr += 'The values for Order must be numeric (' + txtStudyMeasNameNEW.value + ').\n';
				if (oFocus == null) {oFocus = txtSortOrderNEW;}
			}

			if (IsBlank(txtStudyMeasNameNEW.value))
			{
				sErr += 'You must enter a Study Measure Name for each Study Measure.\n';
				if (oFocus == null) {oFocus = txtStudyMeasNameNEW;}
			}

			if (selMeasureIDNEW.options[selMeasureIDNEW.selectedIndex].value == -1)
			{
				sErr += 'You must select a Measure for each Study Measure (' + txtStudyMeasNameNEW.value + ').\n';
				if (oFocus == null) {oFocus = selMeasureIDNEW;}
			}

			if (selLabIDNEW.options[selLabIDNEW.selectedIndex].value == -1)
			{
				sErr += 'You must select a Lab for each Study Measure (' + txtStudyMeasNameNEW.value + ').\n';
				if (oFocus == null) {oFocus = selLabIDNEW;}
			}

			if (!IsBlank(txtDateBeganNEW.value))
			{
				if (!IsValidDate(txtDateBeganNEW.value))
				{
					sErr += 'You must enter a Begin Date in the format: mm/dd/yyyy (' + txtStudyMeasNameNEW.value + ').\n';
					if (oFocus == null) {oFocus = txtDateBeganNEW;}
				}
			}

			if (!IsBlank(txtDateEndNEW.value))
			{
				if (!IsValidDate(txtDateEndNEW.value))
				{
					sErr += 'You must enter an End Date in the format: mm/dd/yyyy (' + txtStudyMeasNameNEW.value + ').\n';
					if (oFocus == null) {oFocus = txtDateEndNEW;}
				}
			}
		}

		if (!IsBlank(sErr))
		{
			alert(sErr);
			oFocus.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.style.display = 'inline';
			oFocus.focus();
			return false;
		}
		else
			return true;
	}
	else
		return true;
}

function DoSubmitEditGroups(e)
{
    var e = (e || window.event);

    if (e != null && e != 'undefined')
    {
		var aSortOrder = document.getElementsByName('txtSortOrder');
		var aGroupName = document.getElementsByName('txtGroupName');
		var aGroupDesc = document.getElementsByName('txtGroupDesc');
		var aGoalN = document.getElementsByName('txtGoalN');
		var sErr = '';
		var oFocus = null;

		for (var i=0;i<aSortOrder.length;i++)
		{
			if (IsBlank(aSortOrder[i].value))
			{
				sErr += 'You must enter an Order for each Group (' + aGroupName[i].value + ').\n';
				if (oFocus == null) {oFocus = aSortOrder[i];}
			}
			else if (isNaN(aSortOrder[i].value))
			{
				sErr += 'The values for Order must be numeric (' + aGroupName[i].value + ').\n';
				if (oFocus == null) {oFocus = aSortOrder[i];}
			}

			if (IsBlank(aGroupName[i].value))
			{
				sErr += 'You must enter an Group Name for each Group (' + aGroupName[i].value + ').\n';
				if (oFocus == null) {oFocus = aGroupName[i];}
			}

			if (IsBlank(aGroupDesc[i].value))
			{
				sErr += 'You must enter an Group Desc. for each Group (' + aGroupName[i].value + ').\n';
				if (oFocus == null) {oFocus = aGroupDesc[i];}
			}

			if (IsBlank(aGoalN[i].value))
			{
				sErr += 'You must enter an Goal # for each Group (' + aGroupName[i].value + ').\n';
				if (oFocus == null) {oFocus = aGoalN[i];}
			}
			else if (isNaN(aGoalN[i].value))
			{
				sErr += 'The values for Goal # must be numeric (' + aGroupName[i].value + ').\n';
				if (oFocus == null) {oFocus = aGoalN[i];}
			}
			else if (aGoalN[i].value <= 0)
			{
				sErr += 'The values for Goal # must be greater than zero (' + aGroupName[i].value + ').\n';
				if (oFocus == null) {oFocus = aGoalN[i];}
			}
		}

		if (!IsBlank(sErr))
		{
			alert(sErr);
			oFocus.focus();
			return false;
		}
		else
			return true;
	}
	else
		return true;
}


function DoSubmitEditActionGroups(e)
{
    var e = (e || window.event);

    if (e != null && e != 'undefined')
    {
		var aMonthsFromStart = document.getElementsByName('txtmos_from_start');
		var aLengthHours = document.getElementsByName('txtlength_hrs');
		var aStudyActionGroupID = document.getElementsByName('hidStudyActionGroupID');
		var sErr = '';
		var oFocus = null;

		for (var i=0;i<aMonthsFromStart.length;i++)
		{
			if (!IsBlank(aMonthsFromStart[i].value) && isNaN(aMonthsFromStart[i].value))
			{
				sErr += 'The values for Months From Start must be numeric.\n';
				if (oFocus == null) {oFocus = aMonthsFromStart[i];}
			}

			if (!IsBlank(aLengthHours[i].value) && isNaN(aLengthHours[i].value))
			{
				sErr += 'The values for Lenght Hours must be numeric.\n';
				if (oFocus == null) {oFocus = aLengthHours[i];}
			}
		}

		if (!IsBlank(sErr))
		{
			alert(sErr);
			oFocus.focus();
			return false;
		}
		else
			return true;
	}
	else
		return true;
}


function DoSubmitEditStudy(e)
{
    var e = (e || window.event);

    if (e != null && e != 'undefined')
    {
		var txtStudyName = GetReferenceToASPNETControl('txtStudyName');
		var txtStudyFullName = GetReferenceToASPNETControl('txtStudyFullName');
		var selGrantID = GetReferenceToASPNETControl('selGrantID');
		var txtStartDate = GetReferenceToASPNETControl('txtStartDate');
		var txtEndDate = GetReferenceToASPNETControl('txtEndDate');
		var selStaffContact = GetReferenceToASPNETControl('selStaffContact');
		var selStaffPI = GetReferenceToASPNETControl('selStaffPI');
		var oIFrame = document.getElementsByTagName('iframe')[0];
		var sErr = '';
		var oFocus = null;

		if (IsBlank(txtStudyName.value))
		{
			sErr += 'You must enter a Study Name.\n';
			if (oFocus == null) {oFocus = txtStudyName;}
		}

		if (IsBlank(txtStudyFullName.value))
		{
			sErr += 'You must enter a Study Full Name.\n';
			if (oFocus == null) {oFocus = txtStudyFullName;}
		}

		if (!IsBlank(txtStartDate.value))
		{
			if (!IsValidDate(txtStartDate.value))
			{
				sErr += 'Start Date must be in the format: mm/dd/yyyy.\n';
				if (oFocus == null) {oFocus = txtStartDate;}
			}
		}

		if (!IsBlank(txtEndDate.value))
		{
			if (!IsValidDate(txtEndDate.value))
			{
				sErr += 'End Date must be in the format: mm/dd/yyyy.\n';
				if (oFocus == null) {oFocus = txtEndDate;}
			}
		}

		if (selGrantID.options[selGrantID.selectedIndex].value == -1)
		{
			sErr += 'You must enter a Grant.\n';
			if (oFocus == null) {oFocus = selGrantID;}
		}

		if (selStaffContact.options[selStaffContact.selectedIndex].value == -1)
		{
			sErr += 'You must enter a Staff Contact.\n';
			if (oFocus == null) {oFocus = selStaffContact;}
		}

		if (selStaffPI.options[selStaffPI.selectedIndex].value == -1)
		{
			sErr += 'You must enter a PI.\n';
			if (oFocus == null) {oFocus = selStaffPI;}
		}

		if (!IsBlank(sErr))
		{
			alert(sErr);

			if (oFocus != null)
				oFocus.focus();

			return false;
		}
		else
		{
			if (oIFrame.style.display == 'inline')
			{
				if (window.confirm('If you have not saved changes to Groups/Actions/Measures, these changes will be lost. Do you wish to continue?'))
					return true;
				else
					return false;
			}
			else
				return true;
		}
	}
	else
		return true;
}

function DoSubmitEditConsentForms(e)
{
    var e = (e || window.event);

    if (e != null && e != 'undefined')
    {
		var txtConsentFormName = GetReferenceToASPNETControl('txtConsentFormName');
		var txtConsentFormNameShort = GetReferenceToASPNETControl('txtConsentFormNameShort');
		var selGroupIDs = GetReferenceToASPNETControl('selGroupIDs');
		var aVersions = document.getElementsByName('txtVersion');
		var aVersionNames = document.getElementsByName('txtConsentFormVersionName');
		var aApprovalDates = document.getElementsByName('txtApprovedDate');
		var aEffectiveDates = document.getElementsByName('txtEffectiveDate');
		var aEndingDates = document.getElementsByName('txtEndingDate');
		var oFocus = null;
		var sErr = '';

		if (IsBlank(txtConsentFormName.value))
		{
			sErr += 'You must enter a Consent Form Name.\n';
			if (oFocus == null) {oFocus = txtConsentFormName;}
		}

		if (aVersions != null)
		{
			for (var i=0;i<aVersions.length;i++)
			{
				if (IsBlank(aVersions[i].value))
				{
					sErr += 'You must enter a Version number (' + aVersionNames[i].value + ').\n';
					if (oFocus == null) {oFocus = aVersions[i];}
				}
				else if (isNaN(aVersions[i].value))
				{
					sErr += 'Version Number must be a number (' + aVersionNames[i].value + ').\n';
					if (oFocus == null) {oFocus = aVersions[i];}
				}

				if (IsBlank(aVersionNames[i].value))
				{
					sErr += 'You must enter a Version Name.\n';
					if (oFocus == null) {oFocus = aVersionNames[i];}
				}

				if (IsBlank(aApprovalDates[i].value))
				{
					sErr += 'You must enter an Approved Date (' + aVersionNames[i].value + ').\n';
					if (oFocus == null) {oFocus = aApprovalDates[i];}
				}
				else if (!IsValidDate(aApprovalDates[i].value))
				{
					sErr += 'Approved Date must be in the format: mm/dd/yyyy (' + aVersionNames[i].value + ').\n';
					if (oFocus == null) {oFocus = aApprovalDates[i];}
				}

				if (IsBlank(aEffectiveDates[i].value))
				{
					sErr += 'You must enter an Effective Date  (' + aVersionNames[i].value + ').\n';
					if (oFocus == null) {oFocus = aEffectiveDates[i];}
				}
				else if (!IsValidDate(aEffectiveDates[i].value))
				{
					sErr += 'Effective Date must be in the format: mm/dd/yyyy (' + aVersionNames[i].value + ').\n';
					if (oFocus == null) {oFocus = aEffectiveDates[i];}
				}
				

				if (!IsBlank(aEndingDates[i].value))
				{
					if (!IsValidDate(aEndingDates[i].value))
					{
						sErr += 'End Date must be in the format: mm/dd/yyyy.\n';
						if (oFocus == null) {oFocus = aEndingDates[i];}
					}
				}
			}
		}

		if (!IsBlank(sErr))
		{
			alert(sErr);
			if (oFocus != null) {oFocus.focus();}
			return false;
		}
		else
			return true;
	}
	else
		return true;
}

function DoSubmitEditMeasureActionAssignments(e, bIsCounterBalanced)
{
    var e = (e || window.event);

    if (e != null && e != 'undefined')
    {
		var aStudyActionIDs = null;
		var bIsErr = false;

		if (bIsCounterBalanced)
			aStudyActionIDs = document.getElementsByName('selStudyActionID');
		else
			aStudyActionIDs = document.getElementsByName('selStudyActionGroupID');

		for (var i=0;i<aStudyActionIDs.length;i++)
		{
			if (aStudyActionIDs[i].options[aStudyActionIDs[i].selectedIndex].value == -1)
			{
				bIsErr = true;
				break;
			}
		}

		if (bIsErr)
			return confirm('Not all of the Measures have been assigned to an Action. Are you sure you want to continue?\n');
		else
			return true;
	}
	else
		return true;
}

function DoSubmitEditConsentActionAssignments(e)
{
    var e = (e || window.event);

    if (e != null && e != 'undefined')
    {
		var aStudyActionIDs = null;
		var bIsErr = false;

		aStudyActionIDs = document.getElementsByName('selStudyActionGroupID');

		for (var i=0;i<aStudyActionIDs.length;i++)
		{
			if (aStudyActionIDs[i].options[aStudyActionIDs[i].selectedIndex].value == -1)
			{
				bIsErr = true;
				break;
			}
		}

		if (bIsErr)
			return confirm('Not all of the Consents have been assigned to an Action. Are you sure you want to continue?\n');
		else
			return true;
	}
	else
		return true;
}

function DoSubmitMeasureMetaData()
{
	var selMeasureID = document.getElementById('selMeasureID');
	var txtAdminTime = document.getElementById('txtAdminTime');
	var selMeasCatID = document.getElementById('selMeasCatID');
	var selMeasRespID = document.getElementById('selMeasRespID');
	var selMeasFocusID = document.getElementById('selMeasFocusID');
	var selMeasMethodID = document.getElementById('selMeasMethodID');
	var txtDateBegin = document.getElementById('txtDateBegin');
	var txtDateEnd = document.getElementById('txtDateEnd');
	var txtDescription = document.getElementById('txtDescription');
	var txtCitation = document.getElementById('txtCitation');
	var sErr = '';

	if (selMeasureID.options[selMeasureID.selectedIndex].value == -1)
		sErr += 'You must select a Measure.\n';

	if (!IsBlank(txtAdminTime.value))
	{
		if (isNaN(txtAdminTime.value))
			sErr += 'The Admin. Time must be a numeric value.\n';
		else if (txtAdminTime.value <= 0 || txtAdminTime.value > 300)
			sErr += 'The Admin. Time must be a value between 1 and 300.\n';
	}

	if (selMeasCatID.options[selMeasCatID.selectedIndex].value == -1)
		sErr += 'You must select a Domain.\n';

	if (selMeasRespID.options[selMeasRespID.selectedIndex].value == -1)
		sErr += 'You must select a Respondent.\n';

	if (selMeasFocusID.options[selMeasFocusID.selectedIndex].value == -1)
		sErr += 'You must select a Focus Person.\n';

	if (selMeasMethodID.options[selMeasMethodID.selectedIndex].value == -1)
		sErr += 'You must select a Method.\n';

	if (IsBlank(txtDateBegin.value))
		sErr += 'You must enter a date for Date Began Using.\n';
	else if (!IsValidDate(txtDateBegin.value))
		sErr += 'The value you entered for Date Began Using must be in the format: mm/dd/yyyy.';

	if (!IsBlank(txtDateEnd.value))
	{
		 if (!IsValidDate(txtDateEnd.value))
			sErr += 'The value you entered for Date End Using must be in the format: mm/dd/yyyy.';
	}

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}
/***********************************************************************************************
BEGIN REPORTS VALIDATION CODE
***********************************************************************************************/
function DoSubmitEditReport(e)
{
    var e = (e || window.event);

    if (e != null && e != 'undefined')
    {
		var selReportID = GetReferenceToASPNETControl('selReportID');
		var selStudyIDs = GetReferenceToASPNETControl('selStudyIDs');
		var txtRptName = GetReferenceToASPNETControl('txtRptName');
		var selRptCategory = GetReferenceToASPNETControl('selRptCategory');
		var selRptType = GetReferenceToASPNETControl('selRptType');
		var txtCommandText = GetReferenceToASPNETControl('txtCommandText');
		var sErr = '';

		if (IsBlank(txtRptName.value))
			sErr += 'You must enter a Report Name.\n';

		if (!HasAnItemSelected(selStudyIDs))
			sErr += 'You must select at least one Study.\n';

		if (selRptCategory.options[selRptCategory.selectedIndex].value == -1)
			sErr += 'You must select a Report Category.\n';

		if (selRptType.options[selRptType.selectedIndex].value == -1)
			sErr += 'You must select a Report Type.\n';

		if (IsBlank(txtCommandText.value))
			sErr += 'You must enter a Report Source.\n';

		if (!IsBlank(sErr))
		{
			alert(sErr);
			return false;
		}
		else
			return true;
	}
	else
		return true;
}

function DoSubmitEditParamsAndLinks()
{
	var oControls = document.forms[0].elements;
	var sErr = '';
	var i = 0;

	for (i=0;i<oControls.length;i++)
	{
		if (StartsWith(oControls[i].name, 'txtParamName') && IsBlank(oControls[i].value))
			sErr += 'You must enter a Parameter Name for each parameter.\n';

		if (StartsWith(oControls[i].name, 'txtFriendlyName') && IsBlank(oControls[i].value))
			sErr += 'You must enter a Friendly Name for each parameter.\n';

		if (StartsWith(oControls[i].name, 'txtLength') && IsBlank(oControls[i].value))
			sErr += 'You must enter a Length for each parameter.\n';
		else if (StartsWith(oControls[i].name, 'txtLength') && isNaN(oControls[i].value))
			sErr += 'The Length you enter for each parameter must be numeric.\n';
		else if (StartsWith(oControls[i].name, 'txtLength') && oControls[i].value <= 0)
			sErr += 'The Length you enter for each parameter must be greater than zero.\n';

		if (StartsWith(oControls[i].name, 'selDataSourceType'))
		{
			if (oControls[i].options[oControls[i].selectedIndex].value != 4 && oControls[i].options[oControls[i].selectedIndex].value != -1)
			{
				if (IsBlank(oControls[i+1].value))
					sErr += 'All Data Sources except "Empty" require Data Source Text.\n';

				if (IsBlank(oControls[i+2].value))
					sErr += 'All Data Sources except "Empty" require a Data Source ID Field.\n';

				if (IsBlank(oControls[i+3].value))
					sErr += 'All Data Sources except "Empty" require a Data Source Text Field.\n';
			}
		}

		if (StartsWith(oControls[i].name, 'txtLinkText') && IsBlank(oControls[i].value))
			sErr += 'You must enter a Link Text Source for each Link Column.\n';

		if (StartsWith(oControls[i].name, 'txtLinkURL') && IsBlank(oControls[i].value) && !StartsWith(oControls[i].name, 'txtLinkURLParam'))
			sErr += 'You must enter a Link URL for each Link Column.\n';
	}

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function DoSubmitUserDefinedReport()
{
	var hidPage = GetReferenceToASPNETControl('hidPage');
	var selStudy = GetReferenceToASPNETControl('selStudy');
	var selStudyActionID = GetReferenceToASPNETControl('selStudyActionID');
	var selStudyMeasureID = GetReferenceToASPNETControl('selStudyMeasureID');
	var sErr = '';

	if (hidPage.value == 1)
	{
		if (selStudy.options[selStudy.selectedIndex].value == -1)
			sErr += 'You must select a Study.\n';

		if (!HasAnItemSelected(selStudyActionID) && !HasAnItemSelected(selStudyMeasureID))
			sErr += 'You must select at least one Action or Measure.\n';
	}
	else if (hidPage.value == 2)
	{
		
	}
	else if (hidPage.value == 3)
	{
		
	}

	if (!IsBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}