function Measures_ChangeTab(sTableID, sTabID)
{
	var oTable = GetReferenceToASPNETNonFormControl(sTableID);
	var oTab = GetReferenceToASPNETNonFormControl(sTabID);
	var tblGeneral = GetReferenceToASPNETNonFormControl('tblGeneral', 'table');
	var tblAdminInfo = GetReferenceToASPNETNonFormControl('tblAdminInfo', 'table');
	var tblAuthorInfo = GetReferenceToASPNETNonFormControl('tblAuthorInfo', 'table');
	var tblDocuments = GetReferenceToASPNETNonFormControl('tblDocuments', 'table');
	var tblDataEntry = GetReferenceToASPNETNonFormControl('tblDataEntry', 'table');
	var tdGeneral = GetReferenceToASPNETNonFormControl('tdGeneral', 'td');
	var tdAdminInfo = GetReferenceToASPNETNonFormControl('tdAdminInfo', 'td');
	var tdAuthorInfo = GetReferenceToASPNETNonFormControl('tdAuthorInfo', 'td');
	var tdDocuments = GetReferenceToASPNETNonFormControl('tdDocuments', 'td');
	var tdDataEntry = GetReferenceToASPNETNonFormControl('tdDataEntry', 'td');

	if (sTableID == tblAdminInfo.id)
	{
		tblGeneral.style.display = 'none';
		tblAdminInfo.style.display = 'inline';
		tblAuthorInfo.style.display = 'none';
		tblDocuments.style.display = 'none';
		tblDataEntry.style.display = 'none';

		tdGeneral.style.backgroundColor = '#a1b5cf';
		tdAdminInfo.style.backgroundColor = '#336699';
		tdAuthorInfo.style.backgroundColor = '#a1b5cf';
		tdDocuments.style.backgroundColor = '#a1b5cf';
		tdDataEntry.style.backgroundColor = '#a1b5cf';
	}
	else if (sTableID == tblAuthorInfo.id)
	{
		tblGeneral.style.display = 'none';
		tblAdminInfo.style.display = 'none';
		tblAuthorInfo.style.display = 'inline';
		tblDocuments.style.display = 'none';
		tblDataEntry.style.display = 'none';

		tdGeneral.style.backgroundColor = '#a1b5cf';
		tdAdminInfo.style.backgroundColor = '#a1b5cf';
		tdAuthorInfo.style.backgroundColor = '#336699';
		tdDocuments.style.backgroundColor = '#a1b5cf';
		tdDataEntry.style.backgroundColor = '#a1b5cf';
	}
	else if (sTableID == tblDocuments.id)
	{
		tblGeneral.style.display = 'none';
		tblAdminInfo.style.display = 'none';
		tblAuthorInfo.style.display = 'none';
		tblDocuments.style.display = 'inline';
		tblDataEntry.style.display = 'none';

		tdGeneral.style.backgroundColor = '#a1b5cf';
		tdAdminInfo.style.backgroundColor = '#a1b5cf';
		tdAuthorInfo.style.backgroundColor = '#a1b5cf';
		tdDocuments.style.backgroundColor = '#336699';
		tdDataEntry.style.backgroundColor = '#a1b5cf';
	}
	else if (sTableID == tblDataEntry.id)
	{
		tblGeneral.style.display = 'none';
		tblAdminInfo.style.display = 'none';
		tblAuthorInfo.style.display = 'none';
		tblDocuments.style.display = 'none';
		tblDataEntry.style.display = 'inline';

		tdGeneral.style.backgroundColor = '#a1b5cf';
		tdAdminInfo.style.backgroundColor = '#a1b5cf';
		tdAuthorInfo.style.backgroundColor = '#a1b5cf';
		tdDocuments.style.backgroundColor = '#a1b5cf';
		tdDataEntry.style.backgroundColor = '#336699';
	}
	else
	{
		tblGeneral.style.display = 'inline';
		tblAdminInfo.style.display = 'none';
		tblAuthorInfo.style.display = 'none';
		tblDocuments.style.display = 'none';
		tblDataEntry.style.display = 'none';

		tdGeneral.style.backgroundColor = '#336699';
		tdAdminInfo.style.backgroundColor = '#a1b5cf';
		tdAuthorInfo.style.backgroundColor = '#a1b5cf';
		tdDocuments.style.backgroundColor = '#a1b5cf';
		tdDataEntry.style.backgroundColor = '#a1b5cf';
	}
}

