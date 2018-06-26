function doSubmitActionStatus()
{
	var nRespForID = GetReferenceToASPNETControl('selRespForID').options[GetReferenceToASPNETControl('selRespForID').selectedIndex].value;
	var nActionStatusID = GetReferenceToASPNETControl('selActionStatusID').options[GetReferenceToASPNETControl('selActionStatusID').selectedIndex].value;
	var nCompByID = GetReferenceToASPNETControl('selCompByID').options[GetReferenceToASPNETControl('selCompByID').selectedIndex].value;
	var dtDateDone = GetReferenceToASPNETControl('txtDateDone').value;
	var dtDueDateStart = GetReferenceToASPNETControl('txtDueDateStart').value;
	var dtDueDateEnd = GetReferenceToASPNETControl('txtDueDateEnd').value;
	var sNotes = GetReferenceToASPNETControl('txtNotes').value;
	var sErr = '';


	if (nActionStatusID == -1)
		sErr += 'You must select an Action Status.\n';
	else if (nActionStatusID == 1)
	{
		if (nCompByID == -1)
			sErr += 'You must select the person who completed this Action.\n';

		if (isBlank(dtDateDone) || (!isValidDate(dtDateDone)))
			sErr += 'The Date Done must be in the format: mm/dd/yyyy.\n';
		else
		{
			var oDate = new Date(dtDateDone);

			if (oDate.getFullYear() < 1998)
				sErr += 'The Date Done must be after 01/01/1998.\n'
		}
	}

	if (!isBlank(dtDueDateStart))
	{
		if (!isValidDate(dtDueDateStart))
			sErr += 'The Due Date Start must be in the format: mm/dd/yyyy.\n';
	}

	if (!isBlank(dtDueDateEnd))
	{
		if (!isValidDate(dtDueDateEnd))
			sErr += 'The Due Date End must be in the format: mm/dd/yyyy.\n';
	}

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function doSubmitMeasureStatus()
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

			if (isBlank(dtDateDone))
				sErr += 'You must enter a valid Date Done in the format: mm/dd/yyyy.\n';
			else if (!isValidDate(dtDateDone))
				sErr += 'The Date Done must be in the format: mm/dd/yyyy.\n';
			else
			{
				var oDate = new Date(dtDateDone);

				if (oDate.getFullYear() < 1998)
					sErr += 'The Date Done must be after 01/01/1998.\n'
			}
		}
	}

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function doSubmitMultipleMeasureStatus()
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

			if (isBlank(dtDateDone))
				sErr += 'You must enter a valid date in the format: mm/dd/yyyy.\n';
			else if (!isValidDate(dtDateDone))
				sErr += 'The Date Done must be in the format: mm/dd/yyyy.\n';
			else
			{
				var oDate = new Date(dtDateDone);

				if (oDate.getFullYear() < 1998)
					sErr += 'The Date Done must be after 01/01/1998.\n'
			}
		}
	}

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function doSumitMultipleActionStatus()
{
	var txtDateDone = GetReferenceToASPNETControl('txtDateDone');
	var selCompBy = GetReferenceToASPNETControl('selCompBy');
	var sErr = '';

	if (!isValidDate(txtDateDone.value))
		sErr += 'The "Date Done" you entered is invalid. Please enter a valid date in the format: mm/dd/yyyy.\n';
	else
	{
		var oDate = new Date(txtDateDone.value);

		if (oDate.getFullYear() < 1998)
			sErr += 'The Date Done must be after 01/01/1998.\n'
	}

	if (selCompBy.options[selCompBy.selectedIndex].value == -1)
		sErr += 'You must select the person who completed these actions.\n';

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function doChangeSearchForm(sSearchType, bIsAdvanced)
{
	var oSharedForm = GetReferenceToASPNETNonFormControl('trSharedForm', 'tr');
	var oActionForm = GetReferenceToASPNETNonFormControl('trActionForm', 'tr');
	var oMeasureForm = GetReferenceToASPNETNonFormControl('trMeasureForm', 'tr');
	var oConsentForm = GetReferenceToASPNETNonFormControl('trConsentForm', 'tr');
	var oSubmitForm = GetReferenceToASPNETNonFormControl('trSubmitForm', 'tr');

	var selStudyID = GetReferenceToASPNETControl('selStudyID');
	var selActionStatusID = GetReferenceToASPNETControl('selActionStatusID');
	var selMeasureStatusID = GetReferenceToASPNETControl('selMeasureStatusID');
	var selMeasureStatusDetailID = GetReferenceToASPNETControl('selMeasureStatusDetailID');
	var selRespForID = GetReferenceToASPNETControl('selRespForID');
	var selCompByID = GetReferenceToASPNETControl('selCompByID');
	var txtStartDate = GetReferenceToASPNETControl('txtStartDate');
	var txtEndDate = GetReferenceToASPNETControl('txtEndDate');
	var selStudyActionID = GetReferenceToASPNETControl('selStudyActionID');
	var selStudyMeasureID = GetReferenceToASPNETControl('selStudyMeasureID');
	var selSubjectStatusID = GetReferenceToASPNETControl('selSubjectStatusID');
	var selSubjectStatusDetailID = GetReferenceToASPNETControl('selSubjectStatusDetailID');
	var txtSubjID = GetReferenceToASPNETControl('txtSubjID');

	if (sSearchType == 'S')
	{
		oActionForm.style.display = 'none';
		oMeasureForm.style.display = 'none';

		if (bIsAdvanced)
		{
			oSharedForm.style.display = 'none';

			selActionStatusID.disabled = true;
			selMeasureStatusID.disabled = true;
			selMeasureStatusDetailID.disabled = true;
			selRespForID.disabled = true;
			selCompByID.disabled = true;
			txtStartDate.disabled = true;
			txtEndDate.disabled = true;
		}
		else
		{
			oConsentForm.style.display = 'none';
			selStudyActionID.disabled = true;
			selStudyMeasureID.disabled = true;
		}
	}
	else if (sSearchType == 'A')
	{
		oActionForm.style.display = 'inline';
		oMeasureForm.style.display = 'none';

		if (bIsAdvanced)
		{
			oSharedForm.style.display = 'inline';
			selSubjectStatusID.disabled = false;
//			selSubjectStatusDetailID.disabled = false;
			txtSubjID.disabled = false;
			txtSubjID.style.backgroundColor = '#ffffff';
			selActionStatusID.disabled = false;
			selMeasureStatusID.disabled = true;
			selMeasureStatusDetailID.disabled = true;
			selRespForID.disabled = false;
			selCompByID.disabled = false;
			txtStartDate.disabled = false;
			txtEndDate.disabled = false;

			if (selStudyID.options[selStudyID.selectedIndex].value != -1)
			{
				doSyncDropDowns(selStudyID.options[selStudyID.selectedIndex].value, null, 'studyactions', 'selStudyActionID');
				doSyncDropDowns(selStudyID.options[selStudyID.selectedIndex].value, null, 'studymeasures', 'selStudyMeasureID');
			}
		}
		else
		{
			oConsentForm.style.display = 'none';
			selStudyActionID.disabled = false;
			selStudyMeasureID.disabled = true;
		}
	}
	else if (sSearchType == 'M')
	{
		oActionForm.style.display = 'none';
		oMeasureForm.style.display = 'inline';

		if (bIsAdvanced)
		{
			oSharedForm.style.display = 'inline';
			selSubjectStatusID.disabled = false;
			txtSubjID.disabled = false;
			txtSubjID.style.backgroundColor = '#ffffff';
			selMeasureStatusID.disabled = false;
			selMeasureStatusDetailID.disabled = false;
			selRespForID.disabled = true;
			selCompByID.disabled = true;
			txtStartDate.disabled = false;
			txtEndDate.disabled = false;

			if (selStudyID.options[selStudyID.selectedIndex].value != -1)
			{
				doSyncDropDowns(selStudyID.options[selStudyID.selectedIndex].value, null, 'studyactions', 'selStudyActionID');
				doSyncDropDowns(selStudyID.options[selStudyID.selectedIndex].value, null, 'studymeasures', 'selStudyMeasureID');
			}
		}
		else
		{
			oConsentForm.style.display = 'none';
			selStudyActionID.disabled = true;
			selStudyMeasureID.disabled = false;
		}
	}
	else if (sSearchType == 'C')
	{
		oActionForm.style.display = 'none';
		oMeasureForm.style.display = 'none';

		if (!bIsAdvanced)
			oConsentForm.style.display = 'inline';

		selStudyActionID.disabled = true;
		selStudyMeasureID.disabled = true;
	}

	oSubmitForm.style.display = '';
}

function doSubmitSearch()
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

	if (isBlank(oSubjID.value))
	{
		if (sSearchType == 'A' && oStudyAction.options[oStudyAction.selectedIndex].value == -1)
			sErr += 'You must enter a Subject ID or an Action.\n';
		else if (sSearchType == 'M' && oStudyMeasure.options[oStudyMeasure.selectedIndex].value == -1)
			sErr += 'You must enter a Subject ID or a Measure.\n';
		else if (sSearchType == 'C' && oConsentForm.options[oConsentForm.selectedIndex].value == -1)
			sErr += 'You must enter a Subject ID or a Consent Form.\n';
	}

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else if (bSubmit)
		return true;
	else
		return false;
}

