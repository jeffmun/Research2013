var oXMLHttp = null;
var oDetail = null;
var sEntityName = null;
var bIsBooleanResponse = false;
var aKeyValueResponse = null;

function SendAJAXRequest(sCommand, aParams)
{
    var sURL = AJAX_URL + 'Command=' + sCommand + '&';

    for (var i=0;i<aParams.length;i++)
        sURL += aParams[i][0] + '=' + aParams[i][1] + '&';

    if (sURL.charAt(sURL.length-1) == '&')
        sURL = sURL.substring(0, sURL.length-1);

	if (document.all)
	{
		oXMLHttp = new ActiveXObject("Microsoft.XMLHTTP");
		oXMLHttp.onreadystatechange = HandlerOnReadyStateChange;
		oXMLHttp.open('GET', sURL, false);
		oXMLHttp.send();
	}
	else
	{
		oXMLHttp = new XMLHttpRequest(); 
		oXMLHttp.open('GET', sURL, false);
		oXMLHttp.send(null);
		HandlerOnReadyStateChange();
	}
}
function HandlerOnReadyStateChange()
{
	if (oXMLHttp.readyState == 4)
	{
		var oNodes = null;
		var oNode = null;
		var oOption = null;

	    aKeyValueResponse = new Array();

	    oNodes = oXMLHttp.responseXML.getElementsByTagName(sEntityName);

		try
		{
			if (!bIsBooleanResponse)
			{
				for (var i=0;i<oNodes.length;i++)
				{
					aKeyValueResponse[i] = new Array(2);

					oNode = oNodes.item(i);
					aKeyValueResponse[i][0] = oNode.childNodes.item(0).firstChild.data;
					aKeyValueResponse[i][1] = oNode.childNodes.item(1).firstChild.data;
				}
			}
			else
			{
				aKeyValueResponse[0] = new Array(2);

				oNode = oNodes.item(i);
				aKeyValueResponse[0][0] = oNode.tagName;
				aKeyValueResponse[0][1] = oNode.childNodes.item(0).data;
			}
        }
        catch(e)
        {
        }
	}
}

