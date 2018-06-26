/* dlcalendar.js
*  by Peter Belesis. v1.0 040731
*  Copyright (c) 2004 Peter Belesis. All Rights Reserved.
*  Originally published and documented at http://www.dhtmlab.com/
*/
/*
Jupitermedia grants you a non-transferable and non-exclusive right and
license, without the right to grant sublicenses, to use the following
software "Popup Calendar" (the Software).  You may use the Software solely
on one (1) Internet Web site. You shall not sell, assign, disseminate or
otherwise make available any portion of the Software to any third party. You
must keep the following copyright notice with all use of the Software:
Copyright (c) (CURRENT YEAR) Jupitermedia corporation.  All Rights Reserved.
Contact licensing@jupitermedia.com for more information.

THE SOFTWARE IS LICENSED "AS IS". ALL OTHER WARRANTIES WHETHER EXPRESS OR
IMPLIED INCLUDING, WITHOUT LIMITATION, WARRANTIES OF MERCHANTABILITY AND
FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.

You shall not acquire any proprietary rights in the Software and shall not
modify, translate, reverse engineer, decompile, disassemble, or create
derivative works of the Software or remove any proprietary notices on the
Software. You may make minor modifications to the Software to conform the
Software to your application, provided that you agree to assign all right
and interest to the modifications to Jupitermedia, at no cost.  You
acknowledges that the source code of the Software is confidential and
proprietary information of Jupitermedia and that will not disclose such
information to any third party.

--------------------------
Copyright (c) 2004 Peter Belesis.
All Rights Reserved. Available for license exclusively from Jupitermedia corporation.
Contact licensing@jupitermedia.com for more information.
---------------------------
*/

var dlcalendar_oCalendarDefaults =
{
	idbase      : "dl_calendar_",
	months      : "Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec",
	days        : "Su,Mo,Tu,We,Th,Fr,Sa",
	firstday    : "Su",

	date_format : "mm/dd/yyyy",
	start_date  : null,
	end_date    : null,
	root_date   : null,
	input_element_id : null,
	click_element_id : null,
	tool_tip    : "Select a Date",
	navbar_style : "",
	daybar_style : "",
	
	selecteddate_style : "",
	weekenddate_style  : "",
	regulardate_style  : "",
	othermonthdate_style : "",

	//dlcalendar 1.1
	emptydate_option : true,
	emptydate_style : "",
	emptydate_text : "Clear Date Field",

	use_webdings : false,
	
	//DF: 4/9 use relative references like ../images/dlcalendar_prevyear_white.gif instead of absolute
	// /images/dlcalendar_prevyear_white.gif
	nav_images : "../images/dlcalendar_prevyear_white.gif,../images/dlcalendar_prevmonth_white.gif,../images/dlcalendar_nextmonth_white.gif,../images/dlcalendar_nextyear_white.gif",
	
	hide_selects : true,
	hide_onselection : true,
	callfunction_onselection : null
};

var dlcalendar_aCalendarStyles =
[
[ "#dlcalendar_container",         'width:10em; table-layout:fixed;' ],
[ '#dlcalendar_navigationRow',     'height:1.5em; width:100%; margin:0px; border:1px solid #000000; background-color:#336699; color:#ffffff; font-family:arial,helvetica,sans-serif; text-align:center;  cursor:default;' ],

[ 'td.dlcalendar_monthYearCell',   'padding-left:4px; padding-right:4px; padding-top:2px; padding-bottom:2px; cursor:default; font-size:.7em; font-weight:bold;' ],
[ 'td.dlcalendar_navWebdings',     'padding-left:4px; padding-right:4px; padding-top:2px; padding-bottom:2px; cursor:pointer; font-size:1em; font-family: webdings; font-weight:normal;' ],
[ 'td.dlcalendar_navImages',       'padding-left:4px; padding-right:4px; padding-top:2px; padding-bottom:2px; cursor:pointer;' ],

[ '#dlcalendar_bodyTable',         'table-layout:fixed;cursor:default; width:100%; border:1px solid #000000; margin:0px; border-collapse:separate' ],

[ '#dlcalendar_headerRow',         'height:1.2em; text-align:center; vertical-align:middle; color:#ffffff; background-color:#a1b5cf; font-family:arial,helvetica,sans-serif; cursor:default;' ],
[ 'th.dlcalendar_headerRowCell',   'width:1em; padding:2px; font-size: .7em; text-align:center; color:#000000' ],

[ 'tr.dlcalendar_dateRow',         'height:1.2em; text-align:center; vertical-align:middle;' ],

[ 'td.dlcalendar_dayRegular',      'font-family:arial,helvetica,sans-serif; font-size:.7em; width:1em; padding:2px; border:1px solid #ffffff; color:#000000; background-color:#ffffff; cursor:pointer' ],
[ 'td.dlcalendar_dayWeekend',      'font-family:arial,helvetica,sans-serif; font-size:.7em; width:1em; padding:2px; border:1px solid #ffffff; color:#990000; background-color:#ffffff; cursor:pointer' ],
[ 'td.dlcalendar_daySelected',     'font-family:arial,helvetica,sans-serif; font-size:.7em; width:1em; padding:2px; border:1px solid #000000; color:#000000; background-color:#ffffff; cursor:default' ],
[ 'td.dlcalendar_dayOtherMonth',   'font-family:arial,helvetica,sans-serif; font-size:.7em; width:1em; padding:2px; border:1px solid #ffffff; color:#ffffff; background-color:#ffffff; cursor:default' ],
[ 'td.dlcalendar_dayDisabled',     'font-family:arial,helvetica,sans-serif; font-size:.7em; width:1em; padding:2px; border:1px solid #ffffff; color:#cccccc; background-color:#ffffff; cursor:default' ],

//dlcalendar 1.1
[ 'td.dlcalendar_emptyDate',     'font-family:arial,helvetica,sans-serif; font-size:.7em; text-align:center; padding:2px; border:1px solid #000000; color:#000000; background-color:lightgrey; cursor:pointer' ]
];

function dlcalendar_start()
{
	dlcalendar_assignGlobalVariables();
	if( dlcalendar_isCompatible() )
	{
		dlcalendar_assignPrototypes();
		dlcalendar_makeStyles();
		dlcalendar_parseCalendarTags();
	}
}

function dlcalendar_assignGlobalVariables()
{
	window.dlcalendar_aAllCalendars = new Array();
	window.dlcalendar_bBrowserSniffed = false;
	window.dlcalendar_bCompatible = false;
	window.dlcalendar_sBrowser = null;
}

