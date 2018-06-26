function CheckAllColumn(objRef, gv, numhiddencols) {
    var grid = document.getElementById(gv);
    var info = document.getElementById("<%= lblInfo.ClientID %>");
    //extracted the column index from the name of the checkbox, but adjust for hidden columns
    var colidx = Number(objRef.substr((objRef.length - 1 ) , 1)) - numhiddencols;
    //info.textContent += " colidx="  + colidx;



    for (var r = 1; r < grid.rows.length; r++) {
        var inputList = grid.rows[r].cells[colidx].getElementsByTagName("input");

        for (var i = 0; i < inputList.length; i++) {
            if (inputList[i].type == "checkbox") {
                inputList[i].checked = document.getElementById(objRef).checked;
                if (document.getElementById(objRef).checked == true) {
                    grid.rows[r].cells[colidx].style.backgroundColor = "yellow";
                }
                else {
                    grid.rows[r].cells[colidx].style.backgroundColor = "white";
                }

            }
        }
    }
}

function CheckAllRow(objRef, gv, idx) {
    var grid = document.getElementById(gv);
    var info = document.getElementById("<%= lblInfo.ClientID %>");
    var rowidx = Number(idx) + 1;
    //info.textContent += " rowidx="  + idx;


    for (var c = 1; c < grid.rows[rowidx].cells.length; c++) {
        var inputList = grid.rows[rowidx].cells[c].getElementsByTagName("input");

        for (var i = 0; i < inputList.length; i++) {
            if (inputList[i].type == "checkbox") {
                inputList[i].checked = document.getElementById(objRef).checked;
                if (document.getElementById(objRef).checked == true) {
                    grid.rows[rowidx].cells[c].style.backgroundColor = "yellow";
                }
                else {
                    grid.rows[rowidx].cells[c].style.backgroundColor = "white";
                }
            }
        }
    }
}


function Checked(objRef, gv, rowidx, colidx, numhiddencols) {
    var grid = document.getElementById(gv);
    var r = Number(rowidx) + 1;
    var c = Number(colidx) - Number(numhiddencols);

    if (document.getElementById(objRef).checked == true) {
        grid.rows[r].cells[c].style.backgroundColor = "yellow";
    }
    else {
        grid.rows[r].cells[c].style.backgroundColor = "white";
    }

}





function getCheckboxValues_in_row(gv, rowidx) {
    var values = [];
    var grid = document.getElementById(gv);

    for (var c = 1; c < grid.rows[rowidx].cells.length; c++) {
        var inputList = grid.rows[rowidx].cells[c].getElementsByTagName("input");

        for (var i = 0; i < inputList.length; i++) {
            if (inputList[i].type == "checkbox") {
                if (document.getElementById(objRef).checked == true) {
                    values.push(inputList[i].value);
                }
            }
        }
    }

    // Do something with values
    alert("Values: " + values.join(', '));
    return values;
}


function countChecksInGridView(gv, hid, lbl) {


    var grid = document.getElementById(gv);
    var inputList = grid.getElementsByTagName("input");


        for (var i = 0; i < inputList.length; i++) {
            if (inputList[i].type == "checkbox") {
                inputList[i].checked = document.getElementById(objRef).checked;
                if (document.getElementById(objRef).checked == true) {
                    grid.rows[rowidx].cells[c].style.backgroundColor = "orange";
                }
                else {
                    grid.rows[rowidx].cells[c].style.backgroundColor = "white";
                }
            }
        }
    }



function countEm2() {
    alert("foo");
}

function countEm() {


    var grid = document.getElementById("gvSubjects");
    var inputList = grid.getElementsByTagName("input");

    var count = 0;

    for (var i = 0; i < inputList.length; i++) {
        if (inputList[i].type == "checkbox") {
            if (inputList[i].checked == true) {
                count++;
            }
        }
    }


    var lblError = document.getElementById("lblError");
    lblError.TEXT_NODE = "fi";

    var b = false;
    //if (inputList.length > 0) b = true;
    if (count > 0) b = true;

    return (b);
}
