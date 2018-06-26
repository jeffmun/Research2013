function UpdateMsg(sender) {
    ob_post.AddParam("entity", sender.ID);
    ob_post.post(null, "UpdateMsg", function () { });
}

function ClearMsg(lit_msg) {
    var msg = document.getElementById(lit_msg);
    msg.textContent = "";
    ob_post.post(null, 'ServerCancelTimer', function () { });
}


function CancelTimer() {
    //document.getElementById('myDIVNote').style.display = 'none';
    ob_post.post(null, 'ServerCancelTimer', function () { });
}

//Use the following 2 functions to handle correctly selecting multiselect 
// items in a ListBox contained in a grid template
function selectByIndexes(listBox, indexes) {
    for (var i = 0; i < indexes.length; i++) {
        listBox._dropDownList.selectItemByIndex(indexes[i], false, false, false, true, true, false);
    }
}

function selectByValues(listBox, values_csv) {
    var values = new Array();
    values = values_csv.split(',');
    var valuesString = '_*_' + values.join('_*_') + '_*_';
    var indexes = new Array();

    for (var i = 0; i < listBox.options.length; i++) {
        listBox._dropDownList.unselectItemByIndex(i);

        if (valuesString.indexOf('_*_' + listBox.options[i].value + '_*_') != -1) {
            indexes.push(i);
        }
    }

    selectByIndexes(listBox, indexes);
}