function dlcalendar_assignPrototypes()
{
	window.Object.prototype.dlcalendar_mToBoolean = function(){return( ( this == true ) || ( this == "true" ) );}
	window.String.prototype.dlcalendar_mTrim = function(){ return this.replace( /(^\s*)|(\s*$)/g, '' )};
	if( ("1234").slice( -2 ).length == 2 )
	{
		window.String.prototype.dlcalendar_mLastTwoChars = function(){ return( ( "0" + this ).slice( -2 ) )};
	}
	else
	{
		window.String.prototype.dlcalendar_mLastTwoChars = function()
		{
			var sPrepended = ( "0" + this );
			return( sPrepended.substr( sPrepended.length-2, 2 ) );
		}
	}
	window.String.prototype.dlcalendar_mValueToObject = function()
	{
		return( this == "null" ) ? null : ( this == "false" ) ? false : ( this == "true" ) ? true : this;
	}
	
	window.Date.prototype.dlcalendar_mGetMonthString = function( aMonths )
	{
		return aMonths[ this.getMonth() ];
	}

	window.Date.prototype.dlcalendar_mIsWeekend = function()
	{
		var nDayofWeek = this.getDay();
		return( nDayofWeek == 0 || nDayofWeek == 6 );
	}

	if( window.Array.prototype.push == null )
	{
		window.Array.prototype.push = function( vObject )
		{
			this[ this.length ] = vObject;
		}
	}
	
	window.Array.prototype.dlcalendar_mAppendArray = function()
	{
		var aArguments = arguments;
		var nArguments = aArguments.length;
		var aArray, nArray, j;
		for( var i=0; i<nArguments; i++ )
		{
			aArray = aArguments[ i ];
			nArray = aArray.length;
			for( j=0; j<nArray; j++ )
			{
				this.push( aArray[ j ] );
			}
		}
	}
	window.dlcalendar_buildCalendar.prototype = dlcalendar_oCalendarDefaults;
}

function dlcalendar_makeStyles()
{
	var aStyles = window.dlcalendar_aCalendarStyles;
	if( aStyles != null )
	{
		var bIE = window.dlcalendar_bIE;
		var nStyles = aStyles.length;
		var aStyleSheet = [ "<style type='text/css'>\n" ];
		var aRule, sStyle;
		for( var i=0,j=1; i<nStyles; i++,j++ )
		{
			aRule = aStyles[ i ];
			sStyle = ( bIE ? aRule[ 1 ].replace( "pointer", "hand" ) : aRule[ 1 ] );
			aStyleSheet[ j ] = ( aRule[ 0 ] + "{" + sStyle + "}\n" );
		}
		aStyleSheet.push( "</style>" );
		document.write(aStyleSheet.join( "" ) );
	}
}

function dlcalendar_isCompatible()
{
	if( window.dlcalendar_bBrowserSniffed )
	{
		return window.dlcalendar_bCompatible;
	}

	var sBrowser;
	var bCompatible = false;
	var oNavigator = window.navigator;
	var bWindows = ( oNavigator.platform.toLowerCase().indexOf( "win" ) != -1 );
	if( bWindows )
	{
		var bDOM = ( document.getElementById != null );
		var bOpera = false;
		var bGecko = false;
		var bIE = false;
		var bNetscape = false;
		var bMozilla = false;

		if( bDOM )
		{
			if( window.opera != null )
			{
				var aMatches = oNavigator.userAgent.match( /Opera.([\d]+\.[\d]+)/ );
				if( aMatches != null )
				{
					var nVersion = parseFloat( aMatches[ 1 ] );
					if( nVersion >= 7.02 )
					{
						bOpera = true;
						sBrowser = "Opera";
					}
				}
			}
			else
			{
				if( ( oNavigator.product != null ) && ( oNavigator.product.toLowerCase() == "gecko" ) )
				{
					var nVendorSub = parseFloat( oNavigator.vendorSub );
					bNetscape = ( ( oNavigator.vendor.toLowerCase().indexOf( 'netscape' ) != -1 ) && ( nVendorSub >= 6.1 ) );
					if( !bNetscape )
					{
						var aMatches = oNavigator.userAgent.match( /rv.([\d]+\.[\d]+)/ );
						if( aMatches != null )
						{
							// 0.9.3 crashes on occasion
							var sVersion = aMatches[ 1 ]
							if( sVersion != "0.9.3" )
							{
								var nVersion = parseFloat( sVersion );
								bMozilla = ( nVersion >= 0.9 );
							}
						}
					}
					else
					{
						window.dlcalendar_nNetscapeVendorSub = nVendorSub;
					}
					if( bNetscape || bMozilla )
					{
						bGecko = true;
						sBrowser = "Gecko";
					}
				}
				else
				{
					if( document.all != null )
					{
						var aMatches = oNavigator.userAgent.match( /MSIE ([\d]+\.[\d]+)/ );
						if( aMatches != null )
						{
							var sVersion = aMatches[ 1 ];
							var nVersion = parseFloat( sVersion );
							if( nVersion >= 5 )
							{
								bIE = true;
								sBrowser = "IE";
								window.dlcalendar_bIE5 = ( nVersion <= 5.5 );
							}
						}
					}
				}
			}
			var bCompatible = ( bOpera || bGecko || bIE );
			if( bCompatible )
			{
				window.dlcalendar_bOpera   = bOpera;
				window.dlcalendar_bGecko   = bGecko;
				window.dlcalendar_bIE      = bIE;
				window.dlcalendar_sBrowser = sBrowser;
				bCompatible = true;
			}
		}
	}
	window.dlcalendar_bBrowserSniffed = true;
	window.dlcalendar_bCompatible = bCompatible;
	return bCompatible;
}

function dlcalendar_parseCalendarTags()
{
	var aCalendarTagsUPPER = document.getElementsByTagName( 'DLCALENDAR' );
	var aCalendarTagsLower = document.getElementsByTagName( 'dlcalendar' );
	
	if( aCalendarTagsUPPER == aCalendarTagsLower )
	{
		var aCalendarTags = aCalendarTagsUPPER;
	}
	else
	{
		var aCalendarTags = new Array();
		aCalendarTags.dlcalendar_mAppendArray( aCalendarTagsUPPER, aCalendarTagsLower );
	}
	var nCalendarTags = aCalendarTags.length;
	var mParseAttributes = window.dlcalendar_bIE ? window.dlcalendar_bIE5 ? dlcalendar_parseAttributesIE5 : dlcalendar_parseAttributesIE6 : dlcalendar_parseAttributesDOM;

	for( var i=0; i<nCalendarTags; i++ )
	{
		dlcalendar_makeCalendar( mParseAttributes( aCalendarTags[ i ] ) );
	}
}

