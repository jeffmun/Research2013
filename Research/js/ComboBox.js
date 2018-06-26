function ComboBox(sTextBoxID, sDropDownListID, sButtonID)
{
	var oTextBox = document.getElementById(sTextBoxID);
	var oDropDownList = document.getElementById(sDropDownListID);
	var oButton = document.getElementById(sButtonID);
	var oContainer = oTextBox.parentElement;
	var oOption = document.createElement('option');
	var oTable = null;

	oDropDownList.style.left = oTextBox.style.width;

	oOption.setAttribute('value', '-1', 0);

	this.TextBox = oTextBox;
	this.TextBox.style.zIndex = 0;
	this.TextBox.style.width = '200px';
	this.TextBox.style.height = '17px';
	this.TextBox.ComboBox = this;
	this.TextBox.TypeEnter = ComboBox_TextBox_TypeEnter;
	this.TextBox.onkeyup = ComboBox_ChangeText;

	this.Container = this.TextBox.parentElement;
	this.Container.style.position = 'relative';

	this.Button = oButton;
	this.Button.ExpandMenu = ComboBox_ExpandMenu;
	this.Button.onclick = this.Button.ExpandMenu;
	this.Button.style.width = '17px';
	this.Button.ComboBox = this;

	this.DropDownList = oDropDownList;
	this.DropDownList.Select = ComboBox_SelectItem;
	this.DropDownList.onclick = this.DropDownList.Select;
	this.DropDownList.ComboBox = this;
	this.DropDownList.style.position = 'absolute';
	this.DropDownList.style.left = '0px';(0 - (parseInt(this.TextBox.style.width) + parseInt(this.Button.style.width))) + 'px';
	this.DropDownList.style.top = (parseInt(this.TextBox.style.height) + 7) + 'px';
	this.DropDownList.style.width = (parseInt(this.TextBox.style.width) + parseInt(this.Button.style.width) + 7) + 'px';
	this.DropDownList.style.zIndex = -1;
	this.DropDownList.IsVisible = false;
	this.DropDownList.insertBefore(oOption, this.DropDownList.options[0]);
	this.DropDownList.TypeDown = ComboBox_DropDownList_TypeEnter;
	this.DropDownList.onkeyup = function(e) {this.TypeDown(e);}

	if (this.DropDownList.options.length > 20)
		this.DropDownList.size = 20;
	else
		this.DropDownList.size = this.DropDownList.options.length;

	return this;
}

function Init_ComboBox(sTextBoxID, sDropDownListID, sButtonID)
{
	var oComboBox = new ComboBox(sTextBoxID, sDropDownListID, sButtonID);

}

function ComboBox_ChangeText(e)
{
	var oEvent = (e || window.event);
	var oDropDownList = this.ComboBox.DropDownList;
	var oTextBox = this.ComboBox.TextBox;
	var nKeyCode = oEvent.keyCode;
	var nCursorPosition = oTextBox.value.length;
	var aCtrlKeys = Array(8, 46, 37, 39, 33, 34, 35, 36, 45, 16, 20);

	if (!isBlank(oTextBox.value))
	{
		for (var i=0;i<aCtrlKeys.length;i++)
		{
			if (oEvent.keyCode == aCtrlKeys[i])
				return;
		}

		if (oEvent.keyCode == 38 || oEvent.keyCode == 40)
		{
			this.ComboBox.Button.ExpandMenu();
			return;
		}

		for (var i=0;i<oDropDownList.options.length;i++)
		{
			if (StartsWith(oDropDownList.options[i].text, oTextBox.value, nKeyCode))
			{
				oDropDownList.selectedIndex = i;
				oDropDownList.Select();
				return;
			}
		}

		oDropDownList.selectedIndex = 0;
	}
}

function ComboBox_SelectItem(e)
{
	if (this.options.length > 0)
	{
		if (this.options[this.options.selectedIndex].value != -1)
		{
			var oTextBox = this.ComboBox.TextBox;
			var sOldValue = oTextBox.value;
			var sNewValue = this.options[this.selectedIndex].text;
			var oTextRange = oTextBox.createTextRange();

			this.style.display = 'none';
			this.IsVisible = false;

			oTextBox.value = sNewValue;

			if (typeof(oTextRange) != 'undefined')
			{
				if (sNewValue != sOldValue)
				{
					oTextRange.moveStart('character', sOldValue.length);
					oTextRange.select();
				}
			}

				oTextBox.focus();
				return;
		}
	}
}

function ComboBox_ExpandMenu(e)
{
	var oEvent = (e || window.event);
	var oButton = this;
	var oComboBox = this.ComboBox;

	if (oComboBox.DropDownList.IsVisible)
	{
		oComboBox.DropDownList.style.display = 'none';
		oComboBox.DropDownList.IsVisible = false;
		oComboBox.TextBox.focus();
	}
	else
	{
		oComboBox.DropDownList.style.display = '';
		oComboBox.DropDownList.IsVisible = true;
		oComboBox.DropDownList.focus();
	}
}

function ComboBox_TextBox_TypeDown(e)
{
	var oEvent = (e || window.event);

	if (oEvent.keyCode == 38 || oEvent.keyCode == 40)
	{
		this.ComboBox.Button.ExpandMenu();
		this.ComboBox.DropDownList.focus();
	}
}

function ComboBox_DropDownList_TypeEnter(e)
{
	var oEvent = (e || window.event);

	if (oEvent.keyCode == 13 || oEvent.keyCode == 32)
	{
		this.Select();
		return;
	}
}

function ComboBox_TextBox_TypeEnter(e)
{
	var oEvent = (e || window.event);

	document.forms[0].submit();
}

function StartsWith(sSearched, sSought, nKeyCode)
{
	if (sSought.length <= 0)
		return false;
	else if (sSought.length == 1 && sSearched.charCodeAt(0) == nKeyCode)
		return true;
	else if (sSearched.length < sSought.length)
		return false;
	else
	{
		if (sSearched.indexOf(sSought, 0) == 0)
			return true;
	}
}

function ChangeStyle(oRow, bIsMouseOver)
{
	var oCells = oRow.childNodes;

	for (var i=0;i<oCells.length;i++)
	{
		if (bIsMouseOver)
		{
			oCells[i].style.backgroundColor = '#0000bb';
			oCells[i].style.color = '#ffffff';
		}
		else
		{
			oCells[i].style.backgroundColor = '#ffffff';
			oCells[i].style.color = '#000000';
		}
	}
}