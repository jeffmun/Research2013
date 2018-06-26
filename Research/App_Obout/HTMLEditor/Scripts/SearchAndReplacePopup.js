Type.registerNamespace("CustomPopups");

// Declare the custom button class
CustomPopups.SearchAndReplacePopup = function (element) {
    CustomPopups.SearchAndReplacePopup.initializeBase(this, [element]);

    // popup's inner fields
    this._searchField = null;
    this._replaceWithField = null;
    this._matchCaseField = null;

    // whether content was changed
    this._contentChanged = false;
    // whether some text was just replaced in the content
    this._just_replaced = false;
    // currently is something found
    this._found = false;
}
CustomPopups.SearchAndReplacePopup.prototype = {

    // override the base method (called before the popup opened)
    preOpen: function (contentWindow) {
        // prepare the popup
        this._preparePopup(contentWindow);
    },

    // prepare the popup
    _preparePopup: function (contentWindow) {

        // get the inner fields
        this._searchField = contentWindow.popupMediator.getField("search");
        this._replaceWithField = contentWindow.popupMediator.getField("replaceWith");
        this._matchCaseField = contentWindow.popupMediator.getField("matchCase");

        // initiate inner buttons executers
        contentWindow.popupMediator.setCallMethodByName("searchNext", Function.createDelegate(this, this._searchAndReplaceNext));
        contentWindow.popupMediator.setCallMethodByName("replace", Function.createDelegate(this, this._replace));
        contentWindow.popupMediator.setCallMethodByName("replaceAll", Function.createDelegate(this, this._replaceAll));

        // focus the first field in the popup
        if (this._searchField != null) {
            var me = this;
            setTimeout(function () { me._searchField.focus(); }, 0);
        }

        // content not changed yet (reset the flag)
        this._contentChanged = false;

        var designPanel = this.get_designPanel();
        // set the mediator for the text manipulation
        if (designPanel != null) { // if called in 'Design' mode
            // use the mediator for the design panel
            this.textMediator = new CustomPopups.SearchAndReplacePopup.DesignPanelMediator(designPanel, this);
        } else { // if called in 'HTML text' mode
            // 'Html mode' panel
            var htmlPanel = this.get_editPanel().get_activePanel();
            // use the mediator for the Html mode panel
            this.textMediator = new CustomPopups.SearchAndReplacePopup.HtmlPanelMediator(htmlPanel);
        }

        // set to start
        this._setToStart();
    },

    // check whether to save the original content
    _checkChanges: function () {
        // if first change - save the content
        if (!this._contentChanged) {
            if (this.get_designPanel() != null) { // if called in 'Design' mode
                // save content
                this.get_designPanel()._saveContent();
            } else {// if called in 'HTML text' mode
                // save content
                this.savedContent = this.get_activePanel().get_element().value;
            }
            // set the flag
            this._contentChanged = true;
        }
    },

    // this method will be called on 'Cancel'
    cancel: function (contentWindow) {
        // unhighlight the previously found text
        this.textMediator.unhighlight(true);
        // restore content if changed
        if (this._contentChanged) {
            if (this.get_designPanel() != null) { // if called in 'Design' mode
                // restore saved content
                this.get_designPanel()._undo(false);
            } else {// if called in 'HTML text' mode
                // restore saved content
                this.get_activePanel().get_element().value = this.savedContent;
            }
        }
    },

    // this method will be called on 'OK'
    ok: function (contentWindow) {
        // unhighlight the previously found text
        this.textMediator.unhighlight(true);
    },

    // set to start (search and replace)
    _setToStart: function () {
        // get collection of lines in the content
        this._lines = this.textMediator.getLines();
        // reset the current line text
        this._line_text = "";
        // reset the current line number
        this._line_number = -1;
        // set the current found text position to MAX
        this._text_position = Number.MAX_VALUE;
        // reset the current found text length
        this._text_length = 0;
    },

    // search/replace next match
    _searchAndReplaceNext: function (replace) {
        // no replace yet
        this._just_replaced = false;
        // found flag
        var found = false;
        // unhighlight the previously found word
        this.textMediator.unhighlight();
        // if there is what to search for
        if (this._searchField != null && this._searchField.value.length > 0) {
            // search value
            var searchValue = (this._matchCaseField != null && !this._matchCaseField.checked) ? this._searchField.value.toLowerCase() : this._searchField.value;

            // search the text
            while (!found) {
                // move farther
                this._text_position += this._text_length;
                // end of the line reached?
                if (this._text_position >= this._line_text.length) { // yes
                    this._line_number++; // next line number
                    if (this._line_number >= this._lines.length) { // lines over
                        // leave the loop
                        break;
                    }
                    // set the current found text position to start
                    this._text_position = 0;
                    // reset the current found text length
                    this._text_length = 0;
                    // get the current line text
                    this._line_text = this.textMediator.getLineText(this._lines[this._line_number]);
                    if (this._matchCaseField != null && !this._matchCaseField.checked) {
                        this._line_text = this._line_text.toLowerCase();
                    }
                }
                // try to find the search text
                var index = this._line_text.indexOf(searchValue, this._text_position);
                if (index >= 0) { //found
                    // length of the found text
                    this._text_length = searchValue.length;
                    // position of the found text
                    this._text_position = index;
                    // set the found flag
                    found = true;
                } else { // not found
                    // set the current found text position to MAX
                    // (force the line end)
                    this._text_position = Number.MAX_VALUE;
                }
            }

            if (found) { // found
                // replace?
                if (typeof replace == "string") {
                    // replace the found text

                    // text before the found
                    var start = this._line_text.substr(0, this._text_position);
                    // text after the found
                    var end = this._line_text.substr(this._text_position + this._text_length);
                    // concatinate the new line
                    this._line_text = start + replace + end;
                    // another "found" text length now
                    this._text_length = replace.length;
                    // set the flag
                    this._just_replaced = true;
                    // update the line
                    this._lines = this.textMediator.updateLine(this._lines[this._line_number], this._line_text);
                    // move cursor to end of the new text
                    this.textMediator.highlight(this._lines[this._line_number], this._text_position + this._text_length, 0);
                } else {
                    // just highlight it
                    this.textMediator.highlight(this._lines[this._line_number], this._text_position, this._text_length);
                }
            } else {
                // not found - start from the begining
                this._setToStart();
                setTimeout(function () { alert("End of the content."); }, 0);
            }
        }
        this._found = found;
        return found; // whether the search text was found
    },

    // _replace current match
    _replace: function () {
        if (this._replaceWithField != null) {
            // save the content if the first time
            this._checkChanges();
            if (!this._just_replaced) {
                this._text_length = 0; // just found
            }
            // if was found something
            if (this._found) {
                if (this._searchAndReplaceNext(this._replaceWithField.value)) { // if found and replaced
                    // then search again
                    this._searchAndReplaceNext();
                }
            }
        }
    },

    // replace all matches
    _replaceAll: function () {
        if (this._replaceWithField != null) {
            // start from the begining
            this._setToStart();
            // save the content if the first time
            this._checkChanges();
            if (!this._just_replaced) {
                this._text_length = 0; // just found
            }
            // replace all
            while (this._searchAndReplaceNext(this._replaceWithField.value)) { }
        }
    }
}
// Register this class
CustomPopups.SearchAndReplacePopup.registerClass("CustomPopups.SearchAndReplacePopup", Obout.Ajax.UI.HTMLEditor.Popups.OkCancelPopup);