function dlcalendar_parseAttributesIE5( eCalendarTag )
{
	var oCalendarParams = new Object();
	var oCalendarDefaults = dlcalendar_oCalendarDefaults;
	for( sAttribute in oCalendarDefaults )
	{
		if( eCalendarTag[ sAttribute ] != null )
		{
			oCalendarParams[ sAttribute ] = eCalendarTag[ sAttribute ];
		}
	}
	return oCalendarParams;
}

function dlcalendar_parseAttributesIE6( eCalendarTag )
{
	var oCalendarParams = new Object();
	var aAttributes = eCalendarTag.attributes;
	var oAttribute;
	for( sAttribute in aAttributes )
	{
		oAttribute = aAttributes[ sAttribute ];
		if( ( oAttribute != null ) && oAttribute.specified )
		{
			oCalendarParams[ sAttribute.toLowerCase() ] = oAttribute.nodeValue.dlcalendar_mValueToObject();
		}
	}
	return oCalendarParams;
}

function dlcalendar_parseAttributesDOM( eCalendarTag )
{
	var oCalendarParams = new Object();
	var aAttributes = eCalendarTag.attributes;
	var nAttributes = aAttributes.length;
	var oAttribute;
	for( var i=0; i<nAttributes; i++ )
	{
		oAttribute = aAttributes[ i ];
		oCalendarParams[ oAttribute.nodeName ] = oAttribute.nodeValue.dlcalendar_mValueToObject();
	}
	return oCalendarParams;
}

function dlcalendar_makeCalendar( oParams )
{
	if( dlcalendar_isCompatible() )
	{
		new dlcalendar_buildCalendar( oParams );
	}
}

function dlcalendar_buildCalendar( oParams )
{
	if( oParams != null )
	{
		for( var sProp in oParams )
		{
			this[ sProp ] = oParams[ sProp ];
		}
	}

	this.id = this.idbase + '_' + ( this.id || dlcalendar_aAllCalendars.length );
	if( window.dlcalendar_bOpera || window.dlcalendar_nNetscapeVendorSub >= 7.1 )
	{
		this.hide_selects = false;
	}
	this.use_webdings = this.use_webdings.dlcalendar_mToBoolean();
	
	this.aNavChars = ( this.use_webdings ) ? [ 7, 3, 4, 8 ] : this.nav_images.split( "," );
	this.aNavHandlers = [ dlcalendar_prevYearOnClick, dlcalendar_prevMonthOnClick, dlcalendar_nextMonthOnClick, dlcalendar_nextYearOnClick ];

	this.aMonths = this.months.split( "," );

	this.aDays = this.days.split( "," );
	for( var i=0; i<7; i++ )
	{
		if( this.aDays[ i ] == this.firstday )
		{
			this.nFirstDay = i;
			break;
		}
	}
	this.bCalendarCreated = false;

	this.mCreateCalendarElement = dlcalendar_createCalendarElement;
	this.mInitialize            = dlcalendar_initialize;
	this.mPaint                 = dlcalendar_paint;

	this.mBuildNavigationCell   = dlcalendar_buildNavigationCell;

	this.mCreateHeader          = dlcalendar_createHeader;
	this.mCreateHeaderRow       = dlcalendar_createHeaderRow;
	this.mWriteHeaderDate       = dlcalendar_writeHeaderDate;

	this.mCreateBody            = dlcalendar_createBody;
	this.mCreateDaysRow         = dlcalendar_createDaysRow;
	this.mCreateDateRows        = dlcalendar_createDateRows;

	//dlcalendar 1.1
	this.mCreateEmptyDate        = dlcalendar_createEmptyDate;

	this.mWriteDateCells        = dlcalendar_writeDateCells;

	this.mPosition              = dlcalendar_position;

	this.mGetCalendarElement    = dlcalendar_getCalendarElement;
	this.mSetDisplayedDate      = dlcalendar_setDisplayedDate;
	this.mGetDisplayedDate      = dlcalendar_getDisplayedDate;

	this.mSetSelectedDate       = dlcalendar_setSelectedDate;
	this.mGetSelectedDate       = dlcalendar_getSelectedDate;

	this.mSetStartDate          = dlcalendar_setStartDateMethod;
	this.mSetEndDate            = dlcalendar_setEndDateMethod;
	
	this.mCompareDates          = dlcalendar_compareDates;
	this.mIsBeyondLimits        = dlcalendar_isBeyondLimits;
	this.mCheckDateLimit        = dlcalendar_checkDateLimit;

	this.mParseInput            = dlcalendar_parseInput;
	this.mSelectedDateToString  = dlcalendar_selectedDateToString;
	this.mDateObjectToString    = dlcalendar_dateObjectToString;

	this.mGetInputElement = dlcalendar_getInputElement;
	this.mGetInputValue = dlcalendar_getInputValue;

	this.bHasInput  = ( this.mGetInputElement() != null );

	//dlcalendar 1.1
	//this.mUpdateInputWithDate = this.bHasInput ? dlcalendar_updateInputWithDate : new Function;
	this.mUpdateInputWithDate = dlcalendar_updateInputWithDate;
	this.mClearInput = dlcalendar_clearInput;
	this.mUpdateInputDisplay  = this.bHasInput ? dlcalendar_updateInputDisplay : new Function;

	//dlcalendar 1.1
	this.mAutoResetDate = dlcalendar_autoResetDate;

	this.mOnNewSelection = dlcalendar_onNewSelection;
	this.mShow = dlcalendar_show;
	this.mHide = dlcalendar_hide;
	this.mMakeInlineStyle = dlcalendar_makeInlineStyle;

	dlcalendar_setCalendarObject( this );
	this.mInitialize();
	return this;
}

function dlcalendar_setCalendarObject( oCalendar )
{
	window.dlcalendar_aAllCalendars.push( oCalendar.id );
	window.dlcalendar_aAllCalendars[ oCalendar.id ] = oCalendar;
}

function dlcalendar_getCalendarObject( sId )
{
	return window.dlcalendar_aAllCalendars[ sId ];
}

function dlcalendar_getCalendarElement()
{
	return dlcalendar_getElementById( this.id );
}

function dlcalendar_getInputElement()
{
	return dlcalendar_getElementById( this.input_element_id );
}

