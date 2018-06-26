var strCurrentHREF = '';

function doToggleTree(strDivID, strImgID, strOpenHREF){
	var aDivs = document.getElementsByTagName('div');

	if (!isBlank(strDivID))
	{
		var oDiv = document.getElementById(strDivID);
		var oImg = document.getElementById(strImgID);

		for (i=0;i<aDivs.length;i++){
			if (aDivs[i].id == strDivID){
				if (aDivs[i].style.display == 'none')
					aDivs[i].style.display = '';
				else
					aDivs[i].style.display = 'none';
			}
		}

		if (oDiv.style.display == 'none')
			oImg.src = '/images/tree-plus.gif';
		else
			oImg.src = '/images/tree-minus.gif';
	}

	if (!isBlank(strOpenHREF)){
		if (strCurrentHREF != strOpenHREF){
			parent.frames['fraMain'].location = strOpenHREF;
			strCurrentHREF = strOpenHREF;
		}
	}else{
		strCurrentHREF = '';
	}
}

function doSync(){
	var arrDivs = document.getElementsByTagName('div');
	var arrImgs = document.getElementsByTagName('img');
	var intSurveyID = 0;
	var intPage = 0;
	var intQuestionID = 0;

	if (parent.frames['fraMain'].document.forms[0] != null){
		if (parent.frames['fraMain'].document.forms[0].hidSurveyID != null)
			intSurveyID = parent.frames['fraMain'].document.forms[0].hidSurveyID.value;

		if (parent.frames['fraMain'].document.forms[0].hidPage != null)
			intPage = parent.frames['fraMain'].document.forms[0].hidPage.value;

		if (parent.frames['fraMain'].document.forms[0].hidQuestionID != null)
			intQuestionID = parent.frames['fraMain'].document.forms[0].hidQuestionID.value;
	}

	for (i=0;i<arrDivs.length;i++){
		if (arrDivs[i].id != '' && arrDivs[i].id != 'divMain' && arrDivs[i].id != 'divSync' && arrDivs[i].id != 'divHome' && arrDivs[i].id != 'divSurvey' && arrDivs[i].id != 'divHelp'){
			if (arrDivs[i].id != 'divPage' + intSurveyID){
				if (arrDivs[i].id != 'divQuestion' + intSurveyID.toString() + intPage.toString()){
					if (arrDivs[i].id != 'divAnswer' + intQuestionID)
						arrDivs[i].style.display = 'none';
					else
						arrDivs[i].style.display = '';
				}else{
					arrDivs[i].style.display = '';
				}
			}else{
				arrDivs[i].style.display = '';
			}
		}
	}

	for (i=0;i<arrImgs.length;i++){
		if (arrImgs[i].id != '' && arrImgs[i].src.search('/images/tree-dot.gif') == -1){
			if (arrImgs[i].id != '' && arrImgs[i].id != 'imgSurvey' && arrImgs[i].id != 'imgHome' && arrImgs[i].id != 'imgHelp'){
				if (arrImgs[i].id != 'imgPage' + intSurveyID){
					if (arrImgs[i].id != 'imgQuestion' + intSurveyID.toString() + intPage.toString()){
						if (arrImgs[i].id != 'imgAnswer' + intQuestionID)
							arrImgs[i].src = '/images/tree-plus.gif';
						else
							arrImgs[i].src = '/images/tree-minus.gif';
					}else{
						arrImgs[i].src = '/images/tree-minus.gif';
					}
				}else{
					arrImgs[i].src = '/images/tree-minus.gif';
				}
			}
		}
	}
}