
/* Development 
var BASE_URL = 'http://localhost:2814/AutismCenterIntranetASP2.0/';
var AJAX_URL = 'http://localhost:2814/AutismCenterIntranetASP2.0/ClientData/Response.aspx?';
*/

/* Production */
var BASE_URL = 'https://uwac.autism.washington.edu/research/';
var AJAX_URL = 'https://uwac.autism.washington.edu/research/ClientData/Response.aspx?';

function IsBlank(str)
{
	if (str != null)
	{
		for (i=0;i<str.length;i++)
		{
			if (str.charCodeAt(i) >= 33)
				return false;
		}
	}

	return true;
}

//hack:  DF 5/10/07 some functions reference isBlank vs IsBlank
function isBlank(str)
{
	if (str != null)
	{
		for (i=0;i<str.length;i++)
		{
			if (str.charCodeAt(i) >= 33)
				return false;
		}
	}

	return true;
}
function ReturnDate(){
	var dt = new Date();
	var arrDays = new Array(8);
	var arrMonths = new Array(13);
	var strDate = '';

	arrDays[0] = "Sun";
	arrDays[1] = "Mon";
	arrDays[2] = "Tue";
	arrDays[3] = "Wed";
	arrDays[4] = "Thu";
	arrDays[5] = "Fri";
	arrDays[6] = "Sat";

	arrMonths[0] = "Jan.";
	arrMonths[1] = "Feb.";
	arrMonths[2] = "Mar.";
	arrMonths[3] = "Apr.";
	arrMonths[4] = "May";
	arrMonths[5] = "Jun.";
	arrMonths[6] = "Jul.";
	arrMonths[7] = "Aug.";
	arrMonths[8] = "Sep.";
	arrMonths[9] = "Oct.";
	arrMonths[10] = "Nov.";
	arrMonths[11] = "Dec.";

	strDate = arrDays[dt.getDay()] + ', ' + arrMonths[dt.getMonth()] + ' ' + dt.getDate() + ', ' + dt.getFullYear();

	return strDate;
}
function HasInvalidChars(sSearchedString, sInvalidChars)
{
	var bReturn = false;

	for (i=0;i<sSearchedString.length;i++)
	{
		if (sInvalidChars.indexOf(sSearchedString.charAt(i)) != -1)
		{
			bReturn = true;
			break;
		}
	}

	return bReturn;
}

function IsValidDate(str)
{
	var sRegExp = "(0[1-9]|1[012])/(0[1-9]|[12][0-9]|3[01])/(19|20)[0-9][0-9]";
	var oRegExp = new RegExp(sRegExp);

	if (!oRegExp.test(str))
		return false;
	else
		return true;
}

function PadNumberWithZeroes(sNumber, nPlaces)
{
	var sReturnValue = null;
	var nLength = sNumber.toString().length;
	var i = 0;

	sReturnValue = sNumber.toString();

	if (nPlaces <= sNumber.length)
		sReturnValue = sReturnValue;
	else
	{
		for (i=0;i<(nPlaces - nLength);i++)
			sReturnValue = '0' + sReturnValue;
	}

	return sReturnValue;
}

function BrowserVersion()
{
	return navigator.userAgent;
}

function DebugPrint(str, sElementID)
{
	var oElement = document.getElementById(sElementID);
	oElement.innerHTML += str + '<br/>';
}

function StartsWith(sSearched, sSought)
{
	if (sSought.length <= 0)
		return false;
	else if (sSearched.length < sSought.length)
		return false;
	else
	{
		if (sSearched.indexOf(sSought, 0) == 0)
			return true;
		else
			return false;
	}
}

function EndsWith(sSearched, sSought)
{
	if (sSought.length <= 0)
		return false;
	else if (sSearched.length < sSought.length)
		return false;
	else
	{
		if (sSearched.lastIndexOf(sSought, (sSearched.length - sSought.length)) != -1)
			return true;
		else
			return false;
	}
}

function ReplaceAll(sSearched, sReplaced, sReplacedWith)
{
	var sReturn = '';

	for (var i=0;i<sSearched.length;i++)
	{
		if (sSearched.substring(i, i+sReplaced.length) == sReplaced)
			sReturn += sReplacedWith;
		else
			sReturn += sSearched.substring(i, i+1);
	}

	return sReturn;
}