//-----------------------------------------------------------------------------
// Mediator class for the text manipulation in the 'Html mode' panel
//-----------------------------------------------------------------------------
CustomPopups.SearchAndReplacePopup.HtmlPanelMediator = function (htmlPanel) {
    // panel component
    this._htmlPanel = htmlPanel;
    // highlighted text descriptor
    this._highlighted = null;
}
CustomPopups.SearchAndReplacePopup.HtmlPanelMediator.prototype = {
    // update the line's text
    updateLine: function (descriptor, newText) {
        // the whole text
        var text = this._htmlPanel.get_element().value;
        // text before the line
        var start = text.substr(0, descriptor.position);
        // text after the line
        var end = text.substr(descriptor.position + descriptor.length);
        // concatinate the new line
        text = start + newText + end;
        // update
        this._htmlPanel.get_element().value = text;
        // it should be changed
        return this.getLines();
    },

    // get text via the line descriptor
    getLineText: function (descriptor) {
        return this._htmlPanel.get_element().value.substr(descriptor.position, descriptor.length);
    },

    // get array of all line descriptors
    getLines: function () {
        // array to be returned
        var descriptors = [];
        // text from the text area
        var text = this._htmlPanel.get_element().value;
        // search RegEx
        var regex = /([^\u0000]*?)([\n\r])/g;
        var index = -1;
        // collect array of the line descriptors
        for (; ; ) {
            index = regex.lastIndex;
            var ar = regex.exec(text);
            if (!ar) break;
            descriptors.push({ position: index, length: ar[0].length });
        }
        // last line
        if (index > 0) {
            descriptors.push({ position: index, length: text.substr(index).length });
        }

        return descriptors;
    },

    // unhighlight previously selected text
    unhighlight: function (prize) {
        // was something highlighted?
        if (this._highlighted != null) {
            // yes - reset cursor position to the end of the word if 'prize' is not set to 'true'
            if (!prize) {
                Obout.Ajax.UI.Library.setSelectionRange(this._htmlPanel.get_element(), this._highlighted.position + this._highlighted.length, this._highlighted.position + this._highlighted.length);
            }
            // reset
            this._highlighted = null;
        }
    },

    // highlight text
    highlight: function (linePointer, position, length) {
        // unhighlight before
        if (this._highlighted != null) {
            this.unhighlight();
        }
        // text's position
        var position = linePointer.position + position;
        // text area element
        var input = this._htmlPanel.get_element();
        // with delay
        var me = this;
        setTimeout(function () {
            // for IE only
            // enable selection for awhile
            if (Obout.Ajax.UI.HTMLEditor.isIE) {
                // save the currently opened popup (indeed it is this popup :-))
                var popup = me._htmlPanel.get_editPanel()._popup;
                me._htmlPanel.get_editPanel()._popup = null;
            }
            // select the text
            Obout.Ajax.UI.Library.setSelectionRange(input, position, position + length);
            // for IE only
            // disable selection (as usual when a popup is opened)
            if (Obout.Ajax.UI.HTMLEditor.isIE) {
                // restore currently opened popup
                me._htmlPanel.get_editPanel()._popup = popup;
            }
        }, 0);
        // save the current selected area
        this._highlighted = { position: position, length: length };
    }
}