function doSubmitAdvancedSearch()
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
			if (oLab.options[oLab.selectedIndex].value == -1 && oRespFor.options[oRespFor.selectedIndex].value == -1 && oCompBy.options[oCompBy.selectedIndex].value == -1 && oActionStatus.options[oActionStatus.selectedIndex].value == -1 && !HasAnItemSelected(oActions) && isBlank(oSubjID.value) && oActionType.options[oActionType.selectedIndex].value == -1 && !HasAnItemSelected(oSubjStatus) && isBlank(oStartDate.value) && isBlank(oEndDate.value))
				sErr += 'You must enter some action criteria.\n';
		}
		else if (oLab.options[oLab.selectedIndex].value == -1)
			sErr += 'You must select a study or a lab.\n';
		else if (oLab.options[oLab.selectedIndex].value == 1)
			sErr += 'If you select the Dawson Lab, you must also select a study.\n';

		if (!isBlank(oStartDate.value))
		{
			if (!isValidDate(oStartDate.value))
				sErr += 'Start Date must be in the format: "mm/dd/yyyy".';
		}

		if (!isBlank(oEndDate.value))
		{
			if (!isValidDate(oEndDate.value))
				sErr += 'End Date must be in the format: "mm/dd/yyyy".';
		}
	}
	else if (sSearchType == 'M')
	{
		if (oStudy.options[oStudy.selectedIndex].value != -1)
		{
			if (oLab.options[oLab.selectedIndex].value == -1 && oMeasStatus.options[oMeasStatus.selectedIndex].value == -1 && oMeasStatusDetail.options[oMeasStatusDetail.selectedIndex].value == -1 && !HasAnItemSelected(oMeasures) && isBlank(oSubjID.value) && !HasAnItemSelected(oSubjStatus) && oActionStatus.options[oActionStatus.selectedIndex].value == -1 && isBlank(oStartDate.value) && isBlank(oEndDate.value))
				sErr += 'You must enter some measure criteria.\n';
		}
		else if (oLab.options[oLab.selectedIndex].value == -1)
			sErr += 'You must select a study or a lab.\n';
		else if (oLab.options[oLab.selectedIndex].value == 1)
			sErr += 'If you select the Dawson Lab, you must also select a study.\n';

		if (!isBlank(oStartDate.value))
		{
			if (!isValidDate(oStartDate.value))
				sErr += 'Start Date must be in the format: "mm/dd/yyyy".';
		}

		if (!isBlank(oEndDate.value))
		{
			if (!isValidDate(oEndDate.value))
				sErr += 'End Date must be in the format: "mm/dd/yyyy".';
		}
	}
	else
		sErr = 'You must select the search type (Subjects, Actions, or Measures).\n';

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function checkStatus(bIsAdvanced)
{
	var oStudyID = GetReferenceToASPNETControl('selStudyID');
	var oGroupID = GetReferenceToASPNETControl('selGroupID');
	var oMeasStatus = GetReferenceToASPNETControl('selMeasureStatusID');
	var oSharedRow = GetReferenceToASPNETNonFormControl('trSharedForm', 'tr');
	var oActionRow = GetReferenceToASPNETNonFormControl('trActionForm', 'tr');
	var oMeasureRow = GetReferenceToASPNETNonFormControl('trMeasureForm', 'tr');
	var oConsentRow = GetReferenceToASPNETNonFormControl('trConsentForm', 'tr');
	var oSubmitRow = GetReferenceToASPNETNonFormControl('trSubmitForm', 'tr');
	var sSearchType = null;

	if (oStudyID != null && oStudyID.options != undefined)
	{
		sSearchType = GetSearchType();

		if (sSearchType == 'A')
		{
			oActionRow.style.display = 'inline';
			if (bIsAdvanced) {oSharedRow.style.display = 'inline';}
		}
		else if (sSearchType == 'M')
		{
			oMeasureRow.style.display = 'inline';
			if (bIsAdvanced) {oSharedRow.style.display = 'inline';}
		}
		else if (sSearchType == 'C')
		{
			oConsentRow.style.display = 'inline';
			if (bIsAdvanced) {oSharedRow.style.display = 'inline';}
		}

		if (bIsAdvanced)
		{
			oSubmitRow.style.display = 'inline';
			doSyncDropDowns(oStudyID.options[oStudyID.selectedIndex].value, null, 'studyactions', 'selStudyActionID');
			doSyncDropDowns(oStudyID.options[oStudyID.selectedIndex].value, null, 'studymeasures', 'selStudyMeasureID');
			doSyncDropDowns(oMeasStatus.options[oMeasStatus.selectedIndex].value, null, 'measures', 'selMeasureStatusDetailID');
			doSyncDropDowns(oStudyID.options[oStudyID.selectedIndex].value, null, 'group', 'selGroupID');
		}
		else
		{
			doSyncDropDowns(oStudyID.options[oStudyID.selectedIndex].value, null, 'studyactions', 'selStudyActionID');
			doSyncDropDowns(oStudyID.options[oStudyID.selectedIndex].value, null, 'studymeasures', 'selStudyMeasureID');
			doSyncDropDowns(oStudyID.options[oStudyID.selectedIndex].value, null, 'consentforms', 'selConsentFormID');
		}
	}
}

