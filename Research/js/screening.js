function doSubmitReports(sListName, nFormIndex, sItemName)
{
	var oList = document.forms[nFormIndex].elements.namedItem(sListName);
	var sErr = '';

	if (oList.options[oList.selectedIndex].value == -1)
		sErr += 'You must select ' + sItemName + ' to continue.';

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false
	}
	else
		return true;
}

function doSubmitPersonSearch()
{
	var sName = document.forms[0].txtLastName.value;
	var sInvalidChars = '1234567890-=!@#$%^&*()_+{}[]:"\'\\|;<>,.?/`~';
	var sErr = '';

	if (isBlank(sName))
		sErr += "You must enter at least one characters of the person's name.\n";
	else if (hasInvalidChars(sName, sInvalidChars))
		sErr += "The text you entered contains some invalid characters.\n"
	
	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function doSubmitPeopleResults()
{
	var oPersonList = document.forms[0].radPersonID;
	var oSurveyList = document.forms[0].selSurveyID;
	var bIsChecked = false;
	var sErr = '';

	if (oPersonList.length > 0)
	{
		for(i=0;i<oPersonList.length;i++)
		{
			if (oPersonList[i].checked)
			{
				bIsChecked = true;
				break;
			}
		}
	}
	else
	{
		oPersonList.checked = true;
		bIsChecked = true;
	}

	if (!bIsChecked)
		sErr += 'You must select a person to proceed.\n';

	if (oSurveyList.options[oSurveyList.selectedIndex].value == -1)
		sErr += 'You must select a Screening Survey to proceed.\n'

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}