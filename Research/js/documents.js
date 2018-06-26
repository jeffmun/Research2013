function doSubmitBS()
{
	var txtDocTitle = document.getElementById('txtDocTitle');
	var oBSFile = document.getElementById('oBSFile');
	var sErr = '';

	if (isBlank(txtDocTitle.value))
		sErr += '    -Document Title\n';

	if (isBlank(oBSFile.value))
		sErr += '    -File Location\n';

	if (!isBlank(sErr))
	{
		alert('You are missing:\n\n' + sErr);
		return false;
	}
	else
		return true;
}

function doSubmitDocument(e)
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

		if (isBlank(txtDocTitle.value))
			sErr += 'You must enter a document title.\n';

		if (isBlank(oDocument.value))
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
					if (isBlank(selEntityValue.value))
						sErr += 'If you choose to relate this document to a  ' + sEntityType + ', you must select a ' + sEntityType + '.';
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
	else
		return true;
}