function GetSearchType()
{
	var sSearchType = null;

	for (i=0;i<document.forms[0].elements.length;i++)
	{
		if (EndsWith(document.forms[0].elements[i].name, 'radSearchType'))
		{
			if (document.forms[0].elements[i].checked)
			{
				sSearchType = document.forms[0].elements[i].value;
				break;
			}
		}
	}

	return sSearchType;
}

function EditMultipleMeasures(nActionID)
{
	var oForm = document.forms[0];
	var sStudyMeasSubjIDs = '';
	var i;

	for (i=0;i<oForm.elements.length;i++)
	{
		if (oForm.elements[i].name == 'chkMeasToEdit')
		{
			if (oForm.elements[i].checked)
				sStudyMeasSubjIDs += oForm.elements[i].value + ',';
		}
	}

	if (sStudyMeasSubjIDs.length > 0)
	{
		sStudyMeasSubjIDs = sStudyMeasSubjIDs.slice(0, sStudyMeasSubjIDs.length - 1);

		popUpWindow('/Measures/EditMultipleMeasures.aspx?DoRefresh=true&ActionID=' + nActionID + '&StudyMeasSubjIDs=' + sStudyMeasSubjIDs, 'oWindow', 'toolbars=no,statusbar=no,addressbar=no,width=600,height=400');
	}
	else
		alert('You must select at least one Measure to edit.\n');
}

