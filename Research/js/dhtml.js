/***********************************************************************************************
BEGIN GENERIC DHTML CODE
***********************************************************************************************/
function PopUpWindow(sLocation, sWindowName, sOptions)
{
	var oWindow = window.open(sLocation, sWindowName, sOptions);
}

function GiveFocus()
{
	var bFoundElement = false;

	if (document.forms.length > 0)
	{
		for (i=0;i<document.forms[0].elements.length;i++)
		{
			if ((document.forms[0].elements[i].type == 'text' || document.forms[0].elements[i].type == 'textarea' || document.forms[0].elements[i].type == 'password') && document.forms[0].elements[i].disabled == false && document.forms[0].elements[i].style.display != 'none')
			{
			    try
			    {
    				document.forms[0].elements[i].focus();
	    			bFoundElement = true;
    				break;
    		    }
    		    catch(e) {}
			}
		}

		if (!bFoundElement)
		{
			for (i=0;i<document.forms[0].elements.length;i++)
			{
				if (document.forms[0].elements[i].type == 'select-one' && document.forms[0].elements[i].disabled == false && document.forms[0].elements[i].style.display != 'none')
				{
    			    try
	    		    {
					    document.forms[0].elements[i].focus();
					    break;
    		        }
    		        catch(e) {}
				}
			}
		}
	}
}

function ChangeStyle(sTagID, sColor)
{
	var oTag = document.getElementById(sTagID);

	oTag.style.backgroundColor = sColor;
}

function ShowTableRow(sRowID)
{
	var oRow = document.getElementById(sRowID);

	if (document.all)
	{
		if (oRow.attributes['class'].value == 'DisplayForPrintOnly')
		{
			oRow.attributes['class'].value = '';
			oRow.style.display = '';
		}
		else
		{
			if (oRow.style.display == 'none')
				oRow.style.display = '';
			else
				oRow.style.display = 'none';
		}
	}
	else
	{
		if (oRow[i].getAttribute('name') == sRowName)
		{
			if (oRow[i].getAttribute['class'] == 'DisplayForPrintOnly')
			{
				oRow[i].setAttribute['class'] = '';
				oRow[i].style.display = '';
			}
			else
			{
				if (oRow[i].style.display == 'none')
					oRow[i].style.display = '';
				else
					oRow[i].style.display = 'none';
			}
		}
	}
}

function ExpandRow(sRowID)
{
	var oRow = document.getElementById(sRowID);

	if (oRow.getAttribute['class'] == 'DisplayForPrintOnly')
	{
		oRow.setAttribute['class'] = '';
		oRow.style.display = 'inline';
	}
	else
	{
		if (oRow.style.display == 'none')
			oRow.style.display = 'inline';
		else
			oRow.style.display = 'none';
	}
}

function HighlightRow(oRow)
{
	if (oRow != null)
	{
		for (i=0;i<oRow.childNodes.length;i++)
		{
			if (!document.all)
			{
				if (oRow.childNodes[i].bgColor == '')
					oRow.childNodes[i].bgColor = '#ffff00';
				else
					oRow.childNodes[i].bgColor = '';
			}
			else
			{
				if (oRow.childNodes[i].style.backgroundColor == '')
					oRow.childNodes[i].style.backgroundColor = '#ffff00';
				else
					oRow.childNodes[i].style.backgroundColor = '';
			}
		}
	}
}

function HasAnItemSelected(oDropDown)
{
	var bReturn = false;
	var i = 0;

	for (i=0;i<oDropDown.options.length;i++)
	{
		if (oDropDown.options[i].selected)
		{
			bReturn = true;
			break;
		}
	}

	return bReturn;
}

function HasAnItemChecked(sControlName)
{
	var aControls = document.getElementsByName(sControlName);
	var bReturn = false;
	var i = 0;

	for (i=0;i<aControls.length;i++)
	{
		if (aControls[i].checked)
		{
			bReturn = true;
			break;
		}
	}

	return bReturn;
}

function ReloadFrame(oFrame)
{
	if (oFrame != null)
		oFrame.document.location.reload();
}

function ListBoxSelectAll(oListBox, bSelectionMode)
{
	var i = 0;

	for (i=0;i<oListBox.options.length;i++)
		oListBox.options[i].selected = bSelectionMode;
}

function ChangeCheckBoxes(sCheckBoxName, bChecked)
{
	var oCheckBox = document.getElementsByName(sCheckBoxName);
	var i = 0;

	for (i=0;i<oCheckBox.length;i++)
	{
		if (oCheckBox[i].type == 'checkbox')
			oCheckBox[i].checked = bChecked;
	}
}

function GetValueOfRadioButton(sName)
{
	var aRadioButtons = document.getElementsByName(sName);
	var sReturn = null;

	if (aRadioButtons != null)
	{
		for (var i=0;i<aRadioButtons.length;i++)
		{
			if (aRadioButtons[i].checked)
			{
				sReturn = aRadioButtons[i].value;
				break;
			}
		}
	}

	return sReturn;
}

