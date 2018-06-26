function doSubmitConsentForms()
{
	var oLastName = document.forms[0].txtLastName;
	var oSubjectID = document.forms[0].txtSubjectID;
	var oStudyID = document.forms[0].selStudyID;
	var sNameInvalidChars = '`~!@#$%^&*()_+1234567890\\={}|[];:",./<>?';
	var sSubjIDInvalidChars = '`~!@#$%^&*()+=[]}{;\\\'|:"/.,?><';
	var sErr = '';

	if (isBlank(oLastName.value) && isBlank(oSubjectID.value))
		sErr += 'You must enter the first few characters of the person\'s Last Name or their Subject ID.\n';
	else if ((!isBlank(oLastName.value)) && hasInvalidChars(oLastName.value, sNameInvalidChars))
		sErr += 'The Last Name you entered contains some invalid characters.\n';
	else if ((!isBlank(oSubjectID.value)) && hasInvalidChars(oSubjectID.value, sSubjIDInvalidChars))
		sErr += 'The Subject ID you entered contains some invalid characters.\n';

	if (oStudyID.options[oStudyID.selectedIndex].value == -1)
		sErr += 'You must select a study.\n';

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function doSubmitConsentFormsConsentForms()
{
	var aCheckBoxes = document.getElementsByName('chkConsentedItems');
	var oHiddenElement = document.getElementById('hidExcludedItems');
	var sDate = document.forms[0].txtDateSigned.value;
	var sCheckedItems = '';
	var sErr = '';
	var i = 0;

	if (!isValidDate(sDate))
		sErr += 'You must enter a valid Date Signed in the format: mm/dd/yyyy.\n';

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
	{
		for (i=0;i<aCheckBoxes.length;i++)
		{
			if (!aCheckBoxes[i].checked)
				sCheckedItems += aCheckBoxes[i].value + ',';
		}

		if (sCheckedItems.length > 0)
			sCheckedItems = sCheckedItems.substring(0, sCheckedItems.length - 1)

		oHiddenElement.value = sCheckedItems;

		return true;
	}
}

function LoadConsentForm(nConsentFormVersionID, nSubjID, sFrameID)
{
	var oFrame = document.getElementById(sFrameID);

	if (nConsentFormVersionID != -1)
		oFrame.src = '/DataEntry/ConsentForms/EditConsentForm.aspx?SubjID=' + nSubjID + '&ConsentFormVersionID=' + nConsentFormVersionID;
	else
		oFrame.src = '/DataEntry/ConsentForms/EditConsentForm.aspx';
}

function doSubmitDataToEnter(e)
{
	
	var selStudyID = GetReferenceToASPNETControl('selStudyID');
	var txtSubjID = GetReferenceToASPNETControl('txtSubjID');
	var sErr = '';

	if (selStudyID.options[selStudyID.selectedIndex].value == -1)
		sErr += '    -Study\n';

	if (!isBlank(sErr))
	{
		alert('You are missing:\n\n' + sErr);
		return false;
	}
	else
		return true;
		
}

function EditMultipleConsentForms(nStudyID)
{
	var oForm = document.forms[0];
	var sSubjIDs = '';
	var i;

	for (i=0;i<oForm.elements.length;i++)
	{
		if (oForm.elements[i].name == 'chkSubjIDs')
		{
			if (oForm.elements[i].checked)
				sSubjIDs += oForm.elements[i].value + ',';
		}
	}

	if (sSubjIDs.length > 0)
	{
		sSubjIDs = sSubjIDs.slice(0, sSubjIDs.length - 1);

		popUpWindow('/DataEntry/ConsentForms/EditMultipleConsentForms.aspx?hidDoRefresh=True&hidStudyID=' + nStudyID + '&hidSubjectIDs=' + sSubjIDs, 'oWindow', 'toolbars=no,statusbar=no,addressbar=no,width=600,height=400');
	}
	else
		alert('You must select at least one Subject to edit.\n');
}

function doSubmitEditMultipleConsentForms()
{
	var selConsents = GetReferenceToASPNETControl('selConsents');
	var txtDateSigned = GetReferenceToASPNETControl('txtDateSigned');
	var txtaNotes = GetReferenceToASPNETControl('txtaNotes');
	var sErr = '';

	if (selConsents.options[selConsents.selectedIndex].value == -1)
		sErr += 'You must select a Consent Form.\n';

	if (isBlank(txtDateSigned.value))
		sErr += 'You must enter the Date Signed.\n';
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

function doSubmitDataStorage()
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

	if (isBlank(txtStorageUnitNumber.value))
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

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function GetMaxStorageUnitNumber(nStudyID)
{
	var hidMaxStorageUnitNumber = document.getElementById('hidMaxStorageUnitNumber');
	var oSpan = document.getElementById('oSpan');

	for (var i=0;i<aMaxStorageUnits.length;i++)
	{
		if (aMaxStorageUnits[i][0] == nStudyID)
		{
			oSpan.innerHTML = ' Max. Unit Number: ' + aMaxStorageUnits[i][1];
			hidMaxStorageUnitNumber.value = aMaxStorageUnits[i][1];
			break;
		}
	}
}

function DoSubmitSearchStorageUnit()
{
	var selStudyID = GetReferenceToASPNETControl('selStudyID');
	var txtSubjID = GetReferenceToASPNETControl('txtSubjID');
	var sErr = '';

	if (selStudyID.options[selStudyID.selectedIndex].value == -1)
		sErr += 'You must select a Study.\n';

	if (isBlank(txtSubjID.value))
		sErr += 'You must select a Subject.\n';

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function CheckOutStorageUnit(nStorageUnitID, nStaffID, nCheckInOrOut)
{
	if (document.all)
	{
		oXMLHttp = new ActiveXObject("Microsoft.XMLHTTP"); 
		oXMLHttp.onreadystatechange = OnReadyStateChange_CheckOutStorageUnit;
		oXMLHttp.open('POST', '/ClientData/Response.aspx?Command=CheckOutStorageUnit&StorageUnitID=' + nStorageUnitID + '&StaffID=' + nStaffID + '&CheckInCheckOut=' + nCheckInOrOut, false);
		oXMLHttp.send();
	}
	else
	{
		oXMLHttp = new XMLHttpRequest(); 
		oXMLHttp.open('POST', '/ClientData/Response.aspx?Command=CheckOutStorageUnit&StorageUnitID=' + nStorageUnitID + '&StaffID=' + nStaffID + '&CheckInCheckOut=' + nCheckInOrOut, false);
		oXMLHttp.send(null);
		OnReadyStateChange_CheckOutStorageUnit();
	}
}

function OnReadyStateChange_CheckOutStorageUnit()
{
	var oSuccessNode = null;
	var oErrorNode = null;
	var oStorageUnitIDNode = null;
	var oStaffIDNode = null;
	var oCheckInCheckOutNode = null;
	var oStaffNameNode = null;
	var oDateNode = null;
	var oLink = null;

	if (document.all)
	{
		if (oXMLHttp.readyState == 4)
		{
			oSuccessNode = oXMLHttp.responseXML.selectSingleNode('//XMLResponse/Success');
			oStorageUnitIDNode = oXMLHttp.responseXML.selectSingleNode('//XMLResponse/StorageUnitID');
			oStaffIDNode = oXMLHttp.responseXML.selectSingleNode('//XMLResponse/StaffID');
			oCheckInCheckOutNode = oXMLHttp.responseXML.selectSingleNode('//XMLResponse/CheckInCheckOut');
			oStaffNameNode = oXMLHttp.responseXML.selectSingleNode('//XMLResponse/StaffShortName');
			oDateNode = oXMLHttp.responseXML.selectSingleNode('//XMLResponse/CheckInOutDate');

			if (oSuccessNode.text == 'True')
			{
				oLink = document.getElementById('aStatus' + oStorageUnitIDNode.text);

				if (oCheckInCheckOutNode.text == 1)
				{
					oLink.href = 'javascript:CheckOutStorageUnit(' + oStorageUnitIDNode.text + ', ' + oStaffIDNode.text + ', ' + '2);';
					oLink.innerHTML = oStaffNameNode.text + ' - ' + oDateNode.text;
					oLink.style.color = '#ff0000';
				}
				else
				{
					oLink.href = 'javascript:CheckOutStorageUnit(' + oStorageUnitIDNode.text + ', ' + oStaffIDNode.text + ', ' + '1);';
					oLink.innerHTML = 'Check Out Now';
					oLink.style.color = '#008800';
				}
			}
			else
			{
				oErrorNode = oXMLHttp.responseXML.selectSingleNode('//XMLResponse/Errors/Error');
				alert(oErrorNode.text);
			}
		}
	}
	else
	{
		oSuccessNode = oXMLHttp.responseXML.getElementsByTagName('Success');
		oStorageUnitIDNode = oXMLHttp.responseXML.getElementsByTagName('StorageUnitID');
		oStaffIDNode = oXMLHttp.responseXML.getElementsByTagName('StaffID');
		oCheckInCheckOutNode = oXMLHttp.responseXML.getElementsByTagName('CheckInCheckOut');
		oStaffNameNode = oXMLHttp.responseXML.getElementsByTagName('StaffShortName');
		oDateNode = oXMLHttp.responseXML.getElementsByTagName('CheckInOutDate');

		if (oSuccessNode.item(0).firstChild.data == 'True')
		{
			oLink = document.getElementById('aStatus' + oStorageUnitIDNode.item(0).firstChild.data);

			if (oCheckInCheckOutNode.item(0).firstChild.data == 1)
			{
				oLink.href = 'javascript:CheckOutStorageUnit(' + oStorageUnitIDNode.item(0).firstChild.data + ', ' + oStaffIDNode.item(0).firstChild.data + ', ' + '2);';
				oLink.innerHTML = oStaffNameNode.item(0).firstChild.data + ' - ' + oDateNode.item(0).firstChild.data;
				oLink.style.color = '#ff0000';
			}
			else
			{
				oLink.href = 'javascript:CheckOutStorageUnit(' + oStorageUnitIDNode.item(0).firstChild.data + ', ' + oStaffIDNode.item(0).firstChild.data + ', ' + '1);';
				oLink.innerHTML = 'Check Out Now';
				oLink.style.color = '#008800';
			}
		}

//		document.location.reload();
	}
}
