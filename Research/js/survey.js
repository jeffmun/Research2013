function newWindow(strURL){
	var objNewWindow = window.open(strURL,'','toolbar=no,status=no,scrollbars=yes,menubar=no,resizable=yes,directories=no,location=no,width=300,height=400');

	if (document.images){
		 if (objNewWindow) objNewWindow.focus()
	}
}

function doSubmitGeneral(){
/***************************************************************
This function will check to make sure that all of the questions
on the survey page are answered and that, for checkbox elements,
the maximum number of responses is not exceeded.
***************************************************************/
	var boolIsErr = false;				//Flag for error.
	var strErr = '';					//Custom error message.
	var objForm = document.forms[0];	//Form object.
	var strElementName = '';			//The name of the current element.
	var strToEval = '';					//Storage for a string to be evaluated.
	var intCheckboxCount = 0;			//Number of checkboxes checked.
	var intCheckboxMax = 0;				//Max number of checkboxes that can be checked.
	var arrChecked = new Array();		//Array to hold checked statuses for each radio/checkbox.
	var boolDoCheckbox =  false;		//Flag to tell whether a checkbox or radio button exists on the page.
	var j = -1;

	//Since the form elements are produced dynamically, we don't know
	//the names, number, and types of elements that will be displayed.
	//Thus, we have to loop over all of the elements on the form and
	//perform different checks for each type of element.
	for (i=0;i<objForm.elements.length;i++){
		//If we are on a new group of form elements, we need to reset
		//the name of the form element as well as the string to be evaluated
		//and the checkbox counter.
		if (strElementName != objForm.elements[i].name){
			strElementName = objForm.elements[i].name;
			intCheckboxCount = 0;
			strToEval = '';
			
			//If the current element is a radio button or checkbox, add an item to the
			//array that keeps track of whether or not at least one answer for the
			//question has been checked, and set it to false. Also, increment the index.
			if (objForm.elements[i].type == 'checkbox' || objForm.elements[i].type == 'radio'){
				boolDoCheckbox = true;
				j = j+1;
				arrChecked[j] = false;
			}
		}

		//If the current form element is a single-select box, make sure that the
		//selected value is not equal to -1.
		if (objForm.elements[i].type == 'select-one'){
			if (objForm.elements[i].options[objForm.elements[i].selectedIndex].value == -1){
				boolIsErr = true;
				break;
			}
		//If the current form element is a multi-select box, make sure that the
		//selected value is not equal to -1 and that at least one option is
		//selected.
		}else if (objForm.elements[i].type == 'select-multiple'){
			if (objForm.elements[i].options[objForm.elements[i].selectedIndex].value == -1 || isBlank(objForm.elements[i].options[objForm.elements[i].selectedIndex].value)){
				boolIsErr = true;
				break;
			}
		//If the current form element is a radio button or checkbox...
		}else if (objForm.elements[i].type == 'radio' || objForm.elements[i].type == 'checkbox'){
			//If the current checkbox/radio button group does not have a checked item,
			//check to see if the current box/button is checked. If it is, change the
			//flag for this group of boxes/buttons.
			if (!arrChecked[j]){
				if (objForm.elements[i].checked == true){
					arrChecked[j] = true;
				}
			}
		}
		
		//If the current element is a checkbox, get the value of the corresponding
		//hidden field that indicates the maximum number of items that can be
		//checked. This DOM reference to this hidden field is stored as a string
		//variable and then evaluated using the 'eval' function to store the value
		//in a variable.
		if (objForm.elements[i].type == 'checkbox'){
			strToEval = 'objForm.hid' + objForm.elements[i].name.slice(3) + '.value';
			intCheckboxMax = eval(strToEval);
			
			//The the max number of allowed items to be checked is less than or equal
			//to zero, there is no limit. No more processing needs to occur. If the
			//number is greater than zero...
			if (intCheckboxMax > 0){
				//If the current checkbox is checked, add one to the counter.
				if (objForm.elements[i].checked){
					intCheckboxCount = intCheckboxCount + 1;
				}

				//If the checkbox is-checked count is greater than the max allowed, raise
				//a specific error.
				if (intCheckboxCount > intCheckboxMax){
					boolIsErr = true;
					strErr += 'There are too many answers selected for one of the questions on this page.';
					break;
				}
			}
		}
	}

	//Loop over the checkbox/radio button array to make sure that each of the
	//items in the array is true. If any are false, this indicates that one of
	//the questions on the page (groups of boxes/buttons) was not answered, so
	//we raise an error.
	if (boolDoCheckbox){
		for (i=0;i<arrChecked.length;i++){
			if (!arrChecked[i]){
				boolIsErr = true;
				break;
			}
		}
	}

	//If the error flag is set to true, check to see if there is a specific
	//error message to display. If there is, display that message; otherwise
	//display a generic message.
	if (boolIsErr){
		if (isBlank(strErr)){
			alert('You must answer all questions on this page.\n');
		}else{
			alert(strErr);
		}
		return false;
	}else{
		return true;
	}
}