function SelectDropDownValue(oDropDownList, sValue)
{
	try
	{
		for (var i=0;i<oDropDownList.options.length;i++)
		{
			if (oDropDownList.options[i].value == sValue)
			{
				oDropDownList.options[i].selected = true;
				return;
			}
				
		}

		if (oDropDownList.options.length > 0)
			oDropDownList.options[0].selected = true;
	}
	catch (e)
	{}
}

function AddOptionToDropDown(oDropDown, sText, sValue)
{
    if (document.all)
    {
        oOption = document.createElement('option');
        oOption.setAttribute("value", sValue, 0);
        oOption.innerText = sText;

        oDropDown.appendChild(oOption);
    }
    else
    {
		oOption = document.createElement('option');
		oOption.text = sText;
		oOption.value = sValue;
		oDropDown.appendChild(oOption);
    }
}

function SetAllListBoxes(bSelectionMode)
{
    var aElements = document.forms[0].elements;

    for (var i=0;i<aElements.length;i++)
    {
        if (aElements[i].type == 'select-multiple')
            ListBoxSelectAll(aElements[i], bSelectionMode);
    }
}

//DF: 4/12
function GetReferenceToASPNETControl2(sTagName, sControlName)
{
    var aElements = document.getElementsByTagName(sTagName);
    var oReturn = null;

    for (var i=0;i<aElements.length;i++)
    {
		if (aElements[i].name != null)
		{
			if (aElements[i].name.indexOf(sControlName) >= 0)
			{
				oReturn = aElements[i];
				break;
			}
        }
        else if (aElements[i].id != null)
		{
			if (aElements[i].id.indexOf(sControlName) >= 0)
			{
				oReturn = aElements[i];
				break;
			}
        }
    }

    return oReturn;
}


//DF: 5/15
function GetAllElementsContainingName(sControlName)
{
    var aElements = document.forms[0].elements;
    var aReturn = new Array;
    var j = 0;
    for (var i=0;i<aElements.length;i++)
    {
		if (aElements[i].name != null)
		{
			if (aElements[i].name.indexOf(sControlName) >= 0)
			{
				aReturn[j++] = aElements[i];
				continue;
			}
        }
        else if (aElements[i].id != null)
		{
			if (aElements[i].id.indexOf(sControlName) >= 0)
			{
				aReturn[j++] = aElements[i];
				continue;
			}
        }
    }

    return aReturn;

}


function GetReferenceToASPNETControl(sControlName)
{
    var aElements = document.forms[0].elements;
    var oReturn = null;

    for (var i=0;i<aElements.length;i++)
    {
		if (aElements[i].name != null)
		{
			if (aElements[i].name.indexOf(sControlName) >= 0)
			{
				oReturn = aElements[i];
				break;
			}
        }
        else if (aElements[i].id != null)
		{
			if (aElements[i].id.indexOf(sControlName) >= 0)
			{
				oReturn = aElements[i];
				break;
			}
        }
    }

    return oReturn;
}

function GetReferenceToASPNETNonFormControl(sControlName)
{
    var aElements = document.all;
    var oReturn = null;

    for (var i=0;i<aElements.length;i++)
    {
		if (aElements[i].name != null)
		{
			if (aElements[i].name.indexOf(sControlName) >= 0)
			{
				oReturn = aElements[i];
				break;
			}
        }
        else if (aElements[i].id != null)
		{
			if (aElements[i].id.indexOf(sControlName) >= 0)
			{
				oReturn = aElements[i];
				break;
			}
        }
    }

    return oReturn;
}

function GetReferenceToASPNETNonFormControl(sControlName, sTagName)
{
    var aElements = document.getElementsByTagName(sTagName);
    var oReturn = null;

    for (var i=0;i<aElements.length;i++)
    {
		if (aElements[i].name != null)
		{
			if (aElements[i].name.indexOf(sControlName) >= 0)
			{
				oReturn = aElements[i];
				break;
			}
        }
        else if (aElements[i].id != null)
		{
			if (aElements[i].id.indexOf(sControlName) >= 0)
			{
				oReturn = aElements[i];
				break;
			}
        }
    }

    return oReturn;
}

function GetReferenceToASPNETControlInParentWindow(sControlName)
{
    var aElements = window.opener.document.forms[0].elements;
    var oReturn = null;

    for (var i=0;i<aElements.length;i++)
    {
        if (aElements[i].name.indexOf(sControlName) >= 0)
        {
            oReturn = aElements[i];
            break;
        }
    }
    
    return oReturn;
}