//-----------------------------------------------------------------------------
// Mediator class for the text manipulation in the 'Design mode' panel
//-----------------------------------------------------------------------------
CustomPopups.SearchAndReplacePopup.DesignPanelMediator = function (designPanel, popup) {
    // panel component
    this._designPanel = designPanel;
    // highlighted text descriptor
    this._highlighted = null;
    // owner - popup
    this._popup = popup;
}
CustomPopups.SearchAndReplacePopup.DesignPanelMediator.prototype = {
    // update the line's text
    updateLine: function (descriptor, newText) {
        descriptor.data = newText;
        // it should be changed
        return this.getLines();
    },

    // get text via the line descriptor
    getLineText: function (descriptor) {
        return descriptor.data + "";
    },

    // get array of all line descriptors
    getLines: function () {
        // array to be returned
        var descriptors = [];
        // get all text nodes
        function recurse(element) {
            if (element.nodeType == 3) {
                if (element.nodeValue != '') {
                    descriptors.push(element);
                }
            } else {
                if (element.childNodes && element.childNodes.length > 0) {
                    for (var i = 0; i < element.childNodes.length; i++) {
                        recurse(element.childNodes[i]);
                    }
                }
            }
        }
        recurse(this._designPanel.get_doc().body);
        return descriptors;
    },

    // unhighlight previously selected text
    unhighlight: function (prize) {
        // was something highlighted and no popup be closed?
        if (!prize && this._highlighted != null) {
            // text node where the previously selected text is in
            var textNode = this._highlighted.textNode;
            // end position of this text
            var position = this._highlighted.position + this._highlighted.length;
            // reset the saved information
            this._highlighted = null;
            // try to set cursor to the end of the previously selected text
            this.highlight(textNode, position, 0);
        }
    },

    // highlight text
    highlight: function (linePointer, position, length) {
        // unhighlight before
        if (this._highlighted != null) {
            this.unhighlight();
        }

        var me = this;
        setTimeout(function () {
            if (Obout.Ajax.UI.HTMLEditor.isIE) { // for IE browsers
                // document where the text node is in
                var _doc = me._designPanel.get_doc();
                // parent element of the text node
                var parent = linePointer.parentNode;
                // trick to allow text selection in IE
                me._popup._diveAndDoMouseDown(_doc.body, false);

                // temporary text ranges and SPAN elements for selectinf a part of the text node
                var range1 = me._designPanel._createRange();
                var range2 = me._designPanel._createRange();
                var span1 = _doc.createElement("span");
                var span2 = _doc.createElement("span");

                // place the 'border' spans for the text node: <span></span>text node<span></span>
                parent.insertBefore(span1, linePointer);
                if (linePointer.nextSibling) {
                    parent.insertBefore(span2, linePointer.nextSibling);
                } else {
                    parent.appendChild(span2);
                }

                // set the text range to select the whole text node
                range1.moveToElementText(span1);
                var ii = range1.moveStart('character', 1);
                range1.moveStart('character', -ii);
                range2.moveToElementText(span2);
                ii = range2.moveEnd('character', -1);
                range2.moveEnd('character', -ii);
                range1.setEndPoint("EndToEnd", range2);
                // move in the range to select a part of the text node
                range1.moveStart('character', position);
                range1.moveEnd('character', -(linePointer.data.length - (position + length)));
                // select it!
                range1.select();

                // remove the temporary SPAN elements
                parent.removeChild(span1);
                parent.removeChild(span2);

                // trick for IE - default behavior
                me._popup._diveAndDoMouseDown(_doc.body, true);
            } else { // all not IE browsers
                // get current selection
                var sel = me._designPanel._getSelection();
                // get range
                var range = me._designPanel._createRange();
                // set positions for the range
                range.setStart(linePointer, position);
                range.setEnd(linePointer, position + length);
                // select the range
                me._designPanel._removeAllRanges(sel);
                me._designPanel._selectRange(sel, range);
            }
        }, 0);
        // save the current selected area
        this._highlighted = { textNode: linePointer, position: position, length: length };
    }
}

Sys.Application.notifyScriptLoaded();