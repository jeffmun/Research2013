function doSubmitOnlineAccess()
{
	var oForm = document.forms[0];
	var sErr = '';

	if (isBlank(oForm.txtRequestor.value))
		sErr += 'You must enter your Name.\n';

	if (isBlank(oForm.txtEmailAddress.value))
		sErr += 'You must enter your Email Address.\n';

	if (isBlank(oForm.txtPhoneNumber.value))
		sErr += 'You must enter your Phone Number.\n';

	if (isBlank(oForm.txtAccessFor.value))
		sErr += 'You must enter who this access is for.\n';

	if (isBlank(oForm.txtDateRequired.value))
		sErr += 'You must enter a Date Required in the format: mm/dd/yyyy.\n';
	else if (!isValidDate(oForm.txtDateRequired.value))
		sErr += 'You must enter a Date Required in the format: mm/dd/yyyy.\n';

	if (isBlank(oForm.txtSupervisor.value))
		sErr += 'You must enter their supervisor.\n';

	if (isBlank(oForm.txtTypeOfAccess.value))
		sErr += 'You must enter the type of access.\n';

	if (!isBlank(sErr))
	{
		alert(sErr);
		return false;
	}
	else
		return true;
}