function ClearAllElements(aExcludedItems)
{
    var aElements = document.forms[0].elements;
    
    for (var i=0;i<aElements.length;i++)
    {
        if (!FindValueInArray(aExcludedItems, aElements[i].id))
        {
            switch (aElements[i].type)
            {
                case 'select-one':
                    aElements[i].selectedIndex = 0;
                    break;
                case 'select-multiple':
                    for (var j = 0;j<aElements[i].options.length;j++)
                        aElements[i].options[j].selected = false;

                    break;
                case 'checkbox':
                    aElements[i].checked = false;
                    break;
                case 'radio':
                    aElements[i].checked = false;
                    break;
                case 'text':
                    aElements[i].value = '';
                    break;
                case 'textarea':
                    aElements[i].innerHTML = '';
                    break;
                default:
                    break;
            }
        }
    }
}

function DisableControlBasedOnAnotherControlsValue(oControlToChange, oControlToTest, sTestValue)
{
    var bDoDisable = false;

    if (oControlToTest.type == 'select-one')
    {
        if (oControlToTest.options[oControlToTest.selectedIndex].value == sTestValue)
            bDoDisable = true;
    }
    else if (oControlToTest.type == 'select-multiple')
    {

        for (var i=0;i<oControlToTest.options.length;i++)
        {
            if (oControlToTest.options[i].selected && oControlToTest.options[i].value == sTestValue)
            {
                bDoDisable = true;
                break;
            }
        }
    }
    else if (oControlToTest.checkbox)
    {
        if (oControlToTest.checked == sTestValue || (oControlToTest.checked && oControlToTest.value == sTestValue))
            bDoDisable = true;
    }
    else
    {
        if (oControlToTest.value == sTestValue)
            bDoDisable = true;
    }

    oControlToChange.disabled = bDoDisable;
}

function MoveListBoxItemsFromOneListBoxToAnother(oListBoxFrom, oListBoxTo)
{
    var sItemsToRemove = '';
    var aItemsToRemove = null;

    for (var i=0;i<oListBoxFrom.options.length;i++)
    {
        if (oListBoxFrom.options[i].selected)
        {
            AddOptionToDropDown(oListBoxTo, oListBoxFrom.options[i].innerHTML, oListBoxFrom.options[i].value);
            sItemsToRemove += oListBoxFrom.options[i].value + ',';
        }
    }

    aItemsToRemove = sItemsToRemove.split(',');

    for (var i=oListBoxFrom.options.length-1;i>-1;i--)
    {
        for (var j=0;j<aItemsToRemove.length;j++)
        {
            if (oListBoxFrom.options[i].value == aItemsToRemove[j])
            {
                oListBoxFrom.remove(i);
                break;
            }
        }
    }
}

function RemoveAllListBoxItems(oListBox)
{
    for (var i=oListBox.options.length-1;i>-1;i--)
        oListBox.remove(i);
}

function DoSubmitSort(sSortItem)
{
	document.forms[0].hidSortField.value = sSortItem;
	document.forms[0].submit();
}

function DoSubmitSort2(sSortItem)
{
	document.forms[0].ctl00_oBodyPlaceHolder_hidSortField.value = sSortItem;
	document.forms[0].submit();
}

function DoChangeDropDown(oDropDown, oTextBox)
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
		if (IsValidDate(dt))
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
/***********************************************************************************************
BEGIN DATA ENTRY/DATA STORAGE DHTML CODE
***********************************************************************************************/
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