function doSubmitMeasureInfo(e)
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

		if (isBlank(txtMeasShortName.value))
			sErr += 'You must enter a Measure Short Name.\n';

		if (isBlank(txtMeasFullName.value))
			sErr += 'You must enter a Measure Full Name.\n';

		if (selMeasCatID.options[selMeasCatID.selectedIndex].value == -1)
			sErr += 'You must select a Measure Category.\n';

		if (isBlank(txtStartDate.value))
		{
	//		sErr += 'You must enter the Date Began Using.\n';
		}
		else if (!isValidDate(txtStartDate.value))
			sErr += 'The value you entered for Date Began Using must be in the format: mm/dd/yyyy.\n';

		if (!isBlank(txtEndDate.value))
		{
			if (!isValidDate(txtEndDate.value))
				sErr += 'The value you entered for Date End Using must be in the format: mm/dd/yyyy.\n';
		}

		if (selStaffID.options[selStaffID.selectedIndex].value == -1)
			sErr += 'You must select a Staff Contact.\n';

		if (!isBlank(sErr))
			sTabName = 'General';

		if (selMeasRespondentID.options[selMeasRespondentID.selectedIndex].value == -1)
			sErr += 'You must select a Resondent.\n';

		if (selFocusPerson.options[selFocusPerson.selectedIndex].value == -1)
			sErr += 'You must select a Focus Person.\n';

		if (selMethodID.options[selMethodID.selectedIndex].value == -1)
			sErr += 'You must select an Admin. Method.\n';

		if (isBlank(txtAdminTime.value))
		{
	//		sErr += 'You must enter an Admin. Time.\n';
		}
		else if (isNaN(txtAdminTime.value))
			sErr += 'The Admin. Time must be numeric.\n';
		else if (txtAdminTime.value < 0 && txtAdminTime.value > 480)
			sErr += 'The Admin. Time must be a number between 1 and 480.\n';

		if (!isBlank(sErr) && isBlank(sTabName))
			sTabName = 'AdminInfo';

	//	if (isBlank(txtDEByWhom.value))
	//		sErr += 'You must enter the "Data Entry By Whom?" info.\n';

		if (isBlank(txtDEEstTime.value))
		{
	//		sErr += 'You must enter the Estimated Data Entry Time.\n';
		}
		else if (isNaN(txtDEEstTime.value))
			sErr += 'The Estimated Data Entry Time must be numeric.\n';
		else if (txtDEEstTime.value < 0 && txtDEEstTime.value > 480)
			sErr += 'The Estimated Data Entry Time must be a number between 1 and 120.\n';

		if (!isBlank(sErr) && isBlank(sTabName))
			sTabName = 'DataEntry';

		if (!isBlank(sErr))
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

function ToggleActionTable(sRowID)
{
	var tblMaster = GetReferenceToASPNETNonFormControl('tblMaster');
	var oRow = GetReferenceToASPNETNonFormControl(sRowID);

	for (var i=0;i<tblMaster.rows.length;i++)
	{
		if (!isBlank(tblMaster.rows[i].id))
		{
			if (tblMaster.rows[i].id != sRowID)
				tblMaster.rows[i].style.display = 'none';
		}
	}

	if (oRow.style.display == 'none')
		oRow.style.display = 'inline';
	else
		oRow.style.display = 'none';
}