function EditMultipleActions(nSubjectID, sActionStatus)
{
	var oForm = document.forms[0];
	var sActionIDs = '';
	var i;

	for (i=0;i<oForm.elements.length;i++)
	{
		if (oForm.elements[i].name == 'chkActionIDs')
		{
			if (oForm.elements[i].checked)
				sActionIDs += oForm.elements[i].value + ',';
		}
	}

	if (sActionIDs.length > 0)
	{
		sActionIDs = sActionIDs.slice(0, sActionIDs.length - 1);

		popUpWindow('/Measures/EditMultipleActions.aspx?DoRefresh=true&ActionStatus=' + sActionStatus + '&SubjID=' + nSubjectID + '&ActionIDs=' + sActionIDs, 'oWindow', 'toolbars=no,statusbar=no,addressbar=no,width=600,height=400');
	}
	else
		alert('You must select at least one Action to edit.\n');
}

function doSubmitScheduleAction()
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

	if (isBlank(txtDateDone.value))
		sErr += 'You must enter an Appointment Date.\n';

	if (selStartTime.options[selStartTime.selectedIndex].value == -1)
		sErr += 'You must enter a Start Time.\n';

	if (selEndTime.options[selEndTime.selectedIndex].value == -1)
		sErr += 'You must enter an End Time.\n';

	if (isBlank(sErr))
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

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function AddAssistants(nTotalNumRows)
{
	if (nTotalNumRows >= 5)
		alert('The maximum number of Staff Members (5) has already been added to this Action.\n');
	else
	{
		var nNumberToAdd = window.prompt('How many assistants would you like to add?', '');
		var tblMaster = GetReferenceToASPNETNonFormControl('tblMaster', 'table');
		var btnAddStaff = GetReferenceToASPNETControl('btnAddStaff');
		var sRegExp = /selected="true"/;
		var oTr = null;
		var oTd = null;
		var i = 0;

		if (!isBlank(nNumberToAdd))
		{
			if (isNaN(nNumberToAdd) || nNumberToAdd < 1 || nNumberToAdd > 5)
			{
				alert('You must enter a number greater than zero and less than five.\n');
				return;
			}
			else if ((nTotalNumRows + parseInt(nNumberToAdd)) > 5)
			{
				alert('The maximum number of staff members for an Action is five.\n');
				return;
			}

			nTotalNumRows = nTotalNumRows + nNumberToAdd;

			for (i=0;i<nNumberToAdd;i++)
			{
				if (document.all)
				{
					oTr = tblMaster.insertRow(tblMaster.rows.length - 1);
					oTr.style.display = '';

					oTd = oTr.insertCell();
					oTd.innerHTML = tblMaster.rows[3].cells[0].innerHTML;

					oTd = oTr.insertCell();
					oTd.innerHTML = tblMaster.rows[3].cells[1].innerHTML;

					oTd = oTr.insertCell();
					oTd.innerHTML = tblMaster.rows[3].cells[2].innerHTML;

					for (j=0;j<oTr.all.length;j++)
					{
						if (oTr.all[j].type == 'select-one')
							oTr.all[j].selectedIndex = 0;
						else if (oTr.all[j].type == 'textarea')
							oTr.all[j].value = '';
					}
				}
				else
				{
					oTr = document.createElement('tr');
					oTr.style.display = '';
					
					oTd = document.createElement('td');
					oTd.innerHTML = tblMaster.rows[3].cells[0].innerHTML;
					oTr.appendChild(oTd);

					oTd = document.createElement('td');
					oTd.innerHTML = tblMaster.rows[3].cells[1].innerHTML;
					oTr.appendChild(oTd);

					oTd = document.createElement('td');
					oTd.innerHTML = tblMaster.rows[3].cells[2].innerHTML;
					oTr.appendChild(oTd);

					tblMaster.appendChild(oTr);
				}
			}
		}
	}
}