/***********************************************************************************************
BEGIN HOUSEHOLD DHTML CODE
***********************************************************************************************/
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
	var oNotesRow = document.getElementById(sNotesRowID);
	var i = 0;
	var j = 0;

	for (i=0;i<tblPersons.rows.length;i++)
	{
		for (j=0;j<tblPersons.rows[i].cells.length;j++)
			tblPersons.rows[i].cells[j].style.backgroundColor = '';
	}

	HighlightRow(oPersonRow);
	HighlightRow(oAddressRow);
	HighlightRow(oNDARRow);
	HighlightRow(oDOBRow);
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
            oCellMC.rowSpan = 5;

			var oRow = oTable.insertRow();
			var oCellMN = oRow.insertCell();
			var oCellLNBC = oRow.insertCell();
			var oCellCB = oRow.insertCell();
			var oCellSB = oRow.insertCell();
            oCellSB.colSpan = 2;

			var oRow = oTable.insertRow();
			var oCellDOB = oRow.insertCell();
			var oCellRace = oRow.insertCell();
			var oCellEthnicity = oRow.insertCell();
			var oCellRole = oRow.insertCell();
            oCellRole.colSpan = 2;

			var oRow = oTable.insertRow();
			var oCellAddress = oRow.insertCell();
			var oCellMotherID = oRow.insertCell();
			var oCellFatherID = oRow.insertCell();
			oCellAddress.colSpan = 2;
            oCellFatherID.colSpan = 2;

            var oRow = oTable.insertRow();
            var oCellNotes = oRow.insertCell();
            oCellNotes.colSpan = 5;

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
			var oCellMN = document.createElement('td');
			var oCellLNBC = document.createElement('td');
			var oCellCB = document.createElement('td');
			var oCellSB = document.createElement('td');
			oCellSB.setAttribute('colspan', '2');
			oRow.setAttribute('id', 'trNDAR');
			oRow.appendChild(oCellMT);
			oRow.appendChild(oCellMN);
			oRow.appendChild(oCellLNBC);
			oRow.appendChild(oCellCB);
			oRow.appendChild(oCellSB);
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
			oCellAddress.setAttribute('colspan', '2');
			oCellFatherID.setAttribute('colspan', '2');
			oRow.setAttribute('id', 'trAddress');
			oRow.appendChild(oCellMT);
			oRow.appendChild(oCellAddress);
			oRow.appendChild(oCellMotherID);
			oRow.appendChild(oCellFatherID);
			oTable.appendChild(oRow);

			var oRow = document.createElement('tr');
			var oCellNotes = document.createElement('td');
			oCellNotes.setAttribute('colspan', '5');
			oRow.setAttribute('id', 'txtPersonNotes');
			oRow.appendChild(oCellNotes);
			oTable.appendChild(oRow);

			oButton.value = 'Remove Extra Person';
		}

		oCellMC.innerHTML = '&nbsp;';
		oCellFN.innerHTML = '<label for="txtFirstNameNEW">First Name</label><span style=\"color:Red\">*</span><br/><input type="hidden" name="hidPersonID" value="0" /><input type="textbox" name="txtFirstName" id="txtFirstNameNEW" />';
		oCellLN.innerHTML = '<label for="txtLastNameNEW">Last Name</label><br/><input type="textbox" name="txtLastName" id="txtLastNameNEW" />';
		oCellNN.innerHTML = '<label for="txtNickNameNEW">Nickname</label><br/><input type="textbox" name="txtNickName" id="txtNickNameNEW" />';
		oCellSex.innerHTML = oTable.rows[1].cells[4].innerHTML;
		oCellDeceased.innerHTML = '<input type="checkbox" name="chkDeceased" value="True" id="chkDeceasedNEW" /><label for="chkDeceasedNEW">Deceased?</label>';
        oCellDeceased.innerHTML += '<br /><input type="checkbox" name="chkDoNotContact" value="True" id="chkDoNotContactNEW" /><label for="chkDoNotContactNEW">Do Not Contact For Future Studies</label>';
		oCellMN.innerHTML = '<label for="txtMiddleNameNEW">Middle Name</label><span style=\"color:Red\">*</span><br/><input type="textbox" name="txtMiddleName" id="txtMiddleNameNEW" />';
		oCellLNBC.innerHTML = '<label for="txtLastNameOnBCNEW">Last Name on Birth Certificate</label><span style=\"color:Red\">*</span><br/><input type="textbox" name="txtLastNameOnBC" id="txtLastNameOnBCNEW" />';
		oCellCB.innerHTML = '<label for="txtCityOfBirthNEW">City of Birth</label><span style=\"color:Red\">*</span><br/><input type="textbox" name="txtCityOfBirth" id="txtCityOfBirthNEW" />';
		oCellSB.innerHTML = '<label for="txtStateOfBirthNEW">StateOfBirth</label><br/><input type="textbox" name="txtStateOfBirth" id="txtStateOfBirthNEW" />';
		oCellDOB.innerHTML = '<label for="txtDOBNEW">DOB</label><span style=\"color:Red\">*</span><br/><input type="textbox" name="txtDOB" id="txtDOBNEW" />';
		oCellRace.innerHTML = oTable.rows[3].cells[1].innerHTML.replace(/selected/, '');
		oCellEthnicity.innerHTML = oTable.rows[3].cells[2].innerHTML.replace(/selected/, '');
		oCellRole.innerHTML = oTable.rows[3].cells[3].innerHTML.replace(/selected/, '');
		oCellAddress.innerHTML = oTable.rows[4].cells[0].innerHTML.replace(/selected/, '');
		oCellMotherID.innerHTML = oTable.rows[4].cells[1].innerHTML.replace(/selected/, '');
		oCellFatherID.innerHTML = oTable.rows[4].cells[2].innerHTML.replace(/selected/, '');
		oCellNotes.innerHTML = oTable.rows[5].cells[0].innerHTML.replace(/selected/, '');

		bNewPerson = true;
	}
	else
	{
		if (document.all)
		{
			oTable.deleteRow(nRowCount-1);
			oTable.deleteRow(nRowCount-2);
			oTable.deleteRow(nRowCount-3);
			oTable.deleteRow(nRowCount - 4);
			oTable.deleteRow(nRowCount - 5);
		}
		else
		{
			document.getElementById('trName').innerHTML = '';
			document.getElementById('trNDAR').innerHTML = '';
			document.getElementById('trDOB').innerHTML = '';
			document.getElementById('trAddress').innerHTML = '';
			document.getElementById('txtPersonNotes').innerHTML = '';
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
	//DF: 4/12 use new GetReferenceToASPNETControl2()
	var oTdAddress = GetReferenceToASPNETControl2('td','tdAddress');
	//var oTdAddress = GetReferenceToASPNETControl('tdAddress');
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
		if (!IsBlank(hidAddressID.value)) {hidAddressID.value += ',0';} else {hidAddressID.value = '0';}
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

/***********************************************************************************************
BEGIN SUBJECTS/ACTIONS/MEASURES/CONSENTS DHTML CODE
***********************************************************************************************/
function DoChangeSearchForm(sSearchType, bIsAdvanced)
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
				DoSyncDropDowns(selStudyID.options[selStudyID.selectedIndex].value, null, 'studyactions', 'selStudyActionID');
				DoSyncDropDowns(selStudyID.options[selStudyID.selectedIndex].value, null, 'studymeasures', 'selStudyMeasureID');
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
				DoSyncDropDowns(selStudyID.options[selStudyID.selectedIndex].value, null, 'studyactions', 'selStudyActionID');
				DoSyncDropDowns(selStudyID.options[selStudyID.selectedIndex].value, null, 'studymeasures', 'selStudyMeasureID');
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

function CheckStatus(bIsAdvanced)
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
			DoSyncDropDowns(oStudyID.options[oStudyID.selectedIndex].value, null, 'studyactions', 'selStudyActionID');
			DoSyncDropDowns(oStudyID.options[oStudyID.selectedIndex].value, null, 'studymeasures', 'selStudyMeasureID');
			DoSyncDropDowns(oMeasStatus.options[oMeasStatus.selectedIndex].value, null, 'measures', 'selMeasureStatusDetailID');
			DoSyncDropDowns(oStudyID.options[oStudyID.selectedIndex].value, null, 'group', 'selGroupID');
		}
		else
		{
			DoSyncDropDowns(oStudyID.options[oStudyID.selectedIndex].value, null, 'studyactions', 'selStudyActionID');
			DoSyncDropDowns(oStudyID.options[oStudyID.selectedIndex].value, null, 'studymeasures', 'selStudyMeasureID');
			DoSyncDropDowns(oStudyID.options[oStudyID.selectedIndex].value, null, 'consentforms', 'selConsentFormID');
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

        //DF: 4/13 use relative path
		PopUpWindow('EditMultipleMeasures.aspx?DoRefresh=true&ActionID=' + nActionID + '&StudyMeasSubjIDs=' + sStudyMeasSubjIDs, 'oWindow', 'toolbars=no,statusbar=no,addressbar=no,width=600,height=400');
		//PopUpWindow('/Measures/EditMultipleMeasures.aspx?DoRefresh=true&ActionID=' + nActionID + '&StudyMeasSubjIDs=' + sStudyMeasSubjIDs, 'oWindow', 'toolbars=no,statusbar=no,addressbar=no,width=600,height=400');
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


		PopUpWindow('EditMultipleActions.aspx?DoRefresh=true&ActionStatus=' + sActionStatus + '&SubjID=' + nSubjectID + '&ActionIDs=' + sActionIDs, 'oWindow', 'toolbars=no,statusbar=no,addressbar=no,width=600,height=400');
		//PopUpWindow('/Measures/EditMultipleActions.aspx?DoRefresh=true&ActionStatus=' + sActionStatus + '&SubjID=' + nSubjectID + '&ActionIDs=' + sActionIDs, 'oWindow', 'toolbars=no,statusbar=no,addressbar=no,width=600,height=400');
	}
	else
		alert('You must select at least one Action to edit.\n');
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

		PopUpWindow('MoveMeasures.aspx?DoRefresh=true&ActionID=' + nActionID + '&StudyMeasSubjIDs=' + sStudyMeasSubjIDs, 'oWindow', 'toolbars=no,statusbar=no,addressbar=no,width=600,height=400');
		//PopUpWindow('/Measures/MoveMeasures.aspx?DoRefresh=true&ActionID=' + nActionID + '&StudyMeasSubjIDs=' + sStudyMeasSubjIDs, 'oWindow', 'toolbars=no,statusbar=no,addressbar=no,width=600,height=400');
	}
	else
		alert('You must select at least one Measure to move.\n');
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

		PopUpWindow('EditMultipleConsents.aspx?DoRefresh=true&ActionID=' + nActionID + '&SubjConsentIDs=' + sSubjConsentIDs, 'oWindow', 'toolbars=no,statusbar=no,addressbar=no,scrollbars=yes,width=600,height=400');
		//PopUpWindow('/Measures/EditMultipleConsents.aspx?DoRefresh=true&ActionID=' + nActionID + '&SubjConsentIDs=' + sSubjConsentIDs, 'oWindow', 'toolbars=no,statusbar=no,addressbar=no,scrollbars=yes,width=600,height=400');
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

		PopUpWindow('MoveConsents.aspx?DoRefresh=true&ActionID=' + nActionID + '&SubjConsentIDs=' + sSubjConsentIDs, 'oWindow', 'toolbars=no,statusbar=no,addressbar=no,width=600,height=400');
		//PopUpWindow('/Measures/MoveConsents.aspx?DoRefresh=true&ActionID=' + nActionID + '&SubjConsentIDs=' + sSubjConsentIDs, 'oWindow', 'toolbars=no,statusbar=no,addressbar=no,width=600,height=400');
	}
	else
		alert('You must select at least one Consent Form to move.\n');
}