function DoSubmitEditStudyActions(e)
{
    var e = (e || window.event);

    if (e != null && e != 'undefined')
    {
		var aActionText = document.getElementsByName('txtActionText');
		var aActionType = document.getElementsByName('selActionTypeID');
		var aLab = document.getElementsByName('selLabID');
		var aStaffPosition = document.getElementsByName('selStaffPosID');
		var aSortOrder = document.getElementsByName('txtSortOrder');
		var sErr = '';
		var oFocus = null;

		for (var i=0;i<aActionText.length;i++)
		{
			if (isBlank(aSortOrder[i].value))
			{
				sErr += 'You must enter an Order for each Study Action (' + aActionText[i].value + ').\n';
				if (oFocus == null) {oFocus = aSortOrder[i];}
			}
			else if (isNaN(aSortOrder[i].value))
			{
				sErr += 'The values for Order must be numeric (' + aActionText[i].value + ').\n';
				if (oFocus == null) {oFocus = aSortOrder[i];}
			}

			if (isBlank(aActionText[i].value))
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

			if (!isBlank(sErr))
				break;
		}

		if (!isBlank(sErr))
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

function GetNumStudyActionsToAdd()
{
	var nNumToAdd = window.prompt('How many new Study Actions would you like to add?', '');
	var hidNumActionsToAdd = document.getElementById('hidNumActionsToAdd');

	hidNumActionsToAdd.value = nNumToAdd;
}

function DoSubmitEditStudyMeasures(e)
{
    var e = (e || window.event);

    if (e != null && e != 'undefined')
    {
		var aStudyMeasName = document.getElementsByName('txtStudyMeasName');
		var aMeasureID = document.getElementsByName('selMeasureID');
		var aLabID = document.getElementsByName('selLabID');
		var aDateBegan = document.getElementsByName('txtDateBegan');
		var aDateEnd = document.getElementsByName('txtDateEnd');
		var aSortOrder = document.getElementsByName('txtSortOrder');
		var aCoreMeasure = document.getElementsByName('selCoreMeasure');
		var sErr = '';
		var oFocus = null;

		for (var i=0;i<aStudyMeasName.length;i++)
		{
			if (isBlank(aSortOrder[i].value))
			{
				sErr += 'You must enter an Order for each Study Measure (' + aStudyMeasName[i].value + ').\n';
				if (oFocus == null) {oFocus = aSortOrder[i];}
			}
			else if (isNaN(aSortOrder[i].value))
			{
				sErr += 'The values for Order must be numeric (' + aStudyMeasName[i].value + ').\n';
				if (oFocus == null) {oFocus = aSortOrder[i];}
			}

			if (isBlank(aStudyMeasName[i].value))
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

			if (!isBlank(aDateBegan[i].value))
			{
				if (!isValidDate(aDateBegan[i].value))
				{
					sErr += 'You must enter a Begin Date in the format: mm/dd/yyyy (' + aStudyMeasName[i].value + ').\n';
					if (oFocus == null) {oFocus = aDateBegan[i];}
				}
			}

			if (!isBlank(aDateEnd[i].value))
			{
				if (!isValidDate(aDateEnd[i].value))
				{
					sErr += 'You must enter an End Date in the format: mm/dd/yyyy (' + aStudyMeasName[i].value + ').\n';
					if (oFocus == null) {oFocus = aDateEnd[i];}
				}
			}

			if (!isBlank(sErr))
				break;
		}

		if (!isBlank(sErr))
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
			if (isBlank(aSortOrder[i].value))
			{
				sErr += 'You must enter an Order for each Group (' + aGroupName[i].value + ').\n';
				if (oFocus == null) {oFocus = aSortOrder[i];}
			}
			else if (isNaN(aSortOrder[i].value))
			{
				sErr += 'The values for Order must be numeric (' + aGroupName[i].value + ').\n';
				if (oFocus == null) {oFocus = aSortOrder[i];}
			}

			if (isBlank(aGroupName[i].value))
			{
				sErr += 'You must enter an Group Name for each Group (' + aGroupName[i].value + ').\n';
				if (oFocus == null) {oFocus = aGroupName[i];}
			}

			if (isBlank(aGroupDesc[i].value))
			{
				sErr += 'You must enter an Group Desc. for each Group (' + aGroupName[i].value + ').\n';
				if (oFocus == null) {oFocus = aGroupDesc[i];}
			}

			if (isBlank(aGoalN[i].value))
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

		if (!isBlank(sErr))
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

function AdjustIFrame(sType)
{
	var selStudyID = GetReferenceToASPNETControl('selStudyID');
 	var oIFrame = document.getElementsByTagName('iframe')[0];
	var btnViewGroups = document.getElementById('tdGroups');
	var btnViewTimepoints = document.getElementById('tdTimepoints');
    var btnViewActions = document.getElementById('tdAction');
	var btnViewMeasures = document.getElementById('tdMeasures');
	var btnViewConsents = document.getElementById('tdConsents');
	var btnViewAssignments = document.getElementById('tdMeasActAssign');
	var btnViewConsentAssignments = document.getElementById('tdConsentActAssign');
	var nStudyID = selStudyID.options[selStudyID.selectedIndex].value;

	if (nStudyID == -1)
	{
		alert('You must select an existing study to view ' + sType + '.\n');
		oIFrame.style.display = 'none';
	}
	else{
		switch (sType)
		{
			case 'groups':
			    btnViewGroups.className = 'tdHeader';
			    btnViewTimepoints.className = 'tdHeaderAlt';
				btnViewActions.className = 'tdHeaderAlt';
				btnViewMeasures.className = 'tdHeaderAlt';
				btnViewConsents.className = 'tdHeaderAlt';
				btnViewAssignments.className = 'tdHeaderAlt';
				btnViewConsentAssignments.className = 'tdHeaderAlt';
				oIFrame.style.display = 'inline';

				if (oIFrame.src != '/StudyDesign/EditGroups.aspx?StudyID=' + nStudyID)
					oIFrame.src = '/StudyDesign/EditGroups.aspx?StudyID=' + nStudyID;

				break;
            case 'timepoints':
                btnViewGroups.className = 'tdHeaderAlt';
                btnViewTimepoints.className = 'tdHeader';
                btnViewActions.className = 'tdHeaderAlt';
                btnViewMeasures.className = 'tdHeaderAlt';
                btnViewConsents.className = 'tdHeaderAlt';
                btnViewAssignments.className = 'tdHeaderAlt';
                btnViewConsentAssignments.className = 'tdHeaderAlt';
                oIFrame.style.display = 'inline';

                if (oIFrame.src != '/StudyDesign/EditTimepoints.aspx?StudyID=' + nStudyID)
                    oIFrame.src = '/StudyDesign/EditTimepoints.aspx?StudyID=' + nStudyID;

                break;
            case 'actions':
				btnViewGroups.className = 'tdHeaderAlt';
				btnViewTimepoints.className = 'tdHeaderAlt';
				btnViewActions.className = 'tdHeader';
				btnViewMeasures.className = 'tdHeaderAlt';
				btnViewConsents.className = 'tdHeaderAlt';
				btnViewAssignments.className = 'tdHeaderAlt';
				btnViewConsentAssignments.className = 'tdHeaderAlt';
				oIFrame.style.display = 'inline';

				if (oIFrame.src != '/StudyDesign/EditStudyActions.aspx?StudyID=' + nStudyID)
					oIFrame.src = '/StudyDesign/EditStudyActions.aspx?StudyID=' + nStudyID;

				break;
			case 'measures':
				btnViewGroups.className = 'tdHeaderAlt';
				btnViewTimepoints.className = 'tdHeaderAlt';
				btnViewActions.className = 'tdHeaderAlt';
				btnViewMeasures.className = 'tdHeader';
				btnViewConsents.className = 'tdHeaderAlt';
				btnViewAssignments.className = 'tdHeaderAlt';
				btnViewConsentAssignments.className = 'tdHeaderAlt';
				oIFrame.style.display = 'inline';

				if (oIFrame.src != '/StudyDesign/EditStudyMeasures.aspx?StudyID=' + nStudyID)
					oIFrame.src = '/StudyDesign/EditStudyMeasures.aspx?StudyID=' + nStudyID;

				break;
			case 'consents':
				btnViewGroups.className = 'tdHeaderAlt';
				btnViewTimepoints.className = 'tdHeaderAlt';
				btnViewActions.className = 'tdHeaderAlt';
				btnViewMeasures.className = 'tdHeaderAlt';
				btnViewConsents.className = 'tdHeader';
				btnViewAssignments.className = 'tdHeaderAlt';
				btnViewConsentAssignments.className = 'tdHeaderAlt';
				oIFrame.style.display = 'inline';

				if (oIFrame.src != '/StudyDesign/EditConsents.aspx?StudyID=' + nStudyID)
					oIFrame.src = '/StudyDesign/EditConsents.aspx?StudyID=' + nStudyID;

				break;
			case 'assignments':
				btnViewGroups.className = 'tdHeaderAlt';
				btnViewTimepoints.className = 'tdHeaderAlt';
				btnViewActions.className = 'tdHeaderAlt';
				btnViewMeasures.className = 'tdHeaderAlt';
				btnViewConsents.className = 'tdHeaderAlt';
				btnViewAssignments.className = 'tdHeader';
				btnViewConsentAssignments.className = 'tdHeaderAlt';
				oIFrame.style.display = 'inline';

				if (oIFrame.src != '/StudyDesign/EditMeasureActionAssignments.aspx?StudyID=' + nStudyID)
					oIFrame.src = '/StudyDesign/EditMeasureActionAssignments.aspx?StudyID=' + nStudyID;

				break;
			case 'consentassignments':
				btnViewGroups.className = 'tdHeaderAlt';
				btnViewTimepoints.className = 'tdHeaderAlt';
				btnViewActions.className = 'tdHeaderAlt';
				btnViewMeasures.className = 'tdHeaderAlt';
				btnViewConsents.className = 'tdHeaderAlt';
				btnViewAssignments.className = 'tdHeaderAlt';
				btnViewConsentAssignments.className = 'tdHeader';
				oIFrame.style.display = 'inline';

				if (oIFrame.src != '/StudyDesign/EditConsentAssignments.aspx?StudyID=' + nStudyID)
					oIFrame.src = '/StudyDesign/EditConsentAssignments.aspx?StudyID=' + nStudyID;

				break;
			default:
				btnViewGroups.className = 'tdHeaderAlt';
				btnViewTimepoints.className = 'tdHeaderAlt';
				btnViewActions.className = 'tdHeaderAlt';
				btnViewMeasures.className = 'tdHeaderAlt';
				btnViewConsents.className = 'tdHeaderAlt';
				btnViewAssignments.className = 'tdHeaderAlt';
				btnViewConsentAssignments.className = 'tdHeaderAlt';

				oIFrame.style.display = 'none';
				break;

		}
	}
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

		if (isBlank(txtStudyName.value))
		{
			sErr += 'You must enter a Study Name.\n';
			if (oFocus == null) {oFocus = txtStudyName;}
		}

		if (isBlank(txtStudyFullName.value))
		{
			sErr += 'You must enter a Study Full Name.\n';
			if (oFocus == null) {oFocus = txtStudyFullName;}
		}

		if (!isBlank(txtStartDate.value))
		{
			if (!isValidDate(txtStartDate.value))
			{
				sErr += 'Start Date must be in the format: mm/dd/yyyy.\n';
				if (oFocus == null) {oFocus = txtStartDate;}
			}
		}

		if (!isBlank(txtEndDate.value))
		{
			if (!isValidDate(txtEndDate.value))
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

		if (!isBlank(sErr))
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

var oXMLHttp = null;

function SyncEditDataTableForm()
{
	var selTableID = GetReferenceToASPNETControl('selTableID');

	if (selTableID.options[selTableID.selectedIndex].value > 0)
	{
		GetReferenceToASPNETNonFormControl('trSubForm', 'tr').style.display = 'inline';
//		document.getElementsByTagName('iframe')[0].src = 'EditDataTableFieldInfo.aspx?TableID=' + selTableID.options[selTableID.selectedIndex].value;
		AdjustDataTablesIFrame('varinfo');

		if (document.all)
			oXMLHttp = new ActiveXObject("Microsoft.XMLHTTP"); 
		else
			oXMLHttp = new XMLHttpRequest(); 

		oXMLHttp.onreadystatechange = SyncEditDataTableFormHandlerOnReadyStateChange;
		oXMLHttp.open('GET', '/ClientData/Response.aspx?Command=GetDataTableInfo&TableID=' + selTableID.options[selTableID.selectedIndex].value, false);
		oXMLHttp.send();
	}
	else
	{
		document.getElementById('trSubForm').style.display = 'none';
		document.getElementById('txtTableName').value = '';
		document.getElementById('selStudyID').selectedIndex = 0;
		document.getElementById('selAllTableID').selectedIndex = 0;
		document.getElementById('selFieldInfoStatusID').selectedIndex = 0;
		document.getElementById('selRunSPSSSyntaxStatus').selectedIndex = 0;
		document.getElementById('selDEScoringStatusID').selectedIndex = 0;
		document.getElementById('selDEScoringTypeID').selectedIndex = 0;
		document.getElementById('txtDEScoringNotes').value = '';
		document.getElementById('chkHasIndexNum').checked = false;
		document.getElementById('chkSkipForMatrix').checked = false;
		document.getElementById('chkRunSingle').checked = false;
		document.getElementById('chkIsTracked').checked = false;
	}
}

function SyncEditDataTableFormHandlerOnReadyStateChange()
{
	var txtTableName = GetReferenceToASPNETControl('txtTableName');
	var selStudyID = GetReferenceToASPNETControl('selStudyID');
	var selAllTableID = GetReferenceToASPNETControl('selAllTableID');
	var selFieldInfoStatusID = GetReferenceToASPNETControl('selFieldInfoStatusID');
	var selRunSPSSSyntaxStatus = GetReferenceToASPNETControl('selRunSPSSSyntaxStatus');
	var selDEScoringStatusID = GetReferenceToASPNETControl('selDEScoringStatusID');
	var selDEScoringTypeID = GetReferenceToASPNETControl('selDEScoringTypeID');
	var txtDEScoringNotes = GetReferenceToASPNETControl('txtDEScoringNotes');
	var chkHasIndexNum = GetReferenceToASPNETControl('chkHasIndexNum');
	var chkSkipForMatrix = GetReferenceToASPNETControl('chkSkipForMatrix');
	var chkRunSingle = GetReferenceToASPNETControl('chkRunSingle');
	var chkIsTracked = GetReferenceToASPNETControl('chkIsTracked');

	if (oXMLHttp.readyState == 4)
	{
		txtTableName.value = oXMLHttp.responseXML.selectSingleNode('//XMLResponse/DataTableInfo/DataTableName').text;
		txtDEScoringNotes.value = oXMLHttp.responseXML.selectSingleNode('//XMLResponse/DataTableInfo/DEScoringNotes').text;

		SelectDropDownValue(selStudyID, oXMLHttp.responseXML.selectSingleNode('//XMLResponse/DataTableInfo/StudyID').text);
		SelectDropDownValue(selAllTableID, oXMLHttp.responseXML.selectSingleNode('//XMLResponse/DataTableInfo/AllTableID').text);
		SelectDropDownValue(selFieldInfoStatusID, oXMLHttp.responseXML.selectSingleNode('//XMLResponse/DataTableInfo/FieldInfoStatusID').text);
		SelectDropDownValue(selRunSPSSSyntaxStatus, oXMLHttp.responseXML.selectSingleNode('//XMLResponse/DataTableInfo/RunSPSSSyntax').text);
		SelectDropDownValue(selDEScoringStatusID, oXMLHttp.responseXML.selectSingleNode('//XMLResponse/DataTableInfo/DEScoringStatusID').text);
		SelectDropDownValue(selDEScoringTypeID, oXMLHttp.responseXML.selectSingleNode('//XMLResponse/DataTableInfo/DEScoringTypeID').text);

		if (oXMLHttp.responseXML.selectSingleNode('//XMLResponse/DataTableInfo/HasIndexNum').text == 'True') {chkHasIndexNum.checked = true;} else {chkHasIndexNum.checked = false;};
		if (oXMLHttp.responseXML.selectSingleNode('//XMLResponse/DataTableInfo/SkipForMatrix').text == 'True') {chkSkipForMatrix.checked = true;} else {chkSkipForMatrix.checked = false;};
		if (oXMLHttp.responseXML.selectSingleNode('//XMLResponse/DataTableInfo/RunSingle').text == 'True') {chkRunSingle.checked = true;} else {chkRunSingle.checked = false;};
		if (oXMLHttp.responseXML.selectSingleNode('//XMLResponse/DataTableInfo/IsTracked').text == 'True') {chkIsTracked.checked = true;} else {chkIsTracked.checked = false;};
	}
}

function AdjustDataTablesIFrame(sSelectedTab)
{
	var selTableID = GetReferenceToASPNETControl('selTableID');
	var oIFrame = document.getElementsByTagName('iframe')[0];
	var tdVarInfo = GetReferenceToASPNETNonFormControl('tdVarInfo', 'td');
	var tdSpecialFields = GetReferenceToASPNETNonFormControl('tdSpecialFields', 'td');

	if (selTableID.options[selTableID.selectedIndex].value >= 0)
	{
		switch (sSelectedTab)
		{
			case 'varinfo':
				tdVarInfo.className = 'tdHeader';
				tdSpecialFields.className = 'tdHeaderAlt';
				tdRenameFields.className = 'tdHeaderAlt';

				if (oIFrame.src != 'EditDataTableFieldInfo.aspx?TableID=' + selTableID.options[selTableID.selectedIndex].value)
					oIFrame.src = 'EditDataTableFieldInfo.aspx?TableID=' + selTableID.options[selTableID.selectedIndex].value;

				break;
			case 'specialfields':
				tdVarInfo.className = 'tdHeaderAlt';
				tdSpecialFields.className = 'tdHeader';
				tdRenameFields.className = 'tdHeaderAlt';

				if (oIFrame.src != 'EditDataTableSpecialFields.aspx?TableID=' + selTableID.options[selTableID.selectedIndex].value)
					oIFrame.src = 'EditDataTableSpecialFields.aspx?TableID=' + selTableID.options[selTableID.selectedIndex].value;

				break;
			case 'renamefields':
				tdVarInfo.className = 'tdHeaderAlt';
				tdSpecialFields.className = 'tdHeaderAlt';
				tdRenameFields.className = 'tdHeader';

				if (oIFrame.src != 'EditDataTableRenameFields.aspx?TableID=' + selTableID.options[selTableID.selectedIndex].value)
					oIFrame.src = 'EditDataTableRenameFields.aspx?TableID=' + selTableID.options[selTableID.selectedIndex].value;

				break;
			default:
				tdVarInfo.className = 'tdHeaderAlt';

				break;
		}
	}
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
			if (isBlank(txtFieldName[i].value))
			{
				sErr += 'You must enter a Field Name for each variable.\n';
				oFocus = txtFieldName[i];
				break;
			}
		}

		if (!isBlank(sErr))
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

function AddVariables()
{
	var hidNumVarsToAdd = GetReferenceToASPNETControl('hidNumVarsToAdd');
	var nNumVarsToAdd = window.prompt('How many Variables would you like to add?\n', '');

	hidNumVarsToAdd.value = nNumVarsToAdd;
}

function SyncEditSpecialFieldsForm()
{
	var selFieldID = GetReferenceToASPNETControl('selFieldID');
	var tdDelete = GetReferenceToASPNETNonFormControl('tdDelete');
	var chkDelete = GetReferenceToASPNETControl('chkDelete');

	if (selFieldID.options[selFieldID.selectedIndex].value > 0)
	{
		tdDelete.style.display = 'inline';

		if (document.all)
			oXMLHttp = new ActiveXObject("Microsoft.XMLHTTP"); 
		else
			oXMLHttp = new XMLHttpRequest(); 

		oXMLHttp.onreadystatechange = SyncEditSpecialFieldsFormHandlerOnReadyStateChange;
		oXMLHttp.open('GET', '/ClientData/Response.aspx?Command=GetSpecialFieldInfo&FieldID=' + selFieldID.options[selFieldID.selectedIndex].value, false);
		oXMLHttp.send();
	}
	else
	{
		tdDelete.style.display = 'none';
		chkDelete.checked = false;
		document.getElementById('txtFieldName').value = '';
		document.getElementById('selFieldCodeID').selectedIndex = 0;
		document.getElementById('chkIsIDField').checked = false;
	}
}

function SyncEditSpecialFieldsFormHandlerOnReadyStateChange()
{
	if (oXMLHttp.readyState == 4)
	{
		GetReferenceToASPNETControl('txtFieldName').value = oXMLHttp.responseXML.selectSingleNode('//XMLResponse/SpecialFieldInfo/FieldName').text;

		SelectDropDownValue(GetReferenceToASPNETControl('selFieldCodeID'), oXMLHttp.responseXML.selectSingleNode('//XMLResponse/SpecialFieldInfo/FieldCodeID').text);

		if (oXMLHttp.responseXML.selectSingleNode('//XMLResponse/SpecialFieldInfo/IsIDField').text == 1)
			GetReferenceToASPNETControl('chkIsIDField').checked = true;
		else
			GetReferenceToASPNETControl('chkIsIDField').checked = false;
	}
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
			if (isBlank(txtFieldName.value))
				sErr += 'You must enter a Field Name.\n';

			if (selFieldCodeID.options[selFieldCodeID.selectedIndex].value == -1)
				sErr += 'You must select a Field Code.\n';
		}

		if (!isBlank(sErr))
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

function AddRenameField()
{
	var nNumberToAdd = prompt('How many Rename Fields would you like to add?\n', '');

	if (isNaN(nNumberToAdd) || isBlank(nNumberToAdd))
	{
		alert('You must enter a numeric value.\n');
		nNumberToAdd = 0;
	}

	GetReferenceToASPNETControl('hidFieldsToAdd').value = nNumberToAdd;
}