function doSubmitAddAssistants()
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

	if (!isBlank(sErr))
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

function MoveMeasuresToNewAction(nActionID)
{
	var oForm = document.forms[0];
	var sStudyMeasSubjIDs = '';
	var i;

	for (i=0;i<oForm.elements.length;i++)
	{
		if (oForm.elements[i].name == 'chkMeasToEdit')
		{
			if (oForm.elements[i].checked)
				sStudyMeasSubjIDs += oForm.elements[i].value + ',';
		}
	}

	if (sStudyMeasSubjIDs.length > 0)
	{
		sStudyMeasSubjIDs = sStudyMeasSubjIDs.slice(0, sStudyMeasSubjIDs.length - 1);

		popUpWindow('/Measures/MoveMeasures.aspx?DoRefresh=true&ActionID=' + nActionID + '&StudyMeasSubjIDs=' + sStudyMeasSubjIDs, 'oWindow', 'toolbars=no,statusbar=no,addressbar=no,width=600,height=400');
	}
	else
		alert('You must select at least one Measure to move.\n');
}

function doSubmitMoveMeasures()
{
	var selActionID = GetReferenceToASPNETControl('selActionID');
	var sErr = '';

	if (selActionID.options[selActionID.selectedIndex].value == -1)
		sErr += 'You must select an Action to continue.\n';

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function doSubmitMeasureMetaData()
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

	if (!isBlank(txtAdminTime.value))
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

	if (isBlank(txtDateBegin.value))
		sErr += 'You must enter a date for Date Began Using.\n';
	else if (!isValidDate(txtDateBegin.value))
		sErr += 'The value you entered for Date Began Using must be in the format: mm/dd/yyyy.';

	if (!isBlank(txtDateEnd.value))
	{
		 if (!isValidDate(txtDateEnd.value))
			sErr += 'The value you entered for Date End Using must be in the format: mm/dd/yyyy.';
	}

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function doSubmitSubjectStatus()
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

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function doSubmitConsentForms()
{
	var selConsentFormVersionID = GetReferenceToASPNETControl('selConsentFormVersionID');
	var txtDateSigned = GetReferenceToASPNETControl('txtDateSigned');
	var sErr = '';

	if (isBlank(txtDateSigned.value))
	{
		if (!window.confirm('Setting the Date Signed to blank will indicate that this Consent Form has not been recieved. Do you want to continue?\n'))
			return false;
	}
	else if (!isValidDate(txtDateSigned.value))
		sErr += 'The Date Signed must be in the format: mm/dd/yyyy.\n';
	else if (selConsentFormVersionID.options[selConsentFormVersionID.selectedIndex].value == -1)
		sErr += 'You must select a Consent Form Version.';
	else
	{
		var oDate = new Date(txtDateSigned.value);

		if (oDate.getFullYear() < 1998)
			sErr += 'The Date Done must be after 01/01/1998.\n'
	}

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function EditMultipleConsents(nActionID)
{
	var oForm = document.forms[0];
	var sSubjConsentIDs = '';
	var i;

	for (i=0;i<oForm.elements.length;i++)
	{
		if (oForm.elements[i].name == 'chkConsentToEdit')
		{
			if (oForm.elements[i].checked)
				sSubjConsentIDs += oForm.elements[i].value + ',';
		}
	}

	if (sSubjConsentIDs.length > 0)
	{
		sSubjConsentIDs = sSubjConsentIDs.slice(0, sSubjConsentIDs.length - 1);

		popUpWindow('/Measures/EditMultipleConsents.aspx?DoRefresh=true&ActionID=' + nActionID + '&SubjConsentIDs=' + sSubjConsentIDs, 'oWindow', 'toolbars=no,statusbar=no,addressbar=no,scrollbars=yes,width=600,height=400');
	}
	else
		alert('You must select at least one Consent Form to edit.\n');
}

function MoveConsentsToNewAction(nActionID)
{
	var oForm = document.forms[0];
	var sSubjConsentIDs = '';
	var i;

	for (i=0;i<oForm.elements.length;i++)
	{
		if (oForm.elements[i].name == 'chkConsentToEdit')
		{
			if (oForm.elements[i].checked)
				sSubjConsentIDs += oForm.elements[i].value + ',';
		}
	}

	if (sSubjConsentIDs.length > 0)
	{
		sSubjConsentIDs = sSubjConsentIDs.slice(0, sSubjConsentIDs.length - 1);

		popUpWindow('/Measures/MoveConsents.aspx?DoRefresh=true&ActionID=' + nActionID + '&SubjConsentIDs=' + sSubjConsentIDs, 'oWindow', 'toolbars=no,statusbar=no,addressbar=no,width=600,height=400');
	}
	else
		alert('You must select at least one Consent Form to move.\n');
}

function doSubmitMultipleConsentForms()
{
	var txtDateSigned = GetReferenceToASPNETControl('txtDateSigned');
	var selConsentFormVersionID = GetReferenceToASPNETControl('selConsentFormVersionID');
	var txtaNotes = GetReferenceToASPNETControl('txtaNotes');
	var sErr = '';

	if (isBlank(txtDateSigned.value))
	{
		if (!window.confirm('Setting the Date Signed to blank will indicate that this Consent Form has not been recieved. Do you want to continue?\n'))
			return false;
	}
	else if (!isValidDate(txtDateSigned.value))
		sErr += 'The Date Signed must be in the format: mm/dd/yyyy.\n';
	else
	{
		var oDate = new Date(txtDateSigned.value);

		if (oDate.getFullYear() < 1998)
			sErr += 'The Date Done must be after 01/01/1998.\n'
	}

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function doSubmitMoveConsents()
{
	var selActionID = GetReferenceToASPNETControl('selActionID');
	var sErr = '';

	if (selActionID.options[selActionID.selectedIndex].value == -1)
		sErr += 'You must select an Action to continue.\n';

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function AddConsentForm()
{
	var nSubjID = GetReferenceToASPNETControl('hidSubjID').value;
	var nStudyID = GetReferenceToASPNETControl('hidStudyID').value;

	popUpWindow('/Measures/AddConsentForm.aspx?DoRefresh=true&StudyID=' + nStudyID + '&SubjID=' + nSubjID, 'oWindow', 'toolbars=no,statusbar=no,addressbar=no,width=600,height=400');
}

function doSubmitAddConsentForm()
{
	var selConsentFormVersionID = GetReferenceToASPNETControl('selConsentFormVersionID');
	var txtDateSigned = GetReferenceToASPNETControl('txtDateSigned');
	var sErr = '';

	if (selConsentFormVersionID.options[selConsentFormVersionID.selectedIndex].value == -1)
		sErr += 'You must select a Consent Form Version.\n';

	if (!isBlank(txtDateSigned.value))
	{
		if (!isValidDate(txtDateSigned.value))
			sErr += 'The Date Signed must be in the format: mm/dd/yyyy.\n';
	}

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true	;
}
function EditMultipleConsentForms(bDoDelete)
{
	var aSubjConsentIDs = document.getElementsByName('chkConsentFormVersionID');
	var sSubjConsentIDs = '';

	for (var i=0;i<aSubjConsentIDs.length;i++)
	{
		if (aSubjConsentIDs[i].checked)
			sSubjConsentIDs += aSubjConsentIDs[i].value + ',';
	}

	if (sSubjConsentIDs.length > 0)
	{
		sSubjConsentIDs = sSubjConsentIDs.slice(0, sSubjConsentIDs.length - 1);
		popUpWindow('/Measures/EditMultipleConsents.aspx?DoRefresh=true&Delete=' + bDoDelete + '&SubjConsentIDs=' + sSubjConsentIDs, 'oWindow', 'toolbars=no,statusbar=no,addressbar=no,scrollbars=yes,width=600,height=400');
	}
	else
		alert('You must select at least one Consent Form to edit.\n');
}

function CheckAllConsentItems(bChecked)
{
	var aConsentItemIDs = document.getElementsByName('chkConsentItemIDs');

	for (var i=0;i<aConsentItemIDs.length;i++)
			aConsentItemIDs[i].checked = bChecked;
}