function CheckOutStorageUnit(nStorageUnitID, nStaffID, nCheckInOrOut)
{
	if (document.all)
	{
		oXMLHttp = new ActiveXObject("Microsoft.XMLHTTP"); 
		oXMLHttp.onreadystatechange = OnReadyStateChange_CheckOutStorageUnit;
		//oXMLHttp.open('POST', '/ClientData/Response.aspx?Command=CheckOutStorageUnit&StorageUnitID=' + nStorageUnitID + '&StaffID=' + nStaffID + '&CheckInCheckOut=' + nCheckInOrOut, false);
		oXMLHttp.open('POST', AJAX_URL + 'Command=CheckOutStorageUnit&StorageUnitID=' + nStorageUnitID + '&StaffID=' + nStaffID + '&CheckInCheckOut=' + nCheckInOrOut, false);
		oXMLHttp.send();
	}
	else
	{
		oXMLHttp = new XMLHttpRequest(); 
		//oXMLHttp.open('POST', '/ClientData/Response.aspx?Command=CheckOutStorageUnit&StorageUnitID=' + nStorageUnitID + '&StaffID=' + nStaffID + '&CheckInCheckOut=' + nCheckInOrOut, false);
		oXMLHttp.open('POST', AJAX_URL + 'Command=CheckOutStorageUnit&StorageUnitID=' + nStorageUnitID + '&StaffID=' + nStaffID + '&CheckInCheckOut=' + nCheckInOrOut, false);
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
		//oXMLHttp.open('GET', '/ClientData/Response.aspx?Command=GetDataTableInfo&TableID=' + selTableID.options[selTableID.selectedIndex].value, false);
		oXMLHttp.open('GET', AJAX_URL + 'Command=GetDataTableInfo&TableID=' + selTableID.options[selTableID.selectedIndex].value, false);
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

function SyncEditSpecialFieldsForm()
{
	var selFieldID = GetReferenceToASPNETControl('selFieldID');
	var tdDelete = GetReferenceToASPNETNonFormControl('tdDelete', 'td');
	var chkDelete = GetReferenceToASPNETControl('chkDelete');

	if (selFieldID.options[selFieldID.selectedIndex].value > 0)
	{
		tdDelete.style.display = 'inline';

		if (document.all)
			oXMLHttp = new ActiveXObject("Microsoft.XMLHTTP"); 
		else
			oXMLHttp = new XMLHttpRequest(); 

		oXMLHttp.onreadystatechange = SyncEditSpecialFieldsFormHandlerOnReadyStateChange;
		oXMLHttp.open('GET', AJAX_URL + 'Command=GetSpecialFieldInfo&FieldID=' + selFieldID.options[selFieldID.selectedIndex].value, false);
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

function DoSyncDropDowns(nSelectedID, nSelectedDetailID, sType, sDetailListID)
{
	var oOption = null;
	var nLength = null;
	var sCommand = null;
	var aParams = null;
	var oSrcElement = null;
	var bPopulateDropDown = true;
	var nSelectCount = 0;
	var bDoRequest = true;

	switch(sType)
	{
		case 'studystatus':
			sCommand = 'GetStudyStatusDetailsByStudyStatusID';
			aParams = new Array(1);
			aParams[0] = new Array(2);
			aParams[0][0] = 'StudyStatusID';
			aParams[0][1] = nSelectedID;
			sEntityName = 'StudyStatusDetail';
			break;
		case 'measurestatus':
			sCommand = 'GetMeasStatusDetailsByMeasStatusID';
			aParams = new Array(1);
			aParams[0] = new Array(2);
			aParams[0][0] = 'MeasStatusID';
			aParams[0][1] = nSelectedID;
			sEntityName = 'MeasStatusDetail';
			break;
		case 'subjects':
			sCommand = 'GetSubjectsByStudyID';
			aParams = new Array(1);
			aParams[0] = new Array(2);
			aParams[0][0] = 'StudyID';
			aParams[0][1] = nSelectedID;
			sEntityName = 'Subject';
			break;
		case 'subjectstatus':
			sCommand = 'GetSubjStatusDetailsBySubjStatusID';
			aParams = new Array(1);
			aParams[0] = new Array(2);
			aParams[0][0] = 'SubjStatusID';
			aParams[0][1] = nSelectedID;
			sEntityName = 'SubjStatusDetail';
			break;
		case 'studyactions':
			sCommand = 'GetStudyActionsByStudyID';
			aParams = new Array(1);
			aParams[0] = new Array(2);
			aParams[0][0] = 'StudyID';
			aParams[0][1] = nSelectedID;
			sEntityName = 'StudyAction';
			break;
		case 'studymeasures':
			sCommand = 'GetStudyMeasuresByStudyID';
			aParams = new Array(1);
			aParams[0] = new Array(2);
			aParams[0][0] = 'StudyID';
			aParams[0][1] = nSelectedID;
			sEntityName = 'StudyMeasure';
			break;
		case 'group':
			sCommand = 'GetGroupsByStudyID';
			aParams = new Array(1);
			aParams[0] = new Array(2);
			aParams[0][0] = 'StudyID';
			aParams[0][1] = nSelectedID;
			sEntityName = 'Group';
			break;
		case 'subjects':
			sCommand = 'GetSubjectsByStudyID';
			aParams = new Array(1);
			aParams[0] = new Array(2);
			aParams[0][0] = 'StudyID';
			aParams[0][1] = nSelectedID;
			sEntityName = 'Subject';
			break;
		case 'consentforms':
			sCommand = 'GetConsentFormsByStudyID';
			aParams = new Array(1);
			aParams[0] = new Array(2);
			aParams[0][0] = 'StudyID';
			aParams[0][1] = nSelectedID;
			sEntityName = 'ConsentForm';
			break;
		case 'consentformsnoversions':
			sCommand = 'GetConsentFormsByStudyID&IncludeVersions=False';
			aParams = new Array(1);
			aParams[0] = new Array(2);
			aParams[0][0] = 'StudyID';
			aParams[0][1] = nSelectedID;
			sEntityName = 'ConsentForm';
			break;
		case 'datatablesbystatus':
			if (document.getElementById('hidSortOrder') != null)
				sCommand = 'GetDataTablesByStatus&SetNameAsID=True&SortOrder=' + GetReferenceToASPNETControl('hidSortOrder').value;
			else
				sCommand = 'GetDataTablesByStatus';

			aParams = new Array(1);
			aParams[0] = new Array(2);
			aParams[0][0] = 'StatusID';
			aParams[0][1] = nSelectedID;
			sEntityName = 'DataTable';
			break;
		default:
			return;
			break;
	}

	if (sDetailListID != '' && sDetailListID != null)
	    
	    //DF: 4/12 use new GetReferenceToASPNETControl2
		oDetail = GetReferenceToASPNETControl2('select', sDetailListID);
	else
		oDetail = document.forms[0].selStatusDetail;

	nLength = oDetail.options.length;

	for (var i=0;i<nLength;i++)
		oDetail.remove(0);

	if (oDetail.type == 'select-one')
	{
		if (document.all)
		{
			oOption = document.createElement('option');
			oOption.setAttribute("value", "-1", 0);
			oOption.innerText = "--Select Item--";
			oDetail.appendChild(oOption);
		}
		else
		{
			oOption = document.createElement('option');
			oOption.text = '--Select Item--';
			oOption.value = '-1';
			oDetail.appendChild(oOption);
		}
	}

    if (bDoRequest)
    {
        SendAJAXRequest(sCommand, aParams);

        for (var i=0;i<aKeyValueResponse.length;i++)
            AddOptionToDropDown(oDetail, aKeyValueResponse[i][1], aKeyValueResponse[i][0]);

        if (oDetail.options.length <= 1 && oDetail.type == 'select-one')
            oDetail.disabled = true;
        else
            oDetail.disabled = false;
    }
}