function doSubmitSearch()
{
	var oForm = document.forms[0];
	var oLastName = oForm.txtLastName;
	var oFirstName = oForm.txtFirstName;
	var oSubjectID = oForm.txtSubjectID;
	var oStudyID = oForm.selStudyID;
	var oState = oForm.selState;
	var oCity = oForm.txtCity;
	var sErr = '';

	if (isBlank(oLastName.value) && isBlank(oFirstName.value) && oState.options[oState.selectedIndex].value == -1 && isBlank(oCity.value) && isBlank(oSubjectID.value) && oStudyID.options[oStudyID.selectedIndex].value == -1)
		sErr += 'You must enter one of the following:\n\n\t-Last Name\n\t-First Name\n\t-Study\n\t-Subject ID and Study\n\t-Locale\n\t-City';

	//if (!isBlank(oSubjectID.value) && oStudyID.options[oStudyID.selectedIndex].value == -1)
	//	sErr += 'If you search by Subject ID, you must select a Study.\n';

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function doChangeDropDown(oDropDown, oTextBox)
{
	if (oDropDown.options[oDropDown.selectedIndex].value == -1)
	{
		oTextBox.disabled = true;
		oTextBox.style.backgroundColor = '#cccccc';
	}
	else
	{
		oTextBox.disabled = false;
		oTextBox.style.backgroundColor = '#ffffff';
		oTextBox.focus();
	}
}

function GetPersonInfo(nPersonID, sPersonName, sPersonRowID, sTextAreaID, sAddressRowID, sNDARRowID, sDOBRowID, sNotesRowID)
{
	var tblPersons = document.getElementById('tblPersons');
	var tblAddresses = document.getElementById('tblAddress' + nPersonID.toString())
	var oTextArea = document.getElementById(sTextAreaID);
	var aTextAreas = document.getElementsByTagName('textarea');
	var aTables = document.getElementsByTagName('table');
	var oPersonRow = document.getElementById(sPersonRowID);
	var oAddressRow = document.getElementById(sAddressRowID);
	var oNDARRow = document.getElementById(sNDARRowID);
	var oDOBRow = document.getElementById(sDOBRowID);
	var oNotesRow = document.getElementById(sNotesID);
	var i = 0;
	var j = 0;

	for (i=0;i<tblPersons.rows.length;i++)
	{
		for (j=0;j<tblPersons.rows[i].cells.length;j++)
			tblPersons.rows[i].cells[j].style.backgroundColor = '';
	}

	HighlightRow(oPersonRow);
	HighlightRow(oNDARRow);
	HighlightRow(oDOBRow);
	HighlightRow(oAddressRow);
	HighlightRow(oNotesRow);
}

var bNewPerson = false;
var bNewPhoneNumber = false;
var bNewEmailAddress = false;

function AddPerson()
{
	var oTable = document.getElementById('tblPersons');
	var oButton = document.getElementById('btnAddPerson');
	var nRowCount = oTable.rows.length;
	var nRowCountAlt = oTable.childNodes.item(0).childNodes.length;

	if (!bNewPerson)
	{
		if (document.all)
		{
			var oRow = oTable.insertRow();
			var oCellMC = oRow.insertCell();
			var oCellFN = oRow.insertCell();
			var oCellLN = oRow.insertCell();
			var oCellNN = oRow.insertCell();
			var oCellSex = oRow.insertCell();
			var oCellDeceased = oRow.insertCell();

			oCellMC.rowSpan = 3;

			var oRow = oTable.insertRow();
			var oCellDOB = oRow.insertCell();
			var oCellRace = oRow.insertCell();
			var oCellEthnicity = oRow.insertCell();
			var oCellRole = oRow.insertCell();

			var oRow = oTable.insertRow();
			var oCellAddress = oRow.insertCell();
			var oCellMotherID = oRow.insertCell();
			var oCellFatherID = oRow.insertCell();

			oCellAddress.colSpan = 2;

			oButton.value = 'Remove Extra Person';
		}
		else
		{
			var oRow = document.createElement('tr');
			var oCellMC = document.createElement('td');
			var oCellFN = document.createElement('td');
			var oCellLN = document.createElement('td');
			var oCellNN = document.createElement('td');
			var oCellSex = document.createElement('td');
			var oCellDeceased = document.createElement('td');
			oRow.setAttribute('id', 'trName');
			oRow.appendChild(oCellMC);
			oRow.appendChild(oCellFN);
			oRow.appendChild(oCellLN);
			oRow.appendChild(oCellNN);
			oRow.appendChild(oCellSex);
			oRow.appendChild(oCellDeceased);
			oTable.appendChild(oRow);

			var oRow = document.createElement('tr');
			var oCellMT = document.createElement('td');
			var oCellDOB = document.createElement('td');
			var oCellRace = document.createElement('td');
			var oCellEthnicity = document.createElement('td');
			var oCellRole = document.createElement('td');
			oCellRole.setAttribute('colspan', '2');
			oRow.setAttribute('id', 'trDOB');
			oRow.appendChild(oCellMT);
			oRow.appendChild(oCellDOB);
			oRow.appendChild(oCellRace);
			oRow.appendChild(oCellEthnicity);
			oRow.appendChild(oCellRole);
			oTable.appendChild(oRow);
			
			var oRow = document.createElement('tr');
			var oCellMT = document.createElement('td');
			var oCellAddress = document.createElement('td');
			var oCellMotherID = document.createElement('td');
			var oCellFatherID = document.createElement('td');
			oCellFatherID.setAttribute('colspan', '2');
			oRow.setAttribute('id', 'trAddress');
			oRow.appendChild(oCellMT);
			oRow.appendChild(oCellAddress);
			oRow.appendChild(oCellMotherID);
			oRow.appendChild(oCellFatherID);
			oTable.appendChild(oRow);

			oCellAddress.setAttribute('colspan', '2');
			oButton.value = 'Remove Extra Person';
		}

		oCellMC.innerHTML = '&nbsp;';
		oCellFN.innerHTML = '<label for="txtFirstNameNEW">First Name</label><br/><input type="hidden" name="hidPersonID" value="0" /><input type="textbox" name="txtFirstName" id="txtFirstNameNEW" />';
		oCellLN.innerHTML = '<label for="txtLastNameNEW">Last Name</label><br/><input type="textbox" name="txtLastName" id="txtLastNameNEW" />';
		oCellNN.innerHTML = '<label for="txtNickNameNEW">Nickname</label><br/><input type="textbox" name="txtNickName" id="txtNickNameNEW" />';
		oCellSex.innerHTML = oTable.rows[1].cells[4].innerHTML;
		oCellDeceased.innerHTML = '<input type="checkbox" name="chkDeceased" value="True" id="chkDeceasedNEW" /><label for="chkDeceasedNEW">Deceased?</label>';
		oCellDeceased.innerHTML += '<br /><input type="checkbox" name="chkDoNotContact" value="True" id="chkDoNotContactNEW" /><label for="chkDoNotContactNEW">Do Not Contact For Future Studies</label>';
		oCellDOB.innerHTML = '<label for="txtDOBNEW">DOB</label><br/><input type="textbox" name="txtDOB" id="txtDOBNEW" />';
		oCellRace.innerHTML = oTable.rows[2].cells[1].innerHTML.replace(/selected/, '');
		oCellEthnicity.innerHTML = oTable.rows[2].cells[2].innerHTML.replace(/selected/, '');
		oCellRole.innerHTML = oTable.rows[2].cells[3].innerHTML.replace(/selected/, '');
		oCellAddress.innerHTML = oTable.rows[3].cells[0].innerHTML.replace(/selected/, '');
		oCellMotherID.innerHTML = oTable.rows[3].cells[1].innerHTML.replace(/selected/, '');
		oCellFatherID.innerHTML = oTable.rows[3].cells[2].innerHTML.replace(/selected/, '');

		bNewPerson = true;
	}
	else
	{
		if (document.all)
		{
			oTable.deleteRow(nRowCount-1);
			oTable.deleteRow(nRowCount-2);
			oTable.deleteRow(nRowCount-3);
		}
		else
		{
			document.getElementById('trName').innerHTML = '';
			document.getElementById('trDOB').innerHTML = '';
			document.getElementById('trAddress').innerHTML = '';
		}

		oButton.value = 'Add Person';
		bNewPerson = false;
	}
}

function AddPhoneNumber()
{
	var oTable = document.getElementById('tblPhoneNumber');
	var oButton = document.getElementById('btnAddPhoneNumber');
	var nRowCount = oTable.rows.length;

	if (!bNewPhoneNumber)
	{
		if (document.all)
		{
			var oRow = oTable.insertRow();
			var oCellNumber = oRow.insertCell();
			var oCellType = oRow.insertCell();
			var oCellNotes = oRow.insertCell();
		}
		else
		{
			var oRow = document.createElement('tr');
			var oCellNumber = document.createElement('td');
			var oCellType = document.createElement('td');
			var oCellNotes = document.createElement('td');
			oRow.setAttribute('id', 'trNewPhone');
			oRow.appendChild(oCellNumber);
			oRow.appendChild(oCellType);
			oRow.appendChild(oCellNotes);
			oTable.appendChild(oRow);
		}

		oCellNumber.style.width = '20%';
		oCellType.style.width = '20%';

		oCellNumber.innerHTML = '<input type="hidden" name="hidPhoneNumberID" value="0" /><input type="text" name="txtPhoneNumber" />';
		oCellType.innerHTML = '<input type="text" name="txtPhoneNumberType" />';
		oCellNotes.innerHTML = '<textarea rows="1" name="txtPhoneNumberNotes" style="width: 100%;"></textarea>';
		oButton.value = 'Remove Extra Phone Number';
		bNewPhoneNumber = true;
	}
	else
	{
		if (document.all)
			oTable.deleteRow(nRowCount-1);
		else
			document.getElementById('trNewPhone').innerHTML = '';

		oButton.value = 'Add Phone Number';
		bNewPhoneNumber = false;
	}
}

function AddEmailAddress()
{
	var oTable = document.getElementById('tblEmailAddress');
	var oButton = document.getElementById('btnAddEmailAddress');
	var nRowCount = oTable.rows.length;

	if (!bNewEmailAddress)
	{
		if (document.all)
		{
			var oRow = oTable.insertRow();
			var oCellAddress = oRow.insertCell();
			var oCellType = oRow.insertCell();
			var oCellNotes = oRow.insertCell();
		}
		else
		{
			var oRow = document.createElement('tr');
			var oCellAddress = document.createElement('td');
			var oCellType = document.createElement('td');
			var oCellNotes = document.createElement('td');
			oRow.setAttribute('id', 'trNewEmail');
			oRow.appendChild(oCellAddress);
			oRow.appendChild(oCellType);
			oRow.appendChild(oCellNotes);
			oTable.appendChild(oRow);
		}

		oCellAddress.style.width = '20%';
		oCellType.style.width = '20%';

		oCellAddress.innerHTML = '<input type="hidden" name="hidEmailID" value="0" /><input type="text" name="txtEmailAddress" />';
		oCellType.innerHTML = '<input type="text" name="txtEmailAddressType" />';
		oCellNotes.innerHTML = '<textarea rows="1" name="txtEmailAddressNotes" style="width: 100%;"></textarea>';
		oButton.value = 'Remove Extra Email Address';
		bNewEmailAddress = true;
	}
	else
	{
		if (document.all)
			oTable.deleteRow(nRowCount-1);
		else
			document.getElementById('trNewEmail').innerHTML = '';

		oButton.value = 'Add Email Address';
		bNewEmailAddress = false;
	}
}

function doSubmitEditHousehold()
{
	var oForm = document.forms[0];
	var sRegExpDate = /(0[1-9]|1[012])\/(0[1-9]|[12][0-9]|3[01])\/(19|20)\d\d/;
	var sRegExpEmail = /^(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}$/;
	var oRegExpDate = new RegExp(sRegExpDate);
	var oRegExpEmail = new RegExp(sRegExpEmail);
	var hidMainContact = document.forms[0].hidMainContact;
	var txtPersonNotes = null;
	var hidIsDeceased = document.forms[0].hidIsDeceased;
	var hidDoNotContact = document.forms[0].hidDoNotContact;
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

		if (oForm.elements[i].name == 'txtFirstName' && isBlank(oForm.elements[i].value))
		{
			sErr += 'First Name is a required field.\n';
			break;
		}	

		if (oForm.elements[i].name == 'txtLastName' && isBlank(oForm.elements[i].value))
		{
			sErr += 'Last Name is a required field.\n';
			break;
		}	

		if (oForm.elements[i].name == 'txtDOB' && !isBlank(oForm.elements[i].value))
		{
			if (oForm.elements[i].value.search(oRegExpDate) < 0)
			{
				sErr += 'The DOB must be in the format: mm/dd/yyyy.';
				break;
			}
		}

		if (oForm.elements[i].name == 'txtPhoneNumber' && isBlank(oForm.elements[i].value))
		{
			sErr += 'Phone Number is a required field.\n';
			break;
		}	

		if (oForm.elements[i].name == 'txtEmailAddress')
		{
			if (!isBlank(oForm.elements[i].value))
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

    if (oForm.elements[i].name == 'chkDeceased') {
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

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

var nCurAddressIndex = 0;

function SynchListBoxWithAddress(nIncrement)
{

	nCurAddressIndex = nCurAddressIndex + nIncrement;

	if (nCurAddressIndex >= aAddresses.length)
		nCurAddressIndex = aAddresses.length - 1;
	else if (nCurAddressIndex < 0)
		nCurAddressIndex = 0;

	var nAddressID = aAddresses[nCurAddressIndex];
	var aTables = document.getElementsByTagName('table');
	var tblAddress = document.getElementById('tblAddress' + nAddressID);
	var spnAddressCount = document.getElementById('spnAddressCount' + nAddressID);
	var aElements = document.forms[0].elements;
	var i = 0;

	for (i=0;i<aTables.length;i++)
	{
		if (document.all)
		{
			if (aTables[i].name == 'tblAddress')
			{
				aTables[i].style.display = 'none';

				spnAddressCount.innerHTML = 'Address ' + (nCurAddressIndex + 1) + ' of ' + aAddresses.length;
			}
		}
		else
		{
			if (aTables[i].getAttribute('name') == 'tblAddress')
			{
				aTables[i].style.display = 'none';

				spnAddressCount.innerHTML = 'Address ' + (nCurAddressIndex + 1) + ' of ' + aAddresses.length;
			}
		}
	}

	if (tblAddress != null) {tblAddress.style.display = '';}
}

var bNewAddress = false;
var sLiveTableID = '';

function AddNewAddress()
{
	var oTdAddress = GetReferenceToASPNETControl('tdAddress');
	var oButton = GetReferenceToASPNETControl('btnAddAddress');
	var aTables = document.getElementsByTagName('table');
	var hidAddressID = GetReferenceToASPNETControl('hidAddressID');
	var aElements = new Array('Address1', 'Address2', 'City', 'State', 'Region', 'Country', 'Zip', 'Notes');
	var oTr = null;
	var tdLabel = null;
	var tdInput = null;
	var i = 0;

	if (!bNewAddress)
	{
		var oTable = document.createElement('table');
		oTable.name = 'tblAddress';
		oTable.id = 'tblAddress0';
		oTable.className = 'tblAddress';

		for (i=0;i<aTables.length;i++)
		{
			if (aTables[i].getAttribute('name') == 'tblAddress')
			{
				if (aTables[i].style.display == '')
					sLiveTableID = aTables[i].id;

				aTables[i].style.display = 'none';
			}
		}

		if (document.all)
		{
			oTr = oTable.insertRow();
			tdLabel = oTr.insertCell();
			tdLabel.colSpan = 2;
			oTr.className = 'trTitle';
			tdLabel.innerHTML = 'Add New Address';

			for (i=0;i<aElements.length;i++)
			{
				oTr = oTable.insertRow();
				tdLabel = oTr.insertCell();
				tdInput = oTr.insertCell();

				tdLabel.innerHTML = '<label for="txt' + aElements[i] + '">' + aElements[i] + ':</label>';
				tdLabel.style.textAlign = 'right';
				tdLabel.className = 'tdLabel';

				if (aElements[i] == 'Notes')
					tdInput.innerHTML = '<textarea name="txt' + aElements[i] + '" rows="4" style="width: 350px;"></textarea>';
				else
					tdInput.innerHTML = '<input type="text" name="txt' + aElements[i] + '" />';
			}
		}
		else
		{
			oTable.setAttribute('cellSpacing', '0');
			oTr = document.createElement('tr');
			oTr.setAttribute('class', 'trTitle');
			tdLabel = document.createElement('td');
			tdLabel.setAttribute('colspan', '2');
			tdLabel.innerHTML = 'Add New Address';
			oTr.appendChild(tdLabel);
			oTable.appendChild(oTr);

			for (i=0;i<aElements.length;i++)
			{
				oTr = document.createElement('tr');
				tdLabel = document.createElement('td');
				tdInput = document.createElement('td');
				oTr.appendChild(tdLabel);
				oTr.appendChild(tdInput);

				tdLabel.style.textAlign = 'right';
				tdLabel.setAttribute('class', 'tdLabel');

				tdLabel.innerHTML = '<label for="txt' + aElements[i] + '">' + aElements[i] + ':</label>';

				if (aElements[i] == 'Notes')
					tdInput.innerHTML = '<textarea name="txt' + aElements[i] + '" rows="4" style="width: 350px;"></textarea>';
				else
					tdInput.innerHTML = '<input type="text" name="txt' + aElements[i] + '" />';

				oTable.appendChild(oTr);
			}
		}

		oTdAddress.appendChild(oTable);
		bNewAddress = true;
		if (!isBlank(hidAddressID.value)) {hidAddressID.value += ',0';} else {hidAddressID.value = '0';}
		oButton.value = 'Remove New Address';
	}
	else
	{
		var oTable = document.getElementById('tblAddress0');

		if (document.all)
		{
			for (i=0;i<oTable.cells.length;i++)
				oTable.cells[i].innerHTML = '';
		}
		else
		{
			for (i=0;i<oTable.childNodes.length;i++)
				oTable.childNodes[i].innerHTML = '';
		}

		for (i=0;i<aTables.length;i++)
		{
			if (aTables[i].getAttribute('name') == 'tblAddress')
			{
				if (aTables[i].id == sLiveTableID)
					aTables[i].style.display = '';
				else
					aTables[i].style.display = 'none';
			}
		}

		bNewAddress = false;
		hidAddressID.value = hidAddressID.value.substring(0, hidAddressID.value.length - 2);
		oButton.value = 'Add New Address';
	}

}

function doSubmitCreateHousehold()
{
	var txtHouseholdName = document.getElementById('txtHouseholdName');
	var txtFirstName = document.getElementById('txtHouseholdName');
	var txtLastName = document.getElementById('txtLastName');
	var txtDOB = document.getElementById('txtDOB');
	var txtPhoneNumber = document.getElementById('txtPhoneNumber');
	var txtPhoneNumberType = document.getElementById('txtPhoneNumberType');
	var txtPhoneNumberNotes = document.getElementById('txtPhoneNumberNotes');
	var txtEmailAddress = document.getElementById('txtEmailAddress');
	var txtEmailAddressType = document.getElementById('txtEmailAddressType');
	var txtEmailAddressNotes = document.getElementById('txtEmailAddressNotes');
	var txtEmerFirstName = document.getElementById('txtEmerFirstName');
	var txtEmerLastName = document.getElementById('txtEmerLastName');
	var txtRelationship = document.getElementById('txtRelationship');
	var txtPhone1 = document.getElementById('txtPhone1');
	var txtZip = document.getElementById('txtZip');
	var sRegExpDate = /(0[1-9]|1[012])\/(0[1-9]|[12][0-9]|3[01])\/(19|20)\d\d/;
	var sRegExpEmail = /^(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}$/;
	var sRegExpZip = /\d\d\d\d\d/;
	var oRegExpDate = new RegExp(sRegExpDate);
	var oRegExpEmail = new RegExp(sRegExpEmail);
	var oRegExpZip = new RegExp(sRegExpZip);
	var sErr = '';

	if (isBlank(txtHouseholdName.value))
		sErr += 'Household Name is required.\n';

	if (isBlank(txtFirstName.value))
		sErr += 'First Name is required.\n';

	if (isBlank(txtLastName.value))
		sErr += 'Last Name is required.\n';
/*
	if (isBlank(txtEmerFirstName.value))
		sErr += 'Emergency Contact First Name is required.\n';

	if (isBlank(txtEmerLastName.value))
		sErr += 'Emergency Contact Last Name is required.\n';

	if (isBlank(txtRelationship.value))
		sErr += 'Emergency Contact Relationship is required.\n';

	if (isBlank(txtPhone1.value))
		sErr += 'Emergency Contact Phone 1 is required.\n';
*/
	if (!isBlank(txtZip.value))
	{
		if (txtZip.value.search(oRegExpZip) < 0)
			sErr += 'The Postal Code must be five digits.\n';
	}

	if (!isBlank(txtDOB.value))
	{
		if (txtDOB.value.search(oRegExpDate) < 0)
			sErr += 'DOB must be in the format: "mm/dd/yyyy".\n';
	}

	if (isBlank(txtPhoneNumber.value))
	{
		if (!isBlank(txtPhoneNumberType.value) || !isBlank(txtPhoneNumberNotes.value))
			sErr += 'You cannot enter Phone Type or Phone Notes without a Phone Number.\n';
	}

	if (!isBlank(txtEmailAddress.value))
	{
		if (txtEmailAddress.value.search(sRegExpEmail) < 0)
			sErr += 'The Email address you entered is invalid.\n';
	}
	else if (!isBlank(txtEmailAddressType.value) || !isBlank(txtEmailAddressNotes.value))
		sErr += 'You cannot enter Email Type or Email Notes without an Email Address.\n';

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function doSubmitEditAddress()
{
	var aElements = document.forms[0].elements;
	var nAddressID = 0;
	var sErr = '';
	var i = 0;

	for (i=0;i<aElements.length;i++)
	{
		if (aElements[i].name == 'hidAddressID')
			nAddressID = aElements[i].value;

		if (aElements[i].name == 'txtAddress1' && isBlank(aElements[i].value))
			sErr += 'Address 1 is a required field.\n';

		if (aElements[i].name == 'txtCity' && isBlank(aElements[i].value))
			sErr += 'City is a required field.\n';

		if (aElements[i].name == 'txtZip' && isBlank(aElements[i].value))
			sErr += 'Postal/Zip Code is a required field.\n';

		if (aElements[i].name == 'txtNotes')
			aElements[i].value = aElements[i].value.replace(',', ';');
	}

	if (!isBlank(sErr))
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

function doSubmitCreateSubject()
{
	var selStudyID = GetReferenceToASPNETControl('selStudyID');
	var selGroupID = GetReferenceToASPNETControl('selGroupID');
	var txtSubjectID = GetReferenceToASPNETControl('txtSubjectID');
	var sErr = '';

	if (selStudyID.options[selStudyID.selectedIndex].value == -1)
		sErr += 'You must select a Study.\n';

	if (selGroupID.options[selGroupID.selectedIndex].value == -1)
		sErr += 'You must select a Group.\n';

	if (isBlank(txtSubjectID.value))
		sErr += 'You must enter a Subject ID.\n';


	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function CheckStatus()
{
	var selStudyID = document.getElementById('selStudyID');

	doSyncDropDowns(selStudyID.options[selStudyID.selectedIndex].value, null, 'group', 'selGroupID');
}

var oXMLHttp = null;

function DisplayMaxID(nStudyID)
{
	var selStudyID = GetReferenceToASPNETControl('selStudyID');

	if (document.all)
	{
		oXMLHttp = new ActiveXObject("Microsoft.XMLHTTP"); 
		oXMLHttp.onreadystatechange = DisplayMaxID_HandlerOnReadyStateChange;
		oXMLHttp.open('GET', '/ClientData/Response.aspx?Command=GetMaxIDByStudyID&StudyID=' + selStudyID.options[selStudyID.selectedIndex].value, false);
		oXMLHttp.send();
	}
	else
	{
		oXMLHttp = new XMLHttpRequest(); 
		oXMLHttp.open('GET', '/ClientData/Response.aspx?Command=GetMaxIDByStudyID&StudyID=' + selStudyID.options[selStudyID.selectedIndex].value, false);
		oXMLHttp.send(null);
		DisplayMaxID_HandlerOnReadyStateChange();
	}
}

function DisplayMaxID_HandlerOnReadyStateChange()
{
	if (oXMLHttp.readyState == 4)
	{
		var spnMaxID = document.getElementById('spnMaxID');
		
		if (document.all)
			spnMaxID.innerHTML = '<br/>Max. ID: ' + oXMLHttp.responseXML.selectSingleNode('//XMLResponse/MaxID').text;
		else
			spnMaxID.innerHTML = '<br/>Max. ID: ' + oXMLHttp.responseXML.getElementsByTagName('MaxID')[0].firstChild.data;
	}
}

function DoSubmitAppendLog()
{
	var bIsContactLog = document.getElementById('hidIsContactLog').value;
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

		if (isBlank(txtContactDate.value) || !isValidDate(txtContactDate.value))
			sErr += 'The Contact Date you entered is invalid.\n';

		if (selStudy.options[selStudy.selectedIndex].value == -1)
			sErr += 'You must select a Study.\n';

		if (selContactStaff.options[selContactStaff.selectedIndex].value == -1)
			sErr += 'You must select the Staff member who made the contact.\n';
	}
	else
	{
		if (isBlank(txtaHouseholdNotes.value))
			sErr += 'You must enter some notes about the contact you made.\n';

		if (selCategory.options[selCategory.selectedIndex].value == -1)
			sErr += 'You must select a Category.\n';

		if (selHouseholdInfoPriority.options[selHouseholdInfoPriority.selectedIndex].value == -1)
			sErr += 'You must select a Priority.\n';

		if (selHouseholdInfoStaff.options[selHouseholdInfoStaff.selectedIndex].value == -1)
			sErr += 'You must select the Staff member who made the contact.\n';
	}

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function AddDateAndTime(oTextBox)
{
	var dt = oTextBox.value;
	var dtNewDate = new Date();
	var sMonth = (dtNewDate.getMonth() + 1).toString();
	var sDay = dtNewDate.getDate().toString();
	var sYear = dtNewDate.getFullYear().toString();
	var sHour = dtNewDate.getHours().toString();
	var sMinute = dtNewDate.getMinutes().toString();
	var sAMPM = 'AM';
	var sReturn = null;

	if (dt.length == 10)
	{
		if (isValidDate(dt))
			sReturn = dt;
	}
	else
	{
		if (sMonth.length == 1)
			sMonth = '0' + sMonth;

		if (sDay.length == 1)
			sDay = '0' + sDay;

		sReturn = sMonth + '/' + sDay + '/' + sYear;
	}

	if (sHour > 12)
	{
		sHour = (parseInt(sHour) - 12).toString();
		sAMPM = 'PM';
	}

	if (sHour.length == 1)
		sHour = '0' + sHour;

	if (sMinute.length == 1)
		sMinute = '0' + sMinute;

	sReturn += ' ' + sHour + ':' + sMinute + ' ' + sAMPM;

	oTextBox.value = sReturn;
}