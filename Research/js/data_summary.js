function DoSubmitCreateSPSSFiles()
{
	var selDataTables = GetReferenceToASPNETControl('selDataTables');
	var sErr = '';

	if (!HasAnItemSelected(selDataTables))
		sErr += 'You must select at least one Data Table from the list.';

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}

function DoSubmitCreateSPSSDataFiles()
{
    var e = (e || window.event);

    if (e != null && e != 'undefined')
    {
		var bDoCheck = new Boolean(GetReferenceToASPNETControl('hidDoSubmit').value.toLowerCase());
		var sErr = '';

		if (bDoCheck)
		{
			if (!HasAnItemChecked('chkInclude'))
				sErr += 'You must select at least one Study Measure.';

			if (!isBlank(sErr))
			{
				alert(sErr);
				return false;
			}
			else
			{
				alert('You will be prompted to save the SPSS Match File Syntax to your computer.\nWhen you save it, make sure you select "All Files" and change the file extension to "*.sps".\n');
				return true;
			}
		}
		else
			return true;
	}
	else
		return true;
}