function AddConsentForm()
{
	var nSubjID = GetReferenceToASPNETControl('hidSubjID').value;
	var nStudyID = GetReferenceToASPNETControl('hidStudyID').value;

	PopUpWindow('AddConsentForm.aspx?DoRefresh=true&StudyID=' + nStudyID + '&SubjID=' + nSubjID, 'oWindow', 'toolbars=no,statusbar=no,addressbar=no,width=600,height=400');
	//PopUpWindow('/Measures/AddConsentForm.aspx?DoRefresh=true&StudyID=' + nStudyID + '&SubjID=' + nSubjID, 'oWindow', 'toolbars=no,statusbar=no,addressbar=no,width=600,height=400');
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
		PopUpWindow('EditMultipleConsents.aspx?DoRefresh=true&Delete=' + bDoDelete + '&SubjConsentIDs=' + sSubjConsentIDs, 'oWindow', 'toolbars=no,statusbar=no,addressbar=no,scrollbars=yes,width=600,height=400');
		//PopUpWindow('/Measures/EditMultipleConsents.aspx?DoRefresh=true&Delete=' + bDoDelete + '&SubjConsentIDs=' + sSubjConsentIDs, 'oWindow', 'toolbars=no,statusbar=no,addressbar=no,scrollbars=yes,width=600,height=400');
	}
	else
		alert('You must select at least one Consent Form to edit.\n');
}
/***********************************************************************************************
BEGIN WEBCAL DHTML CODE
***********************************************************************************************/
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

		if (!IsBlank(nNumberToAdd))
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
/***********************************************************************************************
BEGIN REPORTS DHTML CODE
***********************************************************************************************/
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
		oImg == null ? '' : oImg.src = BASE_URL + 'images/tree-minus.gif';
	}
	else
	{
		oDiv.style.display = 'none';
		oImg == null ? '' : oImg.src = BASE_URL + 'images/tree-plus.gif';
	}
}

