function SubmitReport(nReportID)
{
	var hidReportID = document.getElementById('hidReportID');

	hidReportID.value = nReportID;
	document.forms[0].submit();
}

function ToggleReportTree(sDivID, sImageID)
{
	var oDiv = document.getElementById(sDivID);
	var oImg = document.getElementById(sImageID);

	if (oDiv.style.display == 'none')
	{
		oDiv.style.display = '';
		oImg == null ? '' : oImg.src = '/images/tree-minus.gif';
	}
	else
	{
		oDiv.style.display = 'none';
		oImg == null ? '' : oImg.src = '/images/tree-plus.gif';
	}
}

function doToggleGENSubjFlowForm(nCheckedValue)
{
	var divGroup = GetReferenceToASPNETNonFormControl('divGroup', 'div');
	var selGroup = GetReferenceToASPNETControl('selGroup');
	var divFamily = GetReferenceToASPNETNonFormControl('divFamily', 'div');
	var selHouseholdID = GetReferenceToASPNETControl('selHouseholdID');

	if (nCheckedValue == 1)
	{
		divGroup.style.display = 'none';
		selGroup.disabled = true;

		divFamily.style.display = '';
		selHouseholdID.disabled = false;
	}
	else if (nCheckedValue == 2)
	{
		divFamily.style.display = 'none';
		selHouseholdID.disabled = true;

		divGroup.style.display = '';
		selGroup.disabled = false;
	}
}

function CheckStatus()
{
	var oForm = document.forms[0];
	var i = 0;

	for (i=0;i<oForm.elements.length;i++)
	{
		if (oForm.elements[i].name == 'radType')
		{
			if (oForm.elements[i].checked)
			{
				doToggleGENSubjFlowForm(oForm.elements[i].value);
				break;
			}
		}
	}
}

function NavigateToEditParameters()
{
	var selReportID = GetReferenceToASPNETControl('selReportID');
	var nRptID = selReportID.options[selReportID.selectedIndex].value;

	if (nRptID <= 0)
		alert('You must select an existing report to add parameters.\n');
	else
		document.location = '/Reports/EditParameters.aspx?ReportID=' + nRptID;
}

function doSubmitEditReport(e)
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

		if (isBlank(txtRptName.value))
			sErr += 'You must enter a Report Name.\n';

		if (!HasAnItemSelected(selStudyIDs))
			sErr += 'You must select at least one Study.\n';

		if (selRptCategory.options[selRptCategory.selectedIndex].value == -1)
			sErr += 'You must select a Report Category.\n';

		if (selRptType.options[selRptType.selectedIndex].value == -1)
			sErr += 'You must select a Report Type.\n';

		if (isBlank(txtCommandText.value))
			sErr += 'You must enter a Report Source.\n';

		if (!isBlank(sErr))
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

function AddParam()
{
	var hidReportID = GetReferenceToASPNETControl('hidReportID');
	var nReportID = hidReportID.value;

	document.location = '/Reports/EditParameters.aspx?ReportID=' + nReportID + '&AddParam=True';
}

function AddLink()
{
	var hidReportID = GetReferenceToASPNETControl('hidReportID');
	var nReportID = hidReportID.value;

	document.location = '/Reports/EditParameters.aspx?ReportID=' + nReportID + '&AddLink=True';
}

function ReturnToReport()
{
	var hidReportID = GetReferenceToASPNETControl('hidReportID');
	var nReportID = hidReportID.value;

	document.location = '/Reports/EditReport.aspx?ReportID=' + nReportID;
}

function doSubmitEditParamsAndLinks()
{
	var oControls = document.forms[0].elements;
	var sErr = '';
	var i = 0;

	for (i=0;i<oControls.length;i++)
	{
		if (StartsWith(oControls[i].name, 'txtParamName') && isBlank(oControls[i].value))
			sErr += 'You must enter a Parameter Name for each parameter.\n';

		if (StartsWith(oControls[i].name, 'txtFriendlyName') && isBlank(oControls[i].value))
			sErr += 'You must enter a Friendly Name for each parameter.\n';

		if (StartsWith(oControls[i].name, 'txtLength') && isBlank(oControls[i].value))
			sErr += 'You must enter a Length for each parameter.\n';
		else if (StartsWith(oControls[i].name, 'txtLength') && isNaN(oControls[i].value))
			sErr += 'The Length you enter for each parameter must be numeric.\n';
		else if (StartsWith(oControls[i].name, 'txtLength') && oControls[i].value <= 0)
			sErr += 'The Length you enter for each parameter must be greater than zero.\n';

		if (StartsWith(oControls[i].name, 'selDataSourceType'))
		{
			if (oControls[i].options[oControls[i].selectedIndex].value != 4 && oControls[i].options[oControls[i].selectedIndex].value != -1)
			{
				if (isBlank(oControls[i+1].value))
					sErr += 'All Data Sources except "Empty" require Data Source Text.\n';

				if (isBlank(oControls[i+2].value))
					sErr += 'All Data Sources except "Empty" require a Data Source ID Field.\n';

				if (isBlank(oControls[i+3].value))
					sErr += 'All Data Sources except "Empty" require a Data Source Text Field.\n';
			}
		}

		if (StartsWith(oControls[i].name, 'txtLinkText') && isBlank(oControls[i].value))
			sErr += 'You must enter a Link Text Source for each Link Column.\n';

		if (StartsWith(oControls[i].name, 'txtLinkURL') && isBlank(oControls[i].value) && !StartsWith(oControls[i].name, 'txtLinkURLParam'))
			sErr += 'You must enter a Link URL for each Link Column.\n';
	}

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function doSubmitUserDefinedReport()
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

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}