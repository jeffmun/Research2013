function EditMultipleConsentForms(bDoDelete)
{
	var aConsentFormIDs = document.getElementsByName('chkConsentFormVersionID');
	var sConsentFormIDs = '';

	for (var i=0;i<aConsentFormIDs.length;i++)
	{
		if (aConsentFormIDs[i].checked)
			sConsentFormIDs += aConsentFormIDs[i].value + ',';
	}

	if (sConsentFormIDs.length > 0)
	{
		sConsentFormIDs = sConsentFormIDs.slice(0, sConsentFormIDs.length - 1);
		popUpWindow('/ConsentForms/EditConsentForm.aspx?DoRefresh=true&Delete=' + bDoDelete + '&ConsentFormVersionID=' + sConsentFormIDs, 'oWindow', 'toolbars=no,statusbar=no,addressbar=no,scrollbars=yes,width=600,height=400');
	}
	else
		alert('You must select at least one Consent Form to edit.\n');
}

function doSubmitUpdateConsentForms()
{
	var txtDateSigned = document.getElementById('txtDateSigned');
	var txtaNotes = document.getElementById('txtaNotes');
	var sErr = '';

	if (isBlank(txtDateSigned.value))
		sErr += 'You must enter a valid Date Signed.\n';
	else if (!isValidDate(txtDateSigned.value))
		sErr += 'The Date Signed must be in the format: mm/dd/yyyy.\n';

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function CheckAllConsentItems(bChecked)
{
	var aConsentItemIDs = document.getElementsByName('chkConsentItemIDs');

	for (var i=0;i<aConsentItemIDs.length;i++)
			aConsentItemIDs[i].checked = bChecked;
}