function DoToggleGENSubjFlowForm(nCheckedValue)
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

function NavigateToEditParameters()
{
	var selReportID = GetReferenceToASPNETControl('selReportID');
	var nRptID = selReportID.options[selReportID.selectedIndex].value;

	if (nRptID <= 0)
		alert('You must select an existing report to add parameters.\n');
	else
		document.location = BASE_URL + 'Reports/EditParameters.aspx?ReportID=' + nRptID;
}

function AddParam()
{
	var hidReportID = GetReferenceToASPNETControl('hidReportID');
	var nReportID = hidReportID.value;

	document.location =  BASE_URL + 'Reports/EditParameters.aspx?ReportID=' + nReportID + '&AddParam=True';
}

function AddLink()
{
	var hidReportID = GetReferenceToASPNETControl('hidReportID');
	var nReportID = hidReportID.value;

	document.location =  BASE_URL + 'Reports/EditParameters.aspx?ReportID=' + nReportID + '&AddLink=True';
}

function ReturnToReport()
{
	var hidReportID = GetReferenceToASPNETControl('hidReportID');
	var nReportID = hidReportID.value;

	document.location =  BASE_URL + 'Reports/EditReport.aspx?ReportID=' + nReportID;
}
/***********************************************************************************************
BEGIN STUDY DESIGN DHTML CODE
***********************************************************************************************/
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