function dlcalendar_setSelectedDate( dSelectedDate )
{
	this.dSelectedDate = new Date( dSelectedDate );
	this.mSetDisplayedDate( dSelectedDate );
}

function dlcalendar_getSelectedDate()
{
	return this.dSelectedDate;
}

function dlcalendar_setDisplayedDate( dDate )
{
	this.dDisplayedDate = new Date(dDate);
}

function dlcalendar_getDisplayedDate()
{
	return this.dDisplayedDate;
}

function dlcalendar_cancelEvent()
{
	return false;
}

function dlcalendar_calendarOnMouseDown( e )
{
	( e || window.event ).cancelBubble = true;
}

function dlcalendar_initialize()
{
	this.mSetDisplayedDate( new Date() );
	this.mSetSelectedDate( new Date() );
	document.body.appendChild( this.mCreateCalendarElement() );

	var fDocumentOnMousedown  = ( document.onmousedown || new Function() );
	document.onmousedown = function(){ dlcalendar_hideAll(); fDocumentOnMousedown();};

	this.mPaint();
}

function dlcalendar_createCalendarElement()
{
	// create the physical calendar element
	var eCalendar = document.createElement( 'div' );
	var sId = this.id;
	eCalendar.id = sId;
	eCalendar.style.position        = 'absolute';
	eCalendar.style.left            = '0px';
	eCalendar.style.top             = '0px';
	eCalendar.style.visibility      = 'hidden';
	eCalendar.style.backgroundColor = '#ffffff';
	eCalendar.onselectstart = dlcalendar_cancelEvent;
	eCalendar.oncontextmenu = dlcalendar_cancelEvent;
	eCalendar.onmousedown = dlcalendar_calendarOnMouseDown;

	var eClick = dlcalendar_getElementById( this.click_element_id );
	if( eClick != null )
	{
		eClick.onclick = dlcalendar_showCalendar;
		eClick.style.cursor = ( window.dlcalendar_bIE ? "hand" : "pointer" );
		eClick.title = this.tool_tip;
		eClick.sCalendarId = sId;
	}

	var eTableContainer = document.createElement( 'table' );
	eTableContainer.cellSpacing = 0;
	eTableContainer.cellPadding = 0;
	eTableContainer.border = 0;
	eTableContainer.id = 'dlcalendar_container';
	var eTBody    = document.createElement( 'tbody' );
	var eHeadRow  = document.createElement( 'tr' );
	var eHeadCell = document.createElement( 'td' );
	eHeadRow.appendChild( eHeadCell );
	var eBodyRow  = document.createElement( 'tr' );
	var eBodyCell = document.createElement( 'td' );
	eBodyRow.appendChild( eBodyCell );

	eTBody.appendChild( eHeadRow );
	eTBody.appendChild( eBodyRow );

	//dlcalendar 1.1
	if( this.emptydate_option && this.bHasInput )
	{
		eTBody.appendChild( this.mCreateEmptyDate() );
	}

	eTableContainer.appendChild( eTBody );
	eCalendar.appendChild( eTableContainer );

	this.eHeadCell = eHeadCell;
	this.eBodyCell = eBodyCell;

	return eCalendar;
}

function dlcalendar_paint()
{
	if( !this.bCalendarCreated )
	{
		this.eHeadCell.appendChild( this.mCreateHeader() );
		this.eBodyCell.appendChild( this.mCreateBody()   );
		this.bCalendarCreated = true;
	}
	this.mWriteHeaderDate();
	this.mWriteDateCells();
	if( window.dlcalendar_bOpera )
	{
		var eCalendar = this.mGetCalendarElement();
		eCalendar.style.posLeft += 1;
		eCalendar.style.posLeft -= 1;
	}
}

function dlcalendar_createHeader()
{
	var eHeadTable = document.createElement( 'table' );
	eHeadTable.id = 'dlcalendar_navigationRow';
	eHeadTable.cellSpacing = 0;
	eHeadTable.cellPadding = 0;
	eHeadTable.border = 0;

	//dlcalendar 1.1
	//this.mMakeInlineStyle( eHeadTable, this.navbar_style );

	eHeadTable.appendChild( this.mCreateHeaderRow() );
	return eHeadTable;
}

function dlcalendar_createHeaderRow()
{
	var eHeadTableTBody = document.createElement( "tbody" );
	var eHeadTableRow   = document.createElement( "tr" );
	eHeadTableRow.vAlign = "middle";
	eHeadTableRow.appendChild( this.mBuildNavigationCell( 0 ) );
	eHeadTableRow.appendChild( this.mBuildNavigationCell( 1 ) );

	var sDisplayedMonthCellId = this.id + "dlcalendar_monthYearCell";
	var eDisplayedMonthCell   = document.createElement( 'td' );
	eDisplayedMonthCell.id    = sDisplayedMonthCellId;
	eDisplayedMonthCell.className    = "dlcalendar_monthYearCell";
	eDisplayedMonthCell.align = "center";

	//dlcalendar 1.1
	//eDisplayedMonthCell.style.width = "100%";
	//eDisplayedMonthCell.style.whiteSpace = 'nowrap';
	var sInlineStyle = "width:100%;white-space:nowrap;" + this.navbar_style;
	this.mMakeInlineStyle( eDisplayedMonthCell, sInlineStyle );

	this.sDisplayedMonthCellId  = sDisplayedMonthCellId;

	eHeadTableRow.appendChild( eDisplayedMonthCell );
	eHeadTableRow.appendChild( this.mBuildNavigationCell( 2 ) );
	eHeadTableRow.appendChild( this.mBuildNavigationCell( 3 ) );
	eHeadTableTBody.appendChild( eHeadTableRow );
	return eHeadTableTBody;
}

function dlcalendar_buildNavigationCell( nDirection )
{
	var eNavCell = document.createElement( "td" );
	var sNavChar = this.aNavChars[ nDirection ];
	if( this.use_webdings )
	{
		eNavCell.className = 'dlcalendar_navWebdings';
		eNavCell.innerHTML = sNavChar;
	}
	else
	{
		eNavCell.className = 'dlcalendar_navImages';
		var eImage = document.createElement( 'img' );
		eImage.src = sNavChar;
		eNavCell.appendChild( eImage );
	}

	//dlcalendar1.1
	this.mMakeInlineStyle( eNavCell, this.navbar_style );

	eNavCell.onmousedown = this.aNavHandlers[ nDirection ];
	eNavCell.sCalendarId = this.id;
	return eNavCell;
}

function dlcalendar_createBody()
{
	var eBodyTable = document.createElement( 'table' );
	eBodyTable.cellSpacing = 0;
	eBodyTable.cellPadding = 0;
	eBodyTable.id          = "dlcalendar_bodyTable";
	eBodyTable.appendChild( this.mCreateDaysRow() );
	eBodyTable.appendChild( this.mCreateDateRows() );
	return eBodyTable;
}

function dlcalendar_createDaysRow()
{
	var eBodyTableHead    = document.createElement( 'thead' );
	var eBodyTableHeadRow = document.createElement( 'tr' );
	eBodyTableHeadRow.id = "dlcalendar_headerRow";
	
	var aDays = this.aDays;
	var nFirstDay = this.nFirstDay;
	var eBodyTableHeadCell;
	for( var i=0; i<7; i++ )
	{
		eBodyTableHeadCell = document.createElement( 'th' );
		eBodyTableHeadCell.className = "dlcalendar_headerRowCell";
		this.mMakeInlineStyle( eBodyTableHeadCell, this.daybar_style );
		eBodyTableHeadCell.innerHTML = aDays[ ( nFirstDay + i ) % 7 ];
		eBodyTableHeadRow.appendChild( eBodyTableHeadCell );
	}
	eBodyTableHead.appendChild( eBodyTableHeadRow );
	return eBodyTableHead;
}

function dlcalendar_createDateRows()
{
	var sCalendarId = this.id;
	var eBodyTableBody = document.createElement( 'tbody' );
	var sBodyTableBodyId = sCalendarId + "dlcalendar_idDateBody";
	eBodyTableBody.id = sBodyTableBodyId;

	var eDateRow, j, eDateCell;
	for( var i = 0; i < 6; i++ )
	{
		eDateRow = document.createElement( 'tr' );
		eDateRow.className = "dlcalendar_dateRow";
		for( j = 0; j < 7; j++ )
		{
			eDateCell = document.createElement( 'td' );
			eDateCell.sCalendarId = sCalendarId;
			eDateRow.appendChild( eDateCell );
		}
		eBodyTableBody.appendChild( eDateRow );
	}
	this.sBodyTableBodyId = sBodyTableBodyId;
	return eBodyTableBody;
}

//dlcalendar1.1
function dlcalendar_createEmptyDate()
{
	var eEmptyDateRow  = document.createElement( 'tr' );
	var eEmptyDateCell = document.createElement( 'td' );
	eEmptyDateCell.className = "dlcalendar_emptyDate";
	this.mMakeInlineStyle( eEmptyDateCell, this.emptydate_style );
	eEmptyDateCell.onclick = dlcalendar_emptyDateOnClick;
	eEmptyDateCell.innerHTML = this.emptydate_text;
	eEmptyDateCell.sCalendarId = this.id;
	eEmptyDateRow.appendChild( eEmptyDateCell );
	return eEmptyDateRow;
}

function dlcalendar_writeHeaderDate()
{
	var dDisplayedDate = this.mGetDisplayedDate();
	dlcalendar_getElementById( this.sDisplayedMonthCellId ).innerHTML = ( dDisplayedDate.dlcalendar_mGetMonthString( this.aMonths ) + " " + dDisplayedDate.getFullYear() );
}

function dlcalendar_getElementById( sElementId )
{
	return document.getElementById( sElementId );
}

function dlcalendar_writeDateCells()
{
	var eBodyTableBody = dlcalendar_getElementById( this.sBodyTableBodyId );
	var dDisplayedDate = this.mGetDisplayedDate();
	var dTempDate = new Date( dDisplayedDate );
	dTempDate.setDate( 1 );	  // set temp date to first of displayed month
	var nFirstDayofMonth = dTempDate.getDay();		  // get day of week of first of displayed month

	var nDisplayedDate  = dDisplayedDate.getDate();
	var nDisplayedMonth = dDisplayedDate.getMonth();

	var sSelectedDateStyle   = ( this.selecteddate_style   || "" );
	var sWeekendDateStyle    = ( this.weekenddate_style    || "" );;
	var sRegularDateStyle    = ( this.regulardate_style    || "" );
	var sOtherMonthDateStyle = ( this.othermonthdate_style || "" );
	
	var aDateRows = eBodyTableBody.getElementsByTagName( 'tr' );
	var eDateRow, aDateCells, j, eDateCell, nTempMonth, nTempDate, sClassName, sUserStyle, bDisabled, mClick, sDisplayText;

	var nStartCell = ( ( 7 + nFirstDayofMonth - this.nFirstDay ) % 7 );

	for( var i = 0; i < 6; i++ )
	{
		eDateRow = aDateRows[ i ];
		aDateCells = eDateRow.getElementsByTagName( "td" );
		for( j = 0; j < 7; j++ )
		{
			eDateCell = aDateCells[ j ];
			nTempMonth = dTempDate.getMonth();
			mClick = null;
			if( i==0 && j < nStartCell || nTempMonth != nDisplayedMonth )
			{
				sClassName = "dlcalendar_dayOtherMonth";
				sCustomStyle = sOtherMonthDateStyle;
				sDisplayText = "&nbsp;";
			}
			else
			{
				nTempDate  = dTempDate.getDate();
				if( this.mCompareDates( this.mGetSelectedDate(), dTempDate ) == 0 )
				{
					sClassName = "dlcalendar_daySelected";
					sCustomStyle = sSelectedDateStyle;
				}
				else if( dTempDate.dlcalendar_mIsWeekend() )
				{
					sClassName = "dlcalendar_dayWeekend";
					sCustomStyle = sWeekendDateStyle;
				}
				else
				{
					sClassName = "dlcalendar_dayRegular";
					sCustomStyle = sRegularDateStyle;
				}
				bDisabled = this.mIsBeyondLimits( dTempDate );
				eDateCell.disabled = bDisabled;
				if( bDisabled )
				{
					sClassName = "dlcalendar_dayDisabled";
				}
				else
				{
					eDateCell.nDayOfMonth = nTempDate;
					mClick = dlcalendar_dateOnMousedown;
				}
				sDisplayText = nTempDate;
				dTempDate.setDate( nTempDate + 1 );
			}
			eDateCell.className = sClassName;
			this.mMakeInlineStyle( eDateCell, sCustomStyle );
	
			//dlcalendar 1.1
			//eDateCell.innerHTML = sDisplayText;
			if( eDateCell.innerHTML != sDisplayText )
			{
				eDateCell.innerHTML = sDisplayText;
			}
	
			eDateCell.onclick = mClick;
		}
	}
}

function dlcalendar_compareDates( dDate0, dDate1 )
{
	var bSameDate = ( ( dDate0.getDate() == dDate1.getDate() ) && ( dDate0.getMonth() == dDate1.getMonth() ) && ( dDate0.getFullYear() == dDate1.getFullYear() ) );
	if( !bSameDate )
	{
		return( ( dDate0 < dDate1 ) ? -1 : 1 );
	}
	return 0;
}

function dlcalendar_checkDateLimit( dDateToCheck )
{
	var bValidDate = true;
	if( this.start_date != null )
	{
		var dLimitDate = dlcalendar_dateObjectFromString( this.start_date );
		bValidDate = ( dDateToCheck >= dLimitDate );
	}
	if( bValidDate && ( this.end_date != null ) )
	{
		dLimitDate = dlcalendar_dateObjectFromString( this.end_date );
		bValidDate = ( dDateToCheck <= dLimitDate );
	}
	return bValidDate ? dDateToCheck : dLimitDate;
}

function dlcalendar_isBeyondLimits( dDate )
{
	var dNewDate = this.mCheckDateLimit( dDate );
	return( !( this.mCompareDates( dNewDate, dDate ) == 0 ) );
}

function dlcalendar_setStartDate( sId, sDate )
{
	var sCalendarId = ( dlcalendar_oCalendarDefaults.idbase + '_' + sId );
	var oCalendar = dlcalendar_getCalendarObject( sCalendarId );
	oCalendar.mSetStartDate( sDate );
}

function dlcalendar_setEndDate( sId, sDate )
{
	var sCalendarId = ( dlcalendar_oCalendarDefaults.idbase + '_' + sId );
	var oCalendar = dlcalendar_getCalendarObject( sCalendarId );
	oCalendar.mSetEndDate( sDate );
}

function dlcalendar_setStartDateMethod( sDate )
{
	this.start_date = sDate;
}

function dlcalendar_setEndDateMethod( sDate )
{
	this.end_date = sDate;
}

function dlcalendar_showCalendar( e ) // this == click element ( image )
{
	var oEvent = ( e || window.event );
	dlcalendar_hideAll();
	var sCalendarId = this.sCalendarId;
	var oCalendar = dlcalendar_getCalendarObject( sCalendarId );
	oCalendar.mPosition( e );
	
	if( oCalendar.bHasInput && ( oCalendar.mGetInputValue().length > 0 )  )
	{
		oCalendar.mSetSelectedDate( oCalendar.mParseInput() );
		oCalendar.mUpdateInputWithDate();
	}

	//dlcalendar 1.1
	//else if( oCalendar.root_date != null )
	//{
	//	oCalendar.mSetSelectedDate( dlcalendar_dateObjectFromString( oCalendar.root_date ) );
	//}
	//else
	//{
	//	oCalendar.mSetSelectedDate( new Date() );
	//}
	else
    {
        oCalendar.mAutoResetDate();
    }

	oCalendar.mPaint();
	oCalendar.mShow();
	oEvent.cancelBubble = true;
}

//dlcalendar1.1
function dlcalendar_autoResetDate()
{
	if( this.root_date != null )
	{
		this.mSetSelectedDate( dlcalendar_dateObjectFromString( this.root_date ) );
	}
	else
	{
		this.mSetSelectedDate( new Date() );
	}
	this.mPaint();
}

function dlcalendar_position( e )
{
	var oEvent = ( e || window.event );
	var eDocBody = document.body;
	var nWindowLeftEdge = eDocBody.scrollLeft;
	var nWindowTopEdge  = eDocBody.scrollTop;
	var nLeftPos = ( oEvent.pageX || oEvent.x + nWindowLeftEdge );
	var nTopPos  = ( oEvent.pageY || oEvent.y + nWindowTopEdge );
	dlcalendar_keepInWindow( this.mGetCalendarElement(), nLeftPos, nTopPos )
}

function dlcalendar_keepInWindow( eElement, nLeftPos, nTopPos )
{
	var nMinSpace = 5;
	var eDocBody = document.body;

	var nWindowLeftEdge = eDocBody.scrollLeft;
	var nWindowTopEdge  = eDocBody.scrollTop;
	var nWindowWidth    = ( window.innerWidth  != null ) ? window.innerWidth  : eDocBody.clientWidth;
	var nWindowHeight   = ( window.innerHeight != null ) ? window.innerHeight : eDocBody.clientHeight;
	var nWindowRightEdge  = ( nWindowLeftEdge + nWindowWidth ) - nMinSpace;
	var nWindowBottomEdge = ( nWindowTopEdge + nWindowHeight ) - nMinSpace;

	var nElementRightEdge = nLeftPos + eElement.offsetWidth;
	var nElementBottomEdge = nTopPos + eElement.offsetHeight;

	if( nElementRightEdge > nWindowRightEdge )
	{
		nLeftPos -= ( nElementRightEdge - nWindowRightEdge );
		nLeftPos = Math.max( nMinSpace, nLeftPos );
	}

	if( nElementBottomEdge > nWindowBottomEdge )
	{
		nTopPos -= ( nElementBottomEdge - nWindowBottomEdge );
		nTopPos = Math.max( nMinSpace, nTopPos );
	}

	eElement.style.left = ( nLeftPos + "px" );
	eElement.style.top  = ( nTopPos  + "px" );
}

//dlcalendar 1.1
function dlcalendar_updateInputWithDate()
{
	//var eInput = this.mGetInputElement();
	//var sInputValue = this.mGetInputValue();
	//var sDateString = this.mSelectedDateToString();

	this.mUpdateInputDisplay( this.mSelectedDateToString() );

	//if( sInputValue != sDateString )
	//{
	//	eInput.value = sDateString;
	//	if( eInput.onchange != null )
	//	{
	//		eInput.onchange();
	//	}
	//}
}

function dlcalendar_clearInput()
{
    this.mUpdateInputDisplay( "" );
}

function dlcalendar_updateInputDisplay( sDisplay )
{
    var eInput = this.mGetInputElement();
    var sInputValue = this.mGetInputValue();
    if( sInputValue != sDisplay )
    {
        eInput.value = sDisplay;
        if( eInput.onchange != null )
        {
            eInput.onchange();
        }
    }
}

function dlcalendar_getInputValue()
{
	var eInput = this.mGetInputElement();
	var sInputValue = eInput.value;
	return sInputValue.dlcalendar_mTrim();
}

function dlcalendar_selectedDateToString()
{
	return this.mDateObjectToString( this.mGetSelectedDate() );
}

function dlcalendar_dateObjectToString( dDate )
{
	var xRegExp = /(\{.*\})|(d+)|(m+)|(M+)|(y+)|[^dMmy]/g;
	var sFormat = this.date_format;
	var aMatches = sFormat.match( xRegExp );
	var nMatches = aMatches.length;
	var aStringDate = new Array();
	var sMatch, nChars, sChar, sDisplay, sYear, sMonth, nMonth, sDate;
	for( var i=0; i<nMatches; i++ )
	{
		sMatch = aMatches[ i ];
		nChars = sMatch.length;
		sChar = sMatch.charAt( 0 );
		sDisplay = "";
		switch( sChar )
		{
			case 'y':
				sYear = dDate.getFullYear().toString();
				if( nChars <= 2 )
				{
					sYear = sYear.dlcalendar_mLastTwoChars();
				}
				sDisplay = sYear;
				break;
			case 'm':
				sMonth = ( dDate.getMonth() + 1 ).toString();
				if( nChars >= 2 )
				{
					sMonth = sMonth.dlcalendar_mLastTwoChars();
				}
				sDisplay = sMonth;
				break;
			case 'M':
				sMonth = dDate.dlcalendar_mGetMonthString( this.aMonths );
				sDisplay = sMonth.substr( 0, nChars );
				break;
			case 'd':
				sDate = (dDate.getDate()).toString();
				if( nChars >= 2 )
				{
					sDate = sDate.dlcalendar_mLastTwoChars();
				}
				sDisplay = sDate;
				break;
			default:
				sDisplay = sMatch.replace( /\{|\}/g, '' );
				break;

		}
		aStringDate[ i ] = sDisplay;
	}
	return aStringDate.join( "" );
}

function dlcalendar_parseInput( sDateString )
{
	var sInputValue = this.mGetInputValue();
	var sFormat = this.date_format;
	var xRegExp = /([^dmMy])|($)/;
	var oDate = new Object();
	var aMatches, sMaskSegment, nMaskSegmentLength, sDelimiter, bEndOfDateFormat, sInputSegment, nInputSegmentLength, sFirstMaskChar;

	while( sInputValue.length != 0)
	{
		aMatches = sFormat.match( xRegExp );
		if( aMatches != null )
		{
			sMaskSegment = sFormat.substr( 0, aMatches.index );
			nMaskSegmentLength = sMaskSegment.length;
			sDelimiter = aMatches[ 0 ];
			bEndOfDateFormat = ( sDelimiter.length == 0 );
			sInputSegment = ( bEndOfDateFormat ? sInputValue : ( sInputValue.substr( 0, sInputValue.indexOf( sDelimiter ) ) ) );
			nInputSegmentLength = sInputSegment.length;
			sFirstMaskChar = sMaskSegment.charAt( 0 );
			switch( sFirstMaskChar )
			{
				case 'y':
					var nYear = Number( sInputSegment );
					if( ( !isNaN( nYear ) ) )
					{
						if( ( nMaskSegmentLength <= 2 ) && ( nInputSegmentLength <= 2 ) )
						{
							if( nYear > 50 )
							{
								nYear = nYear + 1900;
							}
							else
							{
								nYear = nYear + 2000;
							}
						}
						oDate.nYear = nYear;
					}
					break;
				case 'm':
					var nMonth = Number( sInputSegment );
					if( ( !isNaN( nMonth ) ) && ( nMonth >=1 ) && ( nMonth <= 12 ) )
					{
						oDate.nMonth = ( nMonth - 1 );
					}
					break;
				case 'M':
					var aMonths = this.aMonths;
					sMonth = sInputSegment.toLowerCase();
					for( var i=0; i<12; i++ )
					{
						if( sMonth == aMonths[ i ].toLowerCase() )
						{
							oDate.nMonth = i;
							break;
						}
					}
					break;
				case 'd':
					var nDate = Number( sInputSegment );
					if( ( !isNaN( nDate ) ) && ( nDate >=1 ) && ( nDate <= 31 ) )
					{
						oDate.nDate = nDate;
					}
					break;
			}
			sFormat = sFormat.slice( aMatches.index + 1 );
			sInputValue = sInputValue.slice( nInputSegmentLength + 1 );
		}
	}
	if( !isNaN( oDate.nYear + oDate.nMonth + oDate.nDate ) )
	{
		var dNewDate = new Date( oDate.nYear, oDate.nMonth, oDate.nDate );
		return this.mCheckDateLimit( dNewDate );
	}
	else
	{
		return new Date();
	}
}

function dlcalendar_nextMonthOnClick( e )
{
	dlcalendar_navigate( e, this.sCalendarId, true, true );
}

function dlcalendar_prevMonthOnClick( e )
{
	dlcalendar_navigate( e, this.sCalendarId, true, false );
}

function dlcalendar_nextYearOnClick( e )
{
	dlcalendar_navigate( e, this.sCalendarId, false, true );
}

function dlcalendar_prevYearOnClick( e )
{
	dlcalendar_navigate( e, this.sCalendarId, false, false );
}

function dlcalendar_navigate( e, sCalendarId, bMonth, bNext )
{
	( e || window.event ).cancelBubble = true;

	var oCalendar = dlcalendar_getCalendarObject( sCalendarId );

	var dDisplayedDate = oCalendar.mGetDisplayedDate();
	var nDisplayedYear = dDisplayedDate.getFullYear();
	var nDisplayedMonth = dDisplayedDate.getMonth();
	var nDirection = ( bNext ? 1 : -1 );
	var dNewDate = new Date( dDisplayedDate );

	//dlcalendar1.1
	//set date object to first day of month to avoid 2 month
	//leap when navigating from longer month to shorter month</SPAN><SPAN class=dl-code-addition>
    dNewDate.setDate( 1 );


	if( bMonth )
	{
		dNewDate.setMonth( nDisplayedMonth + nDirection );
	}
	else
	{
		dNewDate.setFullYear( nDisplayedYear + nDirection );
	}
	oCalendar.mSetDisplayedDate( oCalendar.mCheckDateLimit( dNewDate ) );
	oCalendar.mPaint();
}

//dlcalendar1.1
function dlcalendar_emptyDateOnClick()
{
    var sCalendarId = this.sCalendarId;
    var oCalendar = dlcalendar_getCalendarObject( sCalendarId );
    oCalendar.mAutoResetDate();
    oCalendar.mClearInput();
    if( oCalendar.hide_onselection.dlcalendar_mToBoolean() )
    {
        oCalendar.mHide();
    }
}

function dlcalendar_onNewSelection( nDayOfMonth )
{
	var oNewDate = new Date( this.mGetDisplayedDate() );
	oNewDate.setDate( nDayOfMonth );
	this.mSetSelectedDate( oNewDate );
	this.mUpdateInputWithDate();
	if( this.hide_onselection.dlcalendar_mToBoolean() )
	{
		this.mHide();
	}
	else
	{
		this.mPaint();
	}
	if( this.callfunction_onselection )
	{
		var dSelectedDate = this.mGetSelectedDate();
		( window[ this.callfunction_onselection ] || new Function )( dSelectedDate, dSelectedDate.getFullYear(), dSelectedDate.getMonth()+1, dSelectedDate.getDate(), dSelectedDate.getDay()+1 );
	}
}

function dlcalendar_show()
{
	var eCalendar = this.mGetCalendarElement();
	if( this.hide_selects )
	{
		dlcalendar_hideSelects( eCalendar );
	}
	eCalendar.style.visibility = 'inherit';
}

function dlcalendar_hide()
{
	var eCalendar = this.mGetCalendarElement();
	eCalendar.style.visibility = 'hidden';
	if( this.hide_selects )
	{
		dlcalendar_showSelects( eCalendar );
	}
}

function dlcalendar_dateOnMousedown()  //this == table cell
{
	var oCalendar = dlcalendar_getCalendarObject( this.sCalendarId );
	oCalendar.mOnNewSelection( this.nDayOfMonth );
}

function dlcalendar_dateObjectFromString( sDate )
{
	var aDate = ( sDate.indexOf( "-" ) != -1 ) ? sDate.split( '-' ) : sDate.split( ',' );
	return( new Date( aDate[ 0 ], aDate[ 1 ]-1, aDate[ 2 ] ));
}

function dlcalendar_hideAll()
{
	var aAllCalendars = dlcalendar_aAllCalendars;
	var nAllCalendars = aAllCalendars.length;
	var sCalendarId, oCalendar, eCalendar;
	for( var i=0; i<nAllCalendars; i++ )
	{
		sCalendarId = dlcalendar_aAllCalendars[ i ];
		oCalendar = dlcalendar_getCalendarObject( sCalendarId );
		eCalendar = oCalendar.mGetCalendarElement();
		eCalendar.style.visibility = "hidden";
		if( oCalendar.hide_selects )
		{
			dlcalendar_showSelects( eCalendar );
		}
	}
}

function dlcalendar_getElementLeft( eElement )
{
	var nLeftPos = eElement.offsetLeft;
	var eParElement = eElement.offsetParent;
	while( eParElement != null )
	{
		if( window.dlcalendar_bIE && ( eParElement.tagName != "table" ) && ( eParElement.tagName != "body" ) )
		{
			nLeftPos += eParElement.clientLeft;
		}
		nLeftPos += eParElement.offsetLeft;
		eParElement = eParElement.offsetParent;
	}
	return nLeftPos;
}

function dlcalendar_getElementTop( eElement )
{
	var nTopPos = eElement.offsetTop;
	var eParElement = eElement.offsetParent;
	while(eParElement != null)
	{
		if( window.dlcalendar_bIE &&  ( eParElement.tagName != "table" ) && ( eParElement.tagName != "body" ) )
		{
			nTopPos += eParElement.clientTop;
		}
		nTopPos += eParElement.offsetTop;
		eParElement = eParElement.offsetParent;
	}
	return nTopPos;
}

function dlcalendar_hideSelects( eElement )
{
	var nElementLeft = eElement.offsetLeft;
	var nElementTop = eElement.offsetTop;
	var nElementRight = ( nElementLeft + eElement.offsetWidth );
	var nElementBottom = ( nElementTop + eElement.offsetHeight );

	var aSelects = document.getElementsByTagName( "select" );
	var nSelects = aSelects.length;
	var eSelect, nSelectLeft, nSelectWidth, nSelectRight, nSelectTop, nSelectHeight, nSelectBottom, bCurrentStyle, bComputedStyle, sVisibility;
	for( var i=0; i<nSelects; i++ )
	{
		eSelect = aSelects[ i ];
		nSelectLeft = dlcalendar_getElementLeft( eSelect );
		nSelectWidth = eSelect.offsetWidth;
		nSelectRight = ( nSelectLeft + eSelect.offsetWidth );
		nSelectTop  = dlcalendar_getElementTop( eSelect );
		nSelectHeight = eSelect.offsetHeight;
		nSelectBottom = ( nSelectTop + eSelect.offsetHeight );
		
		if( ( nSelectLeft >= ( nElementLeft - nSelectWidth ) ) && ( nSelectLeft <= nElementRight ) &&
			( nSelectTop  >= ( nElementTop - nSelectHeight ) )  && ( nSelectTop  <= nElementBottom ) )
		{
			bCurrentStyle = ( eSelect.currentStyle != null );
			bComputedStyle = ( document.defaultView != null  && document.defaultView.getComputedStyle != null );
			if( bCurrentStyle || bComputedStyle )
			{
				sVisibility = ( bCurrentStyle ? eSelect.currentStyle.visibility : document.defaultView.getComputedStyle( eSelect, "" ).getPropertyValue( "visibility" ) );
			}
			else
			{
				sVisibility = eSelect.style.visibility;
				if( sVisibility.dlcalendar_mTrim() == "" )
				{
					sVisibility = "inherit";
				}
			}
			eSelect.sPreviousVisibility = sVisibility;
			eSelect.style.visibility = "hidden";
		}
	}
}

function dlcalendar_showSelects( eElement )
{
	var aSelects = document.getElementsByTagName( "select" );
	var nSelects = aSelects.length;
	var eSelect, sPreviousVisibility;
	for( var i=0; i<nSelects; i++ )
	{
		eSelect = aSelects[ i ];
		sPreviousVisibility = eSelect.sPreviousVisibility;
		if( sPreviousVisibility != null )
		{
			eSelect.style.visibility = sPreviousVisibility;
			eSelect.sPreviousVisibility = null;
		}
	}
}

function dlcalendar_makeInlineStyle( eElement, sStyle )
{
	if( sStyle != null && sStyle != "")
	{
		if( window.dlcalendar_bIE )
		{
			eElement.style.cssText = sStyle;
		}
		else
		{
			eElement.setAttribute( "style", sStyle );
		}
	}
}

function dlcalendar_validate()
{
	// future use;
}

dlcalendar_start();
// end