function ToggleActionTable(sRowID)
{
	var tblMaster = GetReferenceToASPNETNonFormControl('tblMaster');
	var oRow = GetReferenceToASPNETNonFormControl(sRowID);

	for (var i=0;i<tblMaster.rows.length;i++)
	{
		if (!IsBlank(tblMaster.rows[i].id))
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

function GetNumStudyActionsToAdd()
{
	var nNumToAdd = window.prompt('How many new Study Actions would you like to add?', '');
	var hidNumActionsToAdd = document.getElementById('hidNumActionsToAdd');

	hidNumActionsToAdd.value = nNumToAdd;
}

function AdjustIFrame(sType)
{
	var selStudyID = GetReferenceToASPNETControl('selStudyID');
 	var oIFrame = document.getElementsByTagName('iframe')[0];
	var btnViewGroups = document.getElementById('tdGroups');
	var btnViewActions = document.getElementById('tdAction');
	var btnViewMeasures = document.getElementById('tdMeasures');
	var btnViewConsents = document.getElementById('tdConsents');
	var btnViewAssignments = document.getElementById('tdMeasActAssign');
	var btnViewConsentAssignments = document.getElementById('tdConsentActAssign');
	var btnViewActionGroups = document.getElementById('tdActionGroup');
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
				btnViewActions.className = 'tdHeaderAlt';
				btnViewMeasures.className = 'tdHeaderAlt';
				btnViewConsents.className = 'tdHeaderAlt';
				btnViewAssignments.className = 'tdHeaderAlt';
				btnViewConsentAssignments.className = 'tdHeaderAlt';
				btnViewActionGroups.className = 'tdHeaderAlt';
				oIFrame.style.display = 'inline';

//				if (oIFrame.src != '/StudyDesign/EditGroups.aspx?StudyID=' + nStudyID)
//					oIFrame.src = '/StudyDesign/EditGroups.aspx?StudyID=' + nStudyID;

				if (oIFrame.src != 'EditGroups.aspx?StudyID=' + nStudyID)
					oIFrame.src = 'EditGroups.aspx?StudyID=' + nStudyID;

				break;
			case 'actions':
				btnViewGroups.className = 'tdHeaderAlt';
				btnViewActions.className = 'tdHeader';
				btnViewMeasures.className = 'tdHeaderAlt';
				btnViewConsents.className = 'tdHeaderAlt';
				btnViewAssignments.className = 'tdHeaderAlt';
				btnViewConsentAssignments.className = 'tdHeaderAlt';
				btnViewActionGroups.className = 'tdHeaderAlt';
				oIFrame.style.display = 'inline';

//				if (oIFrame.src != '/StudyDesign/EditStudyActions.aspx?StudyID=' + nStudyID)
//					oIFrame.src = '/StudyDesign/EditStudyActions.aspx?StudyID=' + nStudyID;

				if (oIFrame.src != 'EditStudyActions.aspx?StudyID=' + nStudyID)
					oIFrame.src = 'EditStudyActions.aspx?StudyID=' + nStudyID;

				break;
			case 'measures':
				btnViewGroups.className = 'tdHeaderAlt';
				btnViewActions.className = 'tdHeaderAlt';
				btnViewMeasures.className = 'tdHeader';
				btnViewConsents.className = 'tdHeaderAlt';
				btnViewAssignments.className = 'tdHeaderAlt';
				btnViewConsentAssignments.className = 'tdHeaderAlt';
				btnViewActionGroups.className = 'tdHeaderAlt';
				oIFrame.style.display = 'inline';

//				if (oIFrame.src != '/StudyDesign/EditStudyMeasures.aspx?StudyID=' + nStudyID)
//					oIFrame.src = '/StudyDesign/EditStudyMeasures.aspx?StudyID=' + nStudyID;

				if (oIFrame.src != 'EditStudyMeasures.aspx?StudyID=' + nStudyID)
					oIFrame.src = 'EditStudyMeasures.aspx?StudyID=' + nStudyID;
					
				break;
			case 'consents':
				btnViewGroups.className = 'tdHeaderAlt';
				btnViewActions.className = 'tdHeaderAlt';
				btnViewMeasures.className = 'tdHeaderAlt';
				btnViewConsents.className = 'tdHeader';
				btnViewAssignments.className = 'tdHeaderAlt';
				btnViewConsentAssignments.className = 'tdHeaderAlt';
				btnViewActionGroups.className = 'tdHeaderAlt';
				oIFrame.style.display = 'inline';

//				if (oIFrame.src != '/StudyDesign/EditConsents.aspx?StudyID=' + nStudyID)
//					oIFrame.src = '/StudyDesign/EditConsents.aspx?StudyID=' + nStudyID;

				if (oIFrame.src != 'EditConsents.aspx?StudyID=' + nStudyID)
					oIFrame.src = 'EditConsents.aspx?StudyID=' + nStudyID;
					
				break;
			case 'assignments':
				btnViewGroups.className = 'tdHeaderAlt';
				btnViewActions.className = 'tdHeaderAlt';
				btnViewMeasures.className = 'tdHeaderAlt';
				btnViewConsents.className = 'tdHeaderAlt';
				btnViewAssignments.className = 'tdHeader';
				btnViewConsentAssignments.className = 'tdHeaderAlt';
				btnViewActionGroups.className = 'tdHeaderAlt';
				oIFrame.style.display = 'inline';

//				if (oIFrame.src != '/StudyDesign/EditMeasureActionAssignments.aspx?StudyID=' + nStudyID)
//					oIFrame.src = '/StudyDesign/EditMeasureActionAssignments.aspx?StudyID=' + nStudyID;

				if (oIFrame.src != 'EditMeasureActionAssignments.aspx?StudyID=' + nStudyID)
					oIFrame.src = 'EditMeasureActionAssignments.aspx?StudyID=' + nStudyID;
					
				break;
			case 'consentassignments':
				btnViewGroups.className = 'tdHeaderAlt';
				btnViewActions.className = 'tdHeaderAlt';
				btnViewMeasures.className = 'tdHeaderAlt';
				btnViewConsents.className = 'tdHeaderAlt';
				btnViewAssignments.className = 'tdHeaderAlt';
				btnViewConsentAssignments.className = 'tdHeader';
				btnViewActionGroups.className = 'tdHeaderAlt';
				oIFrame.style.display = 'inline';

//				if (oIFrame.src != '/StudyDesign/EditConsentAssignments.aspx?StudyID=' + nStudyID)
//					oIFrame.src = '/StudyDesign/EditConsentAssignments.aspx?StudyID=' + nStudyID;

				if (oIFrame.src != 'EditConsentAssignments.aspx?StudyID=' + nStudyID)
					oIFrame.src = 'EditConsentAssignments.aspx?StudyID=' + nStudyID;
					
				break;
			case 'actiongroups':
				btnViewGroups.className = 'tdHeaderAlt';
				btnViewActions.className = 'tdHeaderAlt';
				btnViewMeasures.className = 'tdHeaderAlt';
				btnViewConsents.className = 'tdHeaderAlt';
				btnViewAssignments.className = 'tdHeaderAlt';
				btnViewConsentAssignments.className = 'tdHeaderAlt';
				btnViewActionGroups.className = 'tdHeader';
				oIFrame.style.display = 'inline';


				if (oIFrame.src != 'EditActionGroups.aspx?StudyID=' + nStudyID)
					oIFrame.src = 'EditActionGroups.aspx?StudyID=' + nStudyID;
					
				break;
			default:
				btnViewGroups.className = 'tdHeaderAlt';
				btnViewActions.className = 'tdHeaderAlt';
				btnViewMeasures.className = 'tdHeaderAlt';
				btnViewConsents.className = 'tdHeaderAlt';
				btnViewAssignments.className = 'tdHeaderAlt';
				btnViewConsentAssignments.className = 'tdHeaderAlt';
				btnViewActionGroups.className = 'tdHeaderAlt';

				oIFrame.style.display = 'none';
				break;

		}
	}
}
/***********************************************************************************************
BEGIN DATA SUMMARY DHTML CODE
***********************************************************************************************/
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

function AddVariables()
{
	var hidNumVarsToAdd = GetReferenceToASPNETControl('hidNumVarsToAdd');
	var nNumVarsToAdd = window.prompt('How many Variables would you like to add?\n', '');

	hidNumVarsToAdd.value = nNumVarsToAdd;
}

function AddRenameField()
{
	var nNumberToAdd = prompt('How many Rename Fields would you like to add?\n', '');

	if (isNaN(nNumberToAdd) || IsBlank(nNumberToAdd))
	{
		alert('You must enter a numeric value.\n');
		nNumberToAdd = 0;
	}

	GetReferenceToASPNETControl('hidFieldsToAdd').value = nNumberToAdd;
}

/************************************************************************
FUNCTIONS: StartTimer, StopTimer, TimerExpires (timer script)
*************************************************************************/
/************************************************************************/
var oTimerID = null;
var bTimerIsOn = false;
var nSessionTimeout = 5;
var dtStartTime = new Date();
var nMSExp = dtStartTime.getTime() + 1000 * nSessionTimeout;

function StopTimer()
{
	if (bTimerIsOn)
	{
		clearTimeout(oTimerID);
		bTimerIsOn = false;
	}
}

function StartTimer()
{
	StopTimer();
	TimerExpires();
}

function TimerExpires()
{
	var dtNow = new Date();
	var nMSNow = dtNow.getTime();
	var nMSLeft = nMSExp - nMSNow;
	var nMinutesLeft = Math.floor(nMSLeft/60000);
	var nSecondsLeft = Math.floor(nMSLeft/1000) - (nMinutesLeft * 60);
	var sTimeLeft = nMinutesLeft + " minute";

	if (nMSLeft <= 0)
	{
		bTimerIsOn = false;

		var hidLocation = window.opener.document.getElementById('hidLocation');
		var divMain = window.opener.document.getElementById('divMain');
		hidLocation.value = document.location;
		divMain.style.display = 'inline';

		window.close();

		return;
   }

	if (nMinutesLeft == 2 && nSecondsLeft == 0)
	{}
//		PopUpWindow('/login/PersistSession.aspx', 'wdwPersistSession', 'toolbars=no,status=no,height=150,width=400');

	if (nMinutesLeft != 1) {sTimeLeft += "s ";} else {sTimeLeft += " ";}

	sTimeLeft += PadNumberWithZeroes(nSecondsLeft, 2) + " second";

	if (nSecondsLeft != 1) {sTimeLeft += "s";}

	window.status = "Your session will expire in " + sTimeLeft;
	oTimerID = setTimeout("TimerExpires()", 1000);
	bTimerIsOn = true;
}
function ResetTimer()
{
	StopTimer();
	dtStartTime = new Date();
	nMSExp = dtStartTime.getTime() + 1000 * nSessionTimeout;
	TimerExpires();
}
